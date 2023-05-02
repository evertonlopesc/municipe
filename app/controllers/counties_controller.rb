# frozen_string_literal: true

class CountiesController < ApplicationController
  before_action :set_county, only: %i[show edit update destroy]

  # GET /counties or /counties.json
  def index
    counties = County::Record.order_by_state_and_name
    counties = counties.search_by_name(params[:name]) if params[:name].present?
    counties = counties.search_by_state(params[:state]) if params[:state].present?

    @pagy, @counties = pagy(counties)
  end

  # GET /counties/inactive
  def inactives
    counties = County::Record.list_inactive_counties

    @pagy, @counties = pagy(counties)
  end

  # GET /counties/1 or /counties/1.json
  def show
    addresses = @county.addresses
    addresses = addresses.search_by_street(params[:street]) if params[:street].present?

    @pagy, @addresses = pagy(addresses)
  end

  # GET /counties/new
  def new
    @county = County::Record.new
  end

  # GET /counties/1/edit
  def edit
  end

  # POST /counties or /counties.json
  def create
    @county = County::Record.find_or_initialize_by(county_params)
    if @county.save
      redirect_to county_url(@county), notice: "County was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /counties/1 or /counties/1.json
  def update
    if @county.update(county_params)
      redirect_to county_url(@county), notice: "County was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_county
      @county = County::Record.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def county_params
      params.require(:county)
            .permit(:name, :id_ibge, :state, :status)
    end
end