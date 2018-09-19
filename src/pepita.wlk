import ciudades.*

object pepita {
	var property energia = 100
	var property ciudad = null 

	var property posicion = game.at(3,3)
	method imagen(){
		if(self.estaCansada()){
			return "pepona.png"
		}
		else if(self.estaGorda()){
			return "pepita-gorda-raw.png"
		}
		else{
			return "pepita.png"
		}
	}
	
	method estaGorda(){
		return energia > 100
	}
	
	method estaCansada(){
		return energia < 10
	}

	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method teEncontro(alguien){
		// TODO Acá estás tomando muchas responsabilidades de roque.
		// Probá delegarle este comportamiento a roque y fijate cómo cambia.
		if(alguien.comidaGuardada() != null){
			self.come(alguien.comidaGuardada())
			// TODO Hubiera sido bueno extraer el comportamiento para crear una posición random en un método/objeto aparte.
			game.addVisualIn(alguien.comidaGuardada(), game.at(0.randomUpTo(9),0.randomUpTo(9)))
			alguien.comidaGuardada(null)
		}
	}
	
	method pepe() {
	}
	
	method volaHacia(unaCiudad) {
		if(ciudad == unaCiudad){
			game.say(self,"Ya estoy en " + ciudad.nombre())
		}
		// TODO Podrías repetir menos código si "energiaParaVolar" recibiera directamente una posición en lugar de una distancia.
		else if(self.energiaParaVolar(posicion.distance(unaCiudad.posicion())) > energia){
			game.say(self,"Dame de comer primero !")
		}
		else{
			self.move(unaCiudad.posicion())
			ciudad = unaCiudad
		}
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		// TODO Podrías repetir menos código si "energiaParaVolar" recibiera directamente una posición en lugar de una distancia.
		energia -= self.energiaParaVolar(posicion.distance(nuevaPosicion))
		self.posicion(nuevaPosicion)
	}	
}
