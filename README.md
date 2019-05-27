# CRUD-JSP

El proyecto tratara sobre la gestión de cría de aves en la que se hará el registro de las parejas usadas y las crias nacidas.

El objetivo de este proyecto es informatizar la recogida de estos datos para facilitar el acceso a los ornitólogos ya
que a día de hoy algunos siguen usando libretas para llevar el seguimiento de la cría.

## Índice 
1. [Base de datos utilizada](#id1) 
2. [Página principal](#id2)
3. [Registro de nuevo usuario](#id3)
4. [Inicio de sesión](#id4)
5. [Menú principal](#id5)
6. [Tabla padres](#id6)
    * 6.1 [Añadir padres](#id6.1)
    * 6.2 [Actualizar padres](#id6.2)
    * 6.3 [Filtrar padres](#id6.3)
    * 6.4 [Borrar padres](#id6.4)
7. [Tabla crías](#id7)
    * 7.1 [Añadir crías](#id7.1)
    * 7.2 [Actualizar crías](#id7.2)
    * 7.3 [Filtrar crías](#id7.3)
    * 7.4 [Borrar crías](#id7.4)
<br>

<a name="id1"></a>
## 1. Base de datos utilizada
<img src="Capturas/basededatos.png" alt="Base de datos">
<br>

<a name="id2"></a>
## 2. Página principal
En ella podemos ver el botón de inicio de sesión y un link para iniciar el registro de un nuevo usuario.<br>
*index.jsp*
<img src="Capturas/img1.png" alt="Inicio">
<br>

<a name="id3"></a>
## 3. Registro de nuevo usuario
Consta de un formulario que pide nombre de usuario, contraseña y repetir dicha contraseña.<br>
*registro.jsp*
<img src="Capturas/img2.png" alt="Registro">
En caso de que se introduzcan mal los datos se puede volver a intentar o volver a la pagina de inicio de sesión.
*validaregistro.jsp*
<img src="Capturas/img3.png" alt="Fallo de registro">
Si se completa de forma adecuada el registro se presentara un mensaje que lo confirme y se podra volver a la página de incio de sesión.<br>
*validaregistro.jsp*
<img src="Capturas/img4.png" alt="Registro completado correctamente">
<br>

<a name="id4"></a>
## 4. Inicio de sesión
Se pide al usuario el nombre y la contraseña y tambien acceso al link de registro.<br>
*iniciodesesion.jsp*
<img src="Capturas/img5.png" alt="Pagina de incio de sesión">
Si se introducen mal los datos saldra un mensaje de error y se podra volver a intentar.
<img src="Capturas/img6.png" alt="Error de incio de sesión">
<br>

<a name="id5"></a>
## 5. Menú principal
Una vez hecho correctamente el incio de sesión se nos presenta un menu que nos da acceso a la tabla Padres, Crías y al cierre de sesión.
Ademas cada una de las tablas cuenta con un botón volver que devuelve al usuario al menú principal.
<img src="Capturas/img7.png" alt="Menú principal">
Cualquier intento de acceder a las tablas sin haber iniciado sesión anteriormente redirigira a la pagina de inicio de sesión.
<br>

<a name="id6"></a>
## 6. Tabla padres
En ella se guardan las distintas parejas de padres: el numero de anilla de los padres, el año de nacimiento y la raza.<br>
*padres.jsp*
<img src="Capturas/img8.png" alt="Tabla padres">
<br>

<a name="id6.1"></a>
### 6.1 Añadir padres
Es tan facil como darle al boton verde de Añadir padres.<br>
*anadirpadres.jsp*
<img src="Capturas/img9.png" alt="Añadir padres">
<img src="Capturas/img10.png" alt="Nuevos padres añadidos">
<br>

<a name="id6.2"></a>
### 6.2 Actualizar padres
Dandole al icono del boligrafo amarillo se pueden editar las parejas de padres.<br>
*actualizarpadres.jsp*
<img src="Capturas/img11.png" alt="Actualizar padres">
<br>

<a name="id6.3"></a>
### 6.3 Filtrar padres
Mediante un campo de busqueda se pueden filtrar las parejas de padres por sus distintos campos.
<img src="Capturas/img12.png" alt="Filtrado de datos">

<a name="id6.4"></a>
### 6.4 Borrar padres
Haciendo click sobre el icono de la papelera roja se pueden borrar los padres.<br>
*borrarpadres.jsp*
<img src="Capturas/img13.png" alt="Borrar padres">
<img src="Capturas/img14.png" alt="Padres borrados">
<br>

<a name="id7"></a>
## 7. Tabla crías
En esta tabla se guardan las crias de los padres anteriormente registrados, añadiendo los siguientes datos: su numero de anilla, el color, el sexo, si nacio, murio, fue apartado o vendido y el numero de anilla de los padres.<br>
*crias.jsp*
<img src="Capturas/img15.png" alt="Tabla crías">
<br>

<a name="id7.1"></a>
### 7.1 Añadir crías
Usa el mismo boton que la tabla padres y ademas se pide el numero de anilla de los padres mediante una lista desplegable en la que aparecen las anillas ya registradas.<br>
*anadircrias.jsp*
<img src="Capturas/img16.png" alt="Añadir crías">
<br>

<a name="id7.2"></a>
### 7.2 Actualizar crías
*actualizarcrias.jsp*
<img src="Capturas/img17.png" alt="Actualizar crías">
<br>

<a name="id7.3"></a>
### 7.3 Filtrar crías
Al igual que los padres se pueden filtrar las crías por campos mediante un campo de busqueda.
<img src="Capturas/img18.png" alt="Filtrar crías">
<br>

<a name="id7.4"></a>
### 7.4 Borrar crías
*borrarcrias.jsp*
<img src="Capturas/img19.png" alt="Borrar crías">
<img src="Capturas/img20.png" alt="Crías borradas">








