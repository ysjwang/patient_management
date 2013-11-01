class DashboardsController < ApplicationController
  before_filter :authenticate_doctor!, only: [:doctor]

  def doctor
    @doctor = current_doctor


    @past_appointments = @doctor.appointments.past
    @ongoing_appointments = @doctor.appointments.ongoing
    @future_appointments = @doctor.appointments.future

  end

  def patient
  end
end
