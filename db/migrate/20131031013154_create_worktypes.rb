class CreateWorktypes < ActiveRecord::Migration
  def change
    create_table :worktypes do |t|
      t.string :name
      t.string :billing_unit

      t.timestamps
    end
  end
end
