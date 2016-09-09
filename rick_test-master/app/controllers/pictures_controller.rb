class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
    require 'httparty'
    derp = "http://i.imgur.com/Ysq0xY1.jpg"
    response = HTTParty.get "https://apicloud-facerect.p.mashape.com/process-url.json?features=true&url=" + derp,
      headers:{
        "X-Mashape-Key" => "",
        "Accept" => "text/plain"
      }
    require 'betaface'
    p response
    puts response
  end

  def new
    @picture = Picture.new(params[:picture])
  end

  def create
    render plain: params[:image_id]
    if params[:image_id].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:image_id])
      raise "Invalid upload signature" if !preloaded.valid?
      @picture.url = preloaded.identifier
    end
  end
end
