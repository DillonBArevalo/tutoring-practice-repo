class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :category
      t.references :user
      t.string :name, null: false
      t.string :price, null: false
      t.string :description, null: false

      t.timestamps
    end 
  end
end
