import Entretenimientos.*

class Persona {
	const estaVacunada = true
	var experienciaDeportiva = 0
	var dinero = 0
	
	method dinero() = dinero
	method experienciaDeportiva() = experienciaDeportiva
	method estaVacunada() = estaVacunada
	
	method aumentarExperienciaDeportiva() {
		experienciaDeportiva += 1
	}
	method puedePagar(valorEntrada) = dinero >= valorEntrada
	method pagarEntrada(valorEntrada) {
		dinero -= valorEntrada
	}
	
	method asistirAEntretenimiento(entretenimiento) {
		entretenimiento.asistir(self)
	}
	
	method recibirBono(bono) {
		dinero += bono
	}
}