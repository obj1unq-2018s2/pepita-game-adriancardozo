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
		if(alguien.comidaGuardada() != null){
			self.come(alguien.comidaGuardada())
			game.addVisual(alguien.comidaGuardada())
			alguien.comidaGuardada(null)
		}
	}
	
	method volaHacia(unaCiudad) {
		if(ciudad == unaCiudad){
			game.say(self,"Ya estoy en " + ciudad.nombre())
		}
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
		energia -= self.energiaParaVolar(posicion.distance(nuevaPosicion))
		self.posicion(nuevaPosicion)
	}	
}
