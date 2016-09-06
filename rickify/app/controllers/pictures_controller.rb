class PicturesController < ApplicationController
  def index
    if user_signed_in?
      @pictures = Picture.where("user_id = ?", current_user.id)
    else
      @pictures
    end

  end

  def show
    @picture = Picture.find_by(id: params[:id])
  end

end
