class AddBodyOfWatertoFishingArea < ActiveRecord::Migration[6.1]
  def change
    add_reference :fishing_areas, :body_of_water
  end
end
