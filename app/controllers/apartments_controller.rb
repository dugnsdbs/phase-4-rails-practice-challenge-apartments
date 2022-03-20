class ApartmentsController < ApplicationController

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def index 
    render json: Apartment.all
  end

  def show 
    apartment = Apartment.find(params[:id])
    render json: apartment, status: :accepted
  end

  def create 
    apartment = Apartment.create!(apartment_params)
    render json: apartment
  end

  def update
    apartment = Apartment.find(params[:id])
    apartment.update!(apartment_params)
    render json: apartment
  end

  def destroy 
    apartment = Apartment.find(params[:id])
    apartment.destroy
    head :no_content
  end

  private 

  def apartment_params
    params.permit(:number)
  end

  def render_unprocessable_entity(invalid)
    render json: {errors: invalid.record.errors}, status: :unprocessable_entity
  end

end
