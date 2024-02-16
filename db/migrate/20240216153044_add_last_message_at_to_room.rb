class AddLastMessageAtToRoom < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :last_message_at, :datetime
  end
end
