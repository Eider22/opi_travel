# Prueba técnica backend

En este proyecto encontrarás lo siguiente:

1- En la carpeta classDiagram encontrará un archivo en pdf del diagrama de clases que puedes descargar para hacer zoom y ver con mayor claridad.
NOTAS:
* Este diagrama muestra una estructura de la aplicación por capas(controller, service, repository).

* El diagrama está enfocado en el funcionamiento del núcleo de negocio ya que la aplicación fue diseñada con dos microservicios, uno de seguridad y uno de lógica de negocio y solo el de lógica de negocio cuenta con 16 entidades en su diseño, pero la estructura que verás en el diagrama de clases fácilmente se puede ir extendiendo para representar el 100% de la aplicación.

* El diagrama se basa especificamente en:
 * Diseño decapas
 * Funcionalidades principales del microservicio de la lógica de negocio como:
  * Que un cliente cree solicitudes,
  * Que un cliente cancele solicitudes
  * Que un cliente busque y liste sus solicitudes creadas
  * Que un admin liste, cree, edite, busque y elimine viajes

2- En la carpeta DB model encontrarás:
* El diseño de las bases de datos para los microservicios de lógica de negocio y seguridad.
**NOTA**: Las entidades en color rosa son entidades que no fueron creadas en los queries DML de la base de datos que podrás encontrar en la carpeta DB queries. Estas entidades no fueron creadas simplemente por fines prácticos para alcanzar a desarrollar la prueba, pues estas entidades no son necesarias en los queries solicitados, lo que NO quiere decir que no sean necesarias para la implementación del sistema.

3- En la carpeta DB queries encontraras:
* Un archivo sql llamado "DDL queries.sql" que contiene los queries para la creación de la base de datos y sus tablas.
* Un archivo llamado "DML queries.sql" Que contiene los queries para el llenado de datos de las tablas que son necesarias más adelante para realizar las consultas.
* Un archivo llamado "Queires solicitados.sql" que contiene los queries de las consultas solicitadas

  
