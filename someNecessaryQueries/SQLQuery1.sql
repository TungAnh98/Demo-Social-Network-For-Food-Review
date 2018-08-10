CREATE TABLE Category(
	categoryId int IDENTITY(1,1),
	categoryName nvarchar(100)
)
ALTER TABLE Category ADD CONSTRAINT U_categoryName UNIQUE(categoryName)

ALTER TABLE UserLogin ADD CONSTRAINT U_username UNIQUE(username)