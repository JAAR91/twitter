class ComentsController < ApplicationController
    before_action :authenticate_user!

  def new
    @comment = Coment.new
  end

  def create
    @comment = Coment.new(comment_params)
    if @comment.save
      flash[:notice] = 'New coment on post!'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:notice] = 'Unable to create comment'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:coment).permit(:body, :user_id, :post_id)
  end
end
