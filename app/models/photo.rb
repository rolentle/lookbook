class Photo < ActiveRecord::Base
  def self.all_by_recency
    order(taken_at: :desc)
  end
end

