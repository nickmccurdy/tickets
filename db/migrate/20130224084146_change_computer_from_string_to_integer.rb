class ChangeComputerFromStringToInteger < ActiveRecord::Migration
  def up
    change_column :tickets, :computer, :integer
  end

  def dowm
    change_column :tickets, :computer, :string
  end
end
