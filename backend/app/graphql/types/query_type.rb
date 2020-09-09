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

    field :serch_recipes_by_cooking_time, Types::RecipeType, null: false, description: '調理時間を指定し、レシピを一件取得する' do
      argument :cooking_time, Int, required: true
    end
    def serch_recipes_by_cooking_time(cooking_time:)
      Recipe.where(cooking_time: cooking_time).shuffle.first
    end
  end
end
