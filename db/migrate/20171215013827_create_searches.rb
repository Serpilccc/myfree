class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :typedoc
      t.string :categorie

      t.timestamps
    end
  end
end
