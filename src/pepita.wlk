import ciudades.*
import wollok.game.*
import comidas.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 
	var amiga = pepona
	var property position = game.at(3,3)
	
	method image(){ 
		var image = "pepita.png"
		if(self.energia() > 100){
			image = "pepita-gorda-raw.png"
		}
		return image
	}
	
	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad) {
			self.move(unaCiudad.position())
			ciudad = unaCiudad
		} else {
			game.say(self, "Ya estoy en " + ciudad)
		}
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		if(energia < self.energiaParaVolar(position.distance(nuevaPosicion))){
			game.say(self, "Dame de comer primero!")
		} else {
			energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
			self.position(nuevaPosicion)
		}
	}	
	method volaYCome (comida){
		self.volaHacia(comida)
		self.come(comida)
		game.removeVisual(comida)
	}
		
	method nuevaAmiga(ave){
		if(amiga != ave){
			game.say(self, "hola " + ave.nombre() + "!")
			amiga = ave
		}
		
	}
}

object pepona {
	method image() = "pepona.png"
	method position() = game.at(2,2)
	method nombre() = "Pepona"
}


object pipa {
	method image() = "pepitaCanchera.png"
	method position() = game.at(4,8)
	method nombre() = "Pipa"
}

object roque {
	var property position = game.at(1,1)
	var property mochila

	method image() = "jugador.png"
	
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}	
	
	method agarrarComida(comida){
		if(mochila == null){
			mochila = comida
			comida.guardarte()
		} 
		else { 
			game.addVisualIn(mochila, game.at(0.randomUpTo(10).truncate(0), 0.randomUpTo(10).truncate(0)))
			mochila = comida
			mochila.guardarte()
		}
	}
	
	method alimentarA(ave, comida){
		var energia = ave.energia()
		energia += comida.energia()
		game.addVisualIn(comida, game.at(0.randomUpTo(10).truncate(0), 0.randomUpTo(10).truncate(0)))
		mochila = null
	}
}
