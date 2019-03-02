import Vue from 'vue'
import Router from 'vue-router'
import Mapa from './views/Mapa.vue'
import Formulario from './views/Formulario.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'mapa',
      component: Mapa
    },
    {
      path: '/about',
      name: 'about',
      component: Formulario
    }
  ]
})
