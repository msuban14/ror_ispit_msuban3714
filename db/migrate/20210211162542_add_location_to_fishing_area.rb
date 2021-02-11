class AddLocationToFishingArea < ActiveRecord::Migration[6.1]
  def change
    add_reference :fishing_areas, :location
  end
end
