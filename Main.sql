/* Fernando Dominguez Garcia */
/* Base de datos Slay the Spire */
/* Creacion de la base de datos */
drop database if exists slaythespire;
create database slaythespire;
use slaythespire;

/* Creacion de las tablas */
drop table if exists play;
drop table if exists earn;
drop table if exists relic;
drop table if exists heroe;
drop table if exists card;


create table card(
    nameCard varchar(30) not null,
    rarityCard varchar(10) not null,
    typeCard varchar(10) not null,
    cost smallint(10) not null,
    descriptionCard varchar(150) not null,

    primary key(nameCard)

)ENGINE=InnoDB;

create table heroe(
    nameHeroe varchar(10) not null,
    hp smallint(5) not null,
    descriptionHeroe varchar(100) not null,

    primary key(nameHeroe)
)ENGINE=InnoDB;

create table relic(
    nameRelic varchar(30) not null,
    rarityRelic varchar(10) not null,
    DescriptionRelic varchar(100)not null,

    primary key(nameRelic)
)ENGINE=InnoDB;

create table earn(
    earn_nameHeroe varchar(10) not null,
    earn_nameRelic varchar(30) not null,

    primary key(earn_nameHeroe, earn_nameRelic),

    constraint fk_earn_Heroe
		foreign key (earn_nameHeroe)
		references Heroe (nameHeroe)
	on delete cascade on update cascade,

    constraint fk_earn_Relic
		foreign key (earn_nameRelic)
		references Relic (nameRelic)
	on delete cascade on update cascade
)ENGINE=InnoDB;

create table play(
    play_nameHeroe varchar(10) not null,
    play_nameCard varchar(30) not null,

    primary key(play_nameHeroe, play_nameCard),

    constraint fk_play_Heroe
		foreign key (play_nameHeroe)
		references Heroe (nameHeroe)
	on delete cascade on update cascade,

    constraint fk_play_Card
		foreign key (play_nameCard)
		references Card (nameCard)
	on delete cascade on update cascade
)ENGINE=InnoDB;
