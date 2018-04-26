class ChangeColumnNameAndAddColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :books, :name, :title
    add_column :books, :genre, :string 
  end
end
