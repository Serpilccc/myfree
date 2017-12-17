class AddCommenterToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :commenter, foreign_key: true
  end
end
