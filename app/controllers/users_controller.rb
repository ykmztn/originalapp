class UsersController < ApplicationController

  def show
    @nickname = current_user.nickname
    @poses = current_user.poses
  end
end
