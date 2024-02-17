#Тест 1
CREATE TABLE SOTR(Name VARCHAR(20),Address VARCHAR(255),Mesto VARCHAR(30),Sex VARCHAR(10),BirthDate DATE);
INSERT INTO SOTR (Name,Address,Mesto,Sex,BirthDate) VALUES 
('Петр','Г.Москва, ул. Петрова, д.4','Москва','M','1985-04-23'),
('Иван','Г.Киев, ул. Иванова, д.3','Киев','M','1979-12-12'),
('Маша','Г.Москва, ул. Машина, д.1','Москва','W','1980-09-11'),
('Федор','Г.Москва, ул. Федорова, д.10','Фрунзе','M','1976-07-03');

#Необходимо написать запрос, который выводит все записи по сотрудникам, родившимся в 1977 - 1983 годах

SELECT  * FROM  sotr 
WHERE BirthDate BETWEEN  "1977-01-01" AND  "1983-12-31";  

#Тест 2
#Написать запрос, который выводит содержимое таблицы SOTR по сотрудникам, у которых пол – женский.
SELECT * FROM sotr 
WHERE Sex = "W";



#Тест 3
CREATE TABLE ZARP(Name VARCHAR(20), Zarp INT);
INSERT INTO ZARP (Name, Zarp) VALUES
('Петр', 100),
('Федор', 200),
('Маша', 300);

#Написать запрос, который из таблиц SOTR и ZARP выводит информацию по сотруднику Федор:Имя сотрудника; Адрес; Зарплата


SELECT Sotr.Name AS "Имя сотрудника", Sotr.Address AS "Адрес", Zarp.Zarp AS "Зарплата" FROM sotr 
JOIN Zarp ON Sotr.Name = Zarp.Name
WHERE Sotr.Name = "Федор";
#Тест 4
#Написать запрос, который из таблиц SOTR и ZARP выводит следующую информацию: Имя сотрудника; Адрес; Зарплата
#Если по одному из сотрудников зарплата не указана, то в результирующей выборке в поле Зарплата указывать 0

SELECT Sotr.Name AS "Имя сотрудника", Sotr.Address AS "Адрес", IFNULL (Zarp.Zarp, 0) AS "Зарплата" FROM sotr 
LEFT JOIN Zarp ON Sotr.Name = Zarp.Name;

#Тест 5
CREATE TABLE PAYMENTS(Name VARCHAR(20),Date DATE,Amount FLOAT);
INSERT INTO PAYMENTS (Name,`Date`,Amount) VALUES 
('Петр','2007-03-30',70),
('Федор','2007-03-30',200),
('Петр','2007-04-30',100),
('Маша','2007-04-30',250),
('Федор','2007-04-30',200),
('Федор','2007-05-31',200),
('Маша','2007-05-31',300),
('Петр','2007-05-31',100);

#Написать запрос, который из таблиц SOTR и PAYMENTS выводит следующую информацию: Имя сотрудника; Общая выплаченная сумма
#Примечание. Если по одному из сотрудников не было выплат, то в поле с общей выплаченной суммой указывать 0.

SELECT Sotr.Name AS "Имя сотрудника", IFNULL (SUM(Payments.Amount),0) AS "Общая выплаченная сумма"  FROM sotr 
LEFT JOIN payments ON Sotr.Name = Payments.Name
GROUP BY Sotr.Name ;


