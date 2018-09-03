
object roque {
	var property comidaGuardada = null
	var property posicion = game.at(3,4)
	method imagen() = "jugador.png"
	method levantarYGuardar(comida){
		if(comidaGuardada != null){
			game.addVisual(comidaGuardada)
		}
		comidaGuardada = comida
		game.removeVisual(comida)
	}
}