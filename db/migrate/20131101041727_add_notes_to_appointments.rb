class AddNotesToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :notes, :text
  end

  def up
    add_index :appointments, :doctor_id
    add_index :appointments, :patient_id

    add_index :appointments, :next_appointment_id
    add_index :appointments, :previous_appointment_id
  end

  def down
    remove_index :appointments, :doctor_id
    remove_index :appointments, :patient_id

    remove_index :appointments, :next_appointment_id
    remove_index :appointments, :previous_appointment_id
  end
end
