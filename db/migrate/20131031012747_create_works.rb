class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.decimal :quantity, precision: 8, scale: 2
      t.integer :worktype_id
      t.integer :appointment_id

      t.timestamps
    end
  end
end
