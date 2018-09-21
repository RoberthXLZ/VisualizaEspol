// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
// import Vuex from 'vuex'
import Vuetify from 'vuetify'
import VueMaterial from 'vue-material'
import Vuelidate from 'vuelidate'

import { store } from './store'
import 'vuetify/dist/vuetify.css'
import Navbar from '@/components/Navbar'
import 'vuetify/dist/vuetify.min.css'
import 'vue-material/dist/theme/default.css'
// import confirmDialog from '@/components/confirmDialog'
import 'vue-material/dist/vue-material.min.css'

import App from './App'
import router from './router'
Vue.use(Vuetify)
Vue.use(VueMaterial)
Vue.use(Vuelidate)
Vue.config.productionTip = false
Vue.component('app-navbar', Navbar)
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
