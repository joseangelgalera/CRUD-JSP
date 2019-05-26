<%-- 
    Document   : cerrarsesion
    Created on : 23-may-2019, 20:56:14
    Author     : José Ángel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cerrando sesion</title>
        <link rel="shortcut icon" href="img/favicon.ico">
    </head>

    <body>
        <%
          session = request.getSession(false);
          if (session.getAttribute("CodUSu") == null) {
            response.sendRedirect("iniciosesion.jsp");
          }

        %>
        <%
          session.invalidate();
        %>
        <script>
            location.replace("index.jsp");
        </script>
    </body>
</html>