class AddDescriptionToBodyOfWater < ActiveRecord::Migration[6.1]
  def change
    add_column :body_of_waters, :description, :text
  end
end
