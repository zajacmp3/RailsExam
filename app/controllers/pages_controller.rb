class PagesController < ApplicationController
	before_action :set_todo, only: [:show, :edit, :update, :destroy]
  def welcome
  end

  def about
  end
end

