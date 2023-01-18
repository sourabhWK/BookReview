class LikesController < ApplicationController
  before_action :load_service, only: [:create, :destroy]
  
  def create
    puts "=====================================liked"
      # @like = current_user.likes.new(like_params)
      # if @like.save 
      #     redirect_to @like.likeable
      # else 
      #     flash[:notice] = @like.errors.full_messages
      # end
  end 

  def destroy
    puts "========================================== unliked"
      # @like = current_user.likes.find(params[:id])
      # likeable = @like.likeable
      # if @like.destroy
      #     redirect_to likeable
      # end
  end

  private 
  def like_params
      params.require(:like).permit(:likeable_type, :likeable_id)
  end

  def load_service
    @like = LikeService.new()
  end

end