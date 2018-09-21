<template>
  <div id='navbar'>
  <v-toolbar color="blue darken-2">
    <md-icon class="md-size-1x" color="red">home</md-icon>
    <!--v-toolbar-side-icon></v-toolbar-side-icon-->
    <v-toolbar-title color="white" id="title"
    @click="inicio()" >
      Visualización Espol
    </v-toolbar-title>
    <v-spacer></v-spacer>
    <v-toolbar-items class="hidden-sm-and-down">
      <v-btn flat color="white"
      @click="inicio()" >
        <v-icon>exit_to_app</v-icon>
        Cerrar Sesión
      </v-btn>
    </v-toolbar-items>
  </v-toolbar>
  </div>
</template>
<script>
import router from '../router'
export default {
  methods: {
    inicio () {
      console.log('Entre')
      router.push('./')
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.imageLogo {
  background-color: #1394CE;
  padding: 10px;
  margin-bottom: 30px;
  text-align: left !important;
}
.i2s-name {
  text-align: left !important;
  padding: 20px;
  color: white;
  font-size: 40px;
}
#title{
  cursor: pointer;
  color: white;
}
</style>
