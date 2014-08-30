class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit:30, null:false
      t.string :username, limit:30, null:false
      t.string :password, limit:30, null:false
      t.string :email, limit:30, null:false
      t.timestamps
    end
  end
end
