<%-- 
    Document   : añadirpadres
    Created on : 23-may-2019, 23:55:48
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
        <title>Añadir Padres</title>
    </head>
    <body>
        <%
          request.setCharacterEncoding("UTF-8");
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/cria", "root", "");
          Statement s = conexion.createStatement();
          String insercion = "INSERT INTO padres (NumAnillPad, Raza, AnoNac) ";
          insercion += "VALUES ('";
          insercion += request.getParameter("NumAnillPad") + "', '";
          insercion += request.getParameter("Raza") + "', ";
          insercion += request.getParameter("AnoNac") + ")";
          //out.print(insercion);
          s.execute(insercion);
          conexion.close();
        %>

        <script>
            // Redirecciona a la página principal
            location.replace("padres.jsp");
        </script>
    </body>
</html>

