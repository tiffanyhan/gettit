class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text    :body
      t.integer :user_id
      t.integer :post_id
    end
  end
end
