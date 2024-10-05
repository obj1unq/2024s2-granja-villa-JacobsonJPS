import wollok.game.*
import cultivos.*
import granja.*
import regadores.*

object hector {
	var property position = game.at(4,4)
	const property image = "player.png"

	var property cantidadDeOro = 0

	method sembrar(planta){
		planta.plantar(position)
		granja.sembrarUnaPlanta(planta)
	}

	method regar(){
		self.verificarSiHayPlanta()
		granja.plantasEn(position).forEach({planta => planta.evolucionar()})
	}

	method cosechar(){
		self.verificarSiHayPlanta()
		granja.almacenarCosecha(position)
		granja.plantasEn(position).forEach({planta => planta.cosechar()})
	}

	
	method decirPosesiones(){
		game.say(self,"Tengo " + granja.plantasCosechadas().size() + " plantas para vender y " + cantidadDeOro + " monedas de oro")
	}

	method vender(){
		self.validarSiEstaEnMercado()
		granja.mercadoEn(position).comprarProductos(granja.profit(), granja.plantasCosechadas())
		cantidadDeOro += granja.profit()
		granja.vaciarAlmacen()
	}


	method instalarAspersor(aspersor){
		aspersor.instalar(position)
		granja.agregarAspersor(aspersor)
	}


	// Validaciones

	method verificarSiHayPlanta(){
		if(not granja.hayPlantaEn(position)){
			 game.say(self,"No hay una planta acá") 
			 self.error("No hay una planta acá") 
		}
 	}

	method validarSiEstaEnMercado(){
		if(not self.estaEnMercado()) {
			game.say(self,"No puedo vender si no estoy en un mercado")
			self.error("No puedo vender si no estoy en un mercado")
		}
	}

	method estaEnMercado(){
		return granja.hayMercadoEn(position)
	}

	








}













