class CreateVideoChat < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :token, null: false
      t.datetime :deleted_at
      t.index :email
      t.index :token, unique: true
      t.timestamps
    end
    create_table :v_chats do |t|
      t.bigint :user_id, null: false
      t.datetime :ended_at
      t.string :token
      t.datetime :deleted_at
      t.index :user_id
      t.index :token, unique: true
      t.timestamps
    end
    create_table :v_participants do |t|
      t.bigint :user_id, null: false
      t.bigint :v_chat_id, null: false
      t.datetime :joined_at
      t.datetime :left_at
      t.datetime :deleted_at
      t.index [:v_chat_id, :user_id], name: 'index_v_participants'
      t.timestamps
    end
  end
end
