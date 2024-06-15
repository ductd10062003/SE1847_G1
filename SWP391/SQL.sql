--Ngày 15/5/2024. Base code đầu tiên nên các bangr vẫn còn thiếu 1 vài thứ

--========================================================================
--Tạo bảng---------------------------
--create database SWP_G1_V2
-- use SWP_G1_V2 select * from Discussion
use SWP_G1_V2
-- Delete all constrains from this database if exist
ALTER TABLE User_Enroll_Course
    DROP CONSTRAINT FKUser_Enrol952811;

ALTER TABLE User_Enroll_Course
    DROP CONSTRAINT FKUser_Enrol369795;

ALTER TABLE flashcard
    DROP CONSTRAINT FKflashcard200337;

ALTER TABLE Result_Detail
    DROP CONSTRAINT FKResult_Det440593;

ALTER TABLE User_Practice
    DROP CONSTRAINT FKUser_Pract87055;

ALTER TABLE User_Practice
    DROP CONSTRAINT FKUser_Pract981078;

ALTER TABLE User_Practice
    DROP CONSTRAINT FKUser_Pract601937;

ALTER TABLE Course
    DROP CONSTRAINT FKCourse13033;

ALTER TABLE Quiz
    DROP CONSTRAINT FKQuiz491781;

ALTER TABLE Quiz
    DROP CONSTRAINT FKQuiz898896;

ALTER TABLE Discussion
    DROP CONSTRAINT FKDiscussi292579;

ALTER TABLE Discussion
    DROP CONSTRAINT FKDiscussi982579;

ALTER TABLE Comment
    DROP CONSTRAINT FKCommentUser;

ALTER TABLE Comment
    DROP CONSTRAINT FKCommentDiscuss;

-- Delete all table if exist
IF OBJECT_ID('User_Enroll_Course', 'U') IS NOT NULL
    DROP TABLE User_Enroll_Course;
IF OBJECT_ID('User_Practice', 'U') IS NOT NULL
    DROP TABLE User_Practice;
IF OBJECT_ID('Type_Of_Practice', 'U') IS NOT NULL
    DROP TABLE Type_Of_Practice;
IF OBJECT_ID('Result_Detail', 'U') IS NOT NULL
    DROP TABLE Result_Detail;
IF OBJECT_ID('Quiz', 'U') IS NOT NULL
    DROP TABLE Quiz;
IF OBJECT_ID('flashcard', 'U') IS NOT NULL
    DROP TABLE flashcard;
IF OBJECT_ID('Discussion', 'U') IS NOT NULL
    DROP TABLE Discussion;
IF OBJECT_ID('DiscussionCategory', 'U') IS NOT NULL
    DROP TABLE DiscussionCategory;
IF OBJECT_ID('Comment', 'U') IS NOT NULL
    DROP TABLE Comment;
IF OBJECT_ID('Course', 'U') IS NOT NULL
    DROP TABLE Course;
IF OBJECT_ID('Category', 'U') IS NOT NULL
    DROP TABLE Category;
IF OBJECT_ID('User', 'U') IS NOT NULL
    DROP TABLE [User];


CREATE TABLE Category
(
    category_id   int IDENTITY  NOT NULL,
    category_name nvarchar(500) NOT NULL UNIQUE,
    create_at     date          NOT NULL,
    update_at     date          NOT NULL,
    active        bit           NOT NULL,
    PRIMARY KEY (category_id)
);
CREATE TABLE Course
(
    course_id   int IDENTITY  NOT NULL,
    course_name nvarchar(500) NOT NULL UNIQUE,
    description nvarchar(500) NOT NULL,
    create_at   date          NOT NULL,
    update_at   date          NOT NULL,
    active      bit           NOT NULL,
    created_by  int           NOT NULL,
    category_id int           NOT NULL,
    PRIMARY KEY (course_id)
);
CREATE TABLE flashcard
(
    flashcard_id int IDENTITY  NOT NULL,
    question     nvarchar(500) NOT NULL UNIQUE,
    answer       nvarchar(500) NOT NULL,
    create_at    date          NOT NULL,
    update_at    date          NOT NULL,
    active       bit           NOT NULL,
    Category_id  int           NOT NULL,
    [image]      nvarchar(500) NULL,
    PRIMARY KEY (flashcard_id)
);
CREATE TABLE Discussion
(
    title       nvarchar(500) NOT NULL,
    content     nvarchar(500) NOT NULL,
    create_at   date          NOT NULL,
    update_at   date          NOT NULL,
    active      bit           NOT NULL,
    user_id     int           NOT NULL,
    discussion_id int IDENTITY NOT NULL,
    category_id int           NOT NULL,
    PRIMARY KEY (discussion_id)
);
CREATE TABLE comment
(
    content    nvarchar(500) NOT NULL,
    user_id    int           NOT NULL,
    Comment_id int IDENTITY  NOT NULL,
    discussion_id int        NOT NULL,
    create_at  date           NOT NULL,
    PRIMARY KEY (Comment_id)
);
CREATE TABLE DiscussionCategory
(
    category_id   int IDENTITY  NOT NULL,
    category_name nvarchar(500) NOT NULL UNIQUE,
    create_at     date          NOT NULL,
    update_at     date          NOT NULL,
    active        bit           NOT NULL,
    PRIMARY KEY (category_id)
);
CREATE TABLE Quiz
(
    course_id    int          NOT NULL,
    flashcard_id int          NOT NULL,
    quiz_id      int IDENTITY NOT NULL,
    PRIMARY KEY (quiz_id)
);

CREATE TABLE Result_Detail
(
    result           float(10)    NOT NULL,
    user_practice_id int          NOT NULL,
    time             int          NOT NULL,
    RD_id            int IDENTITY NOT NULL,
    PRIMARY KEY (RD_id)
);
CREATE TABLE Type_Of_Practice
(
    TOP_id   int IDENTITY  NOT NULL,
    TOP_name nvarchar(500) NOT NULL,
    active   bit           NOT NULL,
    PRIMARY KEY (TOP_id)
);
CREATE TABLE [User]
(
    user_id    int IDENTITY  NOT NULL,
    [name]     nvarchar(100) NOT NULL,
    email      nvarchar(100) NOT NULL UNIQUE,
    [password] nvarchar(100) NOT NULL,
    role       int           NOT NULL,
    active     bit           NOT NULL,
    create_at  date          NOT NULL,
    gender     bit           NULL,
    dob        date          NULL,
    phone      nvarchar(20)  NULL,
    [image]    nvarchar(500) NULL,
    PRIMARY KEY (user_id)
);
CREATE TABLE User_Enroll_Course
(
    user_id   int NOT NULL,
    course_id int NOT NULL,
    status    bit NOT NULL,
    PRIMARY KEY (user_id,
                 course_id)
);
CREATE TABLE User_Practice
(
    user_id          int          NOT NULL,
    course_id        int          NOT NULL,
    TOP_id           int          NOT NULL,
    user_practice_id int IDENTITY NOT NULL,
    PRIMARY KEY (user_practice_id)
);

ALTER TABLE User_Enroll_Course
    ADD CONSTRAINT FKUser_Enrol952811 FOREIGN KEY (user_id) REFERENCES [User] (user_id);
ALTER TABLE User_Enroll_Course
    ADD CONSTRAINT FKUser_Enrol369795 FOREIGN KEY (course_id) REFERENCES Course (course_id);
ALTER TABLE flashcard
    ADD CONSTRAINT FKflashcard200337 FOREIGN KEY (Category_id) REFERENCES Category (category_id);
ALTER TABLE Result_Detail
    ADD CONSTRAINT FKResult_Det440593 FOREIGN KEY (user_practice_id) REFERENCES User_Practice (user_practice_id);
ALTER TABLE User_Practice
    ADD CONSTRAINT FKUser_Pract87055 FOREIGN KEY (TOP_id) REFERENCES Type_Of_Practice (TOP_id);
ALTER TABLE User_Practice
    ADD CONSTRAINT FKUser_Pract981078 FOREIGN KEY (user_id) REFERENCES [User] (user_id);
ALTER TABLE User_Practice
    ADD CONSTRAINT FKUser_Pract601937 FOREIGN KEY (course_id) REFERENCES Course (course_id);
ALTER TABLE Course
    ADD CONSTRAINT FKCourse13033 FOREIGN KEY (category_id) REFERENCES Category (category_id);
ALTER TABLE Quiz
    ADD CONSTRAINT FKQuiz491781 FOREIGN KEY (course_id) REFERENCES Course (course_id);
ALTER TABLE Quiz
    ADD CONSTRAINT FKQuiz898896 FOREIGN KEY (flashcard_id) REFERENCES flashcard (flashcard_id);
ALTER TABLE Discussion
    ADD CONSTRAINT FKDiscussi292579 FOREIGN KEY (category_id) REFERENCES DiscussionCategory (category_id);
ALTER TABLE Discussion
    ADD CONSTRAINT FKDiscussi982579 FOREIGN KEY (user_id) REFERENCES [User] (user_id);
ALTER TABLE Comment
    ADD CONSTRAINT FKCommentUser FOREIGN KEY (user_id) REFERENCES [User] (user_id);
ALTER TABLE Comment
    ADD CONSTRAINT FKCommentDiscuss FOREIGN KEY (discussion_id) REFERENCES Discussion (discussion_id);

-- Tạo user mentor admin =================
-- Tạo user
DECLARE @counter1 INT = 1;

WHILE @counter1 <= 20
    BEGIN
        INSERT INTO [User]([name], email, [password], active, [role], create_at)
        VALUES (CONCAT('user ', @counter1), CONCAT('user', @counter1, '@gmail.com'), '123456', 1, 3,
                CAST(GETDATE() AS DATE));

        SET @counter1 = @counter1 + 1;
    END;

-- Tạo mentor
DECLARE @counter2 INT = 21;

WHILE @counter2 <= 25
    BEGIN
        INSERT INTO [User]([name], email, [password], active, [role], create_at)
        VALUES (CONCAT('mentor ', @counter2), CONCAT('mentor', @counter2, '@gmail.com'), '123456', 1, 2,
                CAST(GETDATE() AS DATE));

        SET @counter2 = @counter2 + 1;
    END;

-- Tạo admin
INSERT INTO [User]([name], email, [password], active, [role], create_at)
VALUES ('admin', CONCAT('admin', '@gmail.com'), '123456', 1, 1, CAST(GETDATE() AS DATE));

-- Tạo category==========================
insert into category(category_name, create_at, update_at, active)
values (N'Cơ thể', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1),
       (N'Quần áo', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1),
       (N'Ẩm thực', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1),
       (N'Động vật', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1),
       (N'Thiên nhiên', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1)


--Tạo flashcard cho Màu Sắc -----------
insert into flashcard(question, answer, create_at, update_at, active, Category_id)
values ('Head', N'Cái đầu', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Neck', N'Cái cổ', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Arm', N'Cánh tay', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Thigh', N'Bắp đùi', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Knee', N'Đầu gối', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Armpit', N'Nách', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Wrist', N'Cổ tay', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Elbow', N'Khuỷu tay', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Chest', N'Ngực', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Hip', N'Hông', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Leg', N'Chân', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Abdomen', N'Bụng', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Finger', N'Ngón tay', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Knuckle', N'Khớp ngón tay', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Fingernail', N'Móng tay', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Thumb', N'Ngón tay cái', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Hand', N'Bàn tay', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Foot', N'Bàn chân', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Heel', N'Gót chân', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 1),
       ('Sleeve', N'Tay áo', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 2),
       ('Shirt', N'Áo sơ mi', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 2),
       ('Collar', N'Cổ áo', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 2),
       ('Pocket', N'Túi (áo,quần)', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 2),
       ('Button', N'Cái khuy (cái nút)', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 2),
       ('Hat', N'Mũ có vành', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 2),
       ('Cap', N'Mũ lưỡi trai', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 2),
       ('Suit', N'Bộ com lê', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 2),
       ('Tie', N'Cà vát', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 2),
       ('Knot', N'Nút (nơ)', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 2),
       ('Vest', N'Áo gi lê', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 2),
       ('T-Shirt', N'Áo phông', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 2),
       ('Pants', N'Quần dài', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 2),
       ('Zip', N'Khóa kéo', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 2)


--Tạo course ===========
insert into Course(course_name, [description], create_at, update_at, active, created_by, category_id)
values (N'Cơ thể con người bài 1', N'Các bộ phận cơ bản trên cơ thể con người phần 1', CAST(GETDATE() AS DATE),
        CAST(GETDATE() AS DATE), 1, 21, 1),
       (N'Cơ thể con người bài 2', N'Các bộ phận cơ bản trên cơ thể con người phần 2', CAST(GETDATE() AS DATE),
        CAST(GETDATE() AS DATE), 1, 22, 1),
       (N'Cơ thể con người bài 3', N'Tổng hợp các bài cơ thể con người', CAST(GETDATE() AS DATE),
        CAST(GETDATE() AS DATE), 1, 22, 1),
       (N'Quần áo bài 1', N'Quần áo cho nam bài 1', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 21, 1),
       (N'Quần áo bài 2', N'Quần áo cho nam bài 2', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 22, 1),
       (N'Quần áo bài 3', N'Tổng hợp các bài quần áo', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 22, 1)

-- Tạo quiz =============
insert into Quiz(course_id, flashcard_id)
values (1, 1),
       (1, 2),
       (1, 3),
       (1, 4),
       (1, 5),
       (1, 6),
       (1, 7),
       (1, 8),
       (1, 9),
       (1, 10),
       (1, 11),
       (1, 12),
       (1, 13),
       (1, 14),
       (2, 8),
       (2, 9),
       (2, 10),
       (2, 11),
       (2, 13),
       (2, 14),
       (2, 15),
       (2, 16),
       (2, 17),
       (2, 18),
       (3, 1),
       (3, 2),
       (3, 3),
       (3, 4),
       (3, 5),
       (3, 6),
       (3, 7),
       (3, 8),
       (3, 9),
       (3, 10),
       (3, 11),
       (3, 12),
       (3, 13),
       (3, 14),
       (3, 15),
       (3, 16),
       (3, 17),
       (3, 18),
       (3, 19),
       (4, 20),
       (4, 21),
       (4, 22),
       (4, 23),
       (4, 24),
       (4, 25),
       (4, 26),
       (4, 27),
       (4, 28),
       (5, 26),
       (5, 27),
       (5, 28),
       (5, 29),
       (5, 30),
       (5, 31),
       (5, 32),
       (5, 33)
-- Tao Category Discussion
insert into DiscussionCategory(category_name, create_at, update_at, active)
values (N'Câu hỏi về cơ thể', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1),
       (N'Câu hỏi về quần áo', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1),
       (N'Câu hỏi về ẩm thực', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1),
       (N'Câu hỏi về động vật', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1),
       (N'Câu hỏi về thiên nhiên', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1)

-- Tạo discussion ===========
INSERT INTO Discussion (title, content, create_at, update_at, active, user_id, category_id)
VALUES
    (N'Câu hỏi về cơ thể và những điều cần biết để duy trì sức khỏe tốt hàng ngày',
     N'Câu hỏi về cơ thể con người, bao gồm các hệ thống cơ quan, các chức năng sinh học và cách duy trì sức khỏe qua việc tập thể dục và ăn uống lành mạnh. Chúng ta sẽ thảo luận về các thói quen tốt và cách phòng tránh bệnh tật.',
     CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 21, 1),

    (N'Câu hỏi về quần áo và xu hướng thời trang hiện nay trong các mùa trong năm',
     N'Câu hỏi về quần áo và xu hướng thời trang, bao gồm các loại trang phục phổ biến, cách phối đồ theo mùa, và các xu hướng thời trang hiện đại. Chúng ta sẽ thảo luận về cách lựa chọn trang phục phù hợp với từng hoàn cảnh và phong cách cá nhân.',
     CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 21, 2),

    (N'Câu hỏi về ẩm thực và các món ăn đặc trưng của các vùng miền khác nhau',
     N'Câu hỏi về ẩm thực, bao gồm các món ăn đặc trưng của các vùng miền khác nhau, các kỹ thuật nấu ăn và cách chế biến các món ăn phổ biến. Chúng ta sẽ thảo luận về cách kết hợp các nguyên liệu để tạo ra các món ăn ngon và bổ dưỡng.',
     CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 21, 3),

    (N'Câu hỏi về động vật và hành vi của chúng trong môi trường tự nhiên và nuôi nhốt',
     N'Câu hỏi về động vật, bao gồm các loài động vật hoang dã và nuôi nhốt, hành vi và sinh thái học của chúng, cũng như cách bảo vệ và bảo tồn các loài động vật quý hiếm. Chúng ta sẽ thảo luận về mối quan hệ giữa con người và động vật.',
     CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 21, 4),

    (N'Câu hỏi về thiên nhiên và cách bảo vệ môi trường sống của chúng ta',
     N'Câu hỏi về thiên nhiên, bao gồm các hệ sinh thái, đa dạng sinh học, và cách bảo vệ môi trường sống của chúng ta. Chúng ta sẽ thảo luận về tác động của con người đến thiên nhiên và các biện pháp để bảo vệ tài nguyên thiên nhiên.',
     CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE), 1, 21, 5);
-- Tạo comment ===========
insert into Comment(content, user_id, discussion_id, create_at)
values (N'Câu trả lời 1', 21, 1, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 2', 22, 1, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 3', 23, 1, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 4', 24, 1, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 5', 25, 1, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 6', 21, 2, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 7', 22, 2, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 8', 23, 2, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 9', 24, 2, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 10', 25, 2, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 11', 21, 3, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 12', 22, 3, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 13', 23, 3, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 14', 24, 3, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 15', 25, 3, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 16', 21, 4, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 17', 22, 4, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 18', 23, 4, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 19', 24, 4, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 20', 25, 4, CAST(GETDATE() AS DATE)),
       (N'Câu trả lời 21', 21, 5, CAST(GETDATE() AS DATE))


