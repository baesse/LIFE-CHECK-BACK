class CreateCheckAtivides < ActiveRecord::Migration[5.1]
  def change
    create_table :check_ativides do |t|
      t.string :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
