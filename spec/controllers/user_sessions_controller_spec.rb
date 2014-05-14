require 'spec_helper'

describe UserSessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      subject.class.skip_before_filter :require_login
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      subject.class.skip_before_filter :require_login
      get 'create'
      response.should be_success
    end
  end
end
