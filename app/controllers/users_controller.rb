class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def show
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

  def set_user
    @user = User.find_by(usrname: params[:username])
  end

  def user_params
    params.require(:user).permit(:bio, :links, :role, :username, :first_name, :last_name)
  end

end
