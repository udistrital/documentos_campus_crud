--Schema Documentos
CREATE SCHEMA documentos;

--Creacion tabla dominio_tipo_documento
CREATE SEQUENCE documentos.dominio_tipo_documento_id_seq
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

CREATE TABLE documentos.dominio_tipo_documento(
	id integer NOT NULL DEFAULT nextval('documentos.dominio_tipo_documento_id_seq'::regclass),
    nombre character varying(100) NOT NULL,
	descripcion character varying(100),
	codigo_abreviacion character varying(20),
	activo boolean NOT NULL,
	numero_orden numeric(5,2),
	fecha_creacion TIMESTAMP NOT NULL,
	fecha_modificacion TIMESTAMP NOT NULL,
	CONSTRAINT pk_dominio_tipo_documento PRIMARY KEY (id)
);
COMMENT ON TABLE documentos.dominio_tipo_documento IS 'Tabla que parametriza los diferentes dominios de documentos, entendido como aplicación-negocio.';
COMMENT ON COLUMN documentos.dominio_tipo_documento.id IS 'Identificador unico de la tabla dominio_tipo_documento.';
COMMENT ON COLUMN documentos.dominio_tipo_documento.nombre IS 'Campo obligatorio de la tabla que indica el nombre de los dominios.';
COMMENT ON COLUMN documentos.dominio_tipo_documento.descripcion IS 'Campo en el que se puede registrar una descripcion de la informacion del dominio_tipo_documento.';
COMMENT ON COLUMN documentos.dominio_tipo_documento.codigo_abreviacion IS 'Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere.';
COMMENT ON COLUMN documentos.dominio_tipo_documento.activo IS 'Valor booleano para indicar si el registro esta activo o inactivo.';
COMMENT ON COLUMN documentos.dominio_tipo_documento.numero_orden IS 'En dado caso que se necesite establecer un orden a los registros que no se encuentre definido por aplicación ni por BD. Allí se almacena permitiendo realizar subitems mediante la precisión.';
COMMENT ON COLUMN documentos.dominio_tipo_documento.fecha_creacion IS 'Fecha y hora de la creación del registro en la BD.';
COMMENT ON COLUMN documentos.dominio_tipo_documento.fecha_modificacion IS 'Fecha y hora de la ultima modificación del registro en la BD.';



--Creacion tabla tipo_documento
CREATE SEQUENCE documentos.tipo_documento_id_seq
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

CREATE TABLE documentos.tipo_documento(
	id integer NOT NULL DEFAULT nextval('documentos.tipo_documento_id_seq'::regclass),
    nombre character varying(100) NOT NULL,
	descripcion character varying(100),
	codigo_abreviacion character varying(20),
	activo boolean NOT NULL,
	numero_orden numeric(5,2),
    dominio_tipo_documento_id integer NOT NULL,
	fecha_creacion TIMESTAMP NOT NULL,
	fecha_modificacion TIMESTAMP NOT NULL,
	CONSTRAINT pk_tipo_documento PRIMARY KEY (id),
    CONSTRAINT fk_dominio_tipo_documento_tipo_documento FOREIGN KEY (dominio_tipo_documento_id) REFERENCES documentos.dominio_tipo_documento(id)
);
COMMENT ON TABLE documentos.tipo_documento IS 'Tabla que parametriza las diferentes subcategorias del dominio_tipo_documento, se puede entender como los diferentes documentos de un negocio.';
COMMENT ON COLUMN documentos.tipo_documento.id IS 'Identificador unico de la tabla tipo_documento.';
COMMENT ON COLUMN documentos.tipo_documento.nombre IS 'Campo obligatorio de la tabla que indica el nombre de los dominios.';
COMMENT ON COLUMN documentos.tipo_documento.descripcion IS 'Campo en el que se puede registrar una descripcion de la informacion del tipo_documento.';
COMMENT ON COLUMN documentos.tipo_documento.codigo_abreviacion IS 'Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere.';
COMMENT ON COLUMN documentos.tipo_documento.activo IS 'Valor booleano para indicar si el registro esta activo o inactivo.';
COMMENT ON COLUMN documentos.tipo_documento.numero_orden IS 'En dado caso que se necesite establecer un orden a los registros que no se encuentre definido por aplicación ni por BD. Allí se almacena permitiendo realizar subitems mediante la precisión.';
COMMENT ON COLUMN documentos.tipo_documento.dominio_tipo_documento_id IS 'Identificador unico de la tabla dominio_tipo_documento';
COMMENT ON COLUMN documentos.tipo_documento.fecha_creacion IS 'Fecha y hora de la creación del registro en la BD.';
COMMENT ON COLUMN documentos.tipo_documento.fecha_modificacion IS 'Fecha y hora de la ultima modificación del registro en la BD.';



--Creacion tabla documento
CREATE SEQUENCE documentos.documento_id_seq
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

CREATE TABLE documentos.documento(
	id integer NOT NULL DEFAULT nextval('documentos.documento_id_seq'::regclass),
    nombre character varying(100),
	descripcion character varying(100),
    tipo_documento_id integer NOT NULL,
    contenido json,
	codigo_abreviacion character varying(20),
	activo boolean NOT NULL,
    numero_orden numeric(5,2),
	fecha_creacion TIMESTAMP NOT NULL,
	fecha_modificacion TIMESTAMP NOT NULL,
	CONSTRAINT pk_documento PRIMARY KEY (id),
    CONSTRAINT fk_tipo_documento_documento FOREIGN KEY (tipo_documento_id) REFERENCES documentos.tipo_documento(id)
);
COMMENT ON TABLE documentos.documento IS 'Tabla que contiene la información de los diferentes documentos guardados en el sistema.';
COMMENT ON COLUMN documentos.documento.id IS 'Identificador unico de la tabla documento.';
COMMENT ON COLUMN documentos.documento.nombre IS 'Campo obligatorio de la tabla que indica el nombre del documento';
COMMENT ON COLUMN documentos.documento.descripcion IS 'Campo en el que se puede registrar una descripcion o detalle de la informacion del documento.';
COMMENT ON COLUMN documentos.documento.tipo_documento_id IS 'Identificador unico de la tabla dominio_tipo_documento';
COMMENT ON COLUMN documentos.documento.contenido IS 'Contiene la metadata del documento y lo que sea pertinenete almacenar para el negocio.';
COMMENT ON COLUMN documentos.documento.codigo_abreviacion IS 'Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere.';
COMMENT ON COLUMN documentos.documento.activo IS 'Valor booleano para indicar si el registro esta activo o inactivo.';
COMMENT ON COLUMN documentos.documento.numero_orden IS 'En dado caso que se necesite establecer un orden a los registros que no se encuentre definido por aplicación ni por BD. Allí se almacena permitiendo realizar subitems mediante la precisión.';
COMMENT ON COLUMN documentos.documento.fecha_creacion IS 'Fecha y hora de la creación del registro en la BD.';
COMMENT ON COLUMN documentos.documento.fecha_modificacion IS 'Fecha y hora de la ultima modificación del registro en la BD.';



--°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
--°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

/**
CREATE TABLE core.dominio_tipo_documento
(
  id serial NOT NULL, -- identificador unico
  nombre character varying(50) NOT NULL, -- Nombre de los dominios
  descripcion character varying(250), -- Detalle de los dominios
  codigo_abreviacion character varying(20), -- Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere.
  activo boolean NOT NULL, -- Havilitado para el sistema
  numero_orden numeric(5,2), -- Establecer un orden a los registros que no se encuentre definido por aplicación
  CONSTRAINT pk_dominio_tipo_documento PRIMARY KEY (id)
)
COMMENT ON TABLE core.dominio_tipo_documento IS 'Contiene los distintos dominio de documentos';
COMMENT ON COLUMN core.dominio_tipo_documento.id IS 'identificador unico';
COMMENT ON COLUMN core.dominio_tipo_documento.nombre IS 'Nombre de los dominios';
COMMENT ON COLUMN core.dominio_tipo_documento.descripcion IS 'Detalle de los dominios';
COMMENT ON COLUMN core.dominio_tipo_documento.codigo_abreviacion IS 'Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere.';
COMMENT ON COLUMN core.dominio_tipo_documento.activo IS 'Havilitado para el sistema';
COMMENT ON COLUMN core.dominio_tipo_documento.numero_orden IS 'Establecer un orden a los registros que no se encuentre definido por aplicación ';
**/



/**
CREATE TABLE core.tipo_documento
(
  id integer NOT NULL DEFAULT nextval('core.tipo_documento_id_seq'::regclass), -- identificador unico
  codigo_abreviacion character varying(20) NOT NULL, -- Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere.
  nombre character varying(20) NOT NULL, -- Nombre de los documentos
  descripcion character varying(250), -- Detalle de los documentos
  activo boolean NOT NULL, -- Havilitado para el sistema
  numero_orden numeric(5,2), -- Establecer un orden a los registros que no se encuentre definido por aplicación
  dominio_tipo_documento integer NOT NULL, -- referencia a la tabla dominio_tipo_documentos
  CONSTRAINT pk_tipo_documento PRIMARY KEY (id)
  WITH (FILLFACTOR=100),
  CONSTRAINT fk_tipo_documento_dominio_tipo_documento FOREIGN KEY (dominio_tipo_documento)
      REFERENCES core.dominio_tipo_documento (id) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION
)

COMMENT ON TABLE core.tipo_documento IS 'Contiene los distintos tipos de documentos';
COMMENT ON COLUMN core.tipo_documento.id IS 'identificador unico';
COMMENT ON COLUMN core.tipo_documento.codigo_abreviacion IS 'Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere.';
COMMENT ON COLUMN core.tipo_documento.nombre IS 'Nombre de los documentos';
COMMENT ON COLUMN core.tipo_documento.descripcion IS 'Detalle de los documentos';
COMMENT ON COLUMN core.tipo_documento.activo IS 'Havilitado para el sistema';
COMMENT ON COLUMN core.tipo_documento.numero_orden IS 'Establecer un orden a los registros que no se encuentre definido por aplicación';
COMMENT ON COLUMN core.tipo_documento.dominio_tipo_documento IS 'referencia a la tabla dominio_tipo_documentos';
**/


/**
CREATE TABLE core.documento
(
  id serial NOT NULL, -- identificador unico
  nombre character varying(150), -- Nombre de los documentos
  descripcion character varying(250), -- Detalle de los documentos
  tipo_documento integer NOT NULL,
  contenido json, -- Contiene la información consignada en el documento
  codigo_abreviacion character varying(20), -- Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere.
  activo boolean NOT NULL, -- Havilitado para el sistema
  numero_orden numeric(5,2), -- Establecer un orden a los registros que no se encuentre definido por aplicación
  CONSTRAINT pk_documento PRIMARY KEY (id), -- Llave primaria de la tabla documento
  CONSTRAINT fk_documento_tipo_documento FOREIGN KEY (tipo_documento)
      REFERENCES core.tipo_documento (id) MATCH FULL
      ON UPDATE RESTRICT ON DELETE RESTRICT
)

COMMENT ON TABLE core.documento IS 'Contiene los distintos documentos para el sistema';
COMMENT ON COLUMN core.documento.id IS 'identificador unico';
COMMENT ON COLUMN core.documento.nombre IS 'Nombre de los documentos';
COMMENT ON COLUMN core.documento.descripcion IS 'Detalle de los documentos';
COMMENT ON COLUMN core.documento.contenido IS 'Contiene la información consignada en el documento';
COMMENT ON COLUMN core.documento.codigo_abreviacion IS 'Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere.';
COMMENT ON COLUMN core.documento.activo IS 'Havilitado para el sistema';
COMMENT ON COLUMN core.documento.numero_orden IS 'Establecer un orden a los registros que no se encuentre definido por aplicación';
COMMENT ON CONSTRAINT pk_documento ON core.documento IS 'Llave primaria de la tabla documento';
**/



CREATE TABLE core.valor_atributo_documento
(
  id serial NOT NULL, -- Identificador de la tabla valor_atributo_documento
  valor_atributo character varying(250) NOT NULL, -- Valor del atributo del documento
  atributo_documento integer NOT NULL, -- Campo que contiene el identificador del atributo_documento
  documento integer NOT NULL, -- Campo que contiene el identificador del documento
  CONSTRAINT pk_valor_atributo PRIMARY KEY (id), -- Llave primaria de la tabla valor_atributo
  CONSTRAINT fk_valor_atributo_documento_atributo_documento FOREIGN KEY (atributo_documento)
      REFERENCES core.atributo_documento (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_valor_atributo_documento_documento FOREIGN KEY (documento)
      REFERENCES core.documento (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)


COMMENT ON TABLE core.valor_atributo_documento IS 'Contiene los valores de los atributos del documento';
COMMENT ON COLUMN core.valor_atributo_documento.id IS 'Identificador de la tabla valor_atributo_documento';
COMMENT ON COLUMN core.valor_atributo_documento.valor_atributo IS 'Valor del atributo del documento';
COMMENT ON COLUMN core.valor_atributo_documento.atributo_documento IS 'Campo que contiene el identificador del atributo_documento';
COMMENT ON COLUMN core.valor_atributo_documento.documento IS 'Campo que contiene el identificador del documento';
COMMENT ON CONSTRAINT pk_valor_atributo ON core.valor_atributo_documento IS 'Llave primaria de la tabla valor_atributo';




CREATE TABLE core.atributo_documento
(
  id serial NOT NULL, -- Identificador de atributos_documento
  nombre character varying(50) NOT NULL, -- Nombre del atributo del documento
  descripcion character varying(250), -- Descripción opcional del parámetro
  codigo_abreviacion character varying(20), -- Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere.
  activo boolean NOT NULL, -- Estado del atributo
  numero_orden numeric(5,2), -- Establece un orden a los registros que no se encuentre definido por aplicación ni por BD. Allí se almacena permitiendo realizar subitems mediante la precisión.
  CONSTRAINT pk_atributo_documento PRIMARY KEY (id) -- Llave primaria de la tabla atributos_documento
)

COMMENT ON TABLE core.atributo_documento IS 'Tabla que tiene la metadata del documento';
COMMENT ON COLUMN core.atributo_documento.id IS 'Identificador de atributos_documento';
COMMENT ON COLUMN core.atributo_documento.nombre IS 'Nombre del atributo del documento';
COMMENT ON COLUMN core.atributo_documento.descripcion IS 'Descripción opcional del parámetro';
COMMENT ON COLUMN core.atributo_documento.codigo_abreviacion IS 'Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere. ';
COMMENT ON COLUMN core.atributo_documento.activo IS 'Estado del atributo';
COMMENT ON COLUMN core.atributo_documento.numero_orden IS 'Establece un orden a los registros que no se encuentre definido por aplicación ni por BD. Allí se almacena permitiendo realizar subitems mediante la precisión. ';

COMMENT ON CONSTRAINT pk_atributo_documento ON core.atributo_documento IS 'Llave primaria de la tabla atributos_documento';

