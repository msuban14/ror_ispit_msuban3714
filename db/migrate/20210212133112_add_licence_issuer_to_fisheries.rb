class AddLicenceIssuerToFisheries < ActiveRecord::Migration[6.1]
  def change
    add_reference :fisheries, :licence_issuer
  end
end
