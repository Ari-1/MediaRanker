class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update]

  def index
    @works = Work.all
  end

  def new
    @work = Work.new

  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = " Work Successfully Created"
      redirect_to works_path
    else
      flash[:failure] = "Validations Failed"
      render :new
    end
  end

  def show ; end

  def edit ; end

  def update
    @work.assign_attributes(work_params)
    if @work.save
      flash[:success] = "Successfully updated"
      redirect_to work_path(@work)
    else
      render :edit
    end
  end

  def destroy
    Work.destroy(params[:id])
    redirect_to works_path
  end

  private
  def work_params
    return params.require(:work).permit(:title, :publication_year, :creator, :category, :description)
  end

  def find_work
    @work = Work.find(params[:id])
  end

end
