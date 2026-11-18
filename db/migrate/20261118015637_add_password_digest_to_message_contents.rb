class AddPasswordDigestToMessageContents < ActiveRecord::Migration[8.1]
  def change
    add_column :message_contents, :password_digest, :string
  end
end
