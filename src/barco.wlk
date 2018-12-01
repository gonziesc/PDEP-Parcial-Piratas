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
		return tripulacion.filter({tripulante => tripulante.esFuerte()})
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
		self.perderTripulantesCansados()
	}

	method perderTripulantesCansados(){
		tripulacion = tripulacion.filter({tripulante => !tripulante.estaCansado()})
	}
	
	method aplicarBonus(){
		bando.aplicarBonus(self)
	}
	
	method aumentarMunicionesEnPorcentaje(porcentaje){
		municiones += municiones * porcentaje
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
		barco.aumentarMunicionesEnPorcentaje(0,3)
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
