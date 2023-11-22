import Personas.*
import Entretenimientos.*

class Ciudad {
	const residentes = #{}
	const entretenimientos = #{}
	
	method tieneMuchosEntretenimientos() = entretenimientos.size() > 2
	method residentesRecibirBonoCultural(bono) {
		residentes.forEach({ residente => residente.recibirBono(bono) })
	}
	
	method darBonoCultural(bono) {
		if(self.tieneMuchosEntretenimientos())
			self.residentesRecibirBonoCultural(bono)
	}
	
	method residentesInteresantes() = entretenimientos.map({ entretenimiento => entretenimiento.publicoMasInteresante() })
	
	method asisteAEntretenimientoCiudad(residente) = entretenimientos.any({ entretenimiento => entretenimiento.tieneA(residente) })
	method residentesAburridos() = residentes.filter({ residente => !self.asisteAEntretenimientoCiudad(residente) })
}