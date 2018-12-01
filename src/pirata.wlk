class Pirata{
	var property energia
	method poderDeMando()
	method tomarRonCon(unPirata) {
		energia -= 50
	}
}

class Guerrero inherits Pirata{
	var property poderDePelea
	var property vitalidad
	
	override method poderDeMando(){
		return poderDePelea * vitalidad
	}
}

class Navegador inherits Pirata{
	var property inteligencia
	
	override method poderDeMando(){
		return inteligencia **2
	}
}

class Cocinero inherits Pirata{
	var property moral
	var property ingredientes = []
	
	override method poderDeMando(){
		return moral * ingredientes.size()
	}
	
	override method tomarRonCon(unPirata){
		super(unPirata)
		var ingredienteRobado = ingredientes.anyOne()
		ingredientes.remove(ingredienteRobado)
		unPirata.recibirIngrediente(ingredienteRobado)
	}
}

object jackSparrow inherits Pirata {
	var property poderDePelea = 200
	var property inteligencia = 300
	var property ingredientes = ["botellaDeRon"]
	override method poderDeMando(){
		return poderDePelea * inteligencia * energia
	}
	override method tomarRonCon(unPirata){
		energia += 100
		unPirata.tomarRonCon(self)
	}
	method recibirIngrediente(ingrediente) {
		ingredientes.add(ingrediente)
	}
}