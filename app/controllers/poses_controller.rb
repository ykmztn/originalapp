class PosesController < ApplicationController

  def index
    @poses = Pose.all
  end

  def new
    @pose = Pose.new
  end

end
