class PhotoFetcher
  attr_accessor :user_id

  def initialize
    Instagram.configure do |config|
      config.client_id = ENV['LOOKBOOK_CLIENT_ID']
      config.client_secret = ENV['LOOKBOOK_CLIENT_SECRET']
    end
  end

  def fetch_user_id(user_name)
    users = Instagram.user_search(user_name)
    @user_id = users.find { |user| user['username'] == user_name }['id']
  end

  def fetch_photos
    feed = Instagram.user_recent_media(user_id.to_i)
    @photos = parse_photos(feed)
  end

  def photos
    @photos ||= []
  end

  def parse_photos(feed)
    feed.map do |photo|
      { taken_at: photo['created_time'],
        low_resolution_url: photo['images']['low_resolution']['url'],
        thumbnail_url: photo['images']['thumbnail']['url'],
        standard_resolution_url: photo['images']['standard_resolution']['url']
      }
    end
  end

  def save_photos
    @photos.each do |photo_params|
      Photo.find_or_create_by(photo_params)
    end

    @photos = []
  end
end
