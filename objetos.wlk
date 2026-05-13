/** First Wollok example */
import wollok.game.*
import estado.*


object lionel {
	var estado = titular
	var property position = game.at(3,5)
	
	method image() {
		return estado.image(self)
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
	
	method patear() {
      self.validarMismaPosicion()
      pelota.serPateada()
    }

	method validarMismaPosicion() {
	  if (position != pelota.position()) {
        self.error("Lionel no esta sobre la pelota")
      }
	}
	
	method cambiarEstado() {
		self.validarSiEstaEnElBordeIzq()
		estado = estado.siguienteEstado()
	}

	method validarSiEstaEnElBordeIzq() {
	  if(not self.estaEnPosicion()){
		self.error("No puede cambiar de camiseta, no esta en posición.")
	  }
	}

	method estaEnPosicion() {
	  return position.x() == 0
	}

	method position(_position) { //el setter solo lo necesito para testear
		position = _position 
	}

	method estado() {  //El getter es para el test
	  return estado
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

	method serPateada() {
	  position = game.at((game.width() - 1).min(position.x() + 3), position.y())
	}

	method position(_position) {
	  position = _position
	}
}

