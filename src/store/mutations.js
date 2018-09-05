export default {
	increment: state => state.count++,
    decrement: state => state.count--,

    setProyectosPorZonas (state, proyectosPorZonas) {
    	state.proyectosPorZonas = proyectosPorZonas
    }
}