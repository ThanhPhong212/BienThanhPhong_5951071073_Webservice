CREATE DATABASE BienThanhPhong_5951071073
GO
USE BienThanhPhong_5951071073
GO
CREATE TABLE tbl_Employee
(
	Sr_no INT IDENTITY PRIMARY KEY,
	Emp_name NVARCHAR(500) NOT NULL,
	City NVARCHAR(500),
	STATE NVARCHAR(500),
	Country NVARCHAR(500),
	Department NVARCHAR(500),
	flag NVARCHAR(50)
)
GO
CREATE PROC Sp_Employee
@Emp_name  NVARCHAR(500),
@Sr_no INT,
@City NVARCHAR(500),
@STATE NVARCHAR(500),
@Country NVARCHAR(500),
@Department NVARCHAR(500),
@flag NVARCHAR(50)
AS
BEGIN
    IF(@flag='insert')
	BEGIN
	    INSERT INTO tbl_Employee (Emp_name, City, STATE, Country, Department) 
		VALUES (@Emp_name, @City, @STATE, @Country, @Department)
	END
	ELSE IF (@flag='update')
	BEGIN
	    UPDATE tbl_Employee 
		SET Emp_name=@Emp_name,City=@City,STATE=@STATE,Country=@Country,Department=@Department
		WHERE Sr_no=@Sr_no
	END
	ELSE IF(@flag='delete')
	BEGIN
	    DELETE FROM tbl_Employee
		WHERE Sr_no=@Sr_no
	END
	ELSE IF(@flag='getid')
	BEGIN
	    SELECT*FROM tbl_Employee
		WHERE Sr_no=@Sr_no
	END
	ELSE IF(@flag='get')
	BEGIN
	    SELECT*FROM tbl_Employee
	END
END