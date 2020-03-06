class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.order(id: :asc).includes(:customer)
  end

  def show
  end

  def new
    @order = Order.new
    new_number = (Order.with_deleted.maximum(:number).to_i + 1).to_s.rjust(6, '0')
    @order.number = new_number
    @order.items.build
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to orders_path, notice: '訂單新增成功'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to orders_path, notice: '訂單更新成功'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path, notice: '訂單已刪除'
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    case 
    when @order.nil? || @order.pending?
      params.require(:order).permit(:delivered_at,
                                    :number,
                                    :customer_id,
                                    :note,
                                    items_attributes: [
                                      :id,
                                      :product_id,
                                      :quantity,
                                      :unit,
                                      :price,
                                      :total_quantity,
                                      :total_price,
                                      :_destroy
                                    ])
    when @order.delivered?
      params.require(:order).permit(:note)
    end
  end
end
