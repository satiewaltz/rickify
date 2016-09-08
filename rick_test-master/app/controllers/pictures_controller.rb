class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new(params[:picture])
    if params[:image_id].present?
      byebug
      preloaded = Cloudinary::PreloadedFile.new(params[:image_id])
      raise "Invalid upload signature" if !preloaded.valid?
      @picture.url = preloaded.identifier
    end
  end

  def create
    @picture = Picture.new(url: @url)
  end
end
