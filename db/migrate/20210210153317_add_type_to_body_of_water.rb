class AddTypeToBodyOfWater < ActiveRecord::Migration[6.1]
  def change
    add_column :body_of_waters, :type, :integer
  end
end
