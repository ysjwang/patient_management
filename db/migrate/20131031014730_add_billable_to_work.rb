class AddBillableToWork < ActiveRecord::Migration
  def change
    add_column :works, :billable, :boolean
  end
end
