class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    if !params[:search].nil? && params[:search] != ''
      @rides = Ride.where(id: params[:search])
    end
  end

  def add_ride
    @mechanic = Mechanic.find(params[:id])
    @ride = Ride.find(params[:ride_id])
    @mechanic.rides << @ride
    redirect_to "/mechanics/#{@mechanic.id}"
  end

end
