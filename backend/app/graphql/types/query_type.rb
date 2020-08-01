module Types
  class QueryType < Types::BaseObject
    field :recipes, [Types::RecipeType], null: false, description: "レシピを全件取得する"
    def recipes
      Recipe.all
    end
  end
end
