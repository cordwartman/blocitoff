class UsersController < ApplicationController
  def show
    @user = params[:id].nil? ? current_user : User.find(params[:id])
    @items = Item.where(:user_id => @user.id)
  end
end
