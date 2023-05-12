class Public::HomesController < ApplicationController

  def top
    @items = Item.all
    @items = Item.order('id DESC').limit(4)
  end

  def about
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :price)
  end

end
