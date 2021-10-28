### RELATION 1-N : LIER LES MODELS ENTRE EUX ###
# En liant 2 tables, tu stockes l'information que 2 entrées de BDD sont liées.
# Ainsi, si tu disposes d'une instance de Article, tu peux immédiatement récupérer l'instance User qui lui est liée (son auteur) en faisant .user dessus (tu noteras le singulier de "user").
# Symétriquement, si tu disposes d'une instance de User tu peux immédiatement récupérer un array des instances Article qui lui sont liées (les articles qu'il a écrits) en faisant .articles dessus (tu noteras le pluriel de "articles").

class Article < ApplicationRecord
  belongs_to :user #convention : "user" à mettre au singulier car un article n'a qu'un seul user
end

### FOCUS ON "optional: ###
# utile pour remédier à un ROLLBACK (= impossibilité d'enregistrer en base une entrée avec une foreign_key vide)
# ex : pour créer un article sans user >>>
# class Article < ApplicationRecord
#   belongs_to :user, optional: true
# end

