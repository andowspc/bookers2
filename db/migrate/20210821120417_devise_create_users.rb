# 「User」モデルのマイグレーションファイル

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      
      ## Database authenticatable(ログイン)
      t.string :name,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable(実装せず)
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable（実装せず）
      t.datetime :remember_created_at
  
      ##メールを入力する箇所を追記
      t.string :email
      
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    
  end
end
