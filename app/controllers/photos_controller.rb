class PhotosController < ApplicationController
  def index
    @photos = Photo.all_by_recency
  end
end
