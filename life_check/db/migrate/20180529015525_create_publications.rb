class CreatePublications < ActiveRecord::Migration[5.1]
  def change
    create_table :publications do |t|
      t.string :title
      t.text :description
      t.references :user
      t.timestamps
    end
  end
end
