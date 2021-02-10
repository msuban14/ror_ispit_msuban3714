class BodyOfWaterFixColumnName < ActiveRecord::Migration[6.1]
  def change
    #it seems that type is reserved
    rename_column :body_of_waters, :type, :water_type
  end
end
