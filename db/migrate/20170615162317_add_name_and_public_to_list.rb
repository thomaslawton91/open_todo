class AddNameAndPublicToList < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :name, :string
    add_column :lists, :public, :boolean
  end
end
