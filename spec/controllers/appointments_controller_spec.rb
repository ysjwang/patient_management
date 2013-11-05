require 'spec_helper'

describe AppointmentsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      doctor = create(:doctor)
      sign_in :doctor, doctor

      appointment = create(:valid_ongoing_appointment)
      get 'show', id: appointment.id
      response.should be_success
    end
  end

end
