class Barco{
	var property tripulacion = []
	var property resistencia
	var property poderDeFuego
	var property municiones
	var property bando
	method capitan(){
		return tripulacion.max({tripulante => tripulante.poderDeMando()})
	}
	
	method fuerza(){
		return tripulacion.sum({tripulante => tripulante.poderDeMando()})
	}
	
	method enfrentar(otroBarco){
		if(self.fuerza() > otroBarco.fuerza()) {
			otroBarco.perderContra(self)
		}
		else {
			self.perderContra(otroBarco)
		}
	}
	
	method perderContra(otroBarco){
		otroBarco.ganarTripulacion(self.tripulacionFuerte())
		self.dejarDesolado()
	}
	method dejarDesolado(){
		tripulacion.clear()
		resistencia = 0
		poderDeFuego = 0
		municiones = 0
	}
	method tripulacionFuerte(){
		return tripulacion.filter({tripulante => tripulante.poderDeMando() > 100})
	}
	method ganarTripulacion(tripulantes){
		tripulantes.foreach({tripulante => tripulante.herir()})
		tripulacion.addAll(tripulantes)
	}
}