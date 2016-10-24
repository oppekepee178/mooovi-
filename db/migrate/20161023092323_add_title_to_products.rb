class AddTitleToProducts < ActiveRecord::Migration
  def change
  add_column :products, :title, :string
  add_column :products, :image_url, :text
  end
end
