require 'rails_helper'

RSpec.describe "home page", :type => :request do
  it "displays the rating" do
    user_signed_in = true
    get "/ratings/new"
    assert_select "form.ratings/new" do
      assert_select "input[name=?]", "stars"
      assert_select "input[type=?]", "submit"
    end

    post "ratings/new", :stars => "3"
    assert_select ".header .stars", :text => "3"
  end
end
