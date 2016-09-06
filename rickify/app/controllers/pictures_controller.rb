class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
    #change to find_by user_id
  end
end
