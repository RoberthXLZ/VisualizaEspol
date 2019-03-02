<template>
    <v-toolbar flat color="#001C43" class="white--text" @click.stop="drawer = !drawer">
        <v-toolbar-side-icon dark ></v-toolbar-side-icon>
        <v-toolbar-title class="headline">{{ title }}</v-toolbar-title>
        <v-toolbar-items class="mx-5">
            <v-btn flat small class="white--text" router to="/"> 
                <span class="headline font-weight-light">Mapa</span>
            </v-btn>
            <v-divider vertical></v-divider>
            <v-btn flat small class="white--text" router to="/about">
                <span class="headline font-weight-light">Reportes</span>
            </v-btn>
        </v-toolbar-items>
        <v-spacer></v-spacer>
        <v-btn flat small class="white--text" outline> 
            <span>Cerrar Sesion</span>
        </v-btn>
    </v-toolbar>
</template>

<script>
export default {
    data(){
        return {
            title: 'GEOPOL',
            drawer: true
        }
    }
}
</script>
