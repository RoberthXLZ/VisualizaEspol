<template>
  
</template>

<script>
import L from "leaflet";
export default {
  components: {},
  data() {
    return {
      tilulo_de_la_pagina: "Espol Visualización",
      map: null,
      tileLayer: null,
      myLyres: null,
      LgeoJson: null,
      checkbox1: false,
      checkbox2: false,
      drawer: false,
      mini: false,
      right: null,
      ciudad: false,
    }
    },
  methods: {
    initMap() {
      this.map = L.map("map").setView([-1.931271, -78.932064], 7);
      this.tileLayer = L.tileLayer(
        "https://cartodb-basemaps-{s}.global.ssl.fastly.net/rastertiles/voyager/{z}/{x}/{y}.png",
        {
          maxZoom: 18,
          attribution:
            '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>, &copy; <a href="https://carto.com/attribution">CARTO</a>'
        }
      );
      this.tileLayer.addTo(this.map);
    },

    getCorde(e) {
      console.log(e.latlng.toString());
    }
  },
  mounted() {
    this.initMap();
    this.initLayers();
    this.map.on("click", this.getCorde);
    this.visualizarProvincias()
  }
  
};
</script>
 


 
 <style scoped lang="scss">
.map {
  width: 100%;
  height: 650px;
}
#panel_de_control {
  // margin-left: 0px;
  // padding: 10px;
  height: 650px;
  // border: 0px solid black;
  // box-shadow: 5px 5px 5px #888;
}
h1 {
  color: blue;
  text-align: center;
  padding-top: 3%;
}
button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

a {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

button:hover, a:hover {
  opacity: 0.7;
}
</style>
 
