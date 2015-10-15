class CommentsController < ApplicationController

  def index
  	@post = Post.find(params[:post_id])
    @comment =  @post.comments.all
  end
 
  def new
  end

  def create
    @post = Post.find(params[:comments][:post_id])
    @comment = @post.comments.create(params[:comments])
  	redirect_to post_comments_path(@post)
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

