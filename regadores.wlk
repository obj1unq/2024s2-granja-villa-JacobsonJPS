import wollok.game.*
import granja.*

class Aspersor {
    var property position = game.at(0,0)

    method regar() {
        granja.plantasEn(game.at(position.x()+1,position.y())).forEach({planta => planta.evolucionar()})
        granja.plantasEn(game.at(position.x(),position.y()-1)).forEach({planta => planta.evolucionar()})
        granja.plantasEn(game.at(position.x()-1,position.y())).forEach({planta => planta.evolucionar()})
        granja.plantasEn(game.at(position.x(),position.y()+1)).forEach({planta => planta.evolucionar()})
    } 

    method image(){
        return "aspersor.png"
    }

    method instalar(_position){
        position = _position
        game.addVisual(self)
    }
}