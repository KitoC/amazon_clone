class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def books
  end

  def landingpage
  end
end
