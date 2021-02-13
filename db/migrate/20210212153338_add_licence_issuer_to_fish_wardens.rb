class AddLicenceIssuerToFishWardens < ActiveRecord::Migration[6.1]
  def change
    add_reference :fish_wardens, :licence_issuer, null: false, foreign_key: true
  end
end
