class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.belongs_to :user,       null: false
      t.belongs_to :board,      null: false

      t.timestamps
    end

    add_index :bookmarks, [:user_id, :board_id], unique: true
  end
end
