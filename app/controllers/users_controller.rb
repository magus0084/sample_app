class UsersController < ApplicationController
  
  def show
      @user = User.find(params[:id])
      @title = User.find(params[:id]).name
  end

  def new
      @title = "Sign up"
  end

end
