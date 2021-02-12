class AddCountryToFisheries < ActiveRecord::Migration[6.1]
  def change
    add_reference :fisheries, :country, null: false, foreign_key: true
  end
end
