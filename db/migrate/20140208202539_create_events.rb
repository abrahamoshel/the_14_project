class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :location, index: true
      t.datetime :time
      t.integer :created_by_user, index: true, null: false
      t.integer :contact_user, index: true, null: false

      t.timestamps
    end
  end
end
