<template>
  <v-container>
    <v-row>
      <v-col cols="6" offset="3">
        <v-card>
          <v-card-title>Register Recipes</v-card-title>
          <v-card-text>
            <v-form>
              <v-container>
                <v-row>
                  <v-col cols="6">
                    <v-text-field v-model="newRecipe.title" label="Title" required />
                  </v-col>
                </v-row>
                <v-row>
                  <v-col cols="12">
                    <v-text-field v-model="newRecipe.description" label="Description" required />
                  </v-col>
                </v-row>
                <v-row>
                  <v-col cols="12">
                    <v-text-field v-model.number="newRecipe.cookingTime" label="cookingTime" required />
                  </v-col>
                </v-row>
                <v-row>
                  <v-col>
                    <v-btn @click="createRecipe(newRecipe)">
                      Register
                    </v-btn>
                  </v-col>
                </v-row>
              </v-container>
            </v-form>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
    <v-row v-for="recipe in recipes" :key="recipe.id">
      <v-col cols="6" offset="3">
        <v-card>
          <v-card-title>
            <v-btn text icon @click="deleteRecipe(recipe)">
              <v-icon>clear</v-icon>
            </v-btn>
          </v-card-title>
          <v-card-text>{{ recipe.title }}</v-card-text>
          <v-card-text>{{ recipe.description }}</v-card-text>
          <v-card-text>{{ recipe.cookingTime }}</v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import recipes from '~/apollo/queries/recipes'
import createRecipe from '~/apollo/mutations/createRecipe'
import deleteRecipe from '~/apollo/mutations/deleteRecipe'
import updateRecipe from '~/apollo/mutations/updateRecipe'

export default {
  data() {
    return {
      recipes: {},
      newRecipe: {
        title: '',
        description: '',
        cookingTime: 0,
      }
    }
  },
  methods: {
    async createRecipe(recipe) {

      try {
        await this.$apollo.mutate({
          mutation: createRecipe,
          variables: {
            id: recipe.id,
            title: recipe.title,
            description: recipe.description,
            cookingTime: recipe.cookingTime,
          },
          refetchQueries: [{
            query: recipes
          }]
        })
        this.newRecipe = { title: '', description: '', cookingTime: '' }
      } catch (e) {
        window.console.log(e)
      }
    },
    async deleteRecipe(recipe) {
      try {
        await this.$apollo.mutate({
          mutation: deleteRecipe,
          variables: {
            id: Number(recipe.id)
          },
          refetchQueries: [{
            query: recipes
          }]
        })
      } catch (e) {
        window.console.log(e)
      }
    },
    async updateRecipe(recipe) {
      try {
        await this.$apollo.mutate({
          mutation: updateRecipe,
          variables: {
            id: recipe.id,
            title: recipe.title,
            description: recipe.description
          },
          refetchQueries: [{
            query: recipes
          }]
        })
      } catch (e) {
        window.console.log(e)
      }
    }
  },
  apollo: {
    recipes: {
      query: recipes
    }
  }
}
</script>
