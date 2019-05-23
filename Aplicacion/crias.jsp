<%-- 
    Document   : crias
    Created on : 23-may-2019, 21:07:15
    Author     : José Ángel
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Crias</title>

        <!--Bootstrap 3-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


        <!--Bootstrap 4-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="estilo.css">

        <!--Enlaces propios-->
        <script type="text/javascript" src="javascript.js"></script>
        <link rel="shortcut icon" href="img/favicon.ico">

        <!--Fontawesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    </head>
    <body>

        <%
          request.setCharacterEncoding("UTF-8");
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/cria", "root", "");
          Statement s = conexion.createStatement();
          ResultSet listado = s.executeQuery("SELECT * FROM nido");
          HttpSession sesion = request.getSession();
        %>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Crias de <i><%out.print(sesion.getAttribute("usuario")); %></i></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle"></i><span>Añadir cria</span></a>						
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nº Anilla</th>
                            <th>Color</th>
                            <th>Sexo</th>
                            <th>Nacio</th>
                            <th>Murio</th>
                            <th>Apartado</th>
                            <th>Vendido</th>
                            <th>Nº Anilla de los padres</th>
                        </tr>
                    </thead>
                    <br>
                    <input class="form-control form-control-lg" id="myInput" type="text" placeholder="Filtrar resultados">
                    <tbody id="myTable">
                        <%
                          while (listado.next()) {
                        %>
                        <tr>
                            <td><% out.println(listado.getString("CodNid"));  %></td>
                            <td><% out.println(listado.getString("NumAnill")); %></td>
                            <td><% out.println(listado.getString("Color")); %></td>
                            <td><% out.println(listado.getString("Sexo")); %></td>
                            <td><% out.println(listado.getString("Nac"));%></td>
                            <td><% out.println(listado.getString("Murio"));%></td>
                            <td><% out.println(listado.getString("Apartado"));%></td>
                            <td><% out.println(listado.getString("Vendido"));%></td>
                            <td><% out.println(listado.getString("NumAnillPad"));%></td>
                            <td>
                                <a href="#editEmployeeModal<%= listado.getString("CodNid")%>" class="edit" data-toggle="modal"><i class="fas fa-pen-alt"></i></a>
                                <!--Actualizar cria-->
                                <div id="editEmployeeModal<%= listado.getString("CodNid")%>" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="actualizarcria.jsp" method="post">
                                                <div class="modal-header">						
                                                    <h4 class="modal-title">Editar cria</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                </div>
                                                <div class="modal-body">
                                                    <input type="hidden" name="actualizarCria" value="<%= listado.getString("CodNid")%>">
                                                    <div class="form-group">
                                                        <label>Nº Anilla</label>
                                                        <input type="text" class="form-control" name="NumAnill" placeholder="<%= listado.getString("NumAnill")%>" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Color</label>
                                                        <input type="text" class="form-control" name="Color" placeholder="<%= listado.getString("Color")%>" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Sexo</label>
                                                        <input type="text" class="form-control" name="Sexo" placeholder="<%= listado.getString("Sexo")%>">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Nacio</label>
                                                        <input type="text"  class="form-control" name="Nac" placeholder="<%= listado.getString("Nac")%>" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Murio</label>
                                                        <input type="text"  class="form-control" name="Murio" placeholder="<%= listado.getString("Murio")%>" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Apartado</label>
                                                        <input type="text"  class="form-control" name="Apartado" placeholder="<%= listado.getString("Apartado")%>" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Vendido</label>
                                                        <input type="text" class="form-control" name="Vendido" placeholder="<%= listado.getString("Vendido")%>" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Nº Anilla de los padres</label>
                                                        <input type="text" class="form-control" name="NumAnillPad" placeholder="<%= listado.getString("NumAnillPad")%>" required>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                                    <input type="submit" class="btn btn-info" value="Editar">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <a href="#deleteEmployeeModal<%= listado.getString("CodNid")%>" class="delete" data-toggle="modal"><i class="fas fa-trash-alt"></i></a>

                                <!--Borrar Cria-->
                                <div id="deleteEmployeeModal<%= listado.getString("CodNid")%>" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="borrarcria.jsp" methos="post">
                                                <div class="modal-header">						
                                                    <h4 class="modal-title">Borrar cria</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                </div>
                                                <div class="modal-body">					
                                                    <p>¿Seguro que quieres borrar esta cria?</p>
                                                    <p><%= listado.getString("NumAnill")%></p>
                                                    <input type="hidden" name="borrarCria" value="<%= listado.getString("CodNid")%>">
                                                    <p class="text-warning"><small>Una vez hecho no podrá recuperarse.</small></p>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                                    <input type="submit" class="btn btn-danger" value="Borrar">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <%
                          }
                          conexion.close();
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <!--Añadir Cria-->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="añadircria.jsp" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Añadir cria</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Nº Anilla</label>
                                <input type="text" class="form-control" name="NumAnill" required>
                            </div>
                            <div class="form-group">
                                <label>Color</label>
                                <input type="text" class="form-control" name="Color" required>
                            </div>
                            <div class="form-group">
                                <label>Sexo</label>
                                <input type="text" class="form-control" name="Sexo">
                            </div>
                            <div class="form-group">
                                <label>Nacio</label>
                                <input type="text" class="form-control" name="Nac" required>
                            </div>
                            <div class="form-group">
                                <label>Murio</label>
                                <input type="text" class="form-control" name="Murio" required>
                            </div>
                            <div class="form-group">
                                <label>Apartado</label>
                                <input type="text" class="form-control" name="Apartado" required>
                            </div>
                            <div class="form-group">
                                <label>Vendido</label>
                                <input type="text" class="form-control" name="Vendido" required>
                            </div>
                            <div class="form-group">
                                <label>Nº Anilla de los padres</label>
                                <input type="text" class="form-control" name="NumAnillPad" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                            <input type="submit" class="btn btn-success" value="Añadir">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--Volver al índice-->
        <form action="index.jsp" method="post">
            <div class="col-11">
                <div class="col-xs-6">
                </div>
                <div class="col-xs-2">
                    <input type = "hidden" name = "usuario" value = "<%sesion.getAttribute("usuario");%>" />
                    <input type = "hidden" name = "contrasena" value = "<%sesion.getAttribute("contrasena");%>" />
                    <input type="submit" class="btn-danger btn-lg" value="Volver"> 
                </div>
            </div>
        </form>
        <script>
            $(document).ready(function () {
                $("#myInput").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#myTable tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
        </script>
    </body>
</html>    
