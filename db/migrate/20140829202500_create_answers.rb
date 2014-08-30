class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content, null:false
      t.belongs_to :user, null:false
      t.belongs_to :question, null:false
      t.timestamps
    end
  end
end
