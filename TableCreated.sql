create table Person(
    ID              INT not null unique,
    First_Name      VARCHAR(15) not null,
    Last_Name       VARCHAR(15) not null,
    Phone_Number    int not null unique,
    Address         VARCHAR(25) not null,
    SSN             int not null,
    primary key (ID)   
);

create table Customer(
    ID              INT not null unique,
	License_Number  VARCHAR(9) not null Unique,
    email           VARCHAR(25) not null Unique,
    height          int not null,
    weight          int not null,
    Date_Of_Birth   DATE not null,
    Gender 			char(1) not null,
    Eye_Color 		VARCHAR(8) not null,
    primary key (ID),
    foreign key (ID) references Person(ID)
);

create table Employee(
	ID	INT not null unique,
    primary key (ID),
    foreign key (ID) references Person(ID)
);


drop table Item;
create table Item(
	ID 						INT not null unique,
    name					varchar(20) not null,
    Serial_Number 			varchar(25),
    Manufacturer 			varchar(20),
    Condition_of_item 		varchar(7) not null,
    Type 					varchar(15) not null,
    Age_Of_Item 			varchar(7),
    Location_In_Store		varchar(15),
    Notes 					varchar(25),
    primary key (ID)
);


create table BoughtItems(
	TicketNumber			INT not null unique,
    ID						int not null,
    Name 					varchar(25),
    Buy_Price				decimal(7,2),
    Buy_Date				DATE not null,
    Employee_ID				INT not null unique,
    Customer_ID				INT not null unique,
    Notes_Of_Sale			varchar(25),
    primary key (TicketNumber),
    foreign key (ID) references Item(ID),
    foreign key (Employee_ID) references Employee(ID),
    foreign key (Customer_ID) references Customer(ID)
);

create table PawnBecomesBought(
	TicketNumber			INT not null unique,
    ID						int not null unique,
    Buy_Date				DATE not null,
    Buy_Price				decimal(7,2),
	primary key (TicketNumber),
	foreign key (ID) references Item(ID)
);

create table StoreSoldItems(
	TicketNumber			INT not null unique,
    ID						int not null unique,
    Sell_Price				decimal(7,2) not null,
    Sell_Date				Date not null,
	Employee_ID				INT not null unique,
    Customer_ID				INT not null unique,
    Notes_Of_Sale			varchar(25),
	primary key (TicketNumber),
    foreign key (ID) references Item(ID),
    foreign key (Employee_ID) references Employee(ID),
    foreign key (Customer_ID) references Customer(ID)
);

create table StorePawnedItems(
	TicketNumber			INT not null unique,
    ID						int not null unique,
	name					varchar(20) not null,
    Pawn_Date				Date not null,
	Employee_ID				INT not null unique,
    Customer_ID				INT not null unique,
    Notes_Of_Pawn			varchar(25),
    Paid_Amount 			decimal(7,2) not null,
    Buy_Back_Price			decimal(7,2),
    Payment_Due_Date		DATE,
    Late_Fee				decimal(7,2),
	primary key (TicketNumber),
    foreign key (ID) references Item(ID),
    foreign key (Employee_ID) references Employee(ID),
    foreign key (Customer_ID) references Customer(ID)
);
