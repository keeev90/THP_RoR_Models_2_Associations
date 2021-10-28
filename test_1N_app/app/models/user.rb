### RELATION 1-N : LIER LES MODELS ENTRE EUX ###
# En liant 2 tables, tu stockes l'information que 2 entrées de BDD sont liées.
# Ainsi, si tu disposes d'une instance de Article, tu peux immédiatement récupérer l'instance User qui lui est liée (son auteur) en faisant .user dessus (tu noteras le singulier de "user").
# Symétriquement, si tu disposes d'une instance de User tu peux immédiatement récupérer un array des instances Article qui lui sont liées (les articles qu'il a écrits) en faisant .articles dessus (tu noteras le pluriel de "articles").

class User < ApplicationRecord
  has_many :articles, dependent: :destroy # articles à mettre au pluriel cacr un user a plusieurs articles
end

### EXEMPLES DE COMMANDES DE BASE ###
# AJOUT d'un article à un user : "user1.update(articles: [article1] " en ayant préalablement create un user1 et un article1
# AJOUT d'un user à un article : "Article.create(title: "...", user: user1)"
# COMPTER le nombre d'articles d'un user : "user1.articles.count"

### FOCUS ON ":dependent" ### 
# https://www.sitepoint.com/brush-up-your-knowledge-of-rails-associations/
# It accepts the following values:
# :destroy – all associated objects will removed one by one (in a separate query). The appropriate callbacks will be run before and after deletion. >>> utile pour supprimer automatiquement tous les articles d'un user quand celui-ci est supprimé de la base
# :delete_all – all associated objects will be deleted in a single query. No callbacks will be executed.
# :nullify – foreign keys for the associated objects will be set to NULL. No callbacks will be executed.
# :restrict_with_exception – if there are any associated records, an exception will be raised.
# :restrict_with_error – if there are any associated records, an error will be added to the owner (the record you are trying to delete).
