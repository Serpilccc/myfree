class AddAuthorToCourses < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :author, foreign_key: true
  end
end
