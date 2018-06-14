class AddNameAndAgeToChecklist < ActiveRecord::Migration[5.1]
  def change
    add_column :check_ativides, :age_user, :integer  
    add_column :check_ativides, :title, :string   
  end
end
