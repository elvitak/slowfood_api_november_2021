class Api::OrdersController < ApplicationController
  def create
    order = Order.create(order_params)
    product = Product.find(params[:order][:product_id])
    order.items.create(product: product)
    render json: {order: order}, status: :created
  end

  def update 
    product = Product.find(params[:product_id])
    order = Order.find(params[:id])
    order.items.create(product: product)
    render json: {order: order, message: "#{product.name} was added to your order"}, status: 200
  end

  private
  
  def order_params
    params[:order].permit(:user_id)
  end



end
