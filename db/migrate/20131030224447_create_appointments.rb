class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :doctor_id
      t.integer :patient_id
      t.integer :previous_appointment_id
      t.integer :next_appointment_id

      t.timestamps
    end
  end
end
