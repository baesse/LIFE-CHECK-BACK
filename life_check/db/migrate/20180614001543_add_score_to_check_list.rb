class AddScoreToCheckList < ActiveRecord::Migration[5.1]
  def change
    add_column :check_ativides, :score, :integer   
  end
end
