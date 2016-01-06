alter table usuario add constraint fk_empresa_usuario FOREIGN KEY (emp_rut) REFERENCES empresa_pyme (emp_rut);

alter table emp_contrata_serv add constraint fk_empresa_contrata FOREIGN KEY (emp_rut) REFERENCES empresa_pyme (emp_rut);

alter table emp_contrata_serv add constraint fk_servicio_contrata FOREIGN KEY (ser_codigo) REFERENCES servicio (ser_codigo);

alter table informe add constraint fk_empresa_informe FOREIGN KEY (emp_rut) REFERENCES empresa_pyme (emp_rut);

alter table vehiculo add constraint fk_empresa_vehiculo FOREIGN KEY (emp_rut) REFERENCES empresa_pyme (emp_rut);

alter table CARRO add constraint fk_empresa_carro FOREIGN KEY (emp_rut) REFERENCES empresa_pyme (emp_rut);

alter table neumatico add constraint fk_empresa_neumatico FOREIGN KEY (emp_rut) REFERENCES empresa_pyme (emp_rut);

alter table uni_veh_car add constraint fk_carro_union_vehiculo FOREIGN KEY (car_patente) REFERENCES carro (car_patente);

alter table uni_veh_car add constraint fk_vehiculo_union_carro FOREIGN KEY (veh_patente) REFERENCES vehiculo (veh_patente);

alter table uni_veh_neu add constraint fk_neumatico_union_vehiculo FOREIGN KEY (neu_serie) REFERENCES neumatico (neu_serie);

alter table uni_veh_neu add constraint fk_vehiculo_union_neumatico FOREIGN KEY (veh_patente) REFERENCES vehiculo (veh_patente);

alter table uni_veh_cho add constraint fk_chofer_union_vehiculo FOREIGN KEY (cho_rut) REFERENCES chofer (cho_rut);

alter table uni_veh_cho add constraint fk_vehiculo_union_chofer FOREIGN KEY (veh_patente) REFERENCES vehiculo (veh_patente);

alter table emp_contrata_cho add constraint fk_empresa_contrata_chof FOREIGN KEY (emp_rut) REFERENCES empresa_pyme (emp_rut);

alter table emp_contrata_cho add constraint fk_chofer_contratado FOREIGN KEY (cho_rut) REFERENCES chofer (cho_rut);

alter table proveedor add constraint fk_empresa_proveedor FOREIGN KEY (emp_rut) REFERENCES empresa_pyme (emp_rut);

alter table carga_combustible add constraint fk_proveedor_comb FOREIGN KEY (pro_rut) REFERENCES proveedor (pro_rut);

alter table carga_combustible add constraint fk_vehiculo_comb FOREIGN KEY (veh_patente) REFERENCES vehiculo (veh_patente);

alter table mantencion add constraint fk_proveedor_mant FOREIGN KEY (pro_rut) REFERENCES proveedor (pro_rut);

alter table mantencion add constraint fk_vehiculo_mant FOREIGN KEY (veh_patente) REFERENCES vehiculo (veh_patente);

alter table informe_gps add constraint fk_vehiculo_gps FOREIGN KEY (veh_patente) REFERENCES vehiculo (veh_patente);

alter table chof_comision add constraint fk_chofer_com FOREIGN KEY (cho_rut) REFERENCES chofer (cho_rut);

alter table chof_comision add constraint fk_comision_com FOREIGN KEY (com_codigo) REFERENCES comision (com_codigo);

alter table cliente add constraint fk_empresa_cliente FOREIGN KEY (emp_rut) REFERENCES empresa_pyme (emp_rut);

alter table programa_viaje add constraint fk_empresa_programa FOREIGN KEY (emp_rut) REFERENCES empresa_pyme (emp_rut);

alter table programa_viaje add constraint fk_cliente_programa FOREIGN KEY (cli_rut) REFERENCES cliente (cli_rut);

alter table programa_viaje add constraint fk_ruta_programa FOREIGN KEY (rta_codigo) REFERENCES ruta (rta_codigo);

alter table ruta add constraint fk_enpresa_ruta FOREIGN KEY (emp_rut) REFERENCES empresa_pyme (emp_rut);

alter table viaje_efectuado add constraint fk_empresa_viaje FOREIGN KEY (emp_rut) REFERENCES empresa_pyme (emp_rut);

alter table viaje_efectuado add constraint fk_vehiculo_viaje FOREIGN KEY (veh_patente) REFERENCES vehiculo (veh_patente);

alter table viaje_efectuado add constraint fk_ruta_viaje FOREIGN KEY (rta_codigo) REFERENCES ruta (rta_codigo);

alter table evento_viaje add constraint fk_viaje_evento FOREIGN KEY (vef_codigo) REFERENCES viaje_efectuado (vef_codigo);

alter table guia_de_despacho add constraint fk_cliente_guia FOREIGN (cli_rut) REFERENCES cliente (cli_rut);

alter table guia_de_despacho add constraint fk_viaje_guia (vef_codigo) REFERENCES viaje_efectuado (vef_codigo); 