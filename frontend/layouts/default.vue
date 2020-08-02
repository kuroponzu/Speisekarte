<template>
  <v-app>
    <v-toolbar fixed>
      <v-toolbar-titile v-text="title" />
    </v-toolbar>
    <v-content>
      <nuxt />
    </v-content>
    <v-footer centor>
      <v-layout justify-centor>
        <span>&copy; 2020 sho shimohata. All Rights Reserved.</span>
      </v-layout>
    </v-footer>
  </v-app>
</template>

<script>
export default{
  deta(){
    return{
      title: 'Recipe'
    }
  }
}
</script>
