<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
        <%
          request.setCharacterEncoding("UTF-8");
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/cria", "root", "");
          Statement s = conexion.createStatement();
          HttpSession sesion = request.getSession();
          MessageDigest md = MessageDigest.getInstance("MD5");
          md.update(request.getParameter("PassUsu").getBytes());
          String hash = DatatypeConverter.printHexBinary(md.digest());
          String insercion = "INSERT INTO usuarios (NomUsu, PassUsu) ";
          insercion += "VALUES ('";
          insercion += request.getParameter("NomUsu") + "', '";
          insercion += hash + "')";
          //out.print(insercion);
          if (request.getParameter("PassUsu").equals(request.getParameter("PassUsu2"))) {
            s.execute(insercion);
        %>

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
                            <h4 class="text-center">Registro completado</h4>
                        </div>


                        <form action="index.jsp"  method="post">
                            <input type = "hidden" name = "usuario" value = "<%sesion.getAttribute("usuario");%>" />
                            <input type = "hidden" name = "contrasena" value = "<%sesion.getAttribute("contraseña");%>" />
                            <div class="d-flex justify-content-center mt-3 login_container">
                                <button type="submit" name="button" class="btn login_btn">Volver</button>
                            </div>
                        </form>

                    </div>
                   
                </div>
            </div>
        </div>
        <%
        } else {
        %>
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
                            <h4 class="text-center">Las contraseñas no coinciden</h4>
                        </div>
                        <div class="d-flex justify-content-center mt-3 login_container">
                            <button type="button" name="button" class="btn login_btn"><a href="registro.jsp" class="login">Volver a intentarlo</a></button>
                        </div>

                        <form action="index.jsp"  method="post">
                            <input type = "hidden" name = "usuario" value = "<%sesion.getAttribute("usuario");%>" />
                            <input type = "hidden" name = "contrasena" value = "<%sesion.getAttribute("contraseña");%>" />
                            <div class="d-flex justify-content-center mt-3 login_container">
                                <button type="submit" name="button" class="btn login_btn">Volver</button>
                            </div>
                        </form>

                    </div>



                </div>
            </div>
        </div>
    </div> 
    <%
      }
      conexion.close();
    %>
</body>
</html>

