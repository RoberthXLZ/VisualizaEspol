<template>
    <div class="md-layout md-gutter">
                  <div class="md-layout-item md-small-size-100">
                    <md-field :class="getValidationClass('selectedContinente')">
                      <label for="tipoProyecto">Contiente</label>
                      <md-select
                        name="selectedContinente"
                        id="selectedContinente"
                        v-model="form.selectedContinente"
                        md-dense
                        :md-open-on-focus="false"
                        :disabled="sending"
                        @md-opened="cambiaValor()"
                      >
                        <md-option value="Asia">Asia</md-option>
                        <md-option value="America">America</md-option>
                        <md-option value="Africa">Africa</md-option>
                        <md-option value="Europa">Europa</md-option>
                        <md-option value="Europa">Oceanía</md-option>
                      </md-select>
                      <span class="md-error">Campo Rquerido</span>
                    </md-field>
                  </div>

                  <div class="md-layout-item md-small-size-100">
                    <!--md-autocomplete name="selectedPaises" id="selectedPaises" v-model="form.selectedPaises" md-dense  :md-options="paises" >
                        <label >Paises</label>
                    </md-autocomplete-->
                    <v-card id="map" class="map"></v-card>
                  </div>
                </div>    
</template>

<script>
import L from 'leaflet'
export default {
    data: () => ({
    continenteValid: false,
    rolValido: false,
    nInversion: 1,
    paises: ['Ecuador', 'Chile', 'Colombia', 'Perú'],
    map: null,
    tileLayer: null,
    popup: null,
    form: {
      email: null,
      nombreProyecto: null,
      tipoProyecto: null,
      categoria: null,
      descripcion: null,
      selectedContinente: null,
      selectedZona: null,
      selectedPaises: null,
      fechaInicio: null,
      fechaFin: null,
      director: null,
      involucrado: null,
      inversion: null
    },
    Zonas: [
      'ZONA1',
      'ZONA2',
      'ZONA3',
      'ZONA4',
      'ZONA5',
      'ZONA6',
      'ZONA7',
      'ZONA8'],
    // paises: ['Ecuador', 'Perú','Chile','Brasil'],
    userSaved: false,
    sending: false,
    lastUser: null
  }),
  validations: {
    form: {
      nombreProyecto: {
        required,
        minLength: minLength(3),
        counter: 10
      },
      tipoProyecto: {
        required
      },
      descripcion: {
        required,
        maxLength: maxLength(200)
      },
      categoria: {
        required
      },
      email: {
        required
      }
    }
  },
  mounted () {
    this.initMap()
    this.popup = L.popup()
    this.map.on('click', this.onMapClick)
    // this.initLayers()
  },
  methods: {
    initMap () {
      this.map = L.map('map').setView([37.88437176085360, -4.779524803161621], 14)

      this.tileLayer = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
      })
      this.tileLayer.addTo(this.map)
      // L.geoJSON(data.geojsonFeature).addTo(this.map)
      // console.log('data',data)
      // console.log('Zonas: ',zona8)
      // this.myLyres = L.geoJSON().addTo(this.map)
    },

    onMapClick(e) {
    this.popup
        .setLatLng(e.latlng) // Sets the geographical point where the popup will open.
        .setContent("Has hecho click en la coordenada:<br> " +  e.latlng.lat.toString() + "," +  e.latlng.lng.toString()) // Sets the HTML content of the popup.
        .openOn(this.map); // Adds the popup to the map and closes the previous one. 
    }
}
  
}
</script>



<style scoped>

</style>
