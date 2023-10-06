class RemovePostTimeFromMessageContents < ActiveRecord::Migration[7.0]
  def change
    # MessageContentsテーブルのdatetime型のpost_timeカラムを削除
    remove_column :message_contents, :post_time, :datetime
  end
end
