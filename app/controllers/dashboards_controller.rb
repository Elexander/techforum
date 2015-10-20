class DashboardsController < ApplicationController
  def main
  	@post = Post.joins(:user).all
  	
  end
end
