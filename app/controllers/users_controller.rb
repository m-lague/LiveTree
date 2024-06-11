class UsersController < ApplicationController

  def show
    @user = User.find_by(username: params[:username])
    @lives = @user.lives
    @bio = @user.bio
    @network_usernames = @user.network_usernames
    @first_name = @user.first_name
    @last_name = @user.last_name
    @fullname = "#{@user.first_name} #{@user.last_name}"
    @next_lives = @user.lives.where("air_date > ?",DateTime.now)
    @previous_lives = @user.lives.where("air_date < ?",DateTime.now)
  end

  def edit
  end

  def update
  end


  private

  def user_params
    params.require(:user).permit(:bio, :links, :role, :username, :first_name, :last_name)
  end

end
