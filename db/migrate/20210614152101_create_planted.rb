class CreatePlanted < ActiveRecord::Migration[5.2]
  def change
    create_table :planteds do |t|
      t.references :plant, foreign_key: true
      t.references :plot, foreign_key: true
    end
  end
end
