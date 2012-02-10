class CreateOferts < ActiveRecord::Migration
  def change
    create_table :oferts do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :link

      t.timestamps
    end
  end
end
