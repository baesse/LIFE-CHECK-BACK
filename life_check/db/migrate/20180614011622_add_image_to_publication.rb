class AddImageToPublication < ActiveRecord::Migration[5.1]
  def change
    add_column :publications, :image, :string
  end
end
