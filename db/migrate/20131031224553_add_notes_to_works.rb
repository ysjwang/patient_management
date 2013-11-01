class AddNotesToWorks < ActiveRecord::Migration
  def change
    add_column :works, :notes, :text
  end
end
