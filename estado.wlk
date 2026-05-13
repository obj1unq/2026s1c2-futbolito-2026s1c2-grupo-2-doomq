object titular {
  method image(jugador) {
    return jugador.toString() + "-titular.png"
  }

  method siguienteEstado() {
    return suplente
  }
}

object suplente {
  method image(jugador) {
    return jugador.toString() + "-suplente.png"
  }

  method siguienteEstado() {
    return titular
  }
}