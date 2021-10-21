<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Empleado</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="crear.jsp" method="post">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" required>
                        </div>
                        <div class="mb-3">
                            <label for="primer_apellido" class="form-label">Primer Apellido</label>
                            <input type="text" class="form-control" id="primer_apellido" name="primer_apellido" placeholder="Primer Apellido" required>
                        </div>
                        <div class="mb-3">
                            <label for="segundo_apellido" class="form-label">Segundo Apellido</label>
                            <input type="text" class="form-control" id="segundo_apellido" name="segundo_apellido" placeholder="Segundo Apellido" required>
                        </div>
                        <div class="mb-3">
                            <label for="documento" class="form-label">Documento</label>
                            <input type="number" class="form-control" id="documento" name="documento" placeholder="Nombre" required>
                        </div>
                        <div class="mb-3">
                            <label for="telefono" class="form-label">Teléfono</label>
                            <input type="tel" class="form-control" id="telefono" name="telefono" placeholder="Telefono" required>
                        </div>
                        <div class="mb-3">
                            <label for="celular" class="form-label">Celular</label>
                            <input type="tel" class="form-control" id="celular" name="celular" placeholder="Celular" required>
                        </div>
                        
                        <button type="submit" name="enviar" class="btn btn-primary">Registrar</button>
                    </form>
                </div>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                String nombre = request.getParameter("nombre");
                String primerApellido = request.getParameter("primer_apellido");
                String segundoApellido = request.getParameter("segundo_apellido");
                String documento = request.getParameter("documento");
                String telefono = request.getParameter("telefono");
                String celular = request.getParameter("celular");
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/clientes?user=root&password=123456");
                    Statement statement = connection.createStatement();
                    String query = String.format(
                    "INSERT INTO `clientes` ("
                    + "`nombre`, "
                    + "`primer_apellido`, "
                    + "`segundo_apellido`, "
                    + "`documento`, "
                    + "`telefono`, "
                    + "`celular`) "
                    + "VALUES ('%s', '%s', '%s', %s, '%s', '%s')",
                    nombre, primerApellido, segundoApellido, documento, telefono, celular);
                    statement.execute(query);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception ex)
                {
                    out.print(ex.getMessage());
                }
            }
        %>
    </body>
</html>
