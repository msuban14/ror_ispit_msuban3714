class CreateFish < ActiveRecord::Migration[6.1]
  def change
    create_table :fish do |t|
      t.string :name
      t.string :latin_name
      t.text :description

      t.timestamps
    end
  end
end
