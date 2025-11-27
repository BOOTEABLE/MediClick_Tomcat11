document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("formCliente");

    form.addEventListener("submit", () => {
        // Captura los datos antes de enviar al servidor
        const cliente = {
            Nombre: document.getElementById("nombre").value,
            Cedula: document.getElementById("cedula").value,
            EstadoCivil: document.getElementById("estado").value,
            Residencia: document.querySelector('input[name="rdResidencia"]:checked')?.value,
            FechaNacimiento: document.getElementById("fecha").value,
            ColorFavorito: document.getElementById("color").value,
            Correo: document.getElementById("correo").value,
            Clave: document.getElementById("clave").value
        };
        
		// === VALIDACIONES ===

	    const correoRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	    if (!correoRegex.test(correo)) {
	        alert("❌ Ingrese un correo electrónico válido.");
	        e.preventDefault();
	        return;
	    }
	
	    if (clave.length < 6) {
	        alert("❌ La clave debe tener mínimo 6 caracteres.");
	        e.preventDefault();
	        return;
	    }
	
	    // Si pasa todo, muestra los datos en consola
	    const cliente = {
	        Nombre: nombre,
	        Cedula: cedula,
	        EstadoCivil: estado,
	        Residencia: residencia,
	        FechaNacimiento: fecha,
	        ColorFavorito: color,
	        Correo: correo,
	        Clave: clave
	    };
        console.clear();
        console.log("📌 Datos capturados del formulario:");
        console.table(cliente);
    });
});
