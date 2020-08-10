module Types
  class QueryType < Types::BaseObject
    field :recipes, [Types::RecipeType], null: false, description: 'レシピを全件取得する'
    def recipes
      Recipe.all
    end

    field :recipe, Types::RecipeType, null: false, description: 'レシピを一件取得する' do
      argument :id, Int, required: true
    end
    def recipe(id:)
      Recipe.find(id)
    end
  end
end
