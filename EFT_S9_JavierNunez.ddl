-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-10-06 13:30:02 CLST
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE academia (
    id_academia                    NUMBER(10) NOT NULL,
    nombre_academia                VARCHAR2(30) NOT NULL,
    direccion_academia             VARCHAR2(100) NOT NULL,
    id_director                    NUMBER(10) NOT NULL,
    municipalidad_id_municipalidad NUMBER(10) NOT NULL,
    cantidad_profesores            NUMBER NOT NULL
);

ALTER TABLE academia ADD CONSTRAINT academia_pk PRIMARY KEY ( id_academia );

CREATE TABLE curso (
    id_curso             NUMBER(10) NOT NULL,
    nombre_curso         VARCHAR2(30) NOT NULL,
    horario_curso        VARCHAR2(20) NOT NULL,
    academia_id_academia NUMBER(10) NOT NULL
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( id_curso );

CREATE TABLE municipalidad (
    id_municipalidad        NUMBER(10) NOT NULL,
    nombre_municipalidad    VARCHAR2(100) NOT NULL,
    direccion_municipalidad VARCHAR2(100) NOT NULL
);

ALTER TABLE municipalidad ADD CONSTRAINT municipalidad_pk PRIMARY KEY ( id_municipalidad );

CREATE TABLE profesor (
    id_profesor            NUMBER(10) NOT NULL,
    nombre_profesor        VARCHAR2(100) NOT NULL,
    tipo_contrato_profesor VARCHAR2(20) NOT NULL,
    curso_id_curso         NUMBER(10) NOT NULL
);

CREATE UNIQUE INDEX profesor__idx ON
    profesor (
        curso_id_curso
    ASC );

ALTER TABLE profesor ADD CONSTRAINT profesor_pk PRIMARY KEY ( id_profesor );

CREATE TABLE relation_5 (
    profesor_id_profesor NUMBER(10) NOT NULL,
    academia_id_academia NUMBER(10) NOT NULL
);

ALTER TABLE relation_5 ADD CONSTRAINT relation_5_pk PRIMARY KEY ( profesor_id_profesor,
                                                                  academia_id_academia );

ALTER TABLE academia
    ADD CONSTRAINT academia_municipalidad_fk FOREIGN KEY ( municipalidad_id_municipalidad )
        REFERENCES municipalidad ( id_municipalidad );

ALTER TABLE curso
    ADD CONSTRAINT curso_academia_fk FOREIGN KEY ( academia_id_academia )
        REFERENCES academia ( id_academia );

ALTER TABLE profesor
    ADD CONSTRAINT profesor_curso_fk FOREIGN KEY ( curso_id_curso )
        REFERENCES curso ( id_curso );

ALTER TABLE relation_5
    ADD CONSTRAINT relation_5_academia_fk FOREIGN KEY ( academia_id_academia )
        REFERENCES academia ( id_academia );

ALTER TABLE relation_5
    ADD CONSTRAINT relation_5_profesor_fk FOREIGN KEY ( profesor_id_profesor )
        REFERENCES profesor ( id_profesor );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             1
-- ALTER TABLE                             10
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
