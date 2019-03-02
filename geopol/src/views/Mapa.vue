<template>
  <div id="home">
    <v-layout row wrap>
      <v-flex xs12 fill-height>
        <v-btn
            color="pink"
            dark
            @click.stop="drawer = !drawer"
          >
            Toggle
        </v-btn>
        <v-layout wrap style="height: 200px;">
          <v-navigation-drawer v-model="drawer"  
            hide-overlay>
            <v-list class="pa-1">
              <v-list-tile avatar>
                <v-list-tile-avatar>
                  <img src="https://randomuser.me/api/portraits/men/85.jpg">
                </v-list-tile-avatar>

                <v-list-tile-content>
                  <v-list-tile-title>John Leider</v-list-tile-title>
                </v-list-tile-content>
              </v-list-tile>
            </v-list>

            <v-list class="pt-0" dense>
              <v-divider></v-divider>

              <v-list-tile
                v-for="item in items"
                :key="item.title"
                
              >
                <v-list-tile-action>
                  <v-icon>{{ item.icon }}</v-icon>
                </v-list-tile-action>

                <v-list-tile-content>
                  <v-list-tile-title>{{ item.title }}</v-list-tile-title>
                </v-list-tile-content>
              </v-list-tile>
            </v-list>
          </v-navigation-drawer>
        </v-layout>
        <v-card id="map" class="map mx-3" flat>
          
        </v-card>
      </v-flex>
    </v-layout>
  </div>
  
</template>

<script>
  import L from 'leaflet'

  export default {
    components: {
      
    },
    data(){
      return {
        drawer: false,
        items: [
          { title: 'Home', icon: 'dashboard' },
          { title: 'About', icon: 'question_answer' }
        ],
        mini: false,
        right: null,
        map: null,
        tileLayer: null,
        layers: [],
      }
    },
    methods: {
      initMap() {
        this.map = L.map('map').setView([-1.931271, -78.932064], 7);
      },
      initLayers() {
        this.tileLayer = L.tileLayer(
          'https://cartodb-basemaps-{s}.global.ssl.fastly.net/rastertiles/voyager/{z}/{x}/{y}.png',
          {
            maxZoom: 18,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>, &copy; <a href="https://carto.com/attribution">CARTO</a>',
          }
        );
        this.tileLayer.addTo(this.map);
        var drawnItems = new L.FeatureGroup();
        this.map.addLayer(drawnItems);

        var drawControl = new L.Control.Draw({
            edit: {
                featureGroup: drawnItems
            }
        });
        this.map.addControl(drawControl);
      },
      
    },
    mounted() {
      this.initMap();
      this.initLayers();
      
    }
  }
</script>
 


 
 <style scoped lang="scss">
 .map {
    width: 100%;
    height:650px;
    
}
 </style>
 
