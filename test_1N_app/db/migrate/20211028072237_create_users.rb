### RELATION 1-N : LIAISONS ENTRE DES TABLES ###
# Cas où 2 tables n'existent pas :
# Création Table 1 avec son model >> $ rails g model User first_name:string last_name:string age:integer city:string
# Création Table 2 avec son model >> idem + ajouter t.belongs_to :user, index: true directement dans le fichier de migration généré

# Cas où 2 tables existent déjà :
# Faire une migration dédiée AddIndexToArticle : rajouter l'identifiant de la table users dans la table articles >> $ rails generate migration AddIndexToArticles
# Puis rajouter dans le fichier de migration dédié un identifiant de user avant de la passer >> add_reference :articles, :user, foreign_key: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :city

      t.timestamps
    end
  end
end

