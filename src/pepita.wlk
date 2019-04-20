import ciudades.*
import wollok.game.*
import comidas.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 

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
			game.say(self, "Ya estoy en" + ciudad)
		}
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
		self.position(nuevaPosicion)
	}	
}
