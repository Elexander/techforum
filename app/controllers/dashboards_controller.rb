class DashboardsController < ApplicationController
  def main
  	@today_posts = Post.last(10)
  	@discussion_posts = Post.filter_by_type("Discussion")
  	@question_posts = Post.filter_by_type("Question")
  	
  end

  def listpost
  	@today_posts = Post.last(10)
  	@discussion_posts = Post.filter_by_type("Discussion")
  	@question_posts = Post.filter_by_type("Question")

  end	
end
