<template>
  <v-layout row wrap>
    <v-flex xs4 id="panel_de_control">
      <v-card>
         <h1>Proyectos</h1>
        <v-container fill-height fluid>
         
          <v-checkbox
            v-for="layer in layers"
            :key="layer.id"
            :label="`${layer.name}`"
            v-model="layer.active"
            @change="layerChanged(layer.id, layer.active)"
          ></v-checkbox>
          <!--div v-for = "index in this.$store.getters.proyectosPorZonas">
                <h1>ciudad: {{index.dpa_despro}}</h1>
          </div-->
        </v-container>
      </v-card>
        <v-card>
      
        <v-container fill-height fluid>
          <v-checkbox
            v-for="layer in layers"
            :key="layer.id"
            :label="`${layer.name}`"
            v-model="layer.active"
            @change="layerChanged(layer.id, layer.active)"
          ></v-checkbox>
          <!--div v-for = "index in this.$store.getters.proyectosPorZonas">
                <h1>ciudad: {{index.dpa_despro}}</h1>
          </div-->
        </v-container>
      </v-card>

    </v-flex>

    <v-flex xs8>
      <v-card id="map" class="map"></v-card>
    </v-flex>
  </v-layout>
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
      layers: [
        {
          id: 0,
          name: "Proyectos Integradores",
          active: false,
          features: [
            {
              id: 0,
              name: "Roberth's Smokehouse",
              categoria: "Proyectos Integradores",
              tipo: "Estudiantil",
              beneficiario: [
                {
                  nombre: "Adrian",
                  celular: "0981008659",
                  correo: "roberthloor1@gmail.com"
                },
                {
                  nombre: "Kevin",
                  celular: "0981006759",
                  correo: "kevinalvapearson77@gmail.com"
                },
                {
                  nombre: "Jorge",
                  celular: "0981003459",
                  correo: "lgino@gmail.com"
                }
              ],
              lugar: "Guayaquil",
              type: "marker",
              coords: [-2.5562194448989453, -79.9639892578125]
            }
            /*
            {
              id: 1,
              name: 'Pappy\'s Smokehouse',
              type: 'marker',
              coords: [-2.3778571536645723, -79.8760986328125]
            },
            {
              id: 2,
              name: 'Broadway Oyster Bar',
              type: 'marker',
              coords: [-2.5562194448989453, -79.91729736328125]
            },
            {
              id: 3,
              name: 'Charlie Gitto\'s On the Hill',
              type: 'marker',
              coords: [-2.5562194448989453, -79.9639892578125]
            },
            {
              id: 4,
              name: 'Sugarfire',
              type: 'marker',
              coords: [-2.2516174965491453, -79.9639892578125]
            },
            {
              id: 5,
              name: 'Guayaquil1',
              type: 'marker',
              coords: [-0.354358160095088, -78.75469506249999]
            }*/
          ]
        },
        {
          id: 1,
          name: "Investigaciones",
          active: false,
          features: [
            {
              id: 0,
              name: "Ecuador",
              type: "polygon",
              coords: [
                [1.354358160095088, -78.75469506249999],
                [1.184111917513335, -78.42510521874999],
                [1.1896039030746839, -78.32073510156249],
                [1.0797621819591867, -78.23833764062499],
                [1.0523011157543285, -78.26580346093749],
                [0.6788092434493054, -77.51873314843749],
                [0.45909364873581554, -77.51873314843749],
                [0.3052885230506524, -76.42010033593749],
                [-0.11219042943918141, -75.23357689843749],
                [-0.1561356203853833, -75.51922142968749],
                [-0.9910473292632411, -75.16765892968749],
                [-0.9471083034044788, -75.34344017968749],
                [-2.15513915866521, -76.04656517968749],
                [-2.5942138211065853, -76.61785424218749],
                [-3.0331360848402764, -77.84832299218749],
                [-3.3402772303420516, -78.13396752343749],
                [-3.493812327810823, -78.15594017968749],
                [-3.3402772303420516, -78.35369408593749],
                [-4.545890181956294, -78.63933861718749],
                [-5.027601178862816, -78.96892846093749],
                [-4.326822083702392, -80.08953392968749],
                [-4.458270753516717, -80.41912377343749],
                [-4.222742334728058, -80.32024682031249],
                [-4.178915086001414, -80.45208275781249],
                [-3.998102072516552, -80.43011010156249],
                [-4.009061590550846, -80.27080834374999],
                [-3.910420686971306, -80.12798607812499],
                [-3.3402772303420516, -80.23784935937499],
                [-2.725907672161004, -79.77642357812499],
                [-3.022165091872359, -80.20489037499999],
                [-2.725907672161004, -80.27080834374999],
                [-2.2539429177919166, -80.95196068749999],
                [-1.957512697158963, -80.72124779687499],
                [-1.5841565956786048, -80.83111107812499],
                [-1.3205696597218908, -80.71026146874999],
                [-1.045970288868731, -80.89702904687499],
                [-0.9141536670283867, -80.46856224999999],
                [-0.27698434412988787, -80.42461693749999],
                [0.1734537651737531, -80.04009545312499],
                [0.81063401557762, -80.06206810937499],
                [1.0852543656342206, -79.16118920312499],
                [1.4367311737401145, -78.80962670312499]
              ]
            },
            {
              id: 1,
              name: "BIBLIOTECA VIRTUAL  CIB – ESPOL",
              categoria: "Vinculos con la Sociedad",
              tipo: "Estudiantil",
              beneficiario: [
                {
                  nombre: "Adrian",
                  celular: "0981008659",
                  correo: "roberthloor1@gmail.com"
                },
                {
                  nombre: "Kevin",
                  celular: "0981006759",
                  correo: "kevinalvapearson77@gmail.com"
                },
                {
                  nombre: "Jorge",
                  celular: "0981003459",
                  correo: "lgino@gmail.com"
                }
              ],
              lugar: "Guayaquil",
              type: "marker",
              coords: [-2.3778571536645723, -79.8760986328125]
            },
            {
              id: 2,
              name: "LEGO MINDSTROM  CIB – ESPOL",
              categoria: "Proyectos de Investigaciones",
              tipo: "Estudiantil",
              array: ["h1", "h2", "h3"],
              beneficiario: [
                {
                  nombre: "Zambrano",
                  celular: "0981008659",
                  correo: "roberthloor1@gmail.com"
                },
                {
                  nombre: "Kevin",
                  celular: "0981006759",
                  correo: "kevinalvapearson77@gmail.com"
                },
                {
                  nombre: "Jorge",
                  celular: "0981003459",
                  correo: "lgino@gmail.com"
                }
              ],
              lugar: "Guayaquil",
              type: "marker",
              coords: [-2.5562194448989453, -79.91729736328125]
            }
            /*{
              id: 3,
              name: 'MATERIA INTEGRADORA  CIB – ESPOL',
              categoria: 'Vinculos con la Sociedad',
              tipo: 'Estudiantil',
              array: ['h1', 'h2', 'h3'],
              beneficiario: [{'nombre':'Javier', 'celular':'0981008659', 'correo':'roberthloor1@gmail.com'},
              {'nombre':'Kevin', 'celular':'0981006759', 'correo':'kevinalvapearson77@gmail.com'},
              {'nombre':'Jorge', 'celular':'0981003459', 'correo':'lgino@gmail.com'}],
              lugar: 'Guayaquil',
              type: 'marker',
              coords: [-2.5562194448989453, -79.9639892578125]
            },
            {
              id: 4,
              name: 'SCRATCH  CIB – ESPOL',
              categoria: 'Materia Integradora',
              tipo: 'Estudiantil',
              array: ['h1', 'h2', 'h3'],
              beneficiario: [{'nombre':'Loor', 'celular':'0981008659', 'correo':'roberthloor1@gmail.com'},
              {'nombre':'Kevin', 'celular':'0981006759', 'correo':'kevinalvapearson77@gmail.com'},
              {'nombre':'Jorge', 'celular':'0981003459', 'correo':'lgino@gmail.com'}],
              lugar: 'Guayaquil',
              type: 'marker',
              coords: [-2.2516174965491453, -79.9639892578125]
            },
            {
              id: 5,
              name: 'BIBLIOTECA VIRTUAL  CIB – ESPOL',
              categoria: 'Vinculos con la Sociedad',
              tipo: 'Estudiantil',
              array: ['h1', 'h2', 'h3'],
              beneficiario: [{'nombre':'Roberth', 'celular':'0981008659', 'correo':'roberthloor1@gmail.com'},
              {'nombre':'Kevin', 'celular':'0981006759', 'correo':'kevinalvapearson77@gmail.com'},
              {'nombre':'Jorge', 'celular':'0981003459', 'correo':'lgino@gmail.com'}],
              lugar: 'Guayaquil',
              type: 'marker',
              coords: [-0.354358160095088, -78.75469506249999]
            }*/
          ] // Aqui Termina los features
        }, // termina id

        {
          id: 3,
          name: "Materia Integradora",
          active: false,
          features: [
            {
              id: 0,
              name: "Ecuador",
              type: "polygon",
              coords: [
                [1.354358160095088, -78.75469506249999],
                [1.184111917513335, -78.42510521874999],
                [1.1896039030746839, -78.32073510156249],
                [1.0797621819591867, -78.23833764062499],
                [1.0523011157543285, -78.26580346093749],
                [0.6788092434493054, -77.51873314843749],
                [0.45909364873581554, -77.51873314843749],
                [0.3052885230506524, -76.42010033593749],
                [-0.11219042943918141, -75.23357689843749],
                [-0.1561356203853833, -75.51922142968749],
                [-0.9910473292632411, -75.16765892968749],
                [-0.9471083034044788, -75.34344017968749],
                [-2.15513915866521, -76.04656517968749],
                [-2.5942138211065853, -76.61785424218749],
                [-3.0331360848402764, -77.84832299218749],
                [-3.3402772303420516, -78.13396752343749],
                [-3.493812327810823, -78.15594017968749],
                [-3.3402772303420516, -78.35369408593749],
                [-4.545890181956294, -78.63933861718749],
                [-5.027601178862816, -78.96892846093749],
                [-4.326822083702392, -80.08953392968749],
                [-4.458270753516717, -80.41912377343749],
                [-4.222742334728058, -80.32024682031249],
                [-4.178915086001414, -80.45208275781249],
                [-3.998102072516552, -80.43011010156249],
                [-4.009061590550846, -80.27080834374999],
                [-3.910420686971306, -80.12798607812499],
                [-3.3402772303420516, -80.23784935937499],
                [-2.725907672161004, -79.77642357812499],
                [-3.022165091872359, -80.20489037499999],
                [-2.725907672161004, -80.27080834374999],
                [-2.2539429177919166, -80.95196068749999],
                [-1.957512697158963, -80.72124779687499],
                [-1.5841565956786048, -80.83111107812499],
                [-1.3205696597218908, -80.71026146874999],
                [-1.045970288868731, -80.89702904687499],
                [-0.9141536670283867, -80.46856224999999],
                [-0.27698434412988787, -80.42461693749999],
                [0.1734537651737531, -80.04009545312499],
                [0.81063401557762, -80.06206810937499],
                [1.0852543656342206, -79.16118920312499],
                [1.4367311737401145, -78.80962670312499]
              ]
            },
            {
              id: 1,
              name: "BIBLIOTECA VIRTUAL  CIB – ESPOL",
              categoria: "Vinculos con la Sociedad",
              tipo: "Estudiantil",
              beneficiario: [
                {
                  nombre: "Adrian",
                  celular: "0981008659",
                  correo: "roberthloor1@gmail.com"
                },
                {
                  nombre: "Kevin",
                  celular: "0981006759",
                  correo: "kevinalvapearson77@gmail.com"
                },
                {
                  nombre: "Jorge",
                  celular: "0981003459",
                  correo: "lgino@gmail.com"
                }
              ],
              lugar: "Guayaquil",
              type: "marker",
              coords: [-2.3778571536645723, -79.8760986328125]
            },
            {
              id: 2,
              name: "LEGO MINDSTROM  CIB – ESPOL",
              categoria: "Proyectos de Investigaciones",
              tipo: "Estudiantil",
              array: ["h1", "h2", "h3"],
              beneficiario: [
                {
                  nombre: "Zambrano",
                  celular: "0981008659",
                  correo: "roberthloor1@gmail.com"
                },
                {
                  nombre: "Kevin",
                  celular: "0981006759",
                  correo: "kevinalvapearson77@gmail.com"
                },
                {
                  nombre: "Jorge",
                  celular: "0981003459",
                  correo: "lgino@gmail.com"
                }
              ],
              lugar: "Guayaquil",
              type: "marker",
              coords: [-2.5562194448989453, -79.91729736328125]
            }
            /*{
              id: 3,
              name: 'MATERIA INTEGRADORA  CIB – ESPOL',
              categoria: 'Vinculos con la Sociedad',
              tipo: 'Estudiantil',
              array: ['h1', 'h2', 'h3'],
              beneficiario: [{'nombre':'Javier', 'celular':'0981008659', 'correo':'roberthloor1@gmail.com'},
              {'nombre':'Kevin', 'celular':'0981006759', 'correo':'kevinalvapearson77@gmail.com'},
              {'nombre':'Jorge', 'celular':'0981003459', 'correo':'lgino@gmail.com'}],
              lugar: 'Guayaquil',
              type: 'marker',
              coords: [-2.5562194448989453, -79.9639892578125]
            },
            {
              id: 4,
              name: 'SCRATCH  CIB – ESPOL',
              categoria: 'Materia Integradora',
              tipo: 'Estudiantil',
              array: ['h1', 'h2', 'h3'],
              beneficiario: [{'nombre':'Loor', 'celular':'0981008659', 'correo':'roberthloor1@gmail.com'},
              {'nombre':'Kevin', 'celular':'0981006759', 'correo':'kevinalvapearson77@gmail.com'},
              {'nombre':'Jorge', 'celular':'0981003459', 'correo':'lgino@gmail.com'}],
              lugar: 'Guayaquil',
              type: 'marker',
              coords: [-2.2516174965491453, -79.9639892578125]
            },
            {
              id: 5,
              name: 'BIBLIOTECA VIRTUAL  CIB – ESPOL',
              categoria: 'Vinculos con la Sociedad',
              tipo: 'Estudiantil',
              array: ['h1', 'h2', 'h3'],
              beneficiario: [{'nombre':'Roberth', 'celular':'0981008659', 'correo':'roberthloor1@gmail.com'},
              {'nombre':'Kevin', 'celular':'0981006759', 'correo':'kevinalvapearson77@gmail.com'},
              {'nombre':'Jorge', 'celular':'0981003459', 'correo':'lgino@gmail.com'}],
              lugar: 'Guayaquil',
              type: 'marker',
              coords: [-0.354358160095088, -78.75469506249999]
            }*/
          ] // Aqui Termina los features
        } // termina id


      ] // Aqui termina los layers
    };
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

    visualizarProvincias() {
      this.$store
        .dispatch("getProyectosPorZonas")
        .then(resp => {
          //console.log('no error:')
        })
        .catch(err => {
          //this.color = 'error'
          //this.snackbar = true
          //this.mensajeSnackbar = err
          console.log("error 1");
        });
      // var ciudad =
      // console.log(ciudad)
      //L.geoJSON(geojsonFeature).addTo(this.map);
    },

    initLayers() {
      this.layers.forEach(layer => {
        const markerFeatures = layer.features.filter(
          feature => feature.type === "marker"
        );
        const polygonFeatures = layer.features.filter(
          feature => feature.type === "polygon"
        );
        markerFeatures.forEach(feature => {
          /*  var greenIcon = L.icon({
          iconUrl: 'http://upload.wikimedia.org/wikipedia/commons/f/fc/Sarajevo.jpg',
          //shadowUrl: 'leaf-shadow.png',
          iconSize:     [38, 95], // size of the icon
          shadowSize:   [50, 64], // size of the shadow
          iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
          shadowAnchor: [4, 62],  // the same for the shadow
          popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
          }); */

          var bene = "<div>";
          const value = feature.beneficiario;
          value.forEach(ben => {
            bene =
              bene +
              "<div>" +
              ben.nombre +
              "</div>" +
              "<div>" +
              ben.celular +
              "</div>";
          });
          console.log(bene);
          //value.forEach(val)
          //console.log("beneficiario", value['nombre']);
          var ventana =
            '<div> <h4 style="text-align: center">' +
            feature.name +
            '</h4> <hr> <h4 style="color: red; letter-spacing: 2px; font: normal normal 18px quicksand; text-align:center;">' +
            feature.categoria +
            "</h4>" +
            "<div>" +
            feature.tipo +
            "<div>";
          ventana = ventana + bene;
          /*value.forEach((ben)=>{
            bene= bene +'<div>'+ ben.nombre +'</div>'+'<div>'+ ben.celular +'</div>';
          });*/

          feature.leafletObject = L.marker(
            feature.coords /*, {icon:greenIcon} */
          ).bindPopup(ventana);
        });
        polygonFeatures.forEach(feature => {
          feature.leafletObject = L.polygon(feature.coords, {
            color: "red"
          }).bindPopup("<div>feature.name</div>");
        });
      });
    },

    layerChanged(layerId, active) {
      const layer = this.layers.find(layer => layer.id === layerId);
      layer.features.forEach(feature => {
        if (active) {
          feature.leafletObject.addTo(this.map);
        } else {
          feature.leafletObject.removeFrom(this.map);
        }
      });
    },
    getCorde(e) {
      console.log(e.latlng.toString());
    }
  },
  mounted() {
    this.initMap();
    this.initLayers();
    this.map.on("click", this.getCorde);
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
</style>
 
