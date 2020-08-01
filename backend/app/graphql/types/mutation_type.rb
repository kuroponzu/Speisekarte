module Types
  class MutationType < Types::BaseObject
    field :delete_recipe, mutation: Mutations::DeleteRecipe
    field :update_recipe, mutation: Mutations::UpdateRecipe
    field :create_recipe, mutation: Mutations::CreateRecipe
  end
end
