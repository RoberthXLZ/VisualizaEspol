import Vue from 'vue'
import Router from 'vue-router'
import Mapa from '@/components/Mapa'
import Login from '@/components/Login'

Vue.use(Router)
export default new Router({
  routes: [
    {
      path: '/',
      name: 'Mapa',
      component: Mapa
    },
    {
      path: '/',
      name: 'Login',
      component: Login
    }
  ]
})
