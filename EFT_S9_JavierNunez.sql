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


ALTER TABLE academia 
MODIFY nombre_academia VARCHAR(100);


INSERT INTO municipalidad (id_municipalidad, nombre_municipalidad, direccion_municipalidad)
VALUES (1, 'Municipalidad Viña del Mar', 'Arlegui 615, Viña del Mar'),
       (2, 'Municipalidad Independencia', 'Av. Independencia 753, Independencia'),
       (3, 'Municipalidad Las Condes', 'Apoquindo 3400, Las Condes');


INSERT INTO academia (id_academia, nombre_academia, direccion_academia, id_director, municipalidad_id_municipalidad, cantidad_profesores)
VALUES (1, 'Academia Danza', 'Calle A 111', 101, 1, 10),
       (2, 'Academia Canto', 'Calle B 222', 102, 2, 15),
       (3, 'Academia Intérprete de instrumentos musicales', 'Calle C 333', 103, 3, 12);


INSERT INTO curso (id_curso, nombre_curso, horario_curso, academia_id_academia)
VALUES (1, 'Curso Danza contemporánea', 'Lunes 10-12', 1),
       (2, 'Curso Ópera', 'Martes 14-16', 2),
       (3, 'Curso Guitarra', 'Miércoles 10-12', 3);


INSERT INTO profesor (id_profesor, nombre_profesor, tipo_contrato_profesor, curso_id_curso)
VALUES (1, 'Juan González', 'Planta', 1),
       (2, 'Viviana Pérez', 'Honorarios', 2),
       (3, 'Diego Reyes', 'Planta', 3);
       
SELECT * FROM municipalidad;
SELECT * FROM academia;
SELECT * FROM curso;
SELECT * FROM profesor;
       
