<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1" session="true" import="com.productos.seguridad.*" %>
 
<%
Usuario usuario= new Usuario();
usuario.setNombre(request.getParameter("nombre"));
usuario.setCedula(request.getParameter("cedula"));
String nPerfil=request.getParameter("perfil");
try {
    int perfil = Integer.parseInt(nPerfil);
    usuario.setPerfil(perfil);
} catch (NumberFormatException e) {
    // Manejo de error si el valor no es un n�mero v�lido
    usuario.setPerfil(2); // O asignar un valor predeterminado
}
String nEstadoCivil=request.getParameter("estado_civil");
try {
	int estadoCivil = Integer.parseInt(nEstadoCivil);
	usuario.setEstadoCivil(estadoCivil);
} catch (NumberFormatException e) {
	// Manejo de error si el valor no es un n�mero v�lido
    usuario.setEstadoCivil(1); // O asignar un valor predeterminado
}
usuario.setCorreo(request.getParameter("correo"));
usuario.setClave("654321");
HttpSession sesion=request.getSession(); //Se crea la variable de sesi�n
boolean respuesta=usuario.ingresarUsuario();
if (respuesta)
{
sesion.setAttribute("estado", "Usuario registrado correctamente"); //Se a�ade atributo usuario
}
else
{
sesion.setAttribute("estado", "Error al registrar el usuario"); //Se a�ade atributo usuario
}
response.sendRedirect("usuarios.jsp"); //Se redirecciona a una p�gina espec�fica
%>