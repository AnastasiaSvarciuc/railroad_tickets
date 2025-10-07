CREATE DATABASE RailroadTicketsDB;


USE RailroadTicketsDB;

CREATE TABLE Trains (TrainId INT IDENTITY PRIMARY KEY, TrainNumber NVARCHAR(20) NOT NULL UNIQUE);

CREATE TABLE Routes (
    RouteId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(200) NOT NULL
);

CREATE TABLE Stations (
	StationId INT IDENTITY PRIMARY KEY,
	Code NVARCHAR(10) NOT NULL UNIQUE,
	Name NVARCHAR(200) NOT NULL,
	City NVARCHAR(100),
	Country NVARCHAR(100)
);

CREATE TABLE Seats (SeatId INT IDENTITY PRIMARY KEY, SeatNumber NVARCHAR(20) NOT NULL);

CREATE TABLE Journeys (
    JourneyId INT IDENTITY PRIMARY KEY,
    TrainId INT NOT NULL REFERENCES Trains(TrainId),
    RouteId INT NOT NULL REFERENCES Routes(RouteId),
    DepartureDateTime DATETIME NOT NULL,
    ArrivalDateTime DATETIME NOT NULL,
);

CREATE TABLE Passengers(PassengerId INT IDENTITY PRIMARY KEY, FirstName NVARCHAR(100) NOT NULL, LastName NVARCHAR(100) NOT NULL, DocumentNumber NVARCHAR(100));

CREATE TABLE Tickets(
TicketId INT IDENTITY PRIMARY KEY, 
SeatId INT NULL REFERENCES Seats(SeatId), 
PassengerId INT NULL REFERENCES Passengers(PassengerId),
FromStationId INT NOT NULL REFERENCES Stations(StationId),
ToStationId INT NOT NULL REFERENCES Stations(StationId),
JourneyId INT NOT NULL REFERENCES Journeys(JourneyId),
Price DECIMAL(12,2) NOT NULL,
TicketNumber NVARCHAR(100) UNIQUE,
IssuedAt DATETIME NULL);

INSERT INTO Stations(Code, Name, City, Country) VALUES
('CHI','Chisinau Central','Chisinau','Moldova'),
('BAL','Balti','Balti','Moldova'),
('ORH','Orhei','Orhei','Moldova');







