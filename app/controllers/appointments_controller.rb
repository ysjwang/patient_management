class AppointmentsController < ApplicationController
  before_filter :authenticate_doctor!, only: [:update, :show]

  def new
  end

  def index
  end

  def update
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update(appointment_params)

        format.html { respond_with_bip(@appointment) }
        format.js { respond_with_bip(@appointment) }
        format.json { respond_with_bip(@appointment) }

      else
        format.html { respond_with_bip(@appointment) }
        format.js { respond_with_bip(@appointment) }
        format.json { respond_with_bip(@appointment) }
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
    # @new_work = Work.new(appointment_id: @appointment.id) - DOY. This DOES get passed on to the view, but we didn't save it in the view. Nice one.
    @new_work = Work.new(appointment_id: @appointment.id)

  end


  private

  def appointment_params
    params.require(:appointment).permit(:notes)
  end

end
