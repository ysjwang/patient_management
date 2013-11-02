class WorksController < ApplicationController

  def new
  end

  def index
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
    params.require(:work).permit(:notes, :worktype_id, :quantity, :billable)
  end

end
