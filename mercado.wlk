import wollok.game.*
import granja.*

class Mercado{

    var property position = game.at(4,4)
    var property monedas = 0

    const property productos = []

    method image(){
        return "market.png"
    }

    method comprarProductos(valor, listaDeProductos){
        self.verificarSiPuedeComprar(valor)
        self.agregarProductos(listaDeProductos)
        monedas = monedas - valor
    }

    method puedeComprar(valor){
        return monedas >= valor
    }

    method verificarSiPuedeComprar(precio){
        if(not self.puedeComprar(precio)){
            game.say(self,"No tengo el dinero suficiente")
            self.error("Saldo insuficiente para la compra")
        }
    }

    method agregarProductos(listaDeProductos){
        productos.addAll(listaDeProductos)
    }

}