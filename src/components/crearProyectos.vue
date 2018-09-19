<template>
  <main>
  <app-navbar></app-navbar>
  <div>
    <form novalidate class="md-layout" @submit.prevent="validateUser">
      <md-card style="left:240px; top:20px;" class="md-layout-item md-size-60 md-small-size-100">
        <md-toolbar :md-elevation="1">
              <span class="md-title">Nuevo Proyecto</span>
            </md-toolbar>
        <md-card-content>
          <div class="md-layout md-gutter">
            <div class="md-layout-item md-small-size-100">
              <md-field :class="getValidationClass('nombreProyecto')">
                <!--md-icon>thumb_up</md-icon-->
                <label for="first-name">Nombre del Proyecto</label>
                <md-input name="first-name" id="first-name" autocomplete="given-name" v-model="form.nombreProyecto" :disabled="sending" md-counter="100"/>
                <span class="md-error" v-if="!$v.form.nombreProyecto.required">Nombre del Proyecto es Requerido</span>
                <span class="md-error" v-else-if="!$v.form.nombreProyecto.minlength">Campo Invalido </span>
              </md-field>
            </div>
            <div class="md-layout-item md-small-size-100">
              <md-field :class="getValidationClass('categoria')">
                <!--md-icon>thumb_up</md-icon-->
                <label for="categoria">Categoría</label>
                <md-select name="categoria" id="categoria" v-model="form.categoria" md-dense :disabled="sending">
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
                <md-select name="tipoProyecto" id="tipoProyecto" v-model="form.tipoProyecto" md-dense :disabled="sending">
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
                  <md-textarea type="text" id="descripcion" name="descripcion" autocomplete="descripcion" v-model="form.descripcion" :disabled="sending" md-autogrow md-counter="200"></md-textarea>
                  <span class="md-error" v-if="!$v.form.descripcion.required">descripción necesaria</span>
                <span class="md-error" v-else-if="!$v.form.descripcion.maxlength">Máximo 200 caracteres</span>
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
          <!--Parte del formulario para llenar el lugar del proyecto-->
          <!--md-card>
            <md-toolbar :md-elevation="1">
              <span class="md-title">Lugar</span>
            </md-toolbar>
      
              <md-card-content-->

                <div class="md-layout md-gutter">
                  <div class="md-layout-item md-small-size-100" >
                      <md-field :class="getValidationClass('selectedContinente')">
                        <label for="tipoProyecto">Contiente</label>
                        <md-select name="selectedContinente" id="selectedContinente" v-model="form.selectedContinente" md-dense :md-open-on-focus="false" :disabled="sending" @md-opened="cambiaValor()">
                          <md-option value='Asia'>Asia</md-option>
                          <md-option value='America'>America</md-option>
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
                  </div>
                </div>
              <!--/md-card-content>
          </md-card-->
          <!--para llenar los involucrados-->
          <!--md-card>
            <md-card-header>
              <div class="md-title">Involucrados</div>
              </md-card-header>
              <md-card-content-->
              <!--/md-card-content>
          </md-card-->
          <!--md-field :class="getValidationClass('email')">
            <label for="email">Email</label>
            <md-input type="email" name="email" id="email" autocomplete="email" v-model="form.email" :disabled="sending" />
            <span class="md-error" v-if="!$v.form.email.required">The email is required</span>
            <span class="md-error" v-else-if="!$v.form.email.email">Invalid email</span>
          </md-field-->
          <div class="md-layout md-gutter">
                  <div class="md-layout-item md-small-size-100" >
                       <md-field>
                        <label>Director(@) del Proyecto</label>
                        <md-input v-model="form.director" maxlength="30" counter="30"></md-input>
                        </md-field>
                  </div>

                  <div class="md-layout-item md-small-size-100" >
                       <md-field>
                        <label>Involucrados</label>
                        <md-input v-model="form.involucrado" maxlength="30" counter="30" placeholder="Ingrese los nombres, separado por comas"></md-input>
                        </md-field>
                  </div>
          </div>

          <div class="md-layout md-gutter">
                  <div class="md-layout-item md-small-size-100" >
                       <md-field>
                          <label>Inversion</label>
                          <span class="md-prefix">$</span>
                          <md-input v-model="form.inversion"></md-input>
                        </md-field>
                  </div>

                  <!--div class="md-layout-item md-small-size-100" >
                       <md-field>
                        <label>Involucrados</label>
                        <md-input v-model="form.involucrado" maxlength="30" counter="30" placeholder="Ingrese los nombres, separado por comas"></md-input>
                        </md-field>
                  </div-->
          </div>
        </md-card-content>

        <md-progress-bar md-mode="indeterminate" v-if="sending" />
        <md-card-actions>
          <md-button type="submit" class="md-dense md-raised md-primary" :disabled="sending">Guardar</md-button>
        </md-card-actions>
      </md-card>

      <md-snackbar :md-active.sync="userSaved">The user {{ lastUser }} was saved with success!</md-snackbar>
    </form>
  </div>
  </main>
</template>
<script>
import { validationMixin } from 'vuelidate'
import lugares from '../assets/js/lugares'
import {
  required,
  email,
  minLength,
  maxLength
} from 'vuelidate/lib/validators'
export default {
  name: 'FormValidation',
  mixins: [validationMixin],
  data: () => ({
    continenteValid: false,
    rolValido: false,
    nInversion: 1,
    paises: ['Ecuador', 'Chile', 'Colombia', 'Perú'],
    form: {
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
    }
  },
  /* mounted () {
    this.paises = 
  },*/
  methods: {
    getValidationClass (fieldName) {
      const field = this.$v.form[fieldName]
      if (field) {
        return {
          'md-invalid': field.$invalid && field.$dirty
        }
      }
    },
    cambiaValor: function (value) {
      console.log('valor: ',value)
      if (!this.continenteValid) {
        this.continenteValid = true
      }
    },
    clearForm () {
      this.$v.$reset()
      this.form.nombreProyecto = null
      this.form.tipoProyecto = null
      this.form.descripcion = null
      this.form.categoria = null
      this.form.selectedZona = null
      this.form.selectedContinente = null
      this.form.selectedPaises = null
      this.form.director = null
      this.form.involucrado = null
      //this.form.fechaInicio = null
      //this.form.fechaFin = null
    },
    saveUser () {
      this.sending = true
      // Instead of this timeout, here you can call your API
      window.setTimeout(() => {
        this.lastUser = `${this.form.nombreProyecto} ${this.form.tipoProyecto}`
        this.userSaved = true
        this.sending = false
        this.clearForm()
      }, 1500)
    },
    validateUser () {
      this.$v.$touch()
      if (!this.$v.$invalid) {
        this.saveUser()
      }
    }
  }
}

</script>
<style lang="scss" scoped>
  .md-progress-bar {
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
  }
</style>
