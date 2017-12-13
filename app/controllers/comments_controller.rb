class CommentsController < ApplicationController
  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.build comment_params
    @comment.creator = User.first # TODO: change once we have authentication

    if @comment.save
      flash[:notice] = 'You added a comment!'
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end