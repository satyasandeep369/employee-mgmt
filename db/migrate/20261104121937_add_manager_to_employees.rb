class AddManagerToEmployees < ActiveRecord::Migration[8.1]
  def change
    add_reference :employees, :manager, foreign_key: { to_table: :employees }, index: true
  end
end
