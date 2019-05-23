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
                            <h4 class="text-center">Início de Sesión</h4>
                        </div>

                        <form action="index.jsp"  method="post">
                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" name="usuario" class="form-control input_user" value="" placeholder="Usuario">
                            </div>
                            <div class="input-group mb-2">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" name="contrasena" class="form-control input_pass" value="" placeholder="Contraseña">
                            </div>
                            <div class="d-flex justify-content-center mt-3 login_container">
                                <button type="submit" name="button" class="btn login_btn">Iniciar Sesión</button>
                            </div>
                        </form>
                        <%
                          HttpSession sesion = request.getSession();
                          String usuario = request.getParameter("usuario");
                          String contrasena = request.getParameter("contrasena");
                          sesion.setAttribute("usuario", usuario);
                          sesion.setAttribute("contrasena", contrasena);
                        %>
                    </div>

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
