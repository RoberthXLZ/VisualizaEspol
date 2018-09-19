import Vue from 'vue'
import Router from 'vue-router'
import Mapa from '@/components/Mapa'
import crearProyectos from '@/components/crearProyectos'

Vue.use(Router)
export default new Router({
  routes: [
    {
      path: '/',
      name: 'Mapa',
      component: Mapa
    },
    {
      path: '/crearProyectos',
      name: 'crearProyectos',
      component: crearProyectos
    }
  ]
})
