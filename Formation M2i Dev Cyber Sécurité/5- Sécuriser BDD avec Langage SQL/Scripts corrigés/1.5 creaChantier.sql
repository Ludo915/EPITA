CREATE DATABASE Chantier;
USE Chantier;


-- Creation des tables et contraintes

CREATE TABLE employe (
n_emp VARCHAR(4),
nom_emp VARCHAR(20), qualif_emp VARCHAR(12),
CONSTRAINT pk_emp PRIMARY KEY(n_emp));

CREATE TABLE chantier (
n_chantier VARCHAR(10),
nom_ch VARCHAR(10),
adresse_ch VARCHAR(15),
CONSTRAINT pk_chan PRIMARY KEY(n_chantier));

CREATE TABLE vehicule (
n_vehicule VARCHAR(10),
type_vehicule VARCHAR(1), 
kilometrage NUMERIC,
CONSTRAINT pk_vehi PRIMARY KEY(n_vehicule));

CREATE TABLE visite(
n_chantier VARCHAR(10), 
n_vehicule VARCHAR(10), date_jour DATE, 
kilometres NUMERIC, n_conducteur VARCHAR(4),
CONSTRAINT pk_visite PRIMARY KEY(n_chantier,n_vehicule,date_jour),
CONSTRAINT fk_depl_chantier  FOREIGN KEY(n_chantier) REFERENCES chantier(n_chantier),
CONSTRAINT fk_depl_vehicule  FOREIGN KEY(n_vehicule) REFERENCES vehicule(n_vehicule),
CONSTRAINT fk_depl_employe   FOREIGN KEY(n_conducteur) REFERENCES employe(n_emp));

CREATE TABLE transporter (
n_chantier VARCHAR(10), 
n_vehicule VARCHAR(10), 
date_jour DATE,
n_transporte VARCHAR(4), CONSTRAINT pk_transporter PRIMARY KEY(n_chantier,n_vehicule,date_jour,n_transporte),
CONSTRAINT  fk_transp_visite FOREIGN KEY(n_chantier,n_vehicule,date_jour) REFERENCES visite(n_chantier,n_vehicule,date_jour),
CONSTRAINT fk_transp_employe FOREIGN KEY(n_transporte) REFERENCES employe(n_emp));