import wollok.game.*
import mercado.*


object granja {

    const property cultivos = #{}               //Acumulo lo que voy sembrando
    const  property plantasCosechadas =  #{}    //Acumulo lo que cosecho
    
    const property aspersores = []
    
    const mercadoEste = new Mercado(position = game.at(0,9), monedas = 1700)
    const mercadoCentro = new Mercado(position = game.at(5,5), monedas = 500)
    const mercadoOeste = new Mercado(position = game.at(9,9), monedas = 69)

    const mercados = [mercadoEste,mercadoCentro,mercadoOeste]


    method sembrarUnaPlanta(planta){
        cultivos.add(planta)
    }

    method agregarMercados(){
        mercados.forEach({mercado => game.addVisual(mercado)})
    }

    
    method aspersorRegar(){
        aspersores.forEach({aspersor => aspersor.regar()})
    }
    
    method agregarAspersor(aspersor){
        aspersores.add(aspersor)
    }

    method plantasEn(position){
        return game.getObjectsIn(position).filter({obj => cultivos.contains(obj)})
    }

    method profit(){
        return plantasCosechadas.sum({planta => planta.valor()})
    }

    method vaciarAlmacen(){
        plantasCosechadas.clear()
    }

    method almacenarCosecha(position){
        plantasCosechadas.addAll(self.plantasMadurasEn(position))
    }

    method plantasMadurasEn(position){
        return self.plantasEn(position).filter({planta => planta.esCosechable()})
    }

    method hayPlantaEn(position){
        return not self.plantasEn(position).isEmpty()
    }

    method hayMercadoEn(position){
        return game.getObjectsIn(position).any({obj => mercados.contains(obj)})
    }

    method mercadoEn(position){
        return game.getObjectsIn(position).filter({obj => mercados.contains(obj)}).get(0)
    }
}


