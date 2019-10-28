class AddImageUrlToResource < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :image_url, :string, :default => "https://placekitten.com/300/200"
  end
end
