class LivesController < ApplicationController
  before_action :set_live, only: [:show, :edit, :update, :destroy]

  def index
    @lives = Live.all
  end

  def show
  end

  def new
    @live = Live.new
  end

  def create
    @live = Live.new(live_params)
    @live.user = current_user
    if @live.save
      redirect_to lives_path, notice: "live was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @live.update(live_params)
      redirect_to lives_path, notice: "live was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @live.destroy
    redirect_to lives_path, notice: "live was successfully destroyed."
  end

  private

  def set_live
    @live = Live.find(params[:id])
  end

  def live_params
    params.require(:live).permit(:title, :description, :air_date)
  end
end
