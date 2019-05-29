class CommentsController < ApplicationController
	before_action :find_post
	before_action :authenticate_user!

  def create
  	@comment = @post.comments.new(comment_params)
  	@comment.user = current_user
  	@comment.save

    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
  	params.require(:comment).permit(:body, :post_id)
  end

  def find_post
  	@post = Post.find(params[:post_id])
  end
end
