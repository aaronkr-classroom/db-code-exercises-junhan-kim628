-- User, Game, Item, Play, UserItem
CREATE TABLE users(
	user_id INT PRIMARY KEY,
	user_name VARCHAR(30) NOT NULL,
	user_nickname VARCHAR(30) NOT NULL,
	user_level INT,
	join_date DATE
);

CREATE TABLE games (
	game_id INT PRIMARY KEY,
	game_name VARCHAR(50) NOT NULL,
	game_genre VARCHAR(20),
	release_date DATE
);

CREATE TABLE items (
	item_id INT PRIMARY KEY,
	item_name VARCHAR(30),
	price INT,
	grade CHAR
);

CREATE TABLE plays (
	user_id INT,
	game_id INT,
	start_date DATE,
	play_time INT, -- 시작: Time.now(), 현재: Time.now()
	-- Time.now() = 176864523 - 176854321 = 10202 / 60 / 60
	PRIMARY KEY (user_id, game_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (game_id) REFERENCES games(game_id)
);

CREATE TABLE user_item (
	user_id INT,
	item_id INT,
	acquired_date DATE,
	quantity INT,
	PRIMARY KEY (user_id, item_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (item_id) REFERENCES items(item_id)
);

TABLE users;
TABLE games;
TABLE items;
TABLE plays;
TABLE user_item;

-- INSERT VALUES
INSERT INTO users VALUES
(1, 'asd', 'qwdqw', 2000, '2022-10-10'),
(2, 'aww', 'dwqqq', 10, '2021-12-18'),
(3, 'wdq', 'fewfw', 99, '2026-02-26'),
(4, 'wwe', 'qqq', 21, '1900-08-02'),
(5, 'ttt', 'wqqqqq', 80, '1400-06-02');

INSERT INTO games VALUES
(101, 'qwewq', 'aaa', '1100-02-02'),
(102, 'OAOAOAOAOA', 'abc', '900-12-12'),
(103, 'QWERTYUIOP', 'ASDFGHJKL', '2400-04-20');

INSERT INTO items VALUES
(1001, 'Steak', 50000, 'M'),
(1002, 'Bread', 100, 'B'),
(1003, 'Soup', 200, 'S');

INSERT INTO plays VALUES
(1, 101, '2024-03-23', 120),
(2, 101, '2400-04-12', 123456667),
(3, 103, '5000-02-12', 1232141241),
(4, 102, '2045-05-12', 1231241241),
(5, 103, '4000-09-20', 99999999);

INSERT INTO user_item VALUES
(2, 1002, '6000-09-12', 123141);

-- 기본 조회 연습
-- 1. 전체 유저 조회
SELECT * FROM users;

-- 2. 레벨 높은 순서로 조회
SELECT * FROM users
ORDER BY user_level DESC;

-- 3. 레벨이 10 이상인 유저 조회
SELECT * FROM users
WHERE user_level >= 10;

-- 4. 'S' 등급 아이템 조회

SELECT * FROM items
WHERE grade = 'S';

-- 테이블을 수정할 때 (ALTER TABLE)
-- 1. 게임 회사에서 유저의 이메일도 저장한다.
ALTER TABLE users
ADD COLUMN email VARCHAR(50);
TABLE users;

-- 2. 유저에게 현재 접속 상태를 저장해야 한다.
ALTER TABLE users
ADD COLUMN status VARCHAR(10) DEFAULT 'offline';
TABLE users;

-- 3. 아이템 테이블에 판매 가능 여부를 추가해야 한다.
ALTER TABLE items
ADD COLUMN is_sellable BOOLEAN DEFAULT TRUE;
TABLE items;

-- 4. 게임 테이블에 게임 등급 정보를 추가해야 한다.
ALTER TABLE games
ADD COLUMN age_rating VARCHAR(50);
TABLE games;

-- 테이블에 있는 값이 변경될 때 UPDATE
-- 이메일 추가
UPDATE users
SET email = 'bread@email.com'
WHERE user_id = 1;

-- 레벨 증가
UPDATE users
SET user_level = 25
WHERE user_id = 2;

-- 모든 유저 기본 접속 상태를 online으로 설정한다.
UPDATE users
set status = 'online';

-- 특정 유저 connecting
UPDATE users
set status = 'connecting'
WHERE user_nickname = 'fewfw';

-- 가격 변경
UPDATE items
SET price = 700
WHERE item_name = '회복포션';

-- 게임 등급 12세 이상으로 설정. 
UPDATE games
SET age_rating = '12+'
WHERE game_id = 102;

-- 주의 설명
-- DELETE는 데이터를 삭제한다.
-- DROP TABLE은 테이블 자체를 삭제한다.
-- ALTER TABLE은 테이블 구조를 변경한다.
-- UPDATE 기존 데이터를 수정한다.