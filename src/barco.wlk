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
		tripulantes.foreach({tripulante => tripulante.serHerido()})
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
		tripulacion.addAll(tripulantes)
	}
	
	method dispararContra(otroBarco, cantidad){
		if(cantidad > municiones) {
			self.error("No alcanzan las municiones")
		}
		else {
			municiones -= cantidad
			otroBarco.recibirDisparos(cantidad)
		}
	}
	
	method recibirDisparos(cantidad){
		resistencia -= cantidad * 50
		tripulacion = tripulacion.filter({tripulante => tripulante.energia() > 20})
	}
	
	method aplicarBonus(){
		bando.aplicarBonus(self)
	}
	
	method aumentarMuniciones(cantidad){
		municiones += cantidad
	}
	
	method aumentarPoderDeFuego(cantidad){
		poderDeFuego += cantidad
	}
	
	method duplicarTripulacion(){
		tripulacion.addAll(tripulacion)
	}
}


object armadaInglesa{
	method aplicarBonus(barco){
		barco.aumentarMuniciones(barco.municiones() * 0,3)
	}
}

object unionPirada{
	method aplicarBonus(barco){
		barco.aumentarPoderDeFuego(60)
	}
}

object holandesErrante{
	method aplicarBonus(barco){
		barco.duplicarTripulacion()
	}
}
