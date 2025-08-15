<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*, java.sql.*" %>
<%
  String nombre = request.getParameter("nombre");
  String email = request.getParameter("email");
  String mensaje = request.getParameter("mensaje");

  String resultado = "";
  try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/contacto_db", "root", "");
      PreparedStatement ps = con.prepareStatement("INSERT INTO mensajes (nombre, email, mensaje) VALUES (?, ?, ?)");
      ps.setString(1, nombre);
      ps.setString(2, email);
      ps.setString(3, mensaje);
      ps.executeUpdate();
      con.close();
      resultado = "Mensaje enviado correctamente.";
  } catch(Exception e) {
      resultado = "Error al enviar el mensaje: " + e.getMessage();
  }
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Gracias por tu mensaje</title>
  <link rel="stylesheet" href="styles.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
  <section class="container my-5 text-center">
    <h2 class="mb-4">Gracias, <%= nombre %>!</h2>
    <p>Tu mensaje ha sido recibido. Te respondere pronto a <strong><%= email %></strong>.</p>
    <div class="alert alert-secondary mt-3">
      <strong>Tu mensaje:</strong><br>
      <%= mensaje %>
    </div>
    <div class="alert alert-info mt-4">
      <%= resultado %>
    </div>
    <a href="contacto.html" class="btn btn-primary mt-4">Volver al formulario</a>
  </section>
</body>
</html>
