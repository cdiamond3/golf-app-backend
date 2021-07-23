class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :user
      t.string :input
      t.date :date

      t.timestamps
    end
  end
end
