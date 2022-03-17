class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :username, null: false, unique: true
      t.string :hashed_password
      t.boolean :admin, null: false, default: false

      t.timestamps
    end
  end
end
