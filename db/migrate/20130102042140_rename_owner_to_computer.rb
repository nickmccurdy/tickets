class RenameOwnerToComputer < ActiveRecord::Migration
	def change
		rename_column :tickets, :owner, :computer
	end
end
