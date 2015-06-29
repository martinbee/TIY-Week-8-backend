class SkeletonsController < ApplicationController

  def index
    @skeletons = Skeleton.all.includes(:user).order('id DESC').last(21)
  end

  def create
    @skeletons = Skeleton.all.includes(:user).order('id DESC').last(21)
    @skeleton = Skeleton.new params.require(:skeleton).permit(:content, :user_id)

    if @skeleton.save
      render :index, status: 201
    else
      render json: @skeleton.errors, status: 422
    end
  end

end
