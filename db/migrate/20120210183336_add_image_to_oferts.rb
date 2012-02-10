class AddImageToOferts < ActiveRecord::Migration
  def change
    add_column :oferts, :image, :string
  end
end
