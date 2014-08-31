class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user, null: false
      t.references :voteable, polymorphic: true, null: false
      t.boolean :upvote
      t.timestamps
    end
  end
end
