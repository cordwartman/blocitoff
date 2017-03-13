class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item was save successfully."
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = "Error creating item. Please try again."
      render :new
    end
  end

  def destroy
    @item = Item.destroy(params[:id])

    respond_to do |f|
      f.html { redirect_to user_path(current_user.id) }
      f.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
