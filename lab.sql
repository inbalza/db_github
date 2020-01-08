CREATE TABLE trainings (	subject VARCHAR(10) NOT NULL, 
				duration INT(11), 
				PRIMARY KEY (subject));

CREATE TABLE lab_members (	id INT(11) NOT NULL,
				name VARCHAR(10), 
				lastname VARCHAR(10), 
				birth_date DATETIME, 
				training VARCHAR(10), 
				PRIMARY KEY (id),
				FOREIGN KEY (training)
				REFERENCES trainings(subject));

CREATE TABLE equipment (	name VARCHAR(16),
				manufacturer VARCHAR(45),
				purchase_date DATETIME,
				PRIMARY KEY (name));

CREATE TABLE experiments (	name VARCHAR(16) NOT NULL,
				performed_by_id INT(11), 
				equipment_used VARCHAR(16), 
				date DATETIME,
				PRIMARY KEY (name),
				FOREIGN KEY (performed_by_id) REFERENCES lab_members(id),
				FOREIGN KEY (equipment_used) REFERENCES equipment(name));

CREATE TABLE results ( 	experiment VARCHAR(16) NOT NULL,
			directory VARCHAR(45),
			status CHAR (1),
			comments VARCHAR(255),
			PRIMARY KEY (experiment),
			FOREIGN KEY (experiment) REFERENCES experiments(name));
			 
				

INSERT INTO trainings VALUES("biology","800");
INSERT INTO trainings VALUES("chemistry","1000");
INSERT INTO trainings VALUES("physics","1200");

INSERT INTO lab_members VALUES("1","luna", "zaltsman", "1995-01-01 00:00:00", "physics");
INSERT INTO lab_members VALUES("2","mickey", "mouse", "1985-10-15 00:00:00", "chemistry");
INSERT INTO lab_members VALUES("3","mini", "mouse", "1983-01-30 00:00:00", "chemistry");				
INSERT INTO lab_members VALUES("4","donald", "duck", "1990-01-01 00:00:00", "biology");

INSERT INTO equipment VALUES("NMR","Magritek","2000-01-01 00:00:00");
INSERT INTO equipment VALUES("MS","Aemas","2005-05-01 00:00:00");
INSERT INTO equipment VALUES("PCR","Agilent Technologies Inc","2010-10-10 00:00:00");

INSERT INTO experiments VALUES("EXP1","1","NMR","2019-01-01 00:00:00");
INSERT INTO experiments VALUES("EXP2","1","MS","2019-02-01 00:00:00");
INSERT INTO experiments VALUES("EXP3","2","MS","2019-03-01 00:00:00");
INSERT INTO experiments VALUES("EXP4","3","PCR","2019-04-01 00:00:00");
INSERT INTO experiments VALUES("EXP5","3","PCR","2019-05-01 00:00:00");
INSERT INTO experiments VALUES("EXP6","4","NMR","2019-05-01 00:00:00");

INSERT INTO results VALUES("EXP1","some location","F",NULL);
INSERT INTO results VALUES("EXP2","some location","F",NULL);
INSERT INTO results VALUES("EXP3","some location","S","Yay!");
INSERT INTO results VALUES("EXP4","some location","S",NULL);
INSERT INTO results VALUES("EXP5","some location","F","some comment");
INSERT INTO results VALUES("EXP6","some location","S",NULL);






