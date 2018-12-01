class Pirata{
	var property energia
	method poderDeMando()
	method serHerido()
	method tomarRonCon(unPirata) {
		energia -= 50
	}
}

class Guerrero inherits MonstruoHumanoide{
	var property vitalidad
	
	override method poderDeMando(){
		return super() * vitalidad
	}
	
	override method serHerido(){
		poderDePelea /= 2
	}
}

class Navegador inherits Pirata{
	var property inteligencia
	
	override method poderDeMando(){
		return inteligencia **2
	}
	
	override method serHerido(){
		inteligencia /= 2
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
	
	override method serHerido(){
		moral /= 2
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
	override method serHerido(){
		inteligencia /= 2
		poderDePelea /= 2
	}
}

class MonstruoHumanoide inherits Pirata{
	var property poderDePelea
		override method poderDeMando(){
		return poderDePelea
	}
	
	override method serHerido(){
		poderDePelea /= 2
	}
	
}