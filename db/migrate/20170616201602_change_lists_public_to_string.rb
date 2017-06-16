class ChangeListsPublicToString < ActiveRecord::Migration[5.1]
  def change
    remove_column :lists, :public
    add_column :lists, :permissions, :string
  end
end
