class PosesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :search_product, only: [:index, :search]
  before_action :pose_find, only: :destroy

  def index
    @poses = Pose.includes(:user).order('created_at DESC').page(params[:page]).per(6)
    set_pose_column
  end

  def new
    @pose = Pose.new
  end

  def create
    @pose = Pose.new(pose_params)
    if @pose.save
      redirect_to "/users/#{current_user.id}"
    else
      render :new
    end
  end

  def search
    @results = @p.result.order('created_at DESC')
  end

  def destroy
    if current_user.id == @pose.user_id
      @pose.destroy
      redirect_to user_path
    else
      redirect_to user_path(@pose)
    end
  end

  private

  def pose_params
    params.require(:pose).permit(:title, :image, :effect_id, :minute, :intensity_id).merge(user_id: current_user.id)
  end

  def search_product
    @p = Pose.ransack(params[:q])  # 検索オブジェクトを生成
  end

  def set_pose_column
    @pose_title = Pose.select('title').distinct
    @pose_minute = Pose.select('minute').distinct
  end

  def pose_find
    @pose = Pose.find(params[:id])
  end
end
