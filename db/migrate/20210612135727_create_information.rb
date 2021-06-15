class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.string     :postal_code,   null: false
      t.integer    :area_id, null: false
      t.string     :city,          null: false
      t.string     :address,       null: false
      t.string     :building,      null: false
      t.string     :phone,         null: false
      t.references :order,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
