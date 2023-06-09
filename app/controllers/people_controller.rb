# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]

  def index
    people = Person::Record.order_by_full_name

    @pagy, @people = pagy(people)
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/inactive
  def inactives
    people = Person::Record.list_inactive_people

    @pagy, @people = pagy(people)
  end

  # GET /people/new
  def new
    @person = Person::Record.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @person = Person::Record.find_or_initialize_by(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to person_url(@person), notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to person_url(@person), notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person::Record.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person)
            .permit(
              :full_name,
              :cpf,
              :cns,
              :email,
              :birthday,
              :phone,
              :status,
              :address_id
            )
    end
end