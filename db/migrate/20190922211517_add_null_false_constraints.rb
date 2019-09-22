class AddNullFalseConstraints < ActiveRecord::Migration[5.1]
  def change
    change_column_null :posts, :title, false
    change_column_null :posts, :body, false
    change_column_null :posts, :user_id, false
    change_column_null :subscribers, :email, false
  end
end
