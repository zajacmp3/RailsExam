require 'spec_helper'

describe UsersController do
  let(:valid_attributes) { { "email" => "MyString", 
    "password" => "MyString",
    "password_confirmation" => "MyString" } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all users as @users" do
      subject.class.skip_before_filter :require_login
      user = User.create! valid_attributes
      get :index, {}, valid_session
      assigns(:users).should eq([user])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      subject.class.skip_before_filter :require_login
      user = User.create! valid_attributes
      get :show, {:id => user.to_param}, valid_session
      assigns(:user).should eq(user)
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      subject.class.skip_before_filter :require_login
      get :new, {}, valid_session
      assigns(:user).should be_a_new(User)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      subject.class.skip_before_filter :require_login
      user = User.create! valid_attributes
      get :edit, {:id => user.to_param}, valid_session
      assigns(:user).should eq(user)
    end
  end

  describe "POST create" do

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        subject.class.skip_before_filter :require_login
        User.any_instance.stub(:save).and_return(false)
        post :create, {:user => { "email" => "invalid value" }}, valid_session
        assigns(:user).should be_a_new(User)
      end

      it "re-renders the 'new' template" do
        subject.class.skip_before_filter :require_login
        User.any_instance.stub(:save).and_return(false)
        post :create, {:user => { "email" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        subject.class.skip_before_filter :require_login
        user = User.create! valid_attributes
        User.any_instance.should_receive(:update).with({ "email" => "MyString" })
        put :update, {:id => user.to_param, :user => { "email" => "MyString" }}, valid_session
      end

      it "assigns the requested user as @user" do
        subject.class.skip_before_filter :require_login
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
        assigns(:user).should eq(user)
      end

      it "redirects to the user" do
        subject.class.skip_before_filter :require_login
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
        response.should redirect_to(user)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        subject.class.skip_before_filter :require_login
        user = User.create! valid_attributes
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => user.to_param, :user => { "email" => "invalid value" }}, valid_session
        assigns(:user).should eq(user)
      end

      it "re-renders the 'edit' template" do
        subject.class.skip_before_filter :require_login
        user = User.create! valid_attributes
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => user.to_param, :user => { "email" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      subject.class.skip_before_filter :require_login
      user = User.create! valid_attributes
      expect {
        delete :destroy, {:id => user.to_param}, valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      subject.class.skip_before_filter :require_login
      user = User.create! valid_attributes
      delete :destroy, {:id => user.to_param}, valid_session
      response.should redirect_to(users_url)
    end
  end
end