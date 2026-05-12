/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     12/05/2026 02:17:33 a. m.                    */
/*==============================================================*/


drop index EQUIPO_PK;

drop table EQUIPO cascade;

drop index TIENE_FK;

drop index GOLES_PK;

drop table GOLES cascade;

drop index JUEGA_FK;

drop index JUEGA2_FK;

drop index JUEGA_PK;

drop table JUEGA cascade;

drop index PERTENECE_FK;

drop index JUGADOR_PK;

drop table JUGADOR cascade;

drop index PARTIDO_PK;

drop table PARTIDO cascade;

drop index DIRIGE2_FK;

drop index PRESIDENTE_PK;

drop table PRESIDENTE cascade;

/*==============================================================*/
/* Table: EQUIPO                                                */
/*==============================================================*/
create table EQUIPO (
   CODIGOEQUIPO         INT4                 not null,
   NOMBREEQUIPO         VARCHAR(100)         null,
   NOMBREESTADIO        VARCHAR(120)         null,
   AFORO                INT4                 null,
   ANIOFUNDACION        INT4                 null,
   CIUDAD               VARCHAR(80)          null,
   constraint PK_EQUIPO primary key (CODIGOEQUIPO)
);

/*==============================================================*/
/* Index: EQUIPO_PK                                             */
/*==============================================================*/
create unique index EQUIPO_PK on EQUIPO (
CODIGOEQUIPO
);

/*==============================================================*/
/* Table: GOLES                                                 */
/*==============================================================*/
create table GOLES (
   CODIGOGOL            INT4                 not null,
   CODIGOPARTIDO        INT4                 not null,
   MINUTOGOL            INT4                 null,
   DESCRIPCIONGOL       TEXT                 null,
   constraint PK_GOLES primary key (CODIGOGOL)
);

/*==============================================================*/
/* Index: GOLES_PK                                              */
/*==============================================================*/
create unique index GOLES_PK on GOLES (
CODIGOGOL
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create  index TIENE_FK on GOLES (
CODIGOPARTIDO
);

/*==============================================================*/
/* Table: JUEGA                                                 */
/*==============================================================*/
create table JUEGA (
   CODIGOPARTIDO        INT4                 not null,
   CODIGOEQUIPO         INT4                 not null,
   constraint PK_JUEGA primary key (CODIGOPARTIDO, CODIGOEQUIPO)
);

/*==============================================================*/
/* Index: JUEGA_PK                                              */
/*==============================================================*/
create unique index JUEGA_PK on JUEGA (
CODIGOPARTIDO,
CODIGOEQUIPO
);

/*==============================================================*/
/* Index: JUEGA2_FK                                             */
/*==============================================================*/
create  index JUEGA2_FK on JUEGA (
CODIGOEQUIPO
);

/*==============================================================*/
/* Index: JUEGA_FK                                              */
/*==============================================================*/
create  index JUEGA_FK on JUEGA (
CODIGOPARTIDO
);

/*==============================================================*/
/* Table: JUGADOR                                               */
/*==============================================================*/
create table JUGADOR (
   CODIGOJUGADOR        INT4                 not null,
   CODIGOEQUIPO         INT4                 not null,
   NOMBREJUGADOR        VARCHAR(100)         null,
   FECHANACIMIENTOJUGADOR DATE                 null,
   POSICION             VARCHAR(50)          null,
   constraint PK_JUGADOR primary key (CODIGOJUGADOR)
);

/*==============================================================*/
/* Index: JUGADOR_PK                                            */
/*==============================================================*/
create unique index JUGADOR_PK on JUGADOR (
CODIGOJUGADOR
);

/*==============================================================*/
/* Index: PERTENECE_FK                                          */
/*==============================================================*/
create  index PERTENECE_FK on JUGADOR (
CODIGOEQUIPO
);

/*==============================================================*/
/* Table: PARTIDO                                               */
/*==============================================================*/
create table PARTIDO (
   CODIGOPARTIDO        INT4                 not null,
   FECHAPARTIDO         DATE                 null,
   GOLESVISITA          INT4                 null,
   GOLESCASA            INT4                 null,
   constraint PK_PARTIDO primary key (CODIGOPARTIDO)
);

/*==============================================================*/
/* Index: PARTIDO_PK                                            */
/*==============================================================*/
create unique index PARTIDO_PK on PARTIDO (
CODIGOPARTIDO
);

/*==============================================================*/
/* Table: PRESIDENTE                                            */
/*==============================================================*/
create table PRESIDENTE (
   DNI                  VARCHAR(10)          not null,
   CODIGOEQUIPO         INT4                 not null,
   NOMBREPRESIDENTE     VARCHAR(100)         null,
   APELLIDOSPRESIDENTE  VARCHAR(120)         null,
   FECHANACIMIENTOPRESIDENTE DATE                 null,
   EQUIPOPRESIDENTE     VARCHAR(100)         null,
   ANIOELECCION         INT4                 null,
   constraint PK_PRESIDENTE primary key (DNI)
);

/*==============================================================*/
/* Index: PRESIDENTE_PK                                         */
/*==============================================================*/
create unique index PRESIDENTE_PK on PRESIDENTE (
DNI
);

/*==============================================================*/
/* Index: DIRIGE2_FK                                            */
/*==============================================================*/
create  index DIRIGE2_FK on PRESIDENTE (
CODIGOEQUIPO
);

alter table GOLES
   add constraint FK_GOLES_TIENE_PARTIDO foreign key (CODIGOPARTIDO)
      references PARTIDO (CODIGOPARTIDO)
      on delete restrict on update restrict;

alter table JUEGA
   add constraint FK_JUEGA_JUEGA_PARTIDO foreign key (CODIGOPARTIDO)
      references PARTIDO (CODIGOPARTIDO)
      on delete restrict on update restrict;

alter table JUEGA
   add constraint FK_JUEGA_JUEGA2_EQUIPO foreign key (CODIGOEQUIPO)
      references EQUIPO (CODIGOEQUIPO)
      on delete restrict on update restrict;

alter table JUGADOR
   add constraint FK_JUGADOR_PERTENECE_EQUIPO foreign key (CODIGOEQUIPO)
      references EQUIPO (CODIGOEQUIPO)
      on delete restrict on update restrict;

alter table PRESIDENTE
   add constraint FK_PRESIDEN_DIRIGE_EQUIPO foreign key (CODIGOEQUIPO)
      references EQUIPO (CODIGOEQUIPO)
      on delete restrict on update restrict;

