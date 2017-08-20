class CreateMessages < ActiveRecord::Migration
  def change 
    create_table :messages do |t|
      t.references :purchaser, references: :user
      #  references the user table but we're calling it a purchaser
      # could have done t.integer :purchaser_id
      t.references :seller, references: :user 
      t.references :article

      t.timestamps
    end 
  end
end
