<b>LOYMARK CHALLENGE</b>

<b>Pre-condiciones:</b>
* Tener instalado Angular CLI. Desde una terminal ejecutamos el comando (npm install -g @angular/cli).
* Tener instalado NodeJS (https://nodejs.org/es/_)
* Tener instalado SQL Server 2019 Express (https://www.microsoft.com/es-es/sql-server/sql-server-downloads)
* Tener instalado Visual Studio 2022  (https://visualstudio.microsoft.com/es/vs/community/)
* Tener instalado Visual Studio Code (https://code.visualstudio.com/)

<b>1) BASE DE DATOS</b>

* Ejecutar script de creacion de base de datos "scriptDB_LomarkChallange.sql" que se encuentra en la carpeta "LoymarkDataBase"

<b>2) BACKEND</b>

* Abrir con Visual Studio 2022 el archivo de solucion llamado "LoymarkAPI.sln" que se encuentra en la carpeta "LoymarkAPI".
* Abrir el archivo appsettings.json que se encuentra en la raiz del proyecto y editar la variable "DefaultConnection" con el valor de la cadena de conexion correspondiente de la base de datos que acabamos de crear.
* Compilar y ejecutar la aplicacion.

Tomar nota de la direción (url) que aparece en el navegador ya que la usaremos en el FrontEnd

<b>3) FRONTEND</b>

* Abrir una terminal en la carpeta LoymarkClient.
* Ejecutar el comando "npm update".
* Abrir la carpeta LoymarkClient con VSCode.
* Abrir el archivo src/enviroment/enviroment.ts y modificar la variable apiUrl por la url que se generó en la api.
* Nuevamente en la terminal ejecutamos el comando "npm start"
