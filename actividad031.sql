CREATE DATABASE call_list;
\c call_list
CREATE TABLE users(
	id SERIAL,
	first_name varchar,
	email varchar,
	PRIMARY KEY (id)
);

INSERT INTO users(first_name, email) VALUES ('Carlos', 'carlos@gmail.com'),('Laura', 'laura@gmail.com');

CREATE TABLE calls(
	id SERIAL,
	phone varchar,
	call_date date,
	user_id integer,
	FOREIGN KEY (user_id) REFERENCES users(id)
);

ALTER TABLE users ADD COLUMN last_name varchar;

UPDATE users SET last_name = 'Perez' WHERE first_name = 'Carlos';
UPDATE users SET last_name = 'Aguero' WHERE first_name = 'Laura';

INSERT INTO calls(phone, call_date, user_id) VALUES ('+56965896460', '2018-03-28', 2),
('+56965896460', '2018-04-23', 2), ('+56965896460', '2018-05-21', 2),
('+56965896460', '2018-06-02', 2), ('+56965896460', '2018-07-18', 2),
('+56965896460', '2018-08-13', 2);

INSERT INTO calls(phone, call_date, user_id) VALUES ('+56984975062', '2018-03-11', 1),
('+56984975062', '2018-04-15', 1), ('+56984975062', '2018-05-09', 1),
('+56984975062', '2018-06-23', 1);

INSERT INTO users(first_name, email) VALUES ('Oscar', 'oscar@gmail.com');

SELECT first_name, COUNT(calls) FROM users FULL JOIN calls ON (users.id = user_id) GROUP BY first_name;
SELECT email, phone, call_date FROM calls INNER JOIN users ON (users.id = user_id) WHERE first_name = 'Carlos' ORDER BY call_date DESC;

CREATE TABLE audits(
	id SERIAL,
	delete_reason varchar,
	call_id integer,
	user_id integer,
	FOREIGN KEY (call_id) REFERENCES calls(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);








