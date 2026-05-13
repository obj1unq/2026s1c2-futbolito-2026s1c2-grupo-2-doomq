/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)

	method position(_position) {
	  position = _position
	}
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	
	method patear() {
      self.validarMismaPosicion()
      pelota.serPateada()
    }

	method validarMismaPosicion() {
	  if (position != pelota.position()) {
        self.error("Lionel no esta sobre la pelota")
      }
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	method serPateada() {
	  position = game.at((game.width() - 1).min(position.x() + 3), position.y())
	}

	method position(_position) {
	  position = _position
	}
}
