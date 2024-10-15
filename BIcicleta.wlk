class Bicicleta{
  var property rodado
  const property largo
  const property marca 
  const property accesorios = []

  method altura() = rodado * 2.5 + 15
  method velocidadCrucero() { return if (largo > 120){rodado + 6} 
    else {rodado + 2}
    }
  method carga() = accesorios.sum({a => a.carga()})
  method peso() = rodado / 2 + accesorios.sum({a => a.peso()})
  method tieneLuz() = accesorios.any({a => a.esLuminoso()})
  method cantAccesoriosLivianos() = accesorios.count({a => a.peso() < 1})
}

class Farolito {
  method peso() = 0.5 // esto se da porque tenemos q inicializarlo
  method carga() = 0
  method esLuminoso() = true
}

class Canasto{
  const volumen

  method peso() = volumen / 10

  method carga() = volumen * 2

  method esLuminoso() = false 
}

class Morral{
  const largo
  var property tieneOjoDeGato

  method peso() = 1.2

  method carga() = largo / 3

  method esLuminoso() = tieneOjoDeGato
}

class Deposito{//una coleccion es una lista o un conjunto
  const bicis = []

  method bicisRapidas(){
    bicis.filter({b=> b.velocidadCrucero() > 25})
  }

  method marcasDeBicis(){
    bicis.map({b => b.marca()}.asSet())
  }

  method esNocturno() = bicis.all({b => b.tieneLuz()})

  method tieneBiciParaCargar(kg) {
    return bicis.any({b => b.carga() > kg})
  }

  method marcaMasRapida() = self.biciMasRapida().marca()

  method biciMasRapida() =bicis.max({b => b.velocidad()})//devuelve objeto
  method bicisLargas() = bicis.filter({b=>b.largo()>170})
  method cargaTotalBicisLargas() = if(!self.bicisLargas().isEmpty()){ //si no esta vacio
    return
    self.bicisLargas().sum({b=>b.carga()}) //esto
  }else return 0 //sino 0

  method bicisSinAccesorios(){
    return bicis.count{b=>b.accesorios().isEmpty()}
  }

  
}

 