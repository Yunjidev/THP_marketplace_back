class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.string :image
      t.integer :superficie  # Ajout du champ Superficie en m²
      t.integer :num_rooms  # Ajout du champ Nombre de pièces
      t.boolean :furnished  # Ajout du champ meublé / non meublé en boolean
      t.string :category
      t.string :country_name
      t.string :city_name
      t.belongs_to :user, index: true
      t.belongs_to :city, foreign_key: true
      t.belongs_to :country, foreign_key: true

      t.timestamps
    end
  end
end