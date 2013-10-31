class AddRateToWorktypes < ActiveRecord::Migration
  def change
    add_column :worktypes, :rate, :decimal, precision: 8, scale: 2
  end
end
