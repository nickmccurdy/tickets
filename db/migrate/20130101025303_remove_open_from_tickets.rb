class RemoveOpenFromTickets < ActiveRecord::Migration
  def up
    remove_column :tickets, :open
  end

  def down
    add_column :tickets, :open, :boolean
  end
end
