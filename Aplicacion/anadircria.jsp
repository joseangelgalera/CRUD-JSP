<%-- 
    Document   : nuevacria
    Created on : 23-may-2019, 21:55:47
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
        <title>Añadir Cria</title>
    </head>
    <body>
        <%
          request.setCharacterEncoding("UTF-8");
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/cria", "root", "");
          Statement s = conexion.createStatement();
          String insercion = "INSERT INTO crias (NumAnill, Color, Sexo, Nac, Murio, Apartado, Vendido, NumAnillPad) ";
          insercion += "VALUES ('";
          insercion += request.getParameter("NumAnill") + "', '";
          insercion += request.getParameter("Color") + "', '";
          insercion += request.getParameter("Sexo") + "', '";
          insercion += request.getParameter("Nac") + "', '";
          insercion += request.getParameter("Murio") + "', '";
          insercion += request.getParameter("Apartado") + "', '";
          insercion += request.getParameter("Vendido") + "', '";
          insercion += request.getParameter("NumAnillPad") + "')";
          //out.print(insercion);
          s.execute(insercion);
          conexion.close();
        %>

        <script>
            // Redirecciona a la página principal
            location.replace("crias.jsp");
        </script>
    </body>
</html>
