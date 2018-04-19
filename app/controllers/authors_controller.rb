class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def books
  end

  def show
  end

  def landingpage
  end
  private
  def set_author
    @author = Author.find(params[:id])
  end
end
