class WorksController < ApplicationController
  before_filter :authenticate_doctor!, only: [:create_from_works_detail_table, :destroy_from_works_detail_table, :update, :show]

  def new
  end

  def create_from_works_detail_table
    puts 'hello params ' + params.to_yaml

    # @appointment = Appointment.find(params[:id])

    @work = Work.new(work_params)
    # @work.appointment = @appointment
    @appointment = Appointment.find(@work.appointment_id)
    puts 'Work is ' + @work.to_yaml
    respond_to do |format|
      if @work.save
        puts '-----------------SUCCESS CREATE FROM WORKS TABLE---------------'
        @works = @appointment.works.reload
        @new_work = Work.new(appointment_id: @appointment.id)
        format.js { render :rerender_works_detail_table }

      else
        puts '-------------------FAILURE CREATE FROM WORKS TABLE--------------'
        @works = @appointment.works.reload
        @new_work = Work.new(appointment_id: @appointment.id)
        format.js { render :rerender_works_detail_table }
      end

    end


  end

  def index
  end




  def destroy_from_works_detail_table
    @work = Work.find(params[:id])
    @appointment = @work.appointment
    respond_to do |format|
      if @work.destroy
        puts '------------SUCCESS DESTROY------------'
        @works = @appointment.works.reload
        @new_work = Work.new(appointment_id: @appointment.id)
        format.js { render :rerender_works_detail_table }
      else
        puts '------------FAILURE DESTROY------------'
        @works = @appointment.works.reload
        @new_work = Work.new(appointment_id: @appointment.id)
        format.js { render :rerender_works_detail_table }

      end
    end

  end

  def update
    @work = Work.find(params[:id])

    respond_to do |format|
      if @work.update(work_params)

        format.html { respond_with_bip(@work) }
        format.js { respond_with_bip(@work) }
        format.json { respond_with_bip(@work) }

      else
        format.html { respond_with_bip(@work) }
        format.js { respond_with_bip(@work) }
        format.json { respond_with_bip(@work) }
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
    @work = work.find(params[:id])
  end


  private

  def work_params
    params.require(:work).permit(:notes, :worktype_id, :quantity, :billable, :appointment_id)
  end

end
