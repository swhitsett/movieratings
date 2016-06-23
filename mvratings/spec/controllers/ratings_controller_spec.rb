require 'rails_helper'

RSpec.describe RatingsController, type: :controller do
   describe "GET #_form" do
      it "returns form" do
         get :new
         expect(response).to be_success
      end
   end
end
