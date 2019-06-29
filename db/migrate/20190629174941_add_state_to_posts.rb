class AddStateToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :state, :string, null: false, default: "pending"
  end
end
