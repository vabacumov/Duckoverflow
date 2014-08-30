class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, limit:140, null:false
      t.text :content, null: false
      t.belongs_to :user, null: false
      t.timestamps
    end
  end
end
