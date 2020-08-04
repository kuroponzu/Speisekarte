module Mutations
  class CreateRecipe < BaseMutation
    graphql_name 'CreateRecipe'

    field :recipe, Types::RecipeType, null: true
    field :result, Boolean, null: true

    argument :title, String, required: false
    argument :description, String, required: false
    argument :cooking_time, Integer, required: false

    def resolve(**args)
      recipe = Recipe.create(
        title: args[:title],
        description: args[:description],
        cooking_time: args[:cooking_time]
      )
      {
        recipe: recipe,
        result: recipe.errors.blank?
      }
    end
  end
end
