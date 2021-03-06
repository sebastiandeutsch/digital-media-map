class CompaniesController < ApplicationController
  def index
    @search = Company.search(params[:search])
    @companies = @search.all
  end

  def show
    @company = Company.find(params[:id])
    redirect_to root_url(:anchor => @company.to_param)
  end

  def new
    @company = Company.new
  end

  def edit
    @company = Company.find_by_private_slug!(params[:id])
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to @company
    else
      render :new
    end
  end

  def update
    @company = Company.find_by_private_slug!(params[:id])

    if @company.update_attributes(params[:company])
      redirect_to @company
    else
      render :edit
    end
  end
end
