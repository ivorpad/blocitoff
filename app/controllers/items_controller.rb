class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = @user.items.build(item_params)

    if @item.save
      redirect_to user_path(@user)
    else
      redirect_to :back, alert: "Item could not be saved."
    end
  end

  def show
      @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:name)
  end

end
