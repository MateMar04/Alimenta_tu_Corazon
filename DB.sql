DROP DATABASE IF EXISTS Alimenta_tu_Corazon;
CREATE DATABASE IF NOT EXISTS Alimenta_tu_Corazon;
USE Alimenta_tu_Corazon;

CREATE TABLE NACIONALIDADES
(
    ID          INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE      VARCHAR(30),
    DESCRIPCION TEXT
);

CREATE TABLE SEXOS
(
    ID          INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE      VARCHAR(30),
    DESCRIPCION TEXT
);

CREATE TABLE TALLERES
(
    ID          INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE      VARCHAR(30),
    DESCRIPCION TEXT
);

CREATE TABLE DOMICILIOS
(
    ID     INT AUTO_INCREMENT PRIMARY KEY,
    CALLE  VARCHAR(30),
    NUMERO INT
);

CREATE TABLE SITUACIONES_LABORALES
(
    ID          INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE      VARCHAR(30),
    DESCRIPCION TEXT
);

CREATE TABLE SITUACIONES_FAMILIARES
(
    ID          INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE      VARCHAR(30),
    DESCRIPCION TEXT
);

CREATE TABLE NIVELES_POBREZA
(
    ID          INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE      VARCHAR(30),
    DESCRIPCION TEXT
);

CREATE TABLE ESTADOS_SALUD
(
    ID          INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE      VARCHAR(30),
    DESCRIPCION TEXT
);

CREATE TABLE DISPONIBILIDAD_RECURSOS
(
    ID          INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE      VARCHAR(30),
    DESCRIPCION TEXT
);

CREATE TABLE ROLES
(
    ID          INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE      VARCHAR(30),
    DESCRIPCION TEXT
);

CREATE TABLE VOLUNTARIOS
(
    ID       INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE   VARCHAR(30),
    APELLIDO VARCHAR(30),
    ID_ROL   INT,
    CONSTRAINT `VOLUNTARIO->ROL` FOREIGN KEY (ID_ROL) REFERENCES ROLES (ID)
);

CREATE TABLE INGREDIENTES
(
    ID          INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE      VARCHAR(30),
    DESCRIPCION TEXT
);

CREATE TABLE COMIDAS
(
    ID          INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE      VARCHAR(30),
    DESCRIPCION TEXT
);

CREATE TABLE COMIDAS_INGREDIENTES
(
    ID             INT AUTO_INCREMENT PRIMARY KEY,
    ID_COMIDA      INT,
    ID_INGREDIENTE INT,
    CONSTRAINT `COMIDAS_INGREDIENTES->MENU` FOREIGN KEY (ID_COMIDA) REFERENCES COMIDAS (ID),
    CONSTRAINT `COMIDAS_INGREDIENTES->INGREDIENTE` FOREIGN KEY (ID_INGREDIENTE) REFERENCES INGREDIENTES (ID)
);

CREATE TABLE MONEDAS
(
    ID          INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE      VARCHAR(30),
    DESCRIPCION TEXT
);

CREATE TABLE DONACIONES
(
    ID        INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE    VARCHAR(30),
    APELLIDO  VARCHAR(30),
    FECHA     DATE,
    CANTIDAD  INT,
    ID_MONEDA INT,
    CONSTRAINT `DONACION->MONEDA` FOREIGN KEY (ID_MONEDA) REFERENCES MONEDAS (ID)
);

CREATE TABLE BENEFICIADOS
(
    ID                         INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE                     VARCHAR(30),
    APELLIDO                   VARCHAR(30),
    EDAD                       INT,
    ID_SEXO                    INT,
    ID_NACIONALIDAD            INT,
    ID_SITUACION_LABORAL       INT,
    NRO_HIJOS                  INT,
    INGRESOS                   INT,
    ID_DOMICILIO               INT,
    ID_NIVEL_POBREZA           INT,
    ID_ESTADO_SALUD            INT,
    ID_SITUACION_FAMILIAR      INT,
    ID_DISPONIBILIDAD_RECURSOS INT,
    CONSTRAINT `BENEFICIADO->SEXO` FOREIGN KEY (ID_SEXO) REFERENCES SEXOS (ID),
    CONSTRAINT `BENEFICIADO->NACIONALIDAD` FOREIGN KEY (ID_NACIONALIDAD) REFERENCES NACIONALIDADES (ID),
    CONSTRAINT `BENEFICIADO->SITUACION_LABORAL` FOREIGN KEY (ID_SITUACION_LABORAL) REFERENCES SITUACIONES_LABORALES (ID),
    CONSTRAINT `BENEFICIADO->DOMICILIO` FOREIGN KEY (ID_DOMICILIO) REFERENCES DOMICILIOS (ID),
    CONSTRAINT `BENEFICIADO->NIVEL_POBREZA` FOREIGN KEY (ID_NIVEL_POBREZA) REFERENCES NIVELES_POBREZA (ID),
    CONSTRAINT `BENEFICIADO->ESTADO_SALUD` FOREIGN KEY (ID_ESTADO_SALUD) REFERENCES ESTADOS_SALUD (ID),
    CONSTRAINT `BENEFICIADO->SITAUCION_FAMILIAR` FOREIGN KEY (ID_SITUACION_FAMILIAR) REFERENCES SITUACIONES_FAMILIARES (ID),
    CONSTRAINT `BENEFICIADO->DISPONIBILIDAD_RECURSOS` FOREIGN KEY (ID_DISPONIBILIDAD_RECURSOS) REFERENCES DISPONIBILIDAD_RECURSOS (ID)
);

INSERT INTO NACIONALIDADES (NOMBRE, DESCRIPCION)
VALUES ('Estados Unidos', 'País ubicado en América del Norte');
INSERT INTO NACIONALIDADES (NOMBRE, DESCRIPCION)
VALUES ('España', 'País ubicado en Europa');
INSERT INTO NACIONALIDADES (NOMBRE, DESCRIPCION)
VALUES ('Japón', 'País ubicado en Asia');
INSERT INTO NACIONALIDADES (NOMBRE, DESCRIPCION)
VALUES ('Brasil', 'País ubicado en América del Sur');
INSERT INTO NACIONALIDADES (NOMBRE, DESCRIPCION)
VALUES ('Sudáfrica', 'País ubicado en África');

INSERT INTO SEXOS (NOMBRE, DESCRIPCION)
VALUES ('Masculino', 'Identidad de género masculina');
INSERT INTO SEXOS (NOMBRE, DESCRIPCION)
VALUES ('Femenino', 'Identidad de género femenina');
INSERT INTO SEXOS (NOMBRE, DESCRIPCION)
VALUES ('No binario', 'Identidad de género que no se ajusta a las categorías masculina o femenina');
INSERT INTO SEXOS (NOMBRE, DESCRIPCION)
VALUES ('Intersexual', 'Persona que presenta características biológicas de ambos sexos');
INSERT INTO SEXOS (NOMBRE, DESCRIPCION)
VALUES ('Prefiero no decir', 'Opción para aquellas personas que no desean identificarse con un género en particular');

INSERT INTO TALLERES (NOMBRE, DESCRIPCION)
VALUES ('Taller de carpintería', 'Espacio donde se enseña y se practica el trabajo con madera');
INSERT INTO TALLERES (NOMBRE, DESCRIPCION)
VALUES ('Taller de costura', 'Espacio donde se enseña y se practica la confección de prendas de vestir');
INSERT INTO TALLERES (NOMBRE, DESCRIPCION)
VALUES ('Taller de mecánica', 'Espacio donde se enseña y se practica el mantenimiento y la reparación de vehículos');
INSERT INTO TALLERES (NOMBRE, DESCRIPCION)
VALUES ('Taller de cocina', 'Espacio donde se enseña y se practica la preparación de alimentos y la gastronomía');
INSERT INTO TALLERES (NOMBRE, DESCRIPCION)
VALUES ('Taller de pintura', 'Espacio donde se enseña y se practica la creación de obras de arte con pintura');

INSERT INTO DOMICILIOS (CALLE, NUMERO)
VALUES ('Calle 123', 456);
INSERT INTO DOMICILIOS (CALLE, NUMERO)
VALUES ('Avenida del Sol', 789);
INSERT INTO DOMICILIOS (CALLE, NUMERO)
VALUES ('Calle de la Luna', 321);
INSERT INTO DOMICILIOS (CALLE, NUMERO)
VALUES ('Boulevard de las Rosas', 555);
INSERT INTO DOMICILIOS (CALLE, NUMERO)
VALUES ('Calle del Mar', 888);

INSERT INTO SITUACIONES_LABORALES (NOMBRE, DESCRIPCION)
VALUES ('Empleado a tiempo completo', 'Persona que trabaja para una empresa y cumple un horario completo de trabajo');
INSERT INTO SITUACIONES_LABORALES (NOMBRE, DESCRIPCION)
VALUES ('Empleado a tiempo parcial', 'Persona que trabaja para una empresa pero cumple un horario reducido de trabajo');
INSERT INTO SITUACIONES_LABORALES (NOMBRE, DESCRIPCION)
VALUES ('Trabajador autónomo',
        'Persona que trabaja de manera independiente y no tiene relación de dependencia con una empresa');
INSERT INTO SITUACIONES_LABORALES (NOMBRE, DESCRIPCION)
VALUES ('Desempleado', 'Persona que no tiene trabajo y está en busca de empleo');
INSERT INTO SITUACIONES_LABORALES (NOMBRE, DESCRIPCION)
VALUES ('Estudiante', 'Persona que se dedica a estudiar y no tiene un empleo remunerado');

INSERT INTO SITUACIONES_FAMILIARES (NOMBRE, DESCRIPCION)
VALUES ('Soltero', 'Persona que no está casada ni convive en pareja');
INSERT INTO SITUACIONES_FAMILIARES (NOMBRE, DESCRIPCION)
VALUES ('Casado', 'Persona que está legalmente unida en matrimonio con otra');
INSERT INTO SITUACIONES_FAMILIARES (NOMBRE, DESCRIPCION)
VALUES ('Conviviente', 'Persona que convive en pareja sin estar casada legalmente');
INSERT INTO SITUACIONES_FAMILIARES (NOMBRE, DESCRIPCION)
VALUES ('Divorciado', 'Persona que ha terminado su matrimonio legalmente');
INSERT INTO SITUACIONES_FAMILIARES (NOMBRE, DESCRIPCION)
VALUES ('Viudo', 'Persona cónyuge que ha perdido a su pareja por fallecimiento');

INSERT INTO NIVELES_POBREZA (NOMBRE, DESCRIPCION)
VALUES ('Extrema Pobreza', 'Personas que viven con menos de 1.25 dólares al día');
INSERT INTO NIVELES_POBREZA (NOMBRE, DESCRIPCION)
VALUES ('Pobreza', 'Personas que viven con menos de 2 dólares al día');
INSERT INTO NIVELES_POBREZA (NOMBRE, DESCRIPCION)
VALUES ('Pobreza Moderada', 'Personas que viven con menos de 3.20 dólares al día');
INSERT INTO NIVELES_POBREZA (NOMBRE, DESCRIPCION)
VALUES ('Pobreza Severa', 'Personas que viven con menos de 1.90 dólares al día');
INSERT INTO NIVELES_POBREZA (NOMBRE, DESCRIPCION)
VALUES ('Vulnerabilidad Económica', 'Personas que viven con menos de 5 dólares al día');

INSERT INTO ESTADOS_SALUD (NOMBRE, DESCRIPCION)
VALUES ('Sano', 'Persona sin ninguna enfermedad o dolencia.');
INSERT INTO ESTADOS_SALUD (NOMBRE, DESCRIPCION)
VALUES ('Enfermo', 'Persona que presenta síntomas de una enfermedad o dolencia.');
INSERT INTO ESTADOS_SALUD (NOMBRE, DESCRIPCION)
VALUES ('Crítico', 'Persona que se encuentra en estado grave debido a una enfermedad o lesión.');
INSERT INTO ESTADOS_SALUD (NOMBRE, DESCRIPCION)
VALUES ('Recuperándose', 'Persona que ha sufrido una enfermedad o lesión y se encuentra en proceso de recuperación.');
INSERT INTO ESTADOS_SALUD (NOMBRE, DESCRIPCION)
VALUES ('Convaleciente', 'Persona que ha sufrido una enfermedad o lesión y se encuentra en período de convalecencia.');

INSERT INTO DISPONIBILIDAD_RECURSOS (NOMBRE, DESCRIPCION)
VALUES ('Disponible', 'El recurso está disponible para su uso.');
INSERT INTO DISPONIBILIDAD_RECURSOS (NOMBRE, DESCRIPCION)
VALUES ('En uso', 'El recurso está siendo utilizado por otro proceso o usuario.');
INSERT INTO DISPONIBILIDAD_RECURSOS (NOMBRE, DESCRIPCION)
VALUES ('Reservado', 'El recurso ha sido reservado para su uso futuro.');
INSERT INTO DISPONIBILIDAD_RECURSOS (NOMBRE, DESCRIPCION)
VALUES ('En mantenimiento', 'El recurso está siendo reparado o mantenido y no está disponible para su uso.');
INSERT INTO DISPONIBILIDAD_RECURSOS (NOMBRE, DESCRIPCION)
VALUES ('Fuera de servicio',
        'El recurso está fuera de servicio y no está disponible para su uso debido a un fallo o avería.');

INSERT INTO ROLES (NOMBRE, DESCRIPCION)
VALUES ('Administrador', 'Persona encargada de la gestión y administración de un sistema o aplicación.');
INSERT INTO ROLES (NOMBRE, DESCRIPCION)
VALUES ('Usuario', 'Persona que utiliza un sistema o aplicación para realizar tareas específicas.');
INSERT INTO ROLES (NOMBRE, DESCRIPCION)
VALUES ('Desarrollador', 'Persona encargada de diseñar y desarrollar software.');
INSERT INTO ROLES (NOMBRE, DESCRIPCION)
VALUES ('Analista',
        'Persona encargada de analizar y estudiar datos y sistemas para resolver problemas y mejorar procesos.');
INSERT INTO ROLES (NOMBRE, DESCRIPCION)
VALUES ('Tester',
        'Persona encargada de probar y verificar que el software funciona correctamente y cumple con los requisitos especificados.');

INSERT INTO VOLUNTARIOS (NOMBRE, APELLIDO, ID_ROL)
VALUES ('Maria', 'Garcia', 1);
INSERT INTO VOLUNTARIOS (NOMBRE, APELLIDO, ID_ROL)
VALUES ('Juan', 'Perez', 2);
INSERT INTO VOLUNTARIOS (NOMBRE, APELLIDO, ID_ROL)
VALUES ('Ana', 'Lopez', 3);
INSERT INTO VOLUNTARIOS (NOMBRE, APELLIDO, ID_ROL)
VALUES ('Luis', 'Rodriguez', 4);
INSERT INTO VOLUNTARIOS (NOMBRE, APELLIDO, ID_ROL)
VALUES ('Sofia', 'Gonzalez', 5);

INSERT INTO COMIDAS (NOMBRE, DESCRIPCION)
VALUES ('Pizza',
        'Plato italiano que consiste en una base de masa cubierta de salsa de tomate, queso y otros ingredientes.');
INSERT INTO COMIDAS (NOMBRE, DESCRIPCION)
VALUES ('Hamburguesa',
        'Sándwich de carne, generalmente de vacuno, que se sirve en un pan de hamburguesa con diversos aderezos y acompañamientos.');
INSERT INTO COMIDAS (NOMBRE, DESCRIPCION)
VALUES ('Ensalada', 'Plato frío que combina diferentes verduras, frutas, hortalizas, carnes, pescados o mariscos.');
INSERT INTO COMIDAS (NOMBRE, DESCRIPCION)
VALUES ('Pasta',
        'Plato italiano que consiste en diferentes tipos de masa elaboradas con harina, agua y huevo, acompañadas de diversas salsas y condimentos.');
INSERT INTO COMIDAS (NOMBRE, DESCRIPCION)
VALUES ('Sushi',
        'Plato japonés que consiste en arroz cocido y vinagrado combinado con otros ingredientes, como pescado o mariscos, algas, vegetales y condimentos.');

INSERT INTO INGREDIENTES (NOMBRE, DESCRIPCION)
VALUES ('Tomate', 'Fruto de la planta del mismo nombre que se utiliza como ingrediente en diferentes platos.');
INSERT INTO INGREDIENTES (NOMBRE, DESCRIPCION)
VALUES ('Carne de res', 'Carne procedente de vacas y toros que se utiliza como ingrediente en diferentes platos.');
INSERT INTO INGREDIENTES (NOMBRE, DESCRIPCION)
VALUES ('Arroz', 'Cereal que se utiliza como ingrediente principal en diferentes platos.');
INSERT INTO INGREDIENTES (NOMBRE, DESCRIPCION)
VALUES ('Cebolla', 'Planta cuyo bulbo se utiliza como ingrediente en diferentes platos.');
INSERT INTO INGREDIENTES (NOMBRE, DESCRIPCION)
VALUES ('Queso', 'Producto lácteo que se utiliza como ingrediente en diferentes platos.');



INSERT INTO COMIDAS_INGREDIENTES (ID_COMIDA, ID_INGREDIENTE)
VALUES (1, 2);
INSERT INTO COMIDAS_INGREDIENTES (ID_COMIDA, ID_INGREDIENTE)
VALUES (1, 4);
INSERT INTO COMIDAS_INGREDIENTES (ID_COMIDA, ID_INGREDIENTE)
VALUES (1, 5);
INSERT INTO COMIDAS_INGREDIENTES (ID_COMIDA, ID_INGREDIENTE)
VALUES (2, 1);
INSERT INTO COMIDAS_INGREDIENTES (ID_COMIDA, ID_INGREDIENTE)
VALUES (2, 4);

INSERT INTO MONEDAS (NOMBRE, DESCRIPCION)
VALUES ('Dólar', 'Moneda de curso legal de Estados Unidos.');
INSERT INTO MONEDAS (NOMBRE, DESCRIPCION)
VALUES ('Euro', 'Moneda utilizada por la mayoría de países de la Unión Europea.');
INSERT INTO MONEDAS (NOMBRE, DESCRIPCION)
VALUES ('Yen', 'Moneda de curso legal de Japón.');
INSERT INTO MONEDAS (NOMBRE, DESCRIPCION)
VALUES ('Libra esterlina', 'Moneda de curso legal del Reino Unido.');
INSERT INTO MONEDAS (NOMBRE, DESCRIPCION)
VALUES ('Peso mexicano', 'Moneda de curso legal de México.');

INSERT INTO DONACIONES (NOMBRE, APELLIDO, FECHA, CANTIDAD, ID_MONEDA)
VALUES ('Juan', 'Pérez', '2022-01-15', 500, 1);
INSERT INTO DONACIONES (NOMBRE, APELLIDO, FECHA, CANTIDAD, ID_MONEDA)
VALUES ('María', 'García', '2022-03-01', 1000, 2);
INSERT INTO DONACIONES (NOMBRE, APELLIDO, FECHA, CANTIDAD, ID_MONEDA)
VALUES ('Satoshi', 'Nakamoto', '2022-02-14', 50000, 3);
INSERT INTO DONACIONES (NOMBRE, APELLIDO, FECHA, CANTIDAD, ID_MONEDA)
VALUES ('Elizabeth', 'Windsor', '2022-05-10', 10000, 4);
INSERT INTO DONACIONES (NOMBRE, APELLIDO, FECHA, CANTIDAD, ID_MONEDA)
VALUES ('Carlos', 'Martínez', '2022-06-30', 15000, 5);

INSERT INTO BENEFICIADOS (NOMBRE, APELLIDO, EDAD, ID_SEXO, ID_NACIONALIDAD, ID_SITUACION_LABORAL, NRO_HIJOS, INGRESOS,
                          ID_DOMICILIO, ID_NIVEL_POBREZA, ID_ESTADO_SALUD, ID_SITUACION_FAMILIAR,
                          ID_DISPONIBILIDAD_RECURSOS)
VALUES ('Juan', 'Perez', 30, 1, 1, 2, 2, 500, 1, 3, 4, 2, 1);
INSERT INTO BENEFICIADOS (NOMBRE, APELLIDO, EDAD, ID_SEXO, ID_NACIONALIDAD, ID_SITUACION_LABORAL, NRO_HIJOS, INGRESOS,
                          ID_DOMICILIO, ID_NIVEL_POBREZA, ID_ESTADO_SALUD, ID_SITUACION_FAMILIAR,
                          ID_DISPONIBILIDAD_RECURSOS)
VALUES ('Maria', 'Garcia', 40, 2, 2, 1, 1, 800, 2, 2, 1, 1, 2);
INSERT INTO BENEFICIADOS (NOMBRE, APELLIDO, EDAD, ID_SEXO, ID_NACIONALIDAD, ID_SITUACION_LABORAL, NRO_HIJOS, INGRESOS,
                          ID_DOMICILIO, ID_NIVEL_POBREZA, ID_ESTADO_SALUD, ID_SITUACION_FAMILIAR,
                          ID_DISPONIBILIDAD_RECURSOS)
VALUES ('Pedro', 'Lopez', 25, 1, 1, 3, 0, 300, 3, 4, 3, 1, 3);
INSERT INTO BENEFICIADOS (NOMBRE, APELLIDO, EDAD, ID_SEXO, ID_NACIONALIDAD, ID_SITUACION_LABORAL, NRO_HIJOS, INGRESOS,
                          ID_DOMICILIO, ID_NIVEL_POBREZA, ID_ESTADO_SALUD, ID_SITUACION_FAMILIAR,
                          ID_DISPONIBILIDAD_RECURSOS)
VALUES ('Ana', 'Rodriguez', 55, 2, 1, 2, 3, 1200, 4, 2, 2, 3, 2);
INSERT INTO BENEFICIADOS (NOMBRE, APELLIDO, EDAD, ID_SEXO, ID_NACIONALIDAD, ID_SITUACION_LABORAL, NRO_HIJOS, INGRESOS,
                          ID_DOMICILIO, ID_NIVEL_POBREZA, ID_ESTADO_SALUD, ID_SITUACION_FAMILIAR,
                          ID_DISPONIBILIDAD_RECURSOS)
VALUES ('Sofia', 'Gutierrez', 50, 2, 2, 1, 1, 200, 2, 2, 1, 1, 2);