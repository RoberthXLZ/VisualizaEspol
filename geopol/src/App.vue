<template>
  <v-app>
    
    <navBar/>
    <router-view>

    </router-view>
  </v-app>
</template>

<script>
import navBar from './components/NavBar'
/*import Home from './views/Home'
import About from './views/About'*/
export default {
  name: 'App',
  components: {
    'navBar' : navBar,
  },
  data () {
    return {
      titulo: 'Roberth is here'
    }
  }
}
</script>

<style>
v-app{
  align-content: center;
  max-width: 80%
}
</style>

