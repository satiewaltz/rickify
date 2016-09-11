class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new(params[:picture])
    if params[:image_id].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:image_id])
      raise "Invalid upload signature" if !preloaded.valid?
      @picture.url = preloaded.identifier
    end
  end

  def create
    @picture = Picture.new(url: @url)
    # redirect_to: "pictures#index"
  end

  def upload
    Picture.create(url: "#{params[:address]}.#{params[:format]}")
    # if(params[:redirtag]=="1")
    #   redirect_to "/"
    # end
  end

  def frs
    require "httparty"
    db_url = params[:address]
    response = HTTParty.get "https://apicloud-facerect.p.mashape.com/process-url.json?features=true&url=#{db_url}",
    headers:{
      "X-Mashape-Key" => "cQ44XFRFiemsh1JbW4kP9ltCLibEp1EQ0tCjsnda0ASVCmSYH4",
      "Accept" => "text/plain"
    }
    @coords = response.parsed_response
    render :json => @coords
  end
end
