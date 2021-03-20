class AddImagesToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :image, :json
  end
end
