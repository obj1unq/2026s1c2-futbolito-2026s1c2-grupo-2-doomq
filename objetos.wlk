/** First Wollok example */
import wollok.game.*
import estado.*


object lionel {
	var estado = titular
	var property position = game.at(3,5)

	// metodo setter para test
	method position(_position){  
		position = _position
	}
	
	method image() {
		return estado.image(self)
	}
	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method patearDeTaquito(){
		self.validarPosicionParaTaquito()
		pelota.serPateadaDeTaquito()
	}

	method validarPosicionParaTaquito(){
		if (not(game.onSameCell(pelota.position(), position))){
			self.error("No puedo hacer un taquito sin pelota")
		}
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

	method estado() {  //El getter es para el test
	  return estado
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)
	// metodo setter para test
	method serPateadaDeTaquito(){
		position = game.at (0.max((position.x() - 2)), position.y())
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

