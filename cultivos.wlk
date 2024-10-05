import wollok.game.*

class Maiz {
	var property position = game.at(0, 0)
	var madurez = "baby"

	method image() {
		
		return "corn_"+ madurez +".png"
	}

	method madurez(){
		return madurez
	}

	method plantar(posicion){
		position = posicion
		game.addVisual(self)
	}

	method evolucionar(){
		madurez = "adult"
	}

	method cosechar(){
		if(self.esCosechable()){
			game.removeVisual(self)
		}
	}

	method valor() = 150

	method esCosechable(){
		return madurez == "adult"
	}
}

class Trigo {
	var property position = game.at(0, 0)
	var etapa = 0 

	method image() {
		return "wheat_"+ etapa + ".png"
	}
	
	method plantar(posicion){
		position = posicion
		game.addVisual(self)
	}

	method evolucionar(){
		etapa = (etapa + 1) % 4
	}

	method etapa(){
		return etapa
	}

	method cosechar(){
		if(self.esCosechable()){
			game.removeVisual(self)
		}

	}

	method valor() = (etapa - 1) * 100
	


	method esCosechable(){
		return etapa >= 2
	}
}
class Tomaco {
	var property position = game.at(0, 0)

	method image() {
		return "tomaco.png"
	}

	method plantar(posicion){
		position = posicion
		game.addVisual(self)
	}

	method valor() = 80
		
	

	method evolucionar(){
		position = game.at(position.x(), (game.height() - 1).min(position.y() + 1))
	}

	method cosechar(){
		game.removeVisual(self)
	}
	method esCosechable(){
		return true
	}
}