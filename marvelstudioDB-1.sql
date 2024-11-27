Drop Database if exists marvelstudioDB;
Create database marvelstudioDB;
Use marvelstudioDB;


CREATE TABLE marvels (
ID tinyint(5) PRIMARY KEY,
    name varchar(30),
    popularity INTEGER,
    alignment varchar(30),
    gender varchar(10), 
    height_m DECIMAL(10,2),
    weight_kg DECIMAL(10,2),
    hometown TEXT,
    intelligence tinyint(5),
    strength tinyint(5),
    speed tinyint(5),
    durability tinyint(5),
    energy_Projection tinyint(5),
    fighting_Skills tinyint(5));
    
    
INSERT INTO marvels VALUES(1, "Spider Man", 1, "Good", "Male", 1.78, 75.75, "USA", 4, 4, 3, 3, 1, 4); 
INSERT INTO marvels VALUES(2, "Iron Man", 20, "Neutral", "Male", 1.98, 102.58, "USA", 6, 6, 5, 6, 6, 4); 
INSERT INTO marvels VALUES(3, "Hulk", 18, "Neutral", "Male", 2.44, 635.29, "USA", 1, 7, 3, 7, 5, 4); 
INSERT INTO marvels VALUES(4, "Wolverine", 3, "Good", "Male", 1.6, 88.46, "Canada", 2, 4, 2, 4, 1, 7);
INSERT INTO marvels VALUES(5, "Thor", 5, "Good", "Male", 1.98, 290.3, "Asgard", 2, 7, 7, 6, 6, 4);
INSERT INTO marvels VALUES(6, "Green Goblin", 91, "Bad", "Male", 1.93, 174.63, "USA", 4, 4, 3, 4, 3, 3);
INSERT INTO marvels VALUES(7, "Magneto", 11, "Neutral", "Male", 1.88, 86.18, "Germany", 6, 3, 5, 4, 6, 4);
INSERT INTO marvels VALUES(8, "Thanos", 47, "Bad", "Male", 2.01, 446.79, "Titan", 6, 7, 7, 6, 6, 4);
INSERT INTO marvels VALUES(9, "Loki", 32, "Bad", "Male", 1.93, 238.14, "Jotunheim", 5, 5, 7, 6, 6, 3);
INSERT INTO marvels VALUES(10, "Doctor Doom", 19, "Bad", "Male", 2.01, 188.24, "Latveria", 6, 4, 5, 6, 6, 4);
INSERT INTO marvels VALUES(11, "Jean Grey", 8, "Good", "Female", 1.68, 52.16, "USA", 3, 2, 7, 7, 7, 4);
INSERT INTO marvels VALUES(12, "Rogue", 4, "Good", "Female", 1.73, 54.43, "USA", 7, 7, 7, 7, 7, 7);
INSERT INTO marvels VALUES(13, "Storm", 2, "Good", "Female", 1.80, 66, "Kenya", 2, 2, 3, 2, 5, 4);
INSERT INTO marvels VALUES(14, "Nightcrawler", 6, "Good", "Male", 1.75, 73, "Germany", 3, 2, 7, 2, 1, 3);
INSERT INTO marvels VALUES(15, "Gambit", 7, "Good", "Male", 1.88, 81, "EUA", 2, 2, 2, 2, 2, 4);
INSERT INTO marvels VALUES(16, "Captain America", 9, "Good", "Male", 1.88, 108, "EUA", 3, 3, 2, 3, 1, 6);
INSERT INTO marvels VALUES(17, "Cyclops", 10, "Good", "Male", 1.90, 88, "EUA", 3, 2, 2, 2, 5, 4);
INSERT INTO marvels VALUES(18, "Emma Frost", 12, "Neutral", "Female", 1.78, 65, "EUA", 4, 4, 2, 5, 5, 3);
INSERT INTO marvels VALUES(19, "Kitty Pryde", 13, "Good", "Female", 1.68, 50, "EUA", 4, 2, 2, 3, 1, 5);
INSERT INTO marvels VALUES(20, "Daredevil", 14, "Good", "Male", 1.83, 91, "EUA", 3, 3, 2, 2, 4, 5);
INSERT INTO marvels VALUES(21, "Punisher", 50, "Neutral", "Male", 1.85, 91, "EUA", 3, 3, 2, 2, 1, 6);
INSERT INTO marvels VALUES(22, "Silver Surfer", 33, "Good", "Male", 1.93, 102, "Zenn-La", 3, 7, 7, 6, 7, 2);
INSERT INTO marvels VALUES(23, "Ghost Rider", 86, "Good", "Male", 1.88, 99, "EUA", 2, 4, 3, 5, 4, 2);
INSERT INTO marvels VALUES(24, "Venon", 78, "Neutral", "Male", 1.90, 118, "EUA", 3, 4, 2, 6, 1, 4);
INSERT INTO marvels VALUES(25, "Juggernaut", 76, "Neutral", "Male", 2.87, 862, "EUA", 2, 7, 2, 7, 1, 4);
INSERT INTO marvels VALUES(26, "Professor X", 58, "Good", "Male", 1.83, 86, "EUA", 5, 2, 2, 2, 5, 3);


/*
Summary Statistics

*/

-- Avg height, weight
Select Round(avg(height_m),2) As Average_Height_In_Meters
from marvels;

Select Round(avg(weight_kg),2) As Average_Weight_In_Kg
from marvels;


-- Max intelligence, strength & fighting skills of characters
Select name,strength As Greatest_strength_Level 
from marvels
Where strength =(Select max(strength) from marvels);

Select name,intelligence As Highest_Intelligence_Level 
from marvels
Where intelligence =(Select max(intelligence) from marvels);

Select name,fighting_Skills As Highest_fighting_Skill 
from marvels
Where fighting_Skills =(Select max(fighting_Skills) from marvels);

-- Min 
Select name,strength As Lowest_strength_Level 
from marvels
Where strength =(Select min(strength) from marvels);

Select name,intelligence As Lowest_Intelligence_Level 
from marvels
Where intelligence =(Select min(intelligence) from marvels);

Select name,fighting_Skills As Lowest_fighting_Skill 
from marvels
Where fighting_Skills =(Select min(fighting_Skills) from marvels);

/*
Character specific  abilities
*/
-- First 5 Characters with the least intelligence level and their associated strength
Select name,intelligence,strength
from marvels
ORDER BY intelligence 
LIMIT 5;

-- First 5 Characters with the Highest intelligence level and their associated fighting skills
Select name,intelligence,fighting_Skills
from marvels
ORDER BY intelligence DESC
LIMIT 10;

/*Does speed determine fighting skills 
First five low speed rate against fighting skills
Fist five high speed rate against fighting skills
*/

-- Small speed rate
Select name,speed,fighting_Skills
from marvels
 ORDER BY speed
LIMIT 5;

-- High speed rate
Select name,speed,fighting_Skills
from marvels
 ORDER BY speed DESC
LIMIT 5;

-- Does strenght determine fighting skills
Select name, strength ,fighting_Skills
from marvels
 ORDER BY strength
LIMIT 5;

-- Top 5 characters with the highest popularity 
Select name,popularity,hometown
From marvels
order by popularity DESC
Limit 5;


-- Top 5 characters with the highest popularity with a bad alignment
Select name,popularity,hometown
From marvels
Where popularity=(Select max(popularity) from marvels) And alignment LIKE "%Bad%"
Limit 5;

-- Where are most of the characters from
Select distinct(hometown),count(ID) As Number_Of_Characters
FROM marvels
GROUP BY hometown
ORDER BY Number_Of_Characters DESC;


/*Case to classify strength levels of charcters
2 and below is weak
3 to 4 is Somewhat strong
5 to 6 is strong
7 and above is super strong
*/
Select name,gender,strength,
Case
When strength <= 2 then "Weak"
When  strength= 3 or strength=4 then "Somewhat Strong"
When strength= 5 or strength= 6 then "Strong"
Else
 "Super Strong"
End As Strength_Category
from marvels;

-- Returning the hometowns with characters greater or equal to 2
Select hometown,count(*) As Number_Of_Characters
FROM marvels
Group by hometown
HAVING COUNT(*) >=2
;


-- return alignment level with characters greater than or equal to 2 and intelligence level is greater than 3
SELECT 
    alignment,
    COUNT(*) AS num_characters
FROM marvels
WHERE intelligence > 3
GROUP BY alignment
HAVING COUNT(*) >=2;


-- people from canada or USA with good alignement and speed > 3  and 
Select name
from marvels
where alignment="Good" and speed > 3 and hometown In("Canada","USA");


-- people from Germany or Titan with good alignement and speed > 6 
Select name
from marvels
where alignment="Good" or speed > 6 or  hometown In("Germany","Titan")limit 5;


-- Number of males and females
Select gender,count(*)
from marvels
group by gender;


