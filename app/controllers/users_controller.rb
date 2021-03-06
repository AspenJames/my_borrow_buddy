class UsersController < ApplicationController
    before_action :set_check_user, only: [:edit, :update, :destroy]
    before_action :set_user, only: :show
    
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            redirect_to edit_user_url(@user)
        end
    end
    
    def destroy
        @user.delete
        session.destroy
        redirect_to test_path
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :username, :password, :email)
    end

end