class AppointmentsController < ApplicationController

  def new
  end

  def index
  end

  def update
    @appointment = Appointment.find(params[:id])
    respond_to do |format|
      if @appointment.update(appointment_params)

        format.html { render json: @appointment }
        format.js { render json: @appointment }

      else
        format.html { render json: @appointment }
        format.js { render json: @appointment }
      end
    end
  end

  # def update

  #   @contact = Contact.find(params[:id])
  #   respond_to do |format|
  #     if @contact.update(contact_params)

  #       @contacts = Contact.all.order('id')
  #       @contacts = @contacts.reload

  #       format.html { render json: @contacts }
  #       format.js { render json: @contacts, callback: params[:callback] }
  #     else

  #       @contacts = Contact.all.order('id')
  #       @contacts = @contacts.reload

  #       format.html { render json: @contacts }
  #       format.js { render json: @contacts, callback: params[:callback] }
  #     end
  #   end
  # end


  def show
    @appointment = Appointment.find(params[:id])
    @patient = @appointment.patient
  end


  private

  def appointment_params
    params.require(:appointment).permit(:notes)
  end

end
