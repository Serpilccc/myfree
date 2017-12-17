class AddCourseToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :course, foreign_key: true
  end
end
