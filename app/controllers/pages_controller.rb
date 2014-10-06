class PagesController < ApplicationController
  def index
    flash[:notice] = "Welcome"
  end
end
