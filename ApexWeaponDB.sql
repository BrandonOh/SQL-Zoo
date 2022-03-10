CREATE DATABASE db_apex_gun

USE db_apex_gun
GO

CREATE TABLE tbl_mods (
	mod_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	mod_name VARCHAR(50) NOT NULL,
	mod_rarity VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_gun (
	gun_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	gun_name VARCHAR(50) NOT NULL,
	ammo_type VARCHAR(50) NOT NULL,
	equipable_mod INT NOT NULL CONSTRAINT fk_mod_id FOREIGN KEY REFERENCES tbl_mods(mod_id) ON UPDATE CASCADE ON DELETE CASCADE
);

SELECT * FROM tbl_mods;
SELECT * FROM tbl_gun;

INSERT INTO tbl_mods (mod_name,mod_rarity)
VALUES
	('Turbocharger','Gold'),
	('Hammerpoint Rounds','Purple'),
	('Shatter Caps','Purple'),
	('Anvil Reeiver', 'Gold'),
	('Duel Shell', 'Purple')
;

INSERT INTO tbl_gun (gun_name,ammo_type,equipable_mod)
VALUES
	('VK-47 Flatline','Heavy', 4),
	('Bocek Compound Bow','Arrow', 3),
	('Mastiff','Shotgun', 5),
	('Devotion LMG','Energy', 1),
	('Mozambique','Shotgun', 2)
;	

Select a1.gun_name AS 'Name:', a2.mod_name AS 'Mod Name:', a2.mod_rarity AS 'Rarity:'
FROM
	tbl_gun a1 
	INNER JOIN tbl_mods a2 ON a2.mod_id = a1.equipable_mod
WHERE
	a1.ammo_type = 'Shotgun';