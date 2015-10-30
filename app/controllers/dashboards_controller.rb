class DashboardsController < ApplicationController
  def main
  	@today_posts = Post.today
  	@discussion_posts = Post.filter_by_type("Discussion")
  	@question_posts = Post.filter_by_type("Question")
  	
  end
end
