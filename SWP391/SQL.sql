
--Ngày 15/5/2024. Base code đầu tiên nên các bangr vẫn còn thiếu 1 vài thứ

--========================================================================
--Tạo bảng---------------------------
--create database SWP_G1_V2
-- use SWP_G1_V2select * from [User]
use SWP_G1_V2

-- Drop Foreign Key Constraints
IF OBJECT_ID('FK_User_Practice_User', 'F') IS NOT NULL ALTER TABLE User_Practice DROP CONSTRAINT FK_User_Practice_User;
IF OBJECT_ID('FK_User_Practice_Course', 'F') IS NOT NULL ALTER TABLE User_Practice DROP CONSTRAINT FK_User_Practice_Course;
IF OBJECT_ID('FK_User_Practice_Type_Of_Practice', 'F') IS NOT NULL ALTER TABLE User_Practice DROP CONSTRAINT FK_User_Practice_Type_Of_Practice;
IF OBJECT_ID('FK_User_Enroll_Course_User', 'F') IS NOT NULL ALTER TABLE User_Enroll_Course DROP CONSTRAINT FK_User_Enroll_Course_User;
IF OBJECT_ID('FK_User_Enroll_Course_Course', 'F') IS NOT NULL ALTER TABLE User_Enroll_Course DROP CONSTRAINT FK_User_Enroll_Course_Course;
IF OBJECT_ID('FK_Course_Category', 'F') IS NOT NULL ALTER TABLE Course DROP CONSTRAINT FK_Course_Category;
IF OBJECT_ID('FK_Flashcard_Category', 'F') IS NOT NULL ALTER TABLE Flashcard DROP CONSTRAINT FK_Flashcard_Category;
IF OBJECT_ID('FK_Quiz_Course', 'F') IS NOT NULL ALTER TABLE Quiz DROP CONSTRAINT FK_Quiz_Course;
IF OBJECT_ID('FK_Quiz_Flashcard', 'F') IS NOT NULL ALTER TABLE Quiz DROP CONSTRAINT FK_Quiz_Flashcard;
IF OBJECT_ID('FK_Comment_User', 'F') IS NOT NULL ALTER TABLE Comment DROP CONSTRAINT FK_Comment_User;
IF OBJECT_ID('FK_Reply_Comment', 'F') IS NOT NULL ALTER TABLE Reply DROP CONSTRAINT FK_Reply_Comment;

-- Drop tables if they exist
IF OBJECT_ID('User_Enroll_Course', 'U') IS NOT NULL DROP TABLE User_Enroll_Course;
IF OBJECT_ID('User_Practice', 'U') IS NOT NULL DROP TABLE User_Practice;
IF OBJECT_ID('Quiz', 'U') IS NOT NULL DROP TABLE Quiz;
IF OBJECT_ID('Comment', 'U') IS NOT NULL DROP TABLE Comment;
IF OBJECT_ID('Reply', 'U') IS NOT NULL DROP TABLE Reply;
IF OBJECT_ID('Result_Detail', 'U') IS NOT NULL DROP TABLE Result_Detail;
IF OBJECT_ID('Message', 'U') IS NOT NULL DROP TABLE Message;
IF OBJECT_ID('Flashcard', 'U') IS NOT NULL DROP TABLE Flashcard;
IF OBJECT_ID('Course', 'U') IS NOT NULL DROP TABLE Course;
IF OBJECT_ID('Category', 'U') IS NOT NULL DROP TABLE Category;
IF OBJECT_ID('Type_Of_Practice', 'U') IS NOT NULL DROP TABLE Type_Of_Practice;
IF OBJECT_ID('[User]', 'U') IS NOT NULL DROP TABLE [User];
CREATE TABLE Category (
  category_id      int IDENTITY NOT NULL, 
  category_name    nvarchar(500) NOT NULL UNIQUE, 
  create_at     date NOT NULL, 
  update_at date NOT NULL, 
  active           bit NOT NULL, 
  PRIMARY KEY (category_id));
CREATE TABLE Comment (
  content    nvarchar(500) NOT NULL,  
  user_id    int NOT NULL, 
  Comment_id int IDENTITY NOT NULL, 
  create_at  int NOT NULL, 
  PRIMARY KEY (Comment_id));
CREATE TABLE Course (
  course_id   int IDENTITY NOT NULL, 
  course_name nvarchar(500) NOT NULL UNIQUE, 
  description nvarchar(500) NOT NULL, 
  create_at  date NOT NULL, 
  update_at   date NOT NULL, 
  active      bit NOT NULL, 
  created_by  int NOT NULL, 
  category_id int NOT NULL, 
  PRIMARY KEY (course_id));
CREATE TABLE flashcard (
  flashcard_id int IDENTITY NOT NULL, 
  question     nvarchar(500) NOT NULL UNIQUE, 
  answer       nvarchar(500) NOT NULL, 
  create_at    date NOT NULL, 
  update_at    date NOT NULL, 
  active       bit NOT NULL, 
  Category_id  int NOT NULL, 
  [image]        nvarchar(500) NULL, 
  PRIMARY KEY (flashcard_id));
CREATE TABLE Message (
  messager   int NOT NULL, 
  content    nvarchar(500) NOT NULL, 
  receiver   int NOT NULL, 
  message_id int IDENTITY NOT NULL, 
  create_at  date NOT NULL, 
  PRIMARY KEY (message_id));
CREATE TABLE Quiz (
  course_id    int NOT NULL, 
  flashcard_id int NOT NULL, 
  quiz_id      int IDENTITY NOT NULL, 
  PRIMARY KEY (quiz_id));
CREATE TABLE reply (
  reply_id  int IDENTITY NOT NULL, 
  user_id   int NOT NULL, 
  reply_for int NOT NULL, 
  content   nvarchar(500) NOT NULL, 
  PRIMARY KEY (reply_id));
CREATE TABLE Result_Detail (
  result           float(10) NOT NULL, 
  user_practice_id int NOT NULL, 
  time             int NOT NULL, 
  RD_id            int IDENTITY NOT NULL, 
  PRIMARY KEY (RD_id));
CREATE TABLE Type_Of_Practice (
  TOP_id   int IDENTITY NOT NULL, 
  TOP_name nvarchar(500) NOT NULL, 
  active   bit NOT NULL, 
  PRIMARY KEY (TOP_id));
CREATE TABLE [User] (
  user_id   int IDENTITY NOT NULL, 
  [name]      nvarchar(100) NOT NULL, 
  email     nvarchar(100) NOT NULL UNIQUE, 
  [password]  nvarchar(100) NOT NULL,
  role      int NOT NULL, 
  active    bit NOT NULL, 
  create_at date NOT NULL, 
  gender    bit NULL, 
  dob       date NULL, 
  phone     nvarchar(20) NULL, 
  [image]     nvarchar(500) NULL, 
  PRIMARY KEY (user_id));
CREATE TABLE User_Enroll_Course (
  user_id   int NOT NULL, 
  course_id int NOT NULL, 
  status    bit NOT NULL, 
  PRIMARY KEY (user_id, 
  course_id));
CREATE TABLE User_Practice (
  user_id          int NOT NULL, 
  course_id        int NOT NULL, 
  TOP_id           int NOT NULL, 
  user_practice_id int IDENTITY NOT NULL, 
  PRIMARY KEY (user_practice_id));
ALTER TABLE User_Enroll_Course ADD CONSTRAINT FKUser_Enrol952811 FOREIGN KEY (user_id) REFERENCES [User] (user_id);
ALTER TABLE User_Enroll_Course ADD CONSTRAINT FKUser_Enrol369795 FOREIGN KEY (course_id) REFERENCES Course (course_id);
ALTER TABLE flashcard ADD CONSTRAINT FKflashcard200337 FOREIGN KEY (Category_id) REFERENCES Category (category_id);
ALTER TABLE Message ADD CONSTRAINT FKMessage999432 FOREIGN KEY (messager) REFERENCES [User] (user_id);
ALTER TABLE Message ADD CONSTRAINT FKMessage373202 FOREIGN KEY (receiver) REFERENCES [User] (user_id);
ALTER TABLE Comment ADD CONSTRAINT FKComment537259 FOREIGN KEY (user_id) REFERENCES [User] (user_id);
ALTER TABLE Result_Detail ADD CONSTRAINT FKResult_Det440593 FOREIGN KEY (user_practice_id) REFERENCES User_Practice (user_practice_id);
ALTER TABLE User_Practice ADD CONSTRAINT FKUser_Pract87055 FOREIGN KEY (TOP_id) REFERENCES Type_Of_Practice (TOP_id);
ALTER TABLE User_Practice ADD CONSTRAINT FKUser_Pract981078 FOREIGN KEY (user_id) REFERENCES [User] (user_id);
ALTER TABLE User_Practice ADD CONSTRAINT FKUser_Pract601937 FOREIGN KEY (course_id) REFERENCES Course (course_id);
ALTER TABLE Course ADD CONSTRAINT FKCourse13033 FOREIGN KEY (category_id) REFERENCES Category (category_id);
ALTER TABLE Quiz ADD CONSTRAINT FKQuiz491781 FOREIGN KEY (course_id) REFERENCES Course (course_id);
ALTER TABLE Quiz ADD CONSTRAINT FKQuiz898896 FOREIGN KEY (flashcard_id) REFERENCES flashcard (flashcard_id);
ALTER TABLE reply ADD CONSTRAINT FKreply731631 FOREIGN KEY (reply_for) REFERENCES Comment (Comment_id);

-- Tạo user mentor admin =================
-- Tạo user
DECLARE @counter1 INT = 1;

WHILE @counter1 <= 20
BEGIN
    INSERT INTO [User]([name],email,[password],active,[role],create_at)
    VALUES (CONCAT('user ', @counter1),CONCAT('user',@counter1,'@gmail.com'),'123456',1,3,CAST(GETDATE() AS DATE));
    
    SET @counter1 = @counter1 + 1;
END;

-- Tạo mentor
DECLARE @counter2 INT = 21;

WHILE @counter2 <= 25
BEGIN
    INSERT INTO [User]([name],email,[password],active,[role],create_at)
    VALUES (CONCAT('mentor ', @counter2),CONCAT('mentor',@counter2,'@gmail.com'),'123456',1,2,CAST(GETDATE() AS DATE));
    
    SET @counter2 = @counter2 + 1;
END;

-- Tạo admin
INSERT INTO [User]([name],email,[password],active,[role],create_at)
    VALUES ('admin',CONCAT('admin','@gmail.com'),'123456',1,1,CAST(GETDATE() AS DATE));

-- Tạo category==========================
insert into category(category_name,create_at,update_at,active)
values	(N'Cơ thể',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1),
	(N'Quần áo',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1),
	(N'Ẩm thực',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1),
	(N'Động vật',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1),
	(N'Thiên nhiên',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1)


--Tạo flashcard cho Màu Sắc -----------
insert into flashcard(question,answer,create_at,update_at,active,Category_id)
values('Head',N'Cái đầu',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Neck',N'Cái cổ',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Arm',N'Cánh tay',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Thigh',N'Bắp đùi',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Knee',N'Đầu gối',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Armpit',N'Nách',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Wrist',N'Cổ tay',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Elbow',N'Khuỷu tay',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Chest',N'Ngực',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Hip',N'Hông',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Leg',N'Chân',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Abdomen',N'Bụng',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Finger',N'Ngón tay',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Knuckle',N'Khớp ngón tay',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Fingernail',N'Móng tay',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Thumb',N'Ngón tay cái',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Hand',N'Bàn tay',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Foot',N'Bàn chân',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Heel',N'Gót chân',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,1),
	('Sleeve',N'Tay áo',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,2),
	('Shirt',N'Áo sơ mi',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,2),
	('Collar',N'Cổ áo',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,2),
	('Pocket',N'Túi (áo,quần)',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,2),
	('Button',N'Cái khuy (cái nút)',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,2),
	('Hat',N'Mũ có vành',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,2),
	('Cap',N'Mũ lưỡi trai',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,2),
	('Suit',N'Bộ com lê',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,2),
	('Tie',N'Cà vát',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,2),
	('Knot',N'Nút (nơ)',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,2),
	('Vest',N'Áo gi lê',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,2),
	('T-Shirt',N'Áo phông',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,2),
	('Pants',N'Quần dài',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,2),
	('Zip',N'Khóa kéo',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,2)

	


--Tạo course ===========
insert into Course(course_name,[description],create_at,update_at,active,created_by, category_id)
values (N'Cơ thể con người bài 1', N'Các bộ phận cơ bản trên cơ thể con người phần 1',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,21,1),
	(N'Cơ thể con người bài 2', N'Các bộ phận cơ bản trên cơ thể con người phần 2',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,22,1),
	(N'Cơ thể con người bài 3', N'Tổng hợp các bài cơ thể con người',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,22,1),
	(N'Quần áo bài 1', N'Quần áo cho nam bài 1',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,21,1),
	(N'Quần áo bài 2', N'Quần áo cho nam bài 2',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,22,1),
	(N'Quần áo bài 3', N'Tổng hợp các bài quần áo',CAST(GETDATE() AS DATE),CAST(GETDATE() AS DATE),1,22,1)

-- Tạo quiz =============
insert into Quiz(course_id, flashcard_id)
values (1, 1),(1,2),(1,3),(1, 4),(1, 5),(1, 6),(1, 7),(1,8),(1,9),(1, 10),(1, 11),(1, 12),(1,13),(1,14),
	(2,8),(2,9),(2,10),(2,11),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),
	(3, 1),(3,2),(3,3),(3, 4),(3, 5),(3,6),(3,7),(3,8),(3,9),(3,10),(3, 11),(3,12),(3,13),(3,14),(3,15),(3,16),
	(3,17),(3,18),(3,19),
	(4,20),(4,21),(4,22),(4,23),(4,24),(4,25),(4,26),(4,27),(4,28),
	(5,26),(5,27),(5,28),(5,29),(5,30),(5,31),(5,32),(5,33)

	
