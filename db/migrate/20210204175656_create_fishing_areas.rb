class CreateFishingAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :fishing_areas do |t|
      t.string :name
      t.text :description
      t.integer :views, default: 0
      t.references :user

      t.timestamps
    end
  end
end
