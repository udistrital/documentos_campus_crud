# documentos_campus_crud
API de gestión de documentos

Integración con

 - `CI`
 - `AWS Lambda - S3`
 - `Drone 1.x`
 - `documentos_campus_crud master/develop`

## Requerimientos
Go version >= 1.8.

## Preparación
Para usar el API, usar el comando:

 - `go get github.com/udistrital/documentos_campus_crud`

## Ejecución
Definir los valores de las siguientes variables de entorno:

 - `DOCUMENTOS_CAMPUS_HTTP_PORT`: Puerto asignado para la ejecución del API
 - `DOCUMENTOS_CAMPUS_CRUD__PGUSER`: Usuario de la base de datos
 - `DOCUMENTOS_CAMPUS_CRUD__PGPASS`: Clave del usuario para la conexión a la base de datos  
 - `DOCUMENTOS_CAMPUS_CRUD__PGURLS`: Host de conexión
 - `DOCUMENTOS_CAMPUS_CRUD__PGDB`: Nombre de la base de datos
 - `DOCUMENTOS_CAMPUS_CRUD__SCHEMA`: Esquema a utilizar en la base de datos

## Pruebas
En Proceso


## Ejemplo
DOCUMENTOS_CAMPUS_HTTP_PORT=8094 DOCUMENTOS_CAMPUS_CRUD__PGUSER=user DOCUMENTOS_CAMPUS_CRUD__PGPASS=password DOCUMENTOS_CAMPUS_CRUD__PGURLS=localhost DOCUMENTOS_CAMPUS_CRUD__PGDB=bd DOCUMENTOS_CAMPUS_CRUD__SCHEMA=schema_new bee run

## Modelo BD
![image](https://github.com/planesticud/documentos_crud/blob/develop/modelo_documentos_crud.png).
