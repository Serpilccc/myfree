class AddPdfToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :pdf, :string
  end
end
