<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/clientes?user=root&password=123456");
            String id = request.getParameter("id");
            Statement statement = connection.createStatement();
            statement.executeUpdate(String.format("delete from clientes where id = %s", id));
            request.getRequestDispatcher("index.jsp").forward(request, response);
            try {
            
            } catch (Exception ex)
            {
                out.print(ex.getMessage());
            }
        %>
        <h1>Hello World!</h1>
    </body>
</html>
