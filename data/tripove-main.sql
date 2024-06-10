-- Create Account Table
CREATE TABLE Account (
    id int IDENTITY NOT NULL PRIMARY KEY,
    role nvarchar(255) NULL,
    username nvarchar(255) NULL,
    password nvarchar(255) NULL,
    name nvarchar(255) NULL,
    gender nvarchar(255) NULL,
    dateOfBirth date NULL,
    phoneNumber int NULL,
    email nvarchar(255) NULL,
    address nvarchar(750) NULL,
    image nvarchar(255) NULL,
    created_at datetime NULL,
    updated_at datetime NULL
);

-- Insert admin
INSERT INTO Account (role, username, password, name, gender, dateOfBirth, phoneNumber, email, address, image, created_at, updated_at)
VALUES ('admin', 'admin', '123', 'Ngô Tùng Dương', 'male', null, null, null, null, null, GETDATE(), null);

-- Create Vehicle Table
CREATE TABLE Vehicle (
    licensePlate nvarchar(255) NOT NULL PRIMARY KEY,
    status int NULL,
    Vehicle_Categoryid int NOT NULL,
    created_at datetime NULL,
    updated_at datetime NULL
);

-- Create Seat Table
CREATE TABLE Seat (
    id int IDENTITY NOT NULL PRIMARY KEY,
    name nvarchar(255) NULL,
    status int NULL,
    Route_Detailid int NOT NULL
);

-- Create Vehicle_Category Table
CREATE TABLE Vehicle_Category (
    id int IDENTITY NOT NULL PRIMARY KEY,
    name nvarchar(255) NULL,
    utilities nvarchar(750) NULL,
    created_at datetime NULL,
    updated_at datetime NULL,
    seatQuantity int NULL,
    seatType nvarchar(255) NULL,
    image nvarchar(255) NULL
);

-- Create Route Table
CREATE TABLE Route (
    id int IDENTITY NOT NULL PRIMARY KEY,
    name nvarchar(255) NULL,
    Arrival_Locationid int NOT NULL,
    Departure_Locationid int NOT NULL,
    price int NULL,
    detail nvarchar(255) NULL,
    created_at datetime NULL,
    updated_at datetime NULL
);

-- Create Location Table
CREATE TABLE Location (
    id int IDENTITY NOT NULL PRIMARY KEY,
    name nvarchar(255) NULL
);

-- Create Ticket Table
CREATE TABLE Ticket (
    id int IDENTITY NOT NULL PRIMARY KEY,
    Routeid int NOT NULL,
    Accountid int NOT NULL,
    payment nvarchar(255) NULL,
    Seatid int NOT NULL,
    paymentDate datetime NULL
);

-- Create News Table
CREATE TABLE News (
    id int IDENTITY NOT NULL PRIMARY KEY,
    image nvarchar(255) NULL,
    title nvarchar(255) NOT NULL,
    description ntext NULL,
    created_at datetime NULL,
    updated_at datetime NULL
);

-- Create Evaluate Table
CREATE TABLE Evaluate (
    id int IDENTITY NOT NULL PRIMARY KEY,
    Accountid int NOT NULL,
    star int NULL,
    comment nvarchar(750) NULL,
    created_at datetime NULL,
    updated_at datetime NULL,
    Routeid int NOT NULL
);

-- Create Route_Detail Table
CREATE TABLE Route_Detail (
    id int IDENTITY NOT NULL PRIMARY KEY,
    Routeid int NOT NULL,
    departureDate date NULL,
    departureTime time(7) NULL,
    VehiclelicensePlate nvarchar(255) NOT NULL,
    created_at datetime NULL,
    updated_at datetime NULL
);

-- Add Foreign Key Constraints
ALTER TABLE Vehicle 
    ADD CONSTRAINT FK_Vehicle_Category 
    FOREIGN KEY (Vehicle_Categoryid) 
    REFERENCES Vehicle_Category (id);

ALTER TABLE Route 
    ADD CONSTRAINT FK_Route_Departure_Location 
    FOREIGN KEY (Departure_Locationid) 
    REFERENCES Location (id);

ALTER TABLE Route 
    ADD CONSTRAINT FK_Route_Arrival_Location 
    FOREIGN KEY (Arrival_Locationid) 
    REFERENCES Location (id);

ALTER TABLE Ticket 
    ADD CONSTRAINT FK_Ticket_Route 
    FOREIGN KEY (Routeid) 
    REFERENCES Route (id);

ALTER TABLE Ticket 
    ADD CONSTRAINT FK_Ticket_Account 
    FOREIGN KEY (Accountid) 
    REFERENCES Account (id);

ALTER TABLE Ticket 
    ADD CONSTRAINT FK_Ticket_Seat 
    FOREIGN KEY (Seatid) 
    REFERENCES Seat (id);

ALTER TABLE Evaluate 
    ADD CONSTRAINT FK_Evaluate_Account 
    FOREIGN KEY (Accountid) 
    REFERENCES Account (id);

ALTER TABLE Evaluate 
    ADD CONSTRAINT FK_Evaluate_Route 
    FOREIGN KEY (Routeid) 
    REFERENCES Route (id);

ALTER TABLE Route_Detail 
    ADD CONSTRAINT FK_Route_Detail_Route 
    FOREIGN KEY (Routeid) 
    REFERENCES Route (id);

ALTER TABLE Route_Detail 
    ADD CONSTRAINT FK_Route_Detail_Vehicle 
    FOREIGN KEY (VehiclelicensePlate) 
    REFERENCES Vehicle (licensePlate);

ALTER TABLE Seat 
    ADD CONSTRAINT FK_Seat_Route_Detail 
    FOREIGN KEY (Route_Detailid) 
    REFERENCES Route_Detail (id);

-- Insert initial data into Location Table
INSERT INTO Location (name) VALUES (N'An Giang');
INSERT INTO Location (name) VALUES (N'Bà Rịa - Vũng Tàu');
INSERT INTO Location (name) VALUES (N'Bắc Giang');
INSERT INTO Location (name) VALUES (N'Bắc Kạn');
INSERT INTO Location (name) VALUES (N'Bạc Liêu');
INSERT INTO Location (name) VALUES (N'Bắc Ninh');
INSERT INTO Location (name) VALUES (N'Bến Tre');
INSERT INTO Location (name) VALUES (N'Bình Định');
INSERT INTO Location (name) VALUES (N'Bình Dương');
INSERT INTO Location (name) VALUES (N'Bình Phước');
INSERT INTO Location (name) VALUES (N'Bình Thuận');
INSERT INTO Location (name) VALUES (N'Cà Mau');
INSERT INTO Location (name) VALUES (N'Cần Thơ');
INSERT INTO Location (name) VALUES (N'Cao Bằng');
INSERT INTO Location (name) VALUES (N'Đà Nẵng');
INSERT INTO Location (name) VALUES (N'Đắk Lắk');
INSERT INTO Location (name) VALUES (N'Đắk Nông');
INSERT INTO Location (name) VALUES (N'Điện Biên');
INSERT INTO Location (name) VALUES (N'Đồng Nai');
INSERT INTO Location (name) VALUES (N'Đồng Tháp');
INSERT INTO Location (name) VALUES (N'Gia Lai');
INSERT INTO Location (name) VALUES (N'Hà Giang');
INSERT INTO Location (name) VALUES (N'Hà Nam');
INSERT INTO Location (name) VALUES (N'Hà Nội');
INSERT INTO Location (name) VALUES (N'Hà Tĩnh');
INSERT INTO Location (name) VALUES (N'Hải Dương');
INSERT INTO Location (name) VALUES (N'Hải Phòng');
INSERT INTO Location (name) VALUES (N'Hậu Giang');
INSERT INTO Location (name) VALUES (N'Hòa Bình');
INSERT INTO Location (name) VALUES (N'Hưng Yên');
INSERT INTO Location (name) VALUES (N'Khánh Hòa');
INSERT INTO Location (name) VALUES (N'Kiên Giang');
INSERT INTO Location (name) VALUES (N'Kon Tum');
INSERT INTO Location (name) VALUES (N'Lai Châu');
INSERT INTO Location (name) VALUES (N'Lâm Đồng');
INSERT INTO Location (name) VALUES (N'Lạng Sơn');
INSERT INTO Location (name) VALUES (N'Lào Cai');
INSERT INTO Location (name) VALUES (N'Long An');
INSERT INTO Location (name) VALUES (N'Nam Định');
INSERT INTO Location (name) VALUES (N'Nghệ An');
INSERT INTO Location (name) VALUES (N'Ninh Bình');
INSERT INTO Location (name) VALUES (N'Ninh Thuận');
INSERT INTO Location (name) VALUES (N'Phú Thọ');
INSERT INTO Location (name) VALUES (N'Phú Yên');
INSERT INTO Location (name) VALUES (N'Quảng Bình');
INSERT INTO Location (name) VALUES (N'Quảng Nam');
INSERT INTO Location (name) VALUES (N'Quảng Ngãi');
INSERT INTO Location (name) VALUES (N'Quảng Ninh');
INSERT INTO Location (name) VALUES (N'Quảng Trị');
INSERT INTO Location (name) VALUES (N'Sóc Trăng');
INSERT INTO Location (name) VALUES (N'Sơn La');
INSERT INTO Location (name) VALUES (N'Tây Ninh');
INSERT INTO Location (name) VALUES (N'Thái Bình');
INSERT INTO Location (name) VALUES (N'Thái Nguyên');
INSERT INTO Location (name) VALUES (N'Thanh Hóa');
INSERT INTO Location (name) VALUES (N'Thừa Thiên Huế');
INSERT INTO Location (name) VALUES (N'Tiền Giang');
INSERT INTO Location (name) VALUES (N'TP. Hồ Chí Minh');
INSERT INTO Location (name) VALUES (N'Trà Vinh');
INSERT INTO Location (name) VALUES (N'Tuyên Quang');
INSERT INTO Location (name) VALUES (N'Vĩnh Long');
INSERT INTO Location (name) VALUES (N'Vĩnh Phúc');
INSERT INTO Location (name) VALUES (N'Yên Bái');
