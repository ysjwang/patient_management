require 'spec_helper'

describe DashboardsController do

  describe "GET 'doctor'" do
    it "returns http success" do
      get 'doctor'
      response.should be_success
    end
  end

  describe "GET 'patient'" do
    it "returns http success" do
      get 'patient'
      response.should be_success
    end
  end

end
