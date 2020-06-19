class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.references :user
      t.string     :name
      t.text       :address
      t.string     :city

      t.timestamps
    end
  end
end
