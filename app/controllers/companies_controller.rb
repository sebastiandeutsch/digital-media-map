class CompaniesController < ApplicationController
  def index
    @companies = Company.search(params[:search])
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def edit
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(params[:company])
    if @company.save()
      redirect_to :back, :notice => 'Company updated'
    else
      redirect_to :back, :error => 'Could not update Company'
    end
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      redirect_to :back, :notice => 'Company updated'
    else
      redirect_to :back, :error => 'Could not update Company'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    if @company.destroy
      redirect_to :back, :notice => 'Company deleted'
    else
      redirect_to :back, :error => 'Could not delete Company'
    end
  end
end
