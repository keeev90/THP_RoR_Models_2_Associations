### RELATION 1-N : LIAISONS ENTRE DES TABLES ###
# Cas où 2 tables n'existent pas :
# Création Table 1 avec son model >> $ rails g model User first_name:string last_name:string age:integer city:string
# Création Table 2 avec son model >> idem + ajouter t.belongs_to :user, index: true directement dans le fichier de migration généré

# Cas où 2 tables existent déjà :
# Faire une migration dédiée AddIndexToArticle : rajouter l'identifiant de la table users dans la table articles >> $ rails generate migration AddIndexToArticles
# Puis rajouter dans le fichier de migration dédié un identifiant de user avant de la passer >> add_reference :articles, :user, foreign_key: true

class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subject
      t.text :content
      t.belongs_to :user, index: true #cette ligne rajoute la référence à la table users >>> idem que "t.references :user, foreign_key: true, index: true"
      t.timestamps
    end
  end
end

# "index: true" permet d'ajouter automatiquement un index à une foreign-key > user_01