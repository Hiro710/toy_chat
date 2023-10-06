class ChangeMessagesInputValueNotNull < ActiveRecord::Migration[7.0]
  # MessageContentsの各属性(name, sex, content)にNOT NULL制約を付ける
  # 意図的にNULLを保存できなくする
  # change_column_null :テーブル名, :カラム名, NULLを許容するか否か
  def change
    change_column_null :message_contents, :name, false
    change_column_null :message_contents, :sex, false
    change_column_null :message_contents, :content, false
  end
end
