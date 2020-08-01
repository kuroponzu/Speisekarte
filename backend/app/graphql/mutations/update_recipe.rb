module Mutations
  class UpdateRecipe < BaseMutation
    graphql_name 'UpdateRecipe'

    field :recipe, Types::RecipeType, null: true
    field :result, Boolean, null: true

    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :cooking_time, Integer, required: false

    def resolve(**args)
      recipe = Recipe.find(args[:id])
      recipe.update(
        title: args[:title],
        description: args[:description],
        cooking_time: args[:cooking_time],
      )
      {
        recipe: recipe,
        result: recipe.errors.blank?
      }
    end
  end
end
