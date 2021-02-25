class LikesController < ApplicationController

  def create
    @like = current_user.likes.create(pose_id: params[:pose_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @pose = Pose.find(params[:pose_id])
    @like = Like.find_by(pose_id: params[:pose_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

end