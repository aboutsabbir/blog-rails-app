class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_param)
        if @user.save
            session[:user_id] = @user.id
            redirect_to "/", notice: "User saved sucessfully!"
        else
            render :new
        end
    end

    private
    
    def user_param
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end