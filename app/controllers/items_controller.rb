class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = @user.items.build(item_params)

    if @item.save
      redirect_to user_path(@user)
    else
      redirect_to :back
      flash[:error] = "The item cannot be saved."
    end
  end

  def show
      @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "Item deleted"
      redirect_to :back
    else
      flash[:error] = "Couldn't delete item"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end
