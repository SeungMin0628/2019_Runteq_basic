class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.belongs_to :user,           null: false
      t.string :title,              null: false
      t.text :body,                 null: false

      t.timestamps                  null: false
    end
  end
end
