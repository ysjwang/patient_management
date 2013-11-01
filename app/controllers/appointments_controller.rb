class AppointmentsController < ApplicationController
  def new
  end

  def index
  end

  def show
    @appointment = Appointment.find(params[:id])
  end
end
