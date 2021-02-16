class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @poses = current_user.poses.order('created_at DESC')
  end

  def search
    @results = @p.result.order('created_at DESC')
  end
end
