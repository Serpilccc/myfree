class AddUserToCommenters < ActiveRecord::Migration[5.1]
  def change
    add_reference :commenters, :user, foreign_key: true
  end
end
