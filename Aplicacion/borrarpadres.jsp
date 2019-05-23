<%-- 
    Document   : borrarpadres
    Created on : 23-may-2019, 23:58:36
    Author     : José Ángel
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar Padres</title>
    </head>
    <body>
        <%
          request.setCharacterEncoding("UTF-8");
          
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/cria", "root", "");
          Statement s = conexion.createStatement();
          String borrado = "DELETE FROM padres WHERE CodPad=";
          borrado += request.getParameter("borrarPadres");
          s.execute(borrado);
          conexion.close();
        %>

        <script>
            // Redirecciona a la página principal
            location.replace("padres.jsp");
        </script>
    </body>
</html>
