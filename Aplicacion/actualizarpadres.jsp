<%-- 
    Document   : actualizarpadres
    Created on : 24-may-2019, 0:00:06
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
        <title>Actualizar Padres</title>
    </head>
    <body>
        <%
          request.setCharacterEncoding("UTF-8");
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/cria", "root", "");
          Statement s = conexion.createStatement();
          String actualizacion = "UPDATE padres SET NumAnillPad='";
          actualizacion += request.getParameter("NumAnillPad");         
          actualizacion += "', Raza='";
          actualizacion += request.getParameter("Raza");
          actualizacion += "', AnoNac='";
          actualizacion += request.getParameter("AnoNac");
          actualizacion += "' WHERE CodPad=";
          actualizacion += request.getParameter("actualizarPadres");
          //out.print(actualizacion);
          s.execute(actualizacion);
          conexion.close();
        %>

        <script>
            //Redirecciona a la página principal
            location.replace("padres.jsp");
        </script>

    </body>
</html>
