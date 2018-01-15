class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update_profile_image, :update_profile, :update_password]

 def index
  @users = User.all
 end

 def show
 end

 def edit
 end

 def update_profile_image
  if @user.update(user_params)
    # Sign in the user by passing validation in case their password changed
    bypass_sign_in(@user)
    redirect_to user_path(current_user), notice: "Sucess, your changes have been saved"
  else
    render "edit", notice: "Image upload failed, please try again"
  end
end

 def update_profile
  if @user.update(user_params)
    # Sign in the user by passing validation in case their password changed
    bypass_sign_in(@user)
    redirect_to dashboard_root_path, notice: "Your changes have been saved"
  else
    render "edit"
  end
end


def update_password
  if @user.update(user_params) # make people enter their old pasword with @user.update_with_password(user_params)
    # Sign in the user by passing validation in case their password changed
    bypass_sign_in(@user)
    redirect_to dashboard_root_path, notice: "Your password has been updated"
  else
    render "edit"
  end
end

def destroy
  if @user.destroy
    redirect_to root_path, notice: "User has been deleted"
  end
end 

private
 
 def set_user
    @user = User.friendly.find(params[:id])
 end
 
 def user_params
    params.require(:user).permit(:password, :password_confirmation, :email, :first_name, :last_name, :about, :role, :img)
 end

end