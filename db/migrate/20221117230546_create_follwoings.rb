class CreateFollwoings < ActiveRecord::Migration[7.0]
  def change
    create_table :follwoings do |t|
      t.integer :following_id
      t.integer :follower_id

      t.timestamps
    end
  end
end
