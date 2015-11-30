class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
  	@post = Post.find(params[:post_id])
    @comment =  @post.comments.joins(:user)
    if user_signed_in?
      @user = current_user.id
    end
    @most_voted = Comment.filter_post(params[:post_id]).most_voted
  end
 
  def new
  end

  def create
    @post = Post.find(params[:comments][:post_id])
    @comment = @post.comments.create(params[:comments])
  	redirect_to post_comments_path(@post)
  end

  def vote
    comment = Comment.find(params[:comment_id])
    if current_user.voted_on?(comment)
      current_user.unvote_for(comment)
    else  
      current_user.vote_for(comment)
    end
    
    count = comment.votes_for
    comment.vote_count = count
    comment.save
    redirect_to :back
  end  

  # def edit
  #   @comment = Comment.find(params[:id])
  # end

  # def destroy
  #   @comment = Comment.find(params[:id])
  #   @comment.destroy
 
  #   redirect_to comments_path
  # end


  # def update
  #   @comment = Comment.find(params[:id])
 
  #   if @comment.update(comment_params)
  #     redirect_to @comment
  #   else 
  #     render 'edit'
  #   end
  # end

  def show
	 @comment = Comment.find(params[:id])
  end

end

