class CreateComments < ActiveRecord::Migration[6.1]
  def change
    #commented out later beacuse the error did not happen in production, and couldn't dropped as it didn't exist
    #drop_table :comments #removed last migration when model was destroyed, so we envoke it here, instead of db:rollback

    create_table :comments do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :fishing_area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
