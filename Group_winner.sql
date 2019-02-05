create table players (
    player_id integer not null unique,
    group_id integer not null
    );

create table matches (
    match_id integer not null unique,
    first_player integer not null,
    second_player integer not null,
    first_score integer not null,
    second_score integer not null
    );


INSERT INTO players VALUES (
    20, 
    2
    );
    
INSERT INTO players VALUES (
    30, 
    1
    );
    
INSERT INTO players VALUES (
    40, 
    3
    );
    
INSERT INTO players VALUES (
    45, 
    1
    );
    
INSERT INTO players VALUES (
    50, 
    2
    );
    
INSERT INTO players VALUES (
    65, 
    1
    );

    
INSERT INTO matches VALUES (
    1,
    30,
    45,
    10,
    12
    );
    
INSERT INTO matches VALUES (
    2,
    20,
    50,
    5,
    5
    );
    
INSERT INTO matches VALUES (
    13,
    65,
    45,
    10,
    10
    );
    
INSERT INTO matches VALUES (
    5,
    30,
    65,
    3,
    15
    );
    
INSERT INTO matches VALUES (
    42,
    45,
    65,
    8,
    4
    );
 
    
SELECT * FROM matches;

SELECT * FROM players;










SELECT group_id,player_id,max(winner_score)
    FROM players
    JOIN (
    SELECT
        CASE
            WHEN first_score > second_score THEN  first_score 
            
            WHEN second_score > first_score THEN  second_score 
           
            WHEN first_score = second_score THEN first_score 
         
        END AS winner_score,
       
        CASE
            WHEN first_score > second_score THEN  first_player
            WHEN second_score > first_score THEN  second_player
            WHEN first_score = second_score AND first_player > second_player THEN second_player
            WHEN first_score = second_score AND first_player < second_player THEN first_player
        END AS winner_id
        FROM matches) AS winner_table
    ON players.player_id = winner_table.winner_id
    GROUP BY group_id,player_id
    ;
