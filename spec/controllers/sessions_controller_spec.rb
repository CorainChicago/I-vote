require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #create" do

    context "not valid without credentials" do
      controller do
        def create
          render :text => "index called", :status => :bad_gateway
        end
      end
      it "returns an error message when trying to create without info" do
        get :create
        expect(response).to have_http_status("502")
      end
    end

    context "with valid credentials" do
      let :credentials do
        { email: "cat@cat.com", street_address: "1246 Adams", city: "Atlanta", state: "Alabama", zip: 34543 }
      end
      let :user do
        FactoryGirl.create(:user, credentials)

      get :create
        expect(response).to have_http_status(:success)
      end
    end

  end


 describe "logout"  do
    context "redirects home" do
      it "redirects to root" do
        get :destroy
        expect(response).to redirect_to root_path
      end
    end
  end

   describe "login"  do
    context "ajax" do
      it "render form" do
        get :new, format: :xhr
        expect(response).to have_http_status(:success)
      end
    end
  end
end