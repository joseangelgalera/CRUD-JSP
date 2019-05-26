<%-- 
    Document   : actualizarCria
    Created on : 23-may-2019, 22:30:25
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
        <title>Actualizar cria</title>
    </head>
    <body>
        <%
          request.setCharacterEncoding("UTF-8");
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/cria", "root", "");
          Statement s = conexion.createStatement();
          String actualizacion = "UPDATE crias SET NumAnill='";
          actualizacion += request.getParameter("NumAnill");
          actualizacion += "', Color='";
          actualizacion += request.getParameter("Color");
          actualizacion += "', Sexo='";
          actualizacion += request.getParameter("Sexo");
          actualizacion += "', Nac='";
          actualizacion += request.getParameter("Nac");
          actualizacion += "', Murio='";
          actualizacion += request.getParameter("Murio");
          actualizacion += "', Apartado='";
          actualizacion += request.getParameter("Apartado");
          actualizacion += "', Vendido='";
          actualizacion += request.getParameter("Vendido");
          actualizacion += "', NumAnillPad='";
          actualizacion += request.getParameter("NumAnillPad");
          actualizacion += "' WHERE CodNid=";
          actualizacion += request.getParameter("actualizarCria");
          //out.print(actualizacion);
          s.execute(actualizacion);
          conexion.close();
        %>

        <script>
            //Redirecciona a la página principal
            location.replace("crias.jsp");
        </script>

    </body>
</html>
