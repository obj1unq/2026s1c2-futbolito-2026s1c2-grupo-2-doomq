/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method position() {
	  return position
	}

	method levantarPelota() {
	  if (pelota.position() == position) {
		pelota.subir()
	  	game.schedule(2000, {pelota.bajar()})
	  }
	  
	  
	}
	
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	method position() {
	  return position
	}

	method subir() {
	  position = position.up(1)
	}
	method bajar() {
	  position = position.down(1)
	}

}

