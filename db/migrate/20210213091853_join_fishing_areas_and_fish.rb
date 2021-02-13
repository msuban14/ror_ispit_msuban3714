class JoinFishingAreasAndFish < ActiveRecord::Migration[6.1]
  def change
    create_join_table :fishing_areas, :fish do |t|
      t.index :fishing_area_id
      t.index :fish_id
    end
  end
end
