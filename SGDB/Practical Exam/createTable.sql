create table Neighborhoods(
	NId int IDENTITY(1,1) PRIMARY KEY,
	name varchar(50) not null,
	location varchar(50) not null
)

create table MainResidents(
	MRId int IDENTITY(1,1) PRIMARY KEY,
	name varchar(50) not null,
	phone varchar(50) not null
)

create table SmartDevices(
	SDId int IDENTITY(1,1) PRIMARY KEY,
	name varchar(50)
)

create table SmartHouses(
	SHId int IDENTITY(1,1) PRIMARY KEY,
	name varchar(50) not null,
	address varchar(50) not null,
	NId int FOREIGN KEY REFERENCES Neighborhoods(NId),
	MRId int FOREIGN KEY REFERENCES MainResidents(MRId)
)

create table SmartHouses_SmartDevices(
	SHId int not null,
	SDId int not null,
	Primary KEY(SHId,SDId),
	FOREIGN KEY(SHId) REFERENCES SmartHouses(SHId),
	FOREIGN KEY(SDId) REFERENCES SmartDevices(SDId),
)