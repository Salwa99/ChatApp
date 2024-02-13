class CreateJoinables < ActiveRecord::Migration[7.1]
  def change
    create_table :joinables do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
