<template >
  <div class="row">
    <div class="col-md-4" id="panel_de_control">
      <div
        class="form-check"
        v-for="layer in layers"
        :key="layer.id"
      >
        <label class="form-check-label">
        <input
              class="form-check-input"
              type="checkbox"
              v-model="layer.active"
              @change="layerChanged(layer.id, layer.active)"
        />
          {{ layer.name }}
        </label>
      </div>
      <div style="border: 3px solid black">
        <button v-on:click="irALogin()">Ir a la otra</button>
      </div>
    </div>

    <!-- Aqui tenemos una columna de 8 del total del la pagina-->
    <div class="col-md-8">
        <div id="map" class="map">
        </div>
    </div>
  </div>


</template>
<script>
import router from '../router'
import zona8 from './zona8.js'
export default {
  name: 'HelloWorld',
  data () {
    return {
      tilulo_de_la_pagina: 'Espol Visualización',
      map: null,
      tileLayer: null,
      myLyres: null,
      LgeoJson: null,
      layers: [
      {
      id: 0,
      name: 'Zona 8',
      active: false,
      features: [
         {
            id: 0,
            name: 'Roberth\'s Smokehouse',
            type: 'marker',
            coords: [-2.5562194448989453,-79.9639892578125]
          },
          {
            id: 1,
            name: 'Pappy\'s Smokehouse',
            type: 'marker',
            coords: [-2.3778571536645723,-79.8760986328125]
          },
          {
            id: 2,
            name: 'Broadway Oyster Bar',
            type: 'marker',
            coords: [-2.5562194448989453,-79.91729736328125]
          },
          {
            id: 3,
            name: 'Charlie Gitto\'s On the Hill',
            type: 'marker',
            coords: [-2.5562194448989453,-79.9639892578125]
          },
          {
            id: 4,
            name: 'Sugarfire',
            type: 'marker',
            coords: [ -2.2516174965491453,-79.9639892578125]
          },
          {
            id: 5,
            name: 'Guayaquil1',
            type: 'marker',
            coords: [-0.354358160095088,-78.75469506249999]
          },
          {
            id: 6,
            name: 'Guayaquil6',
            type: 'marker',
            coords: [-1.354358160095088,-74.75469506249999]
          },
          {
            id: 7,
            name: 'Zia\'s Restaurant',
            type: 'marker',
            coords: [-0.354358160095088,-70.75469506249999]
          },
          {
            id: 8,
            name: 'Anthonio\'s Taverna',
            type: 'marker',
            coords: [-0.354358160095088,-73.75469506249999]
          }
        ]
      },      
      {
      id: 1,
      name: 'Paises del Ecuador',
      active: false,
      features: [
          {
                id: 0,
                name: 'Ecuador',
                type: 'polygon',
                coords: [
          [1.354358160095088,-78.75469506249999],
          [1.184111917513335,-78.42510521874999],
          [1.1896039030746839,-78.32073510156249],
          [1.0797621819591867, -78.23833764062499],
          [1.0523011157543285, -78.26580346093749],
          [0.6788092434493054, -77.51873314843749],
          [0.45909364873581554, -77.51873314843749],
          [0.3052885230506524, -76.42010033593749],
          [-0.11219042943918141, -75.23357689843749],
          [-0.1561356203853833, -75.51922142968749],
          [-0.9910473292632411,-75.16765892968749],
          [-0.9471083034044788,-75.34344017968749],
          [-2.15513915866521,-76.04656517968749],
          [-2.5942138211065853,-76.61785424218749],
          [-3.0331360848402764,-77.84832299218749],
          [-3.3402772303420516,-78.13396752343749],
          [-3.493812327810823,-78.15594017968749],
          [-3.3402772303420516,-78.35369408593749],
          [-4.545890181956294,-78.63933861718749],
          [-5.027601178862816,-78.96892846093749],
          [-4.326822083702392,-80.08953392968749],
          [-4.458270753516717,-80.41912377343749],
          [-4.222742334728058,-80.32024682031249],
          [-4.178915086001414,-80.45208275781249],
          [-3.998102072516552,-80.43011010156249],
          [-4.009061590550846,-80.27080834374999],
          [-3.910420686971306,-80.12798607812499],
          [-3.3402772303420516,-80.23784935937499],
          [-2.725907672161004,-79.77642357812499],
          [-3.022165091872359,-80.20489037499999],
          [-2.725907672161004,-80.27080834374999],
          [-2.2539429177919166,-80.95196068749999],
          [-1.957512697158963,-80.72124779687499],
          [-1.5841565956786048,-80.83111107812499],
          [-1.3205696597218908,-80.71026146874999],
          [-1.045970288868731,-80.89702904687499],
          [-0.9141536670283867,-80.46856224999999],
          [-0.27698434412988787,-80.42461693749999],
          [0.1734537651737531,-80.04009545312499],
          [0.81063401557762,-80.06206810937499],
          [1.0852543656342206,-79.16118920312499],
          [1.4367311737401145,-78.80962670312499]
          ]
                }
              ]
              //Aqui Termina los features 
          },// termina id 
          ] //Aqui termina los layers
        }// Aqui termina el retun
      }, //  Aqui el data

  mounted () {
    this.initMap()
    this.initLayers()
  },

  methods: {
    initMap () {
      this.map = L.map('map').setView([-2.3778571536645723,-79.8760986328125], 7);

      this.tileLayer = L.tileLayer(
        'https://cartodb-basemaps-{s}.global.ssl.fastly.net/rastertiles/voyager/{z}/{x}/{y}.png',
        {
          maxZoom: 18,
          attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>, &copy; <a href="https://carto.com/attribution">CARTO</a>',
        }
      );
      this.tileLayer.addTo(this.map);
      console.log('Zonas: ',zona8)
      this.myLyres = L.geoJSON().addTo(this.map);
      
    },
    
    initLayers() {
      this.layers.forEach((layer) => {
        const markerFeatures = layer.features.filter(feature => feature.type === 'marker');
        const polygonFeatures = layer.features.filter(feature => feature.type === 'polygon');
        
        markerFeatures.forEach((feature) => {
          feature.leafletObject = L.marker(feature.coords)
            .bindPopup(feature.name);
        });
        
        polygonFeatures.forEach((feature) => {
          feature.leafletObject = L.polygon(feature.coords)
            .bindPopup(feature.name);
        });
      });
    },
     layerChanged(layerId, active) {
      const layer = this.layers.find(layer => layer.id === layerId);
      layer.features.forEach((feature) => {
        if (active) {
          feature.leafletObject.addTo(this.map);
        } else {
          feature.leafletObject.removeFrom(this.map);
        }
      });
    },
    irALogin () {
      console.log('Entre')
      router.push ('./Login')
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.map {
  width: 100%;
    height: 580px;
    box-shadow: 5px 5px 5px #888;
    margin-left:5px;
    border: 5px solid black;
}
#panel_de_control {
  padding-right: 0px;
  height: 580px;
  border: 2px solid black;
  box-shadow: 5px 5px 5px #888;
}
</style>
