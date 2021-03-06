class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]  
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => [:destroy]
  before_filter :signed_out_user, :only => [:new, :create]

  def index
      @title = "All users"
      @users = User.paginate(:page => params[:page])
  end

  def show
      @user = User.find(params[:id])
      @microposts = @user.microposts.paginate(:page => params[:page])
      @title = @user.name
  end

  def new
      @user = User.new
      @title = "Sign up"
  end

  def create
      @user = User.new(params[:user])
      if @user.save
      	 sign_in @user
      	 flash[:success] = "Welcome to the Sample App!"
      	 redirect_to @user
      else
	 @title = "Sign up"
	 @user.password = ""
	 @user.password_confirmation = ""
	 render 'new'
      end
  end

  def edit
      @title = "Edit user"
  end

  def update
      if @user.update_attributes(params[:user])
      	 flash[:success] = "Profile updated."
	 redirect_to @user
      else
         @title = "Edit user"
	 @user.password = ""
	 @user.password_confirmation = ""
         render 'edit'
      end
  end


  def destroy
      user_to_delete = User.find(params[:id])

      # Implementation of getting the flash message might be a hack
      if user_to_delete != current_user
      	 flash[:success] = "'#{user_to_delete.name}' was deleted."
	 user_to_delete.destroy
      	 redirect_to users_path
      else 
         flash[:error] = "Admins cannot delete their own accounts."
      	 redirect_to users_path
      end
  end

  
  def following
      @title = "Following"
      @user = User.find(params[:id])
      @users = @user.following.paginate(:page => params[:page])
      render 'show_follow'
  end


  def followers
      @title = "Followers"
      @user = User.find(params[:id])
      @users = @user.followers.paginate(:page => params[:page])
      render 'show_follow'
  end

  private

	def correct_user
	    @user = User.find(params[:id])
	    redirect_to(root_path) unless current_user?(@user)
	end

	def admin_user
	   redirect_to(root_path) unless current_user.admin?
	end

	def signed_out_user
	   if signed_in?
	      flash[:notice] = "Please sign out to create a new account."
	      redirect_to(root_path) if signed_in?
	   end
	end
end
