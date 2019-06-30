<template>
  <div class="about">
    <form novalidate class="md-layout" @submit.prevent="validateUser">
      <md-card style="left:150px; top:20px;" class="md-layout-item md-size-80 md-small-size-100">
        <md-toolbar :md-elevation="1">
          <span class="md-title">Nuevo Proyecto</span>
        </md-toolbar>
        <md-card-content>
          <div>
            <md-steppers md-horizontal>
              <md-step
                id="first"
                md-label="Datos Principales"
                md-description="datos principales del proyecto"
              >
                <div class="md-layout md-gutter">
                  <div class="md-layout-item md-small-size-100">
                    <md-field :class="getValidationClass('nombreProyecto')">
                      <!--md-icon>thumb_up</md-icon-->
                      <label for="first-name">Nombre del Proyecto</label>
                      <md-input
                        name="first-name"
                        id="first-name"
                        autocomplete="given-name"
                        v-model="form.nombreProyecto"
                        :disabled="sending"
                        md-counter="100"
                      />
                      <span
                        class="md-error"
                        v-if="!$v.form.nombreProyecto.required"
                      >Nombre del Proyecto es Requerido</span>
                      <span
                        class="md-error"
                        v-else-if="!$v.form.nombreProyecto.minlength"
                      >Campo Invalido</span>
                    </md-field>
                  </div>
                  <div class="md-layout-item md-small-size-100">
                    <md-field :class="getValidationClass('categoria')">
                      <!--md-icon>thumb_up</md-icon-->
                      <label for="categoria">Categoría</label>
                      <md-select
                        name="categoria"
                        id="categoria"
                        v-model="form.categoria"
                        md-dense
                        :disabled="sending"
                      >
                        <md-option value="Vínculos con la Sociedad">Vínculos con la Sociedad</md-option>
                        <md-option value="Proyectos Integradores">Proyectos Integradores</md-option>
                        <md-option value="Investigación">Investigación</md-option>
                      </md-select>
                      <span class="md-error">Campo Requerido</span>
                    </md-field>
                  </div>
                </div>

                <div class="md-layout md-gutter">
                  <div class="md-layout-item md-small-size-100">
                    <md-field :class="getValidationClass('tipoProyecto')">
                      <label for="tipoProyecto">Tipo Proyecto</label>
                      <md-select
                        name="tipoProyecto"
                        id="tipoProyecto"
                        v-model="form.tipoProyecto"
                        md-dense
                        :disabled="sending"
                      >
                        <md-option value="Gubernamental">Gubernamental</md-option>
                        <md-option value="Empresarial">Empresarial</md-option>
                        <md-option value="ONG">ONG</md-option>
                        <md-option value="Otros">Otros</md-option>
                      </md-select>
                      <span class="md-error">Campo Rquerido</span>
                    </md-field>
                  </div>
                  <div class="md-layout-item md-small-size-100">
                    <md-field :class="getValidationClass('descripcion')">
                      <label for="descripcion">Descripcion</label>
                      <md-textarea
                        type="text"
                        id="descripcion"
                        name="descripcion"
                        autocomplete="descripcion"
                        v-model="form.descripcion"
                        :disabled="sending"
                        md-autogrow
                        md-counter="200"
                      ></md-textarea>
                      <span
                        class="md-error"
                        v-if="!$v.form.descripcion.required"
                      >descripción necesaria</span>
                      <span
                        class="md-error"
                        v-else-if="!$v.form.descripcion.maxlength"
                      >Máximo 200 caracteres</span>
                    </md-field>
                  </div>
                </div>

                <div class="md-layout md-gutter">
                  <div class="md-layout-item md-small-size-100">
                    <md-datepicker v-model="form.fechaInicio" md-immediately>
                      <label>Fecha de Inicio</label>
                    </md-datepicker>
                  </div>

                  <div class="md-layout-item md-small-size-100">
                    <md-datepicker v-model="form.fechaFin" md-immediately>
                      <label>Fecha de Finalización</label>
                    </md-datepicker>
                  </div>
                </div>
              </md-step>
              
              <!--Segundo Stepper -->
              <!--md-step
                id="second"
                md-label="Lugar"
                md-description="Lugar donde ocurrió el proyecto"
              >
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
                    <md-autocomplete name="selectedPaises" id="selectedPaises" v-model="form.selectedPaises" md-dense  :md-options="paises" >
                        <label >Paises</label>
                    </md-autocomplete>
                    <v-card id="map" class="map"></v-card>
                  </div>
                </div>
              </md-step-->

              <md-step
                id="third"
                md-label="Involucrados"
                md-description="Personas que formaron parte del proyecto"
              >
                <div class="md-layout md-gutter">
                  <div class="md-layout-item md-small-size-100">
                    <md-field>
                      <label>Director(@) del Proyecto</label>
                      <md-input v-model="form.director" maxlength="30" counter="30"></md-input>
                    </md-field>
                  </div>

                  <div class="md-layout-item md-small-size-100">
                    <md-field>
                      <label>Involucrados</label>
                      <md-input
                        v-model="form.involucrado"
                        maxlength="30"
                        counter="30"
                        placeholder="Ingrese los nombres, separado por comas"
                      ></md-input>
                    </md-field>
                  </div>
                </div>
              </md-step>

              <md-step id="four" md-label="Beneficiarios" md-description>
                <div class="md-layout md-gutter">
                  <div class="md-layout-item md-small-size-100">
                    <md-field>
                      <label>Beneficiado</label>
                      <span class="md-prefix">$</span>
                      <md-input v-model="form.inversion"></md-input>
                    </md-field>
                  </div>

                  <div class="md-layout-item md-small-size-100">
                    <md-field :class="getValidationClass('email')">
                      <label for="email">Email</label>
                      <md-input
                        type="email"
                        name="email"
                        id="email"
                        autocomplete="email"
                        v-model="form.email"
                        :disabled="sending"
                      />
                      <span class="md-error" v-if="!$v.form.email.required">The email is required</span>
                      <span class="md-error" v-else-if="!$v.form.email.email">Invalid email</span>
                    </md-field>
                  </div>
                </div>

                <div class="md-layout md-gutter">
                  <div class="md-layout-item md-small-size-100">
                    <md-field>
                      <label>Rol</label>
                      <span class="md-prefix">$</span>
                      <md-input v-model="form.inversion"></md-input>
                    </md-field>
                  </div>

                  <div class="md-layout-item md-small-size-100">
                    <md-field>
                      <label>Telefono</label>
                      <span class="md-prefix">$</span>
                      <md-input v-model="form.inversion"></md-input>
                    </md-field>
                  </div>
                </div>
              </md-step>
            </md-steppers>
          </div>
        </md-card-content>

        <md-progress-bar md-mode="indeterminate" v-if="sending"/>
        <md-card-actions>
          <md-button type="submit" class="md-dense md-raised md-primary" :disabled="sending">Guardar</md-button>
        </md-card-actions>
      </md-card>

      <md-snackbar :md-active.sync="userSaved">The user {{ lastUser }} was saved with success!</md-snackbar>
    </form>
  </div>
</template>

<script>
import { validationMixin } from "vuelidate";
import lugares from "../assets/js/lugares";
import L from "leaflet";
import {
  required,
  // email,
  minLength,
  maxLength
} from "vuelidate/lib/validators";

export default {
  name: "FormValidation",
  mixins: [validationMixin],
  data: () => ({
    continenteValid: false,
    rolValido: false,
    nInversion: 1,
    paises: ["Ecuador", "Chile", "Colombia", "Perú"],
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
      "ZONA1",
      "ZONA2",
      "ZONA3",
      "ZONA4",
      "ZONA5",
      "ZONA6",
      "ZONA7",
      "ZONA8"
    ],
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
  mounted() {
    this.initMap();
    this.popup = L.popup();
    this.map.on("click", this.onMapClick);
    // this.initLayers()
  },
  methods: {
    initMap() {
      this.map = L.map("map").setView(
        [37.8843717608536, -4.779524803161621],
        14
      );

      this.tileLayer = L.tileLayer("http://{s}.tile.osm.org/{z}/{x}/{y}.png", {
        attribution:
          '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
      });
      this.tileLayer.addTo(this.map);
      // L.geoJSON(data.geojsonFeature).addTo(this.map)
      // console.log('data',data)
      // console.log('Zonas: ',zona8)
      // this.myLyres = L.geoJSON().addTo(this.map)
    },

    onMapClick(e) {
      this.popup
        .setLatLng(e.latlng) // Sets the geographical point where the popup will open.
        .setContent(
          "Has hecho click en la coordenada:<br> " +
            e.latlng.lat.toString() +
            "," +
            e.latlng.lng.toString()
        ) // Sets the HTML content of the popup.
        .openOn(this.map); // Adds the popup to the map and closes the previous one.
    },
    getValidationClass(fieldName) {
      const field = this.$v.form[fieldName];
      if (field) {
        return {
          "md-invalid": field.$invalid && field.$dirty
        };
      }
    },
    cambiaValor: function(value) {
      console.log("valor: ", value);
      if (!this.continenteValid) {
        this.continenteValid = true;
        this.paises = lugares("America");
      }
    },
    clearForm() {
      this.$v.$reset();
      this.form.nombreProyecto = null;
      this.form.email = null;
      this.form.tipoProyecto = null;
      this.form.descripcion = null;
      this.form.categoria = null;
      this.form.selectedZona = null;
      this.form.selectedContinente = null;
      this.form.selectedPaises = null;
      this.form.director = null;
      this.form.involucrado = null;
      // this.form.fechaInicio = null
      // this.form.fechaFin = null
    },
    saveUser() {
      this.sending = true;
      // Instead of this timeout, here you can call your API
      window.setTimeout(() => {
        this.lastUser = `${this.form.nombreProyecto} ${this.form.tipoProyecto}`;
        this.userSaved = true;
        this.sending = false;
        this.clearForm();
      }, 1500);
    },
    validateUser() {
      this.$v.$touch();
      if (!this.$v.$invalid) {
        this.saveUser();
      }
    }
  }
};
</script>


<style lang="scss" scoped>
.md-progress-bar {
  position: absolute;
  top: 0;
  right: 0;
  left: 0;
}
.map {
  width: 100%;
  height: 200px;
  box-shadow: 5px 5px 5px #888;
  margin-left: 5px;
  border: 0px solid black;
}
</style>