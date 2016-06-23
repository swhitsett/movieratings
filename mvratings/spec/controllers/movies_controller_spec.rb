require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
   describe "GET #index" do
      it "checks load response" do
         get :index
         expect(response).to be_success
      end
   
      it "renders the index template" do
         get :index
         expect(response).to render_template("index")
      end
   end
end
