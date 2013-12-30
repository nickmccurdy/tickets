class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :owner
      t.string :reason
      t.boolean :open

      t.timestamps
    end
  end
end
