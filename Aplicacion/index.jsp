<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início de sesión</title>

        <!--Bootstrap 4-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">

        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="login.css">

        <!--Favicon-->
        <link rel="shortcut icon" href="img/favicon.ico">
    </head>

    <body>

        <div class="container h-100">

            <div class="d-flex justify-content-center h-100">
                <div class="user_card">
                    <div class="d-flex justify-content-center">
                        <div class="brand_logo_container">
                            <img src="img/logo.jpg" class="brand_logo" alt="Logo">
                        </div>
                    </div>
                    <div class="mt-4">
                        <div class="d-flex justify-content-center links">
                            <h4 class="text-center">Cria de pajaros</h4>
                        </div>
                        <%
                          Class.forName("com.mysql.jdbc.Driver");
                          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/cria", "root", "");
                          Statement s = conexion.createStatement();
                          HttpSession sesion = request.getSession();
                          String usuario = "";
                          String contrasena = "";
                          String usuarioBD = "";
                          String contrasenaBD = "";
                          if (!sesion.isNew()) {
                            usuario = request.getParameter("usuario");
                            contrasena = request.getParameter("contrasena");
                          }
                          sesion.setAttribute("usuario", usuario);
                          sesion.setAttribute("contrasena", contrasena);
                          String query = "SELECT * FROM usuario";
                          MessageDigest md = MessageDigest.getInstance("MD5");
                          md.update(contrasena.getBytes());
                          String hash = DatatypeConverter.printHexBinary(md.digest());

                          ResultSet lista = s.executeQuery(query);
                          while (lista.next()) {
                            usuarioBD = lista.getString("NomUsu");
                            contrasenaBD = lista.getString("PassUsu");
                            if (sesion.getAttribute("usuario").equals(usuarioBD) && MessageDigest.isEqual(hash.getBytes(), contrasenaBD.getBytes())) {
                              break;
                            }
                          }
                          if (sesion.getAttribute("usuario").equals(usuarioBD) && MessageDigest.isEqual(hash.getBytes(), contrasenaBD.getBytes())) {
                        %>


                        <div class="d-flex justify-content-center mt-3 login_container">
                            <button type="button" name="button" class="btn login_btn"><a class ="link" href="padres.jsp">Padres</a></button>
                        </div>
                        <div class="d-flex justify-content-center mt-3 login_container">
                            <button type="button" name="button" class="btn login_btn"><a class ="link" href="crias.jsp">Crias</a></button>
                        </div>

                        <div class="d-flex justify-content-center mt-3 login_container">
                            <button type="button" name="button" class="btn login_btn"><a class ="link" href="cerrarsesion.jsp">Cerrar Sesion</a></button>
                        </div>
                    </div>

                    <%
                    } else {
                    %>
                    <br>
                    <% if (sesion.isNew()) {%>
                    <div class="d-flex justify-content-center mt-3 login_container">
                        <button type="button" name="button" class="btn login_btn"><a class ="link" href="iniciosesion.jsp">Iniciar Sesion</a></button>
                    </div>
                    <%
            } else {
            %>
            <div class="d-flex justify-content-center mt-3 login_container">
                        <button type="button" name="button" class="btn login_btn"><a class ="link" href="iniciosesion.jsp">Iniciar Sesion</a></button>
                    </div>

                    <%
                        }
                      }
                    %>
                    <div class="mt-4">
                        <div class="d-flex justify-content-center links">
                            ¿No tienes cuenta? <a href="registro.jsp" class="ml-2">Registrate</a>
                        </div>
                </div>
            </div>
        </div>
    </div>    
</body>
</html>