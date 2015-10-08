class CommentsController < ApplicationController
  def index
  	@comment = Comment.all
  end
 
  def new

  end

  def create
    @comment = Comment.new(params[:comments])
  	@comment.save
  	redirect_to comments_path
  end



  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
 
    redirect_to comments_path
  end


def update
  @comment = Comment.find(params[:id])
 
  if @comment.update(comment_params)
    redirect_to @comment
  else 
    render 'edit'
  end
end

def show
	@comment = Comment.find(params[:id])
end


end
