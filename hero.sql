CREATE DATABASE hero;

CREATE TABLE IF NOT EXISTS public.class
(
    class_id integer NOT NULL,
    class_name character varying(255) NOT NULL,
    class_description text,
    PRIMARY KEY (class_id)
);

CREATE TABLE IF NOT EXISTS public.item
(
    item_id integer NOT NULL,
    item_name character varying(255) NOT NULL,
    item_description text,
    item_type character varying(50),
    PRIMARY KEY (item_id)
);

CREATE TABLE IF NOT EXISTS public.hero
(
    hero_id integer NOT NULL,
    hero_name character varying(255) NOT NULL,
    class_id integer,
    is_active boolean,
    PRIMARY KEY (hero_id),
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE IF NOT EXISTS public.heroitem
(
    hero_item_id integer NOT NULL,
    hero_id integer,
    item_id integer,
    PRIMARY KEY (hero_item_id),
    FOREIGN KEY (hero_id) REFERENCES hero(hero_id),
    FOREIGN KEY (item_id) REFERENCES item(item_id)
);

CREATE TABLE IF NOT EXISTS public.player
(
    player_id integer NOT NULL,
    player_name character varying(255) NOT NULL,
    player_level integer,
    player_experience integer,
    hero_id integer,
    PRIMARY KEY (player_id),
    FOREIGN KEY (hero_id) REFERENCES hero(hero_id)
);

CREATE TABLE IF NOT EXISTS public.skills
(
    skill_id integer NOT NULL,
    skill_name character varying(255) NOT NULL,
    skill_description text,
    class_id integer,
    PRIMARY KEY (skill_id),
	FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE IF NOT EXISTS public.HeroItem 
(
    hero_item_id INT PRIMARY KEY,
    hero_id INT,
    item_id INT,
    FOREIGN KEY (hero_id) REFERENCES Hero(hero_id),
    FOREIGN KEY (item_id) REFERENCES Item(item_id)
);

INSERT INTO Class (class_id, class_name, class_description)
VALUES
    (101, 'Warrior', 'A strong and melee-focused class'),
    (102, 'Mage', 'A magic-wielding class'),
    (103, 'Rogue', 'A stealthy and agile class'),
    (104, 'Skilled Archers', 'Precise ranged attackers'),
    (105, 'Range Archers', 'Skilled archers'),
    (106, 'Assassin', 'Stealthy and high burst damage'),
    (107, 'Fighter', 'Versatile combatants'),
    (108, 'Support', 'Provide assistance and healing'),
    (109, 'Tank', 'High durability and crowd control'),
    (110, 'Wizard', 'Masters of arcane magic');

    INSERT INTO Item (item_id, item_name, item_description, item_type)
VALUES
    (101, 'Blade of Despair', 'Increases physical damage', 'Weapon'),
    (102, 'Magic Shoes', 'Reduces skill cooldown', 'Armor'),
    (103, 'Bloodlust Axe', 'Provides spell vamp', 'Consumable'),
    (104, 'Demon Hunter Sword', 'Increases attack speed', 'Weapon'),
    (105, 'Queens Wings', 'Provides lifesteal', 'Armor'),
    (106, 'Endless Battle', 'Enhances basic attacks', 'Weapon'),
    (107, 'Necklace of Durance', 'Reduces enemy healing', 'Consumable'),
    (108, 'Thunder Belt', 'Adds a slow effect', 'Armor'),
    (109, 'Blade Armor', 'Reflects physical damage', 'Armor'),
    (110, 'Feather of Heaven', 'Increases attack speed', 'Weapon');

    INSERT INTO Hero (hero_id, hero_name, class_id, is_active)
VALUES
    (1, 'Aldous', 101, true),
    (2, 'Karina', 102, true),
    (3, 'Gusion', 103, false),
    (4, 'Layla', 101, true),
    (5, 'Selena', 102, true),
    (6, 'Hayabusa', 103, false),
    (7, 'Franco', 101, true),
    (8, 'Fanny', 102, true),
    (9, 'Leomord', 103, false),
    (10, 'Chou', 101, true);

    INSERT INTO Player (player_id, player_name, player_level, player_experience, hero_id)
VALUES
    (1, 'ShinmenTakezo', 10, 1000, 1),
    (2, 'Elgin', 8, 800, 2),
    (3, 'Betosky', 12, 1500, 3),
    (4, 'GosuGeneral', 15, 2000, 4),
    (5, 'MobileLegendsTV', 7, 700, 5),
    (6, 'HororoChan', 9, 950, 6),
    (7, 'CongTV', 14, 1800, 7),
    (8, 'BluePanda', 11, 1200, 8),
    (9, 'LeomordLegend', 13, 1600, 9),
    (10, 'ShinmenX', 6, 650, 10);