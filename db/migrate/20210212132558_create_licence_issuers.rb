class CreateLicenceIssuers < ActiveRecord::Migration[6.1]
  def change
    create_table :licence_issuers do |t|
      t.string :name

      t.timestamps
    end
  end
end
