
object roque {
	var property comidaGuardada = null
	var property posicion = game.at(3,4)
	method imagen() = "jugador.png"
	method levantarYGuardar(comida){
		if(comidaGuardada != null){
			game.addVisualIn(comidaGuardada, game.at(posicion.up(1).x(),posicion.up(1).y() % 10))
		}
		comidaGuardada = comida
		game.removeVisual(comida)
	}
}