require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

	describe MoviesController do
		let(:query) {nil}
	end

	describe 'GET index' do
		it "assings" do
			get :index
			expect(assigns['query']).to eq(query)
		end
	end
end
