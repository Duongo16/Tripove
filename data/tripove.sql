ALTER TABLE Seat ADD paymentDate datetime NULL;
ALTER TABLE dbo.Seat DROP CONSTRAINT FKSeat850255;
ALTER TABLE dbo.Seat DROP CONSTRAINT FKSeat673167;
ALTER TABLE Seat alter column Accountid int NOT NULL;
ALTER TABLE Seat ADD CONSTRAINT FKSeat673167 FOREIGN KEY (Route_Detailid) REFERENCES Route_Detail (id);
ALTER TABLE Seat ADD CONSTRAINT FKSeat850255 FOREIGN KEY (Accountid) REFERENCES Account (id);
