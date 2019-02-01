class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to :user_url(@user) 
        else
            nil 
        end 
    end

    def new
      @user = User.new 
    end

    def show
        @user = User.find_by(:id, params[:id])
        render :show
    end

    private

    def user_params
      params.require(:user).permit(:email)
    end
end
