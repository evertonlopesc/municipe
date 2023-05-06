# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :set_address, only: %i[ show edit update destroy ]

  # GET /addresses or /addresses.json
  def index
    addresses = Address::Record.order_by_full_name

    @pagy, @addresses = pagy(addresses)
  end

  # GET /addresses/1 or /addresses/1.json
  def show
    people = @address.people
    people = people.search_by_fullname(params[:full_name]) if params[:full_name].present?
    people = people.search_by_email(params[:email]) if params[:email].present?
    people = people.search_by_cns(params[:cns]) if params[:cns].present?

    @pagy, @people = pagy(people)
  end

  # GET /addresses/inactive
  def inactives
    addresses = Address::Record.list_inactive_addresses

    @pagy, @addresses = pagy(addresses)
  end

  # GET /addresses/new
  def new
    @address = Address::Record.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses or /addresses.json
  def create
    @address = Address::Record.find_or_initialize_by(address_params)

    respond_to do |format|
      if @address.save
        format.html {
          redirect_to address_url(@address),
          notice: "Address was successfully created."
        }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1 or /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to address_url(@address), notice: "Address was successfully updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address::Record.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address)
            .permit(
              :cep,
              :street,
              :number,
              :complement,
              :neighborhood,
              :status,
              :county_id
            )
    end
end