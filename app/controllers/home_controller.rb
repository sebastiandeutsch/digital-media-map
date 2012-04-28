class HomeController < ApplicationController
  def index
    @search = Company.search(params[:search])
  end
end
