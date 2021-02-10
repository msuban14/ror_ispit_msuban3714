class CreateComments < ActiveRecord::Migration[6.1]
  def change
    drop_table :comments #removed last migration when model was destroyed, so we envoke it here, instead of db:rollback

    create_table :comments do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :fishing_area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
