import Personas.*

class Entretenimiento {
	const capacidadMaxima = 0
	const publico = #{}
	const diversion = 0
	
	method dificultad(persona) 
	
	method agregarPublico(persona) {
		publico.add(persona)
	}
	
	method permiteIngresar(persona) = !self.estaAgotado()
	method estaAgotado() = capacidadMaxima == publico.size()
	method asistir(persona) {
		if(self.permiteIngresar(persona))
			self.agregarPublico(persona)
	} 
	
	method masPobre() = publico.min({ persona => persona.dinero() })
	method publicoMasInteresante() = self.masPobre()
	
	method tieneA(persona) = publico.contains(persona)
	
	method satisfaccion(persona) = diversion - self.dificultad(persona)
}

class Parque inherits Entretenimiento {
	var estaAbierto = true
	
	override method dificultad(persona) = 5
	
	method estaAbierto(estado) {
		estaAbierto = estado
	}
	
	override method permiteIngresar(persona) = super(persona) && estaAbierto
}

class Ecoparque inherits Parque {
	override method permiteIngresar(persona) = super(persona) && persona.estaVacunada()
	
	override method satisfaccion(persona) = 2 * super(persona)
}

class Espectaculo inherits Entretenimiento {
	const valorEntrada = 0
	
	override method permiteIngresar(persona) = super(persona) && persona.puedePagar(valorEntrada)
	override method agregarPublico(persona) {
		super(persona)
		persona.pagarEntrada(valorEntrada)
	}
	
	override method dificultad(persona) = (valorEntrada / (2 * persona.dinero())) + 1
}

class PartidoDeFutbol inherits Espectaculo {
	override method agregarPublico(persona) {
		super(persona)
		persona.aumentarExperienciaDeportiva()
	}
	
	method masExperimentadoDeportivamente() = publico.max({ persona => persona.experienciaDeportiva() })
	override method publicoMasInteresante() = self.masExperimentadoDeportivamente()
	
	override method dificultad(persona) = (valorEntrada / (5 * persona.dinero())) + 1
}