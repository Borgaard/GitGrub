class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
    @posts = Post.create(post_params)
    # @posts = current_user.posts.create(post_params)
  	if @post.save
  		redirect_to @post, :notice => "You have successfully created a post!"
  	else
  		render :new
  	end
  end

  # def edit
  # end

  def show
    @post = Post.find(params[:id])
  end

private
  def post_params
    params.require(:post).permit(:time, :body, :place, :neighborhood)
  end
end
private

def post_params
    params.require(:post).permit(:place, :neighborhood, :time, :body)
  end