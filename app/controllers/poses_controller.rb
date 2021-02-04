class PosesController < ApplicationController

  def index
    @poses = Pose.all
  end

  def new
    @pose = Pose.new
  end

  def create
    @pose = Pose.new(pose_params)
    if @pose.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def pose_params
    params.require(:pose).permit(:title, :image, :effect_id, :minute, :intensity_id).merge(user_id: current_user.id)
  end

end
