class PosesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :search_product, only: [:index, :search]

  def index
    @poses = Pose.all.order('created_at DESC')
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


  private

  def pose_params
    params.require(:pose).permit(:title, :image, :effect_id, :minute, :intensity_id).merge(user_id: current_user.id)
  end

  def search_product
    @p = Pose.ransack(params[:q])  # 検索オブジェクトを生成
  end

  def set_pose_column
    @pose_title = Pose.select("title").distinct
    @pose_minute = Pose.select("minute").distinct
  end

end
