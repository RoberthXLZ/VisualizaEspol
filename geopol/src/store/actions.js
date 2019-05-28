// import Vue from 'vue'
import axios from 'axios'

export default {
  /*
  getProyectosPorZonas ({commit}, zonaId) {
    return new Promise((resolve, reject) => {
      Vue.http.get('https://jsonplaceholder.typicode.com/todos/1')
        .then((resp) => {
          console.log('Entre:', resp.body.estado)
          if (resp.body.estado) {
            console.log(resp.body.estado)
            commit('setProyectosPorZonas', resp.body.datos)
            return resolve()
          } else {
            commit('setError', resp.body.datos)
            return reject(resp.body.datos)
          }
        }).catch((err) => {
          commit('setError', err)
          return reject(err)
        })
    })
  } */

  getBeneficiariosAll({commit}, Id){
    /*return new Promise((resolve, reject) => {
      Vue.http.get('https://jsonplaceholder.typicode.com/todos/1')
        .then((resp) => {
          console.log('Entre:', resp.body.estado)
          if (resp.body.estado) {
            console.log(resp.body.estado)
            commit('setProyectosPorZonas', resp.body.datos)
            return resolve()
          } else {
            commit('setError', resp.body.datos)
            return reject(resp.body.datos)
          }
        }).catch((err) => {
          commit('setError', err)
          return reject(err)
        })
    })*/
    const proxyurl = "https://cors-anywhere.herokuapp.com/"
    const url = 'http://127.0.0.1:8000/beneficiario'
    axios.get(url)
      /*.then(function (response) {
      console.log(response.data);
      })*/
      .then(response => response)
      .then(contents => console.log(contents))
      .catch(function (error) {
      console.log('supererror',error);
      });
  }



}
