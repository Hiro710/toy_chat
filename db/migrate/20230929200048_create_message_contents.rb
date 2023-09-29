class CreateMessageContents < ActiveRecord::Migration[7.0]
  def change
    create_table :message_contents do |t|
      t.string :name
      t.string :sex
      t.string :mood
      t.string :type
      t.text :content
      t.datetime :post_time

      t.timestamps
    end
  end
end
