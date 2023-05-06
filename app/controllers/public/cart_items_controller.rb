class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @cart_item = CartItem.new
    @total_price = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item
      @cart_item.update(amount: params[:cart_item][:amount])
      redirect_to cart_items_path
    else
      @cart_item = current_customer.cart_items
      @total_price = current_customer.cart_items.cart_items_total_price(@cart_item)
      redirect_to cart_items_path
    end
  end

  def destroy
    current_customer.cart_items.find(params[:id]).destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
     @item = Item.find(cart_item_params[:item_id])
     @cart_item = CartItem.find_by(item_id: @item.id, customer_id: current_customer.id)#(customer_id: カスタマーのid, item_id: 商品のid)
    if @cart_item
      @cart_item.update(amount: @cart_item.amount + cart_item_params[:amount].to_i)
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
    end
    redirect_to cart_items_path(@cart_item.id)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
