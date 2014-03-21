class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :taken_at
      t.text :low_resolution_url
      t.text :thumbnail_url
      t.text :standard_resolution_url

      t.timestamps
    end
  end
end
