INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');



INSERT INTO petPet (petname, owner, species, gender, birth, death)
VALUES ('Hammy','Diane','Hamster','M','2010-10-30',NULL);

INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');




INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Claws', '1997-08-03', 'accident', 'broke the rib');


UPDATE petPet
SET death = '2020-09-01'
WHERE petname = 'Puffball';


DELETE FROM petEvent WHERE petname IN (SELECT petname FROM petPet WHERE owner = 'Harold');
DELETE FROM petPet WHERE owner = 'Harold';

