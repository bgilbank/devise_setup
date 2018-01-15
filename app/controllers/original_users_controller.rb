class UsersController < ApplicationController
  before_action :authenticate_user!

 def index
  @users = User.all
 end

 def show
 end

 def edit
  @user = friendly_user
 end

 def update_profile_image
  @user = current_user
  if @user.update(user_params)
    # Sign in the user by passing validation in case their password changed
    bypass_sign_in(@user)
    redirect_to user_path(current_user), notice: "Sucess, your changes have been saved"
  else
    render "edit", notice: "Image upload failed, please try again"
  end
end

 def update_profile
  @user = current_user
  if @user.update(user_params)
    # Sign in the user by passing validation in case their password changed
    bypass_sign_in(@user)
    redirect_to dashboard_root_path, notice: "Your changes have been saved"
  else
    render "edit"
  end
end


def update_password
  @user = current_user
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

 def user_params
    params.require(:user).permit(:password, :password_confirmation, :email, :first_name, :last_name, :about, :role, :img)
 end

end