class RenameTypeColumnToMessageContents < ActiveRecord::Migration[7.0]
  def change
    rename_column :message_contents, :type, :person_type
  end
end
