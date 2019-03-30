import Vue from 'vue'
import Vuex from 'vuex'
import VueResource from 'vue-resource'
import 'es6-promise/auto'

import mutations from './mutations'
import actions from './actions'
import getters from './getters'

Vue.use(Vuex)
Vue.use(VueResource)

export const store = new Vuex.Store({
  state: {
    count: 0,
    proyectosPorZona: null
  },
  mutations,
  actions,
  getters
})
