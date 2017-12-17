class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :titre
      t.string :matiere
      t.string :fac
      t.string :annee
     

      t.timestamps
    end
  end
end
