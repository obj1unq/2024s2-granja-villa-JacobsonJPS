import wollok.game.*
import granja.*

class Aspersor {
    var property position = game.at(0,0)

    method regarPosicion(xOffset, yOffset) {
        granja.plantasEn(game.at(position.x() + xOffset, position.y() + yOffset)).forEach({ planta => planta.evolucionar() })
    }

    method regar() {
        self.regarPosicion(1, 0)   // Derecha
        self.regarPosicion(0, -1)  // Arriba
        self.regarPosicion(-1, 0)  // Izquierda
        self.regarPosicion(0, 1)   // Abajo
    }
    

    method image(){
        return "aspersor.png"
    }

    method instalar(_position){
        position = _position
        game.addVisual(self)
    }
}



