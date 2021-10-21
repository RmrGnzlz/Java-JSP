<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
        <title>Lista de empleados</title>
    </head>
    <body>
        <%
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>
        <div class="container mt-5">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col" colspan="7" class="text-center">Clientes</th>
                        <th>
                            <a href="crear.jsp" class="btn btn-primary">Nuevo</a>
                        </th>
                    </tr>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Primer Apellido</th>
                        <th scope="col">Segundo Apellido</th>
                        <th scope="col">Documento</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Celular</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/clientes?user=root&password=123456");
                        statement = connection.createStatement();
                        resultSet = statement.executeQuery("select * from clientes");
                        
                        while (resultSet.next()) {
                    %>
                    <tr>
                        <th scope="row"><%= resultSet.getString("id") %></th>
                        <td><%= resultSet.getString("nombre") %></td>
                        <td><%= resultSet.getString("primer_apellido") %></td>
                        <td><%= resultSet.getString("segundo_apellido") %></td>
                        <td><%= resultSet.getLong("documento") %></td>
                        <td><%= resultSet.getString("telefono") %></td>
                        <td><%= resultSet.getString("celular") %></td>
                        <td>
                            <a href="editar.jsp?id=<%= resultSet.getString("id") %>">
                                <i class="bi bi-pencil-fill"></i>
                            </a>
                            <a href="eliminar.jsp?id=<%= resultSet.getString("id") %>">
                                <i class="bi bi-trash-fill"></i>
                            </a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>
