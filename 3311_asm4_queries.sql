-- Q1
SELECT videoId, title FROM
(SELECT videoId, title FROM Video INNER JOIN
(SELECT videoId AS V FROM Movie) ON V=videoId) INNER JOIN 
(SELECT videoId AS S FROM Tags WHERE tag='Comedy') ON videoId=S;

-- Q2
SELECT username FROM Account WHERE registrationDate >= TO_DATE('2014-01-01','YYYY-MM-DD') 
AND registrationDate <= TO_DATE('2016-01-01','YYYY-MM-DD');

-- Q3
select videoId, title from (
select VideoId, count(*) from Watches natural join Movie natural join Acts natural join CastMember where castName like '%Robert Downey Jr.%' group by VideoId having count(*) = (
select max(watchCount) from (
select VideoId, count(*) as watchCount from Watches natural join Movie natural join Acts natural join CastMember where castName like '%Robert Downey Jr.%' group by videoId))) natural join Video;

-- Q4
SELECT username, AGE_TODAY FROM Account INNER JOIN
(SELECT username U, TRUNC((TO_DATE('2022-05-01','YYYY-MM-DD') - birthDate)/ 365.25) AS AGE_TODAY FROM Account)
ON U=username WHERE (AGE_TODAY > 21);

-- Q5
SELECT DISTINCT username, playListName FROM Playlist MINUS
(SELECT DISTINCT username, playListName FROM Playlist INNER JOIN
((SELECT videoId V FROM Movie WHERE dateOfRelease >= TO_DATE('2014-01-01', 'YYYY-MM-DD')) UNION 
(SELECT videoId FROM TVShow WHERE dateOfRelease >= TO_DATE('2014-01-01', 'YYYY-MM-DD'))) ON V=videoId
);

-- Q6
--INSERT INTO Account VALUES ('test', 'Jane Doe', 'jdoe@whoami.com', '12-DEC-1999', '18-NOV-2021');
--INSERT INTO Premium VALUES ('test');

-- Q7
--DELETE FROM Account WHERE username='test';


