import wollok.game.*

class Manzana {
	var property position = game.at(5,1)
	method image() = "manzana.png"
	method energia() = 80
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}
	
	method guardarte(){
		game.removeVisual(self)
	}
	
	method teEncontro(alguien){
		alguien.agarrarComida(self)
	}
}

class Alpiste {
	var property position = game.at(5,5)
	method image() = "alpiste.png"
	method energia() = 5
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}
	method guardarte(){
		game.removeVisual(self)
	}

	method teEncontro(alguien){
		alguien.agarrarComida(self)
	}
}
