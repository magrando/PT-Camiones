/**********************************************************************************************************************/

create table if not exists USUARIO (

usu_email varchar (50) not null,
usu_tipo integer not null,
usu_contraseña varchar (20) not null,
usu_vigente boolean default true,
emp_rut varchar (10) default null,
constraint pk_usuario PRIMARY KEY (usu_email)
);

create table if not exists SERVICIO (

ser_codigo integer not null auto_increment,
ser_nombre varchar (50) not null,
ser_descripcion varchar (1000) default null,
constraint pk_servicio PRIMARY KEY (ser_codigo)
);

create table if not exists EMPRESA_PYME (

emp_rut varchar (10) not null,
emp_nombre varchar (100) not null,
emp_giro varchar (100) not null,
emp_telefono integer not null,
emp_direccion varchar (200) not null,
emp_email varchar (50) not null,
emp_descripcion varchar (1000) not null,
constraint pk_empresa PRIMARY KEY (emp_rut)
);

create table if not exists emp_contrata_serv (

emp_rut varchar (10) not null,
ser_codigo integer not null,
serv_fecha_ini datetime not null,
serv_fecha_fin datetime default null,
serv_vigente boolean default true,
constraint pk_contrata PRIMARY KEY (emp_rut, ser_codigo)
);

create table if not exists INFORME (

inf_codigo integer not null auto_increment,
emp_rut varchar (10) not null,
inf_ruta_dd varchar (150) not null,
inf_fecha_creacion datetime not null,
inf_tipo varchar (20) not null,
inf_observaciones varchar (1000) not null,
constraint pk_informe PRIMARY KEY (inf_codigo)
);

create table if not exists VEHICULO (

veh_patente varchar (7) not null,
emp_rut varchar (10) not null,
veh_tipo varchar (50) not null,
veh_marca varchar (50) not null,
veh_color varchar (20) not null,
veh_fecha_compra date not null,
veh_km_compra integer not null,
veh_valor_compra integer default null,
veh_max_carga integer default null,
veh_observaciones varchar (1000) default null,
veh_carter integer default null,
veh_caja integer default null,
veh_diferencial integer default null,
veh_num_motor integer default null,
veh_num_chasis integer default null,
veh_num_ejes integer default null,
veh_imagen varchar (200) default null,
veh_gps_cod integer default null,
constraint pk_vehiculo PRIMARY KEY (veh_patente)
);

create table if not exists CARRO (

car_patente varchar (7) not null,
emp_rut varchar (10) not null,
car_marca varchar (50) not null,
car_num_ejes integer not null,
car_tipo varchar (50) not null,
car_fecha_compra date not null,
car_valor_compra integer default null,
car_observacion varchar (1000) default null,
car_imagen varchar (200) default null,
constraint pk_carro PRIMARY KEY (car_patente)
);

create table if not exists NEUMATICO (

neu_serie varchar (20) not null,
emp_rut varchar (10) not null,
neu_marca varchar (100) not null,
neu_valor_compra integer not null,
neu_fecha_compra date not null,
neu_ancho integer default null,
neu_altura integer default null,
neu_diametro integer default null,
neu_km_acumulados integer default null,
neu_observaciones varchar (1000) default null,
neu_imagen varchar (200) default null,
constraint pk_neumatico PRIMARY KEY (neu_serie)
);

create table if not exists CHOFER (

cho_rut varchar (10) not null,
cho_num_licencia varchar (10) not null,
cho_primer_nombre varchar (100) not null,
cho_segundo_nombre varchar (100) not null,
cho_apell_paterno varchar (100) not null,
cho_apell_materno varchar (100) not null,
cho_fecha_nac date not null,
cho_direccion varchar (200) not null,
cho_telefono integer not null,
cho_email varchar (50) default null,
cho_imagen varchar (200) default null,
cho_sueldo integer default null,
constraint pk_chofer PRIMARY KEY (cho_rut)
);


create table if not exists COMISION (

com_codigo integer not null auto_increment,
com_porcentaje integer not null,
constraint pk_comision PRIMARY KEY (com_codigo)
);

create table if not exists chof_comision (

com_codigo integer not null,
cho_rut varchar (10) not null,
fecha_ini datetime not null,
fecha_fin datetime default null,
com_vigente boolean default true,
constraint pk_chof_comidion PRIMARY KEY (com_codigo, cho_rut)
);

create table if not exists emp_contrata_cho (

emp_rut varchar (10) not null,
cho_rut varchar (10) not null,
contr_fecha_ini date not null,
contr_fecha_fin date default null,
contr_vigente boolean default true,
constraint pk_contrata_cho PRIMARY KEY (emp_rut, cho_rut)
);

create table if not exists uni_veh_car (

veh_patente varchar (7) not null,
car_patente varchar (7) not null,
fecha_ini date not null,
fecha_fin date default null,
vigente boolean default true,
constraint pk_uni_veh_car PRIMARY KEY (veh_patente, car_patente)
);

create table if not exists uni_veh_neu (

veh_patente varchar (7) not null,
neu_serie varchar (20) not null,
fecha_ini_ date not null,
fecha_fin date default null,
posicion varchar (20) not null,
vigente boolean default true,
constraint pk_uni_veh_neu PRIMARY KEY (veh_patente, neu_serie)
);

create table if not exists uni_veh_cho (

veh_patente varchar (7) not null,
cho_rut varchar (10) not null,
fecha_ini date not null,
fecha_fin date default null,
vigente boolean default true,
constraint pk_uni_veh_cho PRIMARY KEY (veh_patente, cho_rut)
);


create table if not exists PROVEEDOR (

pro_rut varchar (10) not null,
emp_rut varchar (10) not null,
pro_nombre varchar (100) not null,
pro_giro varchar (100) default null,
pro_direccion varchar (200) not null,
pro_telefono integer not null,
pro_email varchar (50) default null,
pro_observaciones varchar (1000) default null,
constraint pk_proveedor PRIMARY KEY (pro_rut)
);

create table if not exists CARGA_COMBUSTIBLE (

ccm_codigo integer not null auto_increment,
ccm_contador integer not null,
veh_patente varchar (7) not null,
pro_rut varchar (10) default null,
ccm_kilometraje integer not null,
ccm_valor integer not null,
ccm_litros integer not null,
ccm_fecha_hora datetime not null,
ccm_tipo_doc varchar (30) not null,
ccm_num_doc integer not null,
ccm_observaciones varchar (1000) default null,
constraint pk_carga_combustible PRIMARY KEY (ccm_codigo)
);

create table if not exists MANTENCION (

man_codigo integer not null auto_increment,
man_contador integer not null,
veh_patente varchar (7) not null,
pro_rut varchar (10) default null,
man_kilometraje integer not null,
man_valor integer not null,
man_fecha_hora datetime not null,
man_tipo varchar (50) not null,
man_observacion varchar (1000) not null,
constraint pk_mantencion PRIMARY KEY (man_codigo)
);

create table if not exists INFORME_GPS (

infgps_codigo integer not null auto_increment,
veh_patente varchar (7) not null,
infgps_fecha datetime not null,
infgps_ruta_dd varchar (150) not null,
infgps_descripcion varchar (1000) not null,
constraint pk_informe_gps PRIMARY KEY (infgps_codigo)
);

create table if not exists CLIENTE (

cli_rut varchar (10) not null,
emp_rut varchar (10) not null,
cli_nombre varchar (200) not null,
cli_direccion varchar (200) not null,
cli_giro varchar (100) default null,
cli_rubro varchar (100) default null,
cli_telefono integer not null,
cli_email varchar (50) default null,
cli_observacion varchar (1000) default null,
constraint pk_cliente PRIMARY KEY (cli_rut)
);

create table if not exists PROGRAMA_VIAJE (

prv_codigo integer not null auto_increment,
prv_contador integer not null,
emp_rut varchar (10) not null,
cli_rut varchar (10) default null,
rta_codigo integer default null,
prv_valor integer not null,
prv_fecha_prog datetime not null,
prv_fecha_viaje datetime not null,
prv_observaciones varchar (1000) default null,
constraint pk_programa_viaje PRIMARY KEY (prv_codigo)
);

create table if not exists RUTA (

rta_codigo integer not null auto_increment,
emp_rut varchar (10) not null,
rta_nombre varchar (100) not null,
rta_kilometros_pav integer not null,
rta_kilometros_tierra integer not null,
rta_inicio varchar (150) not null,
rta_fin varchar (150) not null,
rta_observaciones varchar (1000) default null,
constraint pk_ruta PRIMARY KEY (rta_codigo)
);

create table if not exists VIAJE_EFECTUADO (

vef_codigo integer not null auto_increment,
vef_contador integer not null,
emp_rut varchar (10) not null,
rta_codigo integer not null,
veh_patente varchar (7) not null,
vef_valor_serv integer not null,
vef_comision_cho integer not null,
vef_gasto_peaje integer not null,
vef_gasto_otros integer not null,
vef_kilometraje_sal integer not null,
vef_kilometraje_lleg integer not null,
vef_fecha_sal datetime not null,
vef_fecha_lleg datetime not null,
vef_observaciones varchar (1000) not null,
constraint pk_viaje_efectuado PRIMARY KEY (vef_codigo)
);

create table if not exists GUIA_DE_DESPACHO (

guia_codigo integer not null auto_increment,
guia_numero integer not null,
guia_espec_carga varchar (2000) not null,
cli_rut varchar (7) not null,
vef_codigo integer not null,
constraint pk_guia_de_despacho PRIMARY KEY (guia_codigo)
);

create table if not exists EVENTO_VIAJE (

eve_codigo integer not null auto_increment,
vef_codigo integer not null,
eve_fecha datetime not null,
eve_kilometraje integer default null,
eve_descripcion varchar (2000) not null,
constraint pk_evento_viaje PRIMARY KEY (eve_codigo)
);


/******************************************************************************************************************/

alter table USUARIO add constraint fk_empresa_usuario FOREIGN KEY (emp_rut) REFERENCES EMPRESA_PYME (emp_rut);

alter table emp_contrata_serv add constraint fk_empresa_contrata FOREIGN KEY (emp_rut) REFERENCES EMPRESA_PYME (emp_rut);

alter table emp_contrata_serv add constraint fk_servicio_contrata FOREIGN KEY (ser_codigo) REFERENCES SERVICIO (ser_codigo);

alter table INFORME add constraint fk_empresa_informe FOREIGN KEY (emp_rut) REFERENCES EMPRESA_PYME (emp_rut);

alter table VEHICULO add constraint fk_empresa_vehiculo FOREIGN KEY (emp_rut) REFERENCES EMPRESA_PYME (emp_rut);

alter table CARRO add constraint fk_empresa_carro FOREIGN KEY (emp_rut) REFERENCES EMPRESA_PYME (emp_rut);

alter table NEUMATICO add constraint fk_empresa_neumatico FOREIGN KEY (emp_rut) REFERENCES EMPRESA_PYME (emp_rut);

alter table uni_veh_car add constraint fk_carro_union_vehiculo FOREIGN KEY (car_patente) REFERENCES CARRO (car_patente);

alter table uni_veh_car add constraint fk_vehiculo_union_carro FOREIGN KEY (veh_patente) REFERENCES VEHICULO (veh_patente);

alter table uni_veh_neu add constraint fk_neumatico_union_vehiculo FOREIGN KEY (neu_serie) REFERENCES NEUMATICO (neu_serie);

alter table uni_veh_neu add constraint fk_vehiculo_union_neumatico FOREIGN KEY (veh_patente) REFERENCES VEHICULO (veh_patente);

alter table uni_veh_cho add constraint fk_chofer_union_vehiculo FOREIGN KEY (cho_rut) REFERENCES CHOFER (cho_rut);

alter table uni_veh_cho add constraint fk_vehiculo_union_chofer FOREIGN KEY (veh_patente) REFERENCES VEHICULO (veh_patente);

alter table emp_contrata_cho add constraint fk_empresa_contrata_chof FOREIGN KEY (emp_rut) REFERENCES EMPRESA_PYME (emp_rut);

alter table emp_contrata_cho add constraint fk_chofer_contratado FOREIGN KEY (cho_rut) REFERENCES CHOFER (cho_rut);

alter table PROVEEDOR add constraint fk_empresa_proveedor FOREIGN KEY (emp_rut) REFERENCES EMPRESA_PYME (emp_rut);

alter table CARGA_COMBUSTIBLE add constraint fk_proveedor_comb FOREIGN KEY (pro_rut) REFERENCES PROVEEDOR (pro_rut);

alter table CARGA_COMBUSTIBLE add constraint fk_vehiculo_comb FOREIGN KEY (veh_patente) REFERENCES VEHICULO (veh_patente);

alter table MANTENCION add constraint fk_proveedor_mant FOREIGN KEY (pro_rut) REFERENCES PROVEEDOR (pro_rut);

alter table MANTENCION add constraint fk_vehiculo_mant FOREIGN KEY (veh_patente) REFERENCES VEHICULO (veh_patente);

alter table INFORME_GPS add constraint fk_vehiculo_gps FOREIGN KEY (veh_patente) REFERENCES VEHICULO (veh_patente);

alter table chof_comision add constraint fk_chofer_com FOREIGN KEY (cho_rut) REFERENCES CHOFER (cho_rut);

alter table chof_comision add constraint fk_comision_com FOREIGN KEY (com_codigo) REFERENCES COMISION (com_codigo);

alter table CLIENTE add constraint fk_empresa_cliente FOREIGN KEY (emp_rut) REFERENCES EMPRESA_PYME (emp_rut);

alter table PROGRAMA_VIAJE add constraint fk_empresa_programa FOREIGN KEY (emp_rut) REFERENCES EMPRESA_PYME (emp_rut);

alter table PROGRAMA_VIAJE add constraint fk_cliente_programa FOREIGN KEY (cli_rut) REFERENCES CLIENTE (cli_rut);

alter table PROGRAMA_VIAJE add constraint fk_ruta_programa FOREIGN KEY (rta_codigo) REFERENCES RUTA (rta_codigo);

alter table RUTA add constraint fk_enpresa_ruta FOREIGN KEY (emp_rut) REFERENCES EMPRESA_PYME (emp_rut);

alter table VIAJE_EFECTUADO add constraint fk_empresa_viaje FOREIGN KEY (emp_rut) REFERENCES EMPRESA_PYME (emp_rut);

alter table VIAJE_EFECTUADO add constraint fk_vehiculo_viaje FOREIGN KEY (veh_patente) REFERENCES VEHICULO (veh_patente);

alter table VIAJE_EFECTUADO add constraint fk_ruta_viaje FOREIGN KEY (rta_codigo) REFERENCES RUTA (rta_codigo);

alter table EVENTO_VIAJE add constraint fk_viaje_evento FOREIGN KEY (vef_codigo) REFERENCES VIAJE_EFECTUADO (vef_codigo);

alter table GUIA_DE_DESPACHO add constraint fk_cliente_guia FOREIGN KEY (cli_rut) REFERENCES CLIENTE (cli_rut);

alter table GUIA_DE_DESPACHO add constraint fk_viaje_guia FOREIGN KEY (vef_codigo) REFERENCES VIAJE_EFECTUADO (vef_codigo); 









