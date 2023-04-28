# frozen_string_literal: true

class CountiesController < ApplicationController
  before_action :set_county, only: [:show, :edit, :update, :destroy]

  # GET /counties or /counties.json
  def index
    counties = County::Record.order_by_state_and_name
    counties = counties.filter_by_name(params[:name]) if params[:name].present?
    counties = counties.filter_by_state(params[:state]) if params[:state].present?


    @pagy, @counties = pagy(counties)
  end

  # GET /counties/1 or /counties/1.json
  def show
    @people = @county.people
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
    @county = County::Record.new(county_params)
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

  # DELETE /counties/1 or /counties/1.json
  def destroy
    @county.destroy

    redirect_to counties_url, notice: "County was successfully destroyed."
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