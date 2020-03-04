class AreasController < ApplicationController
  before_action :find_area, only: [:edit, :update, :destroy]

  def index
    @areas = Area.order(id: :asc)
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    
    if @area.save
      redirect_to areas_path, notice: '成功新增地區資料'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @area.update(area_params)
      redirect_to areas_path, notice: '成功更新地區資料'
    else
      render :edit
    end
  end

  def destroy
    @area.destroy
    redirect_to areas_path, notice: '成功刪除地區資料'
  end

  private

  def find_area
    @area = Area.find(params[:id])
  end

  def area_params
    params.require(:area).permit(:name)
  end
end
