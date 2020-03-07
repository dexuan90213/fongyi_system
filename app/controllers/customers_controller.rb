class CustomersController < ApplicationController
  before_action :find_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.order(id: :asc)
  end

  def new
    @customer = Customer.new
    Product.all.size.times { @customer.prices.build }
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to customers_path, notice: '成功新增客戶'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: '成功更新客戶'
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path, notice: '成功刪除客戶資料'
  end

  private

  def find_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name,
                                     :area_id,
                                     :tel,
                                     :address,
                                     :cash_payment,
                                     :close_day_at_25th,
                                     :note,
                                     prices_attributes: [:id, :product_id, :price])
  end
end
