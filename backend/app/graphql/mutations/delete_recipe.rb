module Mutations
  class DeleteRecipe < BaseMutation
    graphql_name 'DeleteRecipe'

    field :recipe, Types::RecipeType, null: true
    field :result, Boolean, null: true

    argument :id, ID, required: true

    def resolve(**args)
      recipe = Recipe.find(args[:id])
      recipe.destroy
      {
        recipe: recipe,
        result: recipe.errors.blank?
      }
    end
  end
end
