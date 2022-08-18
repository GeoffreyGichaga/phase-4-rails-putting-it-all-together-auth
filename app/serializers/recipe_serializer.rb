class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :intstructions, :minutes_to_complete
end
