class UsersController < ApplicationController
 
 before_action :authenticate_user!, only: [:show]

 def new
    @user = User.new
  end

  def index
      @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
      @conversations = Conversation.involving(current_user).order("created_at DESC")
  end

def create
      @user=User.new(user_params)
      if @user.save
      log_in @user
      redirect_to @user
      else
          render ‘new’
      end
end

  def show
  	@user = User.find(params[:id])
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
      else 
      render 'edit'
    end
  end

  def private

    def set_user
    end

     def user_params
      params.require(:user).permit(:image, :username, :fac, :formation, :niveau, :email, :password)
    end
  end

end
