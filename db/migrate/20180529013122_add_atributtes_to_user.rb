class AddAtributtesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :contact, :string
    add_column :users, :age, :integer
    add_column :users, :weight, :integer
    add_column :users, :heigth, :decimal
  end
end
