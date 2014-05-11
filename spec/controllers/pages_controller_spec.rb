require 'spec_helper'

describe PagesController do
	render_views

	describe "GET welcome" do
		it "has a 200 status code" do
	      get :welcome
	      expect(response.status).to eq(200)
	    end
	    it "says 'welcome'" do
	      {:get => "/welcome" }.should be_routable
	    end
	end

	describe "GET about" do
		it "has a 200 status code" do
	      get :about
	      expect(response.status).to eq(200)
	    end
	    it "says 'about'" do
	      get :about
	      expect(response.body).to match /about/m
	    end
	end
end
