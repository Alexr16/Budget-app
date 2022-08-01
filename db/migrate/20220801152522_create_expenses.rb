class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.float :Amount, default: 0.00

      t.timestamps
    end
  end
end
