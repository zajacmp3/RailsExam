require 'spec_helper'

describe PostsController do
  describe "GET index" do
    it "has 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
    it "has OK message status" do
      get :index
      expect(response.status).to eq('OK')
    end
    it "has default layout" do
      get :index
      expect(layout).to eq('default')
    end
  end
end
