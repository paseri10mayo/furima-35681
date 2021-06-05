class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,         null: false
      t.text       :text,         null: false
      t.integer    :price,        null: false
      t.integer    :categry_id,      null: false
      t.integer    :condition_id,    null: false
      t.integer    :charge_id,    null: false
      t.integer    :area_id,      null: false
      t.integer    :shipment_id,   null: false
      t.references :user,         foreign_key: true

      t.timestamps
    end
  end
end
