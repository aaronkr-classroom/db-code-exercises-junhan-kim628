/*
Game User DB
[Entities]
-User
-Character

[game_user Properties]
- id (SERIAL)
- name (varchar(30))
- character_id (int)

[Character Properties]
- id (SERIAL)
- name (varchar(30))
- created_at (DATE)
*/

CREATE TABLE game_user(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	character_id int
);

CREATE TABLE character(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	created_at DATE,
	user_id int NOT NULL,

	CONSTRAINT fk_user -- 외래키 설정: users 테이블의 id를 참조
		FOREIGN KEY (user_id)
		REFERENCES users(id)
		ON DELETE CASCADE -- 유저가 삭제되면 해당 유저의 캐릭터도 함께 삭제
);