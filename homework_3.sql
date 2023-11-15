CREATE TABLE Fabric (
    ID INT PRIMARY KEY,
    Name VARCHAR(255) UNIQUE
);

CREATE TABLE Category (
    ID INT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Pattern (
    ID INT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Content (
    ID INT PRIMARY KEY,
    Type VARCHAR(255)
);

CREATE TABLE FabricCategory (
    FabricID INT,
    CategoryID INT,
    FOREIGN KEY (FabricID) REFERENCES Fabric(ID),
    FOREIGN KEY (CategoryID) REFERENCES Category(ID)
);

CREATE TABLE FabricPattern (
    FabricID INT,
    PatternID INT,
    FOREIGN KEY (FabricID) REFERENCES Fabric(ID),
    FOREIGN KEY (PatternID) REFERENCES Pattern(ID)
);

CREATE TABLE FabricContent (
    FabricID INT,
    ContentID INT,
    Percentage INT,
    FOREIGN KEY (FabricID) REFERENCES Fabric(ID),
    FOREIGN KEY (ContentID) REFERENCES Content(ID)
);

SELECT F.Name
FROM Fabric F
JOIN FabricPattern FP ON F.ID = FP.FabricID
JOIN Pattern P ON FP.PatternID = P.ID
WHERE F.Name = '피카츄' AND P.Name = '솔리드';

SELECT F.Name
FROM Fabric F
LEFT JOIN FabricCategory FC ON F.ID = FC.FabricID
LEFT JOIN Category C ON FC.CategoryID = C.ID
LEFT JOIN FabricPattern FP ON F.ID = FP.FabricID
LEFT JOIN Pattern P ON FP.PatternID = P.ID
WHERE C.Name = '전기' OR P.Name = '체크';

SELECT F.Name
FROM Fabric F
JOIN FabricContent FC ON F.ID = FC.FabricID
GROUP BY F.Name
HAVING COUNT(FC.ContentID) >= 2;

SELECT F.Name
FROM Fabric F
LEFT JOIN FabricPattern FP ON F.ID = FP.FabricID
WHERE FP.PatternID IS NULL;