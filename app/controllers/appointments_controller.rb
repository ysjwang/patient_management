class AppointmentsController < ApplicationController
  def new
  end

  def index
  end

  def show
    @appointment = Appointment.find(params[:id])
    @patient = @appointment.patient
  end
end
