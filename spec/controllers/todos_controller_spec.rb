require 'spec_helper'

describe TodosController do
	render_views

	describe "GET index" do
		it "assigns @todos" do
			get :index
			expect(:todos).should_not equal(nil)
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end
		it "has a 200 status code" do
	      get :index
	      expect(response.status).to eq(200)
	    end
	    it "says 'Moja lista rzeczy do zrobienia'" do
	      get :index
	      expect(response.body).to match /Moja lista rzeczy do zrobienia/m
	    end
	end

	describe "GET search" do
		it "renders the index template" do
			get :search
			expect(response).to render_template("index")
		end
		it "has a 200 status code" do
	      get :search
	      expect(response.status).to eq(200)
	    end
	end

	describe "GET new" do
		it "renders the new template" do
			get :new
			expect(response).to render_template("new")
		end

		it "assigns new @todo" do
			todo = Todo.new
			get :new
			expect(assigns(:todo)).to be_a_new(Todo)
		end
		it "has a 200 status code" do
	      get :new
	      expect(response.status).to eq(200)
	    end
	    it "says 'Nowa notatka'" do
	      get :new
	      expect(response.body).to match /Nowa notatka/m
	    end
	    it "has return button 'Powrót'" do
	      get :new
	      expect(response.body).to match /Powrót/m
	    end
	end

	describe "POST create" do
		it "adds and redirects to new todo" do
			post :create, {:todo => {:name => 'testname', :description => 'testdesc', :image => nil}}
			response.should redirect_to("/todos/1")
		end
		it "assings @todo" do
			todo = Todo.new(:id => 1, :name => '', :image => nil)
			post :create, {:todo => {:name => '', :image => nil}}
			expect(assigns(:todo)).to eq(todo)
		end
		it "has a 302 status code" do
	      post :create, {:todo => {:name => 'testname', :description => 'testdesc', :image => nil}}
	      expect(response.status).to eq(302)
	    end
	end
end
