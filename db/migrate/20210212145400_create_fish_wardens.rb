class CreateFishWardens < ActiveRecord::Migration[6.1]
  def change
    create_table :fish_wardens do |t|
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
