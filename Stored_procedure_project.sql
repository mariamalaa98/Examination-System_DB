Use ITIsys;
--- insert into Branch:
CREATE PROCEDURE Create_branch @name varchar(100)
As
Begin
begin try
insert into Branches values(@name)
End try
Begin catch 
select ERROR_MESSAGE() as ErrorMessage;
END catch
End;
execute Create_branch @name= ".net";
SELECT * FROM Branches;

----Update branch:
Create procedure Update_Branch @id int, @name varchar(100)
As
 begin
 Begin try
update Branches set BranchName=@name where BranchID =@id;
End try
Begin catch
select ERROR_MESSAGE() as ErrorMessage;
END catch
End;
execute Update_Branch @id=2, @name="Alex";
--------Select:
Create procedure select_Branch @id int
As
 begin
 Begin try
select * from Branches where BranchID =@id;
End try
Begin catch
select ERROR_MESSAGE() as ErrorMessage;
END catch
End;
execute select_Branch @id=1
----------------Delete Branch
Create procedure Delete_Branch @id int
As
 begin
 Begin try
delete  Branches where BranchID =@id;
End try
Begin catch
select ERROR_MESSAGE() as ErrorMessage;
END catch
End;
execute Delete_Branch @id=3;
execute select_Branch @id=5;
-----------------Track Table---------------------
 ----insert into track------
 Create procedure insert_track @Branchid int, @trackname varchar(100)
As
 begin
 Begin try
insert into Tracks values(@Branchid,@trackname);
End try
Begin catch
select ERROR_MESSAGE() as ErrorMessage;
END catch
End;
 execute Create_branch @name="pd";
  execute select_Branch @id=2;
execute insert_track @Branchid=2, @trackname=Pd;
------Update track name---
Create procedure Update_Track_Name @id int, @name varchar(100)
As
 begin
 Begin try
update Tracks set TrackName=@name where TrackID =@id;
End try
Begin catch
select ERROR_MESSAGE() as ErrorMessage;
END catch
End;
execute Update_Track_Name @id=2, @name="opensource";
------Update track branch---
Create procedure Update_Track_Branch @id int, @barnch int
As
 begin
 Begin try
update Tracks set BranchID=@barnch where TrackID =@id;
End try
Begin catch
select ERROR_MESSAGE() as ErrorMessage;
END catch
End;
Execute Update_Track_Branch @id=3, @barnch=5
-----------select
Create procedure select_Track @id int
As
 begin
 Begin try
select * from Tracks where TrackID=@id;
End try
Begin catch
select ERROR_MESSAGE() as ErrorMessage;
END catch
End;
execute select_Track @id=3
-------------Delete
Create procedure Delete_track @id int
As
 begin
 Begin try
delete  Tracks where TrackID =@id;
End try
Begin catch
select ERROR_MESSAGE() as ErrorMessage;
END catch
End;
execute Delete_track @id=3;

------------------Course--------------
--------------Insert Course
Create procedure insert_Course @trackid int, @crsname varchar(100)
As
 begin
 Begin try
insert into Courses values(@trackid,@crsname);
End try
Begin catch
select ERROR_MESSAGE() as ErrorMessage;
END catch
End;
 execute insert_Course @trackid=4,@crsname=DataScience;
 --------------update course name
 Create procedure Update_course_Name @id int, @name varchar(100)
As
 begin
 Begin try
update Courses set CourseName=@name where CourseID =@id;
End try
Begin catch
select ERROR_MESSAGE() as ErrorMessage;
END catch
End;
Execute Update_course_Name @id=2, @name="DS";
-------------Update Course track
Create procedure Update_Course_track @id int, @track int
As
 begin
 Begin try
update Courses set TrackID=@track where CourseID =@id;
End try
Begin catch
select ERROR_MESSAGE() as ErrorMessage;
END catch
End;
Execute Update_Course_track @id=2, @track=5;---mfe4 track id bta3o 5
-----------------select
Create procedure select_Course @id int
As
 begin
 Begin try
select * from Courses where CourseID=@id;
End try
Begin catch
select ERROR_MESSAGE() as ErrorMessage;
END catch
End;
Execute select_Course @id=2
-------------Delete
Create procedure Delete_Course @id int
As
 begin
 Begin try
delete  Courses where CourseID =@id;
End try
Begin catch
select ERROR_MESSAGE() as ErrorMessage;
END catch
End;
execute Delete_track @id=2;

----------------------------Instructor------------------------------
-------------- Insert Instructor
CREATE PROCEDURE insert_Instructor 
    @BranchID int, 
    @TrackID int, 
    @InstructorName varchar(100), 
    @Email varchar(100) = NULL
AS
BEGIN
    BEGIN TRY
        INSERT INTO Instructors (BranchID, TrackID, InstructorName, Email)
        VALUES (@BranchID, @TrackID, @InstructorName, @Email);
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC insert_Instructor @BranchID=2, @TrackID=4, @InstructorName='John Doe', @Email='john.doe@example.com';

-------------- Update Instructor Name
CREATE PROCEDURE Update_Instructor_Name 
    @InstructorID int, 
    @InstructorName varchar(100)
AS
BEGIN
    BEGIN TRY
        UPDATE Instructors 
        SET InstructorName = @InstructorName 
        WHERE InstructorID = @InstructorID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
EXEC Update_Instructor_Name @InstructorID=1, @InstructorName='Jane Doe';

-------------- Update Instructor Branch
CREATE PROCEDURE Update_Instructor_Branch 
    @InstructorID int, 
    @BranchID int
AS
BEGIN
    BEGIN TRY
        UPDATE Instructors 
        SET BranchID = @BranchID 
        WHERE InstructorID = @InstructorID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC Update_Instructor_Branch @InstructorID=1, @BranchID=2;

-------------- Update Instructor Track
CREATE PROCEDURE Update_Instructor_Track 
    @InstructorID int, 
    @TrackID int
AS
BEGIN
    BEGIN TRY
        UPDATE Instructors 
        SET TrackID = @TrackID 
        WHERE InstructorID = @InstructorID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC Update_Instructor_Track @InstructorID=1, @TrackID=5;

-------------- Select Instructor
CREATE PROCEDURE select_Instructor 
    @InstructorID int
AS
BEGIN
    BEGIN TRY
        SELECT * FROM Instructors WHERE InstructorID = @InstructorID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC select_Instructor @InstructorID=2;

-------------- Delete Instructor
CREATE PROCEDURE Delete_Instructor 
    @InstructorID int
AS
BEGIN
    BEGIN TRY
        DELETE FROM Instructors WHERE InstructorID = @InstructorID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC Delete_Instructor @InstructorID=1;

----------------------Students----------------------------------------
-------------- Insert Student
CREATE PROCEDURE insert_Student 
    @BranchID int, 
    @TrackID int, 
    @StudentName varchar(100), 
    @Email varchar(100) = NULL
AS
BEGIN
    BEGIN TRY
        INSERT INTO Students (BranchID, TrackID, StudentName, Email)
        VALUES (@BranchID, @TrackID, @StudentName, @Email);
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC insert_Student @BranchID=2, @TrackID=4, @StudentName='Alice Smith', @Email='alice.smith@example.com';

-------------- Update Student Name
CREATE PROCEDURE Update_Student_Name 
    @StudentID int, 
    @StudentName varchar(100)
AS
BEGIN
    BEGIN TRY
        UPDATE Students 
        SET StudentName = @StudentName 
        WHERE StudentID = @StudentID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC Update_Student_Name @StudentID=1, @StudentName='Bob Johnson';

-------------- Update Student Branch
CREATE PROCEDURE Update_Student_Branch 
    @StudentID int, 
    @BranchID int
AS
BEGIN
    BEGIN TRY
        UPDATE Students 
        SET BranchID = @BranchID 
        WHERE StudentID = @StudentID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC Update_Student_Branch @StudentID=1, @BranchID=2;

-------------- Update Student Track
CREATE PROCEDURE Update_Student_Track 
    @StudentID int, 
    @TrackID int
AS
BEGIN
    BEGIN TRY
        UPDATE Students 
        SET TrackID = @TrackID 
        WHERE StudentID = @StudentID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC Update_Student_Track @StudentID=1, @TrackID=5;

-------------- Select Student
CREATE PROCEDURE select_Student 
    @StudentID int
AS
BEGIN
    BEGIN TRY
        SELECT * FROM Students WHERE StudentID = @StudentID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
-- Execute example
EXEC select_Student @StudentID=1;

-------------- Delete Student
CREATE PROCEDURE Delete_Student 
    @StudentID int
AS
BEGIN
    BEGIN TRY
        DELETE FROM Students WHERE StudentID = @StudentID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC Delete_Student @StudentID=1;

------------------studentAnswer-------------------------------
-------------- Insert Student Answer
CREATE PROCEDURE insert_StudentAnswer 
    @SubmissionID int, 
    @QuestionID int, 
    @StudentAnswer char(1)
AS
BEGIN
    BEGIN TRY
        INSERT INTO StudentAnswers (SubmissionID, QuestionID, StudentAnswer)
        VALUES (@SubmissionID, @QuestionID, @StudentAnswer);
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC insert_StudentAnswer @SubmissionID=1, @QuestionID=2, @StudentAnswer='A';

-------------- Update Student Answer
CREATE PROCEDURE Update_StudentAnswer 
    @SubmissionID int, 
    @QuestionID int, 
    @StudentAnswer char(1)
AS
BEGIN
    BEGIN TRY
        UPDATE StudentAnswers 
        SET StudentAnswer = @StudentAnswer 
        WHERE SubmissionID = @SubmissionID AND QuestionID = @QuestionID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC Update_StudentAnswer @SubmissionID=1, @QuestionID=2, @StudentAnswer='B';

-------------- Select Student Answer
CREATE PROCEDURE select_StudentAnswer 
    @SubmissionID int, 
    @QuestionID int
AS
BEGIN
    BEGIN TRY
        SELECT * FROM StudentAnswers 
        WHERE SubmissionID = @SubmissionID AND QuestionID = @QuestionID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC select_StudentAnswer @SubmissionID=1, @QuestionID=2;

-------------- Delete Student Answer
CREATE PROCEDURE Delete_StudentAnswer 
    @SubmissionID int, 
    @QuestionID int
AS
BEGIN
    BEGIN TRY
        DELETE FROM StudentAnswers 
        WHERE SubmissionID = @SubmissionID AND QuestionID = @QuestionID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC Delete_StudentAnswer @SubmissionID=1, @QuestionID=2;


----------------QuestionBank------------------------------------
-------------- Insert Question
CREATE PROCEDURE insert_Question 
    @CourseID int, 
    @QuestionText varchar(max), 
    @QuestionType varchar(10), 
    @ModelAnswer char(1), 
    @Points int
AS
BEGIN
    BEGIN TRY
        INSERT INTO QuestionBank (CourseID, QuestionText, QuestionType, ModelAnswer, Points)
        VALUES (@CourseID, @QuestionText, @QuestionType, @ModelAnswer, @Points);
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC insert_Question @CourseID=1, @QuestionText='What is SQL?', @QuestionType='MCQ', @ModelAnswer='A', @Points=10;

-------------- Update Question Text
CREATE PROCEDURE Update_Question_Text 
    @QuestionID int, 
    @QuestionText varchar(max)
AS
BEGIN
    BEGIN TRY
        UPDATE QuestionBank 
        SET QuestionText = @QuestionText 
        WHERE QuestionID = @QuestionID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
EXEC Update_Question_Text @QuestionID=1, @QuestionText='What is a database?';

-------------- Update Question Type
CREATE PROCEDURE Update_Question_Type 
    @QuestionID int, 
    @QuestionType varchar(10)
AS
BEGIN
    BEGIN TRY
        UPDATE QuestionBank 
        SET QuestionType = @QuestionType 
        WHERE QuestionID = @QuestionID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC Update_Question_Type @QuestionID=1, @QuestionType='Essay';

-------------- Update Model Answer
CREATE PROCEDURE Update_Model_Answer 
    @QuestionID int, 
    @ModelAnswer char(1)
AS
BEGIN
    BEGIN TRY
        UPDATE QuestionBank 
        SET ModelAnswer = @ModelAnswer 
        WHERE QuestionID = @QuestionID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC Update_Model_Answer @QuestionID=1, @ModelAnswer='B';

-------------- Update Question Points
CREATE PROCEDURE Update_Question_Points 
    @QuestionID int, 
    @Points int
AS
BEGIN
    BEGIN TRY
        UPDATE QuestionBank 
        SET Points = @Points 
        WHERE QuestionID = @QuestionID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC Update_Question_Points @QuestionID=1, @Points=15;

-------------- Select Question
CREATE PROCEDURE select_Question 
    @QuestionID int
AS
BEGIN
    BEGIN TRY
        SELECT * FROM QuestionBank WHERE QuestionID = @QuestionID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC select_Question @QuestionID=1;

-------------- Delete Question
CREATE PROCEDURE Delete_Question 
    @QuestionID int
AS
BEGIN
    BEGIN TRY
        DELETE FROM QuestionBank WHERE QuestionID = @QuestionID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC Delete_Question @QuestionID=1;
-------------------------ExamSubmission-------------
-------------- Insert Exam Submission
CREATE PROCEDURE insert_ExamSubmission 
    @ExamID int, 
    @StudentID int, 
    @SubmissionDate datetime, 
    @Score decimal(5,2) = NULL
AS
BEGIN
    BEGIN TRY
        INSERT INTO ExamSubmissions (ExamID, StudentID, SubmissionDate, Score)
        VALUES (@ExamID, @StudentID, @SubmissionDate, @Score);
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC insert_ExamSubmission @ExamID=1, @StudentID=2, @SubmissionDate='2023-10-01 10:00:00', @Score=85.50;

-------------- Update Exam Submission Score
CREATE PROCEDURE Update_ExamSubmission_Score 
    @SubmissionID int, 
    @Score decimal(5,2)
AS
BEGIN
    BEGIN TRY
        UPDATE ExamSubmissions 
        SET Score = @Score 
        WHERE SubmissionID = @SubmissionID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC Update_ExamSubmission_Score @SubmissionID=1, @Score=90.00;

-------------- Update Exam Submission Date
CREATE PROCEDURE Update_ExamSubmission_Date 
    @SubmissionID int, 
    @SubmissionDate datetime
AS
BEGIN
    BEGIN TRY
        UPDATE ExamSubmissions 
        SET SubmissionDate = @SubmissionDate 
        WHERE SubmissionID = @SubmissionID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC Update_ExamSubmission_Date @SubmissionID=1, @SubmissionDate='2023-10-02 11:00:00';

-------------- Select Exam Submission
CREATE PROCEDURE select_ExamSubmission 
    @SubmissionID int
AS
BEGIN
    BEGIN TRY
        SELECT * FROM ExamSubmissions WHERE SubmissionID = @SubmissionID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC select_ExamSubmission @SubmissionID=1;

-------------- Delete Exam Submission
CREATE PROCEDURE Delete_ExamSubmission 
    @SubmissionID int
AS
BEGIN
    BEGIN TRY
        DELETE FROM ExamSubmissions WHERE SubmissionID = @SubmissionID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

EXEC Delete_ExamSubmission @SubmissionID=1;


-------------------Exams------------------
-------------- Insert Exam
CREATE PROCEDURE insert_Exam 
    @CourseID int, 
    @ExamDate datetime
AS
BEGIN
    BEGIN TRY
        INSERT INTO Exams (CourseID, ExamDate)
        VALUES (@CourseID, @ExamDate);
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
-- Execute example
-- EXEC insert_Exam @CourseID=1, @ExamDate='2023-10-15 09:00:00';

-------------- Update Exam Date
CREATE PROCEDURE Update_Exam_Date 
    @ExamID int, 
    @ExamDate datetime
AS
BEGIN
    BEGIN TRY
        UPDATE Exams 
        SET ExamDate = @ExamDate 
        WHERE ExamID = @ExamID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
-- Execute example
-- EXEC Update_Exam_Date @ExamID=1, @ExamDate='2023-10-16 10:00:00';

-------------- Select Exam
CREATE PROCEDURE select_Exam 
    @ExamID int
AS
BEGIN
    BEGIN TRY
        SELECT * FROM Exams WHERE ExamID = @ExamID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
-- Execute example
-- EXEC select_Exam @ExamID=1;

-------------- Delete Exam
CREATE PROCEDURE Delete_Exam 
    @ExamID int
AS
BEGIN
    BEGIN TRY
        DELETE FROM Exams WHERE ExamID = @ExamID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
-- Execute example
-- EXEC Delete_Exam @ExamID=1;


-----------ExamQuestions-------------------
-------------- Insert Exam Question
CREATE PROCEDURE insert_ExamQuestion 
    @ExamID int, 
    @QuestionID int
AS
BEGIN
    BEGIN TRY
        INSERT INTO ExamQuestions (ExamID, QuestionID)
        VALUES (@ExamID, @QuestionID);
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
-- Execute example
-- EXEC insert_ExamQuestion @ExamID=1, @QuestionID=2;

-------------- Select Exam Questions
CREATE PROCEDURE select_ExamQuestions 
    @ExamID int
AS
BEGIN
    BEGIN TRY
        SELECT * FROM ExamQuestions WHERE ExamID = @ExamID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
-- Execute example
-- EXEC select_ExamQuestions @ExamID=1;

-------------- Delete Exam Question
CREATE PROCEDURE Delete_ExamQuestion 
    @ExamID int, 
    @QuestionID int
AS
BEGIN
    BEGIN TRY
        DELETE FROM ExamQuestions 
        WHERE ExamID = @ExamID AND QuestionID = @QuestionID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
-- Execute example
-- EXEC Delete_ExamQuestion @ExamID=1, @QuestionID=2;



-----------------choice---------------------
-------------- Insert Choice
CREATE PROCEDURE insert_Choice 
    @QuestionID int, 
    @ChoiceLetter char(1), 
    @ChoiceText varchar(max)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Choices (QuestionID, ChoiceLetter, ChoiceText)
        VALUES (@QuestionID, @ChoiceLetter, @ChoiceText);
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
-- Execute example
-- EXEC insert_Choice @QuestionID=1, @ChoiceLetter='A', @ChoiceText='This is choice A';

-------------- Update Choice Text
CREATE PROCEDURE Update_Choice_Text 
    @ChoiceID int, 
    @ChoiceText varchar(max)
AS
BEGIN
    BEGIN TRY
        UPDATE Choices 
        SET ChoiceText = @ChoiceText 
        WHERE ChoiceID = @ChoiceID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
-- Execute example
-- EXEC Update_Choice_Text @ChoiceID=1, @ChoiceText='This is updated choice A';

-------------- Update Choice Letter
CREATE PROCEDURE Update_Choice_Letter 
    @ChoiceID int, 
    @ChoiceLetter char(1)
AS
BEGIN
    BEGIN TRY
        UPDATE Choices 
        SET ChoiceLetter = @ChoiceLetter 
        WHERE ChoiceID = @ChoiceID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
-- Execute example
-- EXEC Update_Choice_Letter @ChoiceID=1, @ChoiceLetter='B';

-------------- Select Choice
CREATE PROCEDURE select_Choice 
    @ChoiceID int
AS
BEGIN
    BEGIN TRY
        SELECT * FROM Choices WHERE ChoiceID = @ChoiceID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
-- Execute example
-- EXEC select_Choice @ChoiceID=1;

-------------- Delete Choice
CREATE PROCEDURE Delete_Choice 
    @ChoiceID int
AS
BEGIN
    BEGIN TRY
        DELETE FROM Choices WHERE ChoiceID = @ChoiceID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
-- Execute example
-- EXEC Delete_Choice @ChoiceID=1;


CREATE PROCEDURE GenerateExam
    @CourseName NVARCHAR(255),
    @NumMCQ INT,
    @NumTF INT
AS
BEGIN
    DECLARE @CourseID INT, @ExamID INT;

    -- Get Course ID
    SELECT @CourseID = CourseID FROM Courses WHERE CourseName = @CourseName;
    
    -- Ensure Course Exists
    IF @CourseID IS NULL
    BEGIN
        PRINT 'Course not found';
        RETURN;
    END

    -- Insert a new exam record
    INSERT INTO Exams (CourseID, ExamDate)
    VALUES (@CourseID, GETDATE());

    -- Get the newly created Exam ID
    SET @ExamID = SCOPE_IDENTITY();

    -- Insert MCQ Questions
 -- Insert MCQ Questions
INSERT INTO ExamQuestions (ExamID, QuestionID)
SELECT @ExamID, QuestionID  -- Now selecting both ExamID and QuestionID
FROM QuestionBank
WHERE QuestionType = 'MCQ' AND CourseID = @CourseID
ORDER BY NEWID()
OFFSET 0 ROWS FETCH NEXT @NumMCQ ROWS ONLY; -- Ensures we fetch the required number of questions
  
-- Insert True/False Questions
INSERT INTO ExamQuestions (ExamID, QuestionID)
SELECT @ExamID, QuestionID  -- Now selecting both ExamID and QuestionID
FROM QuestionBank
WHERE QuestionType = 'TrueFalse' AND CourseID = @CourseID
ORDER BY NEWID()
OFFSET 0 ROWS FETCH NEXT @NumTF ROWS ONLY;
 -- Use OFFSET-FETCH for better compatibility
 -- Random selection

    PRINT 'Exam generated successfully with ExamID: ' + CAST(@ExamID AS NVARCHAR);
END;


CREATE PROCEDURE GetModelAnswersByExam
    @ExamID INT
AS
BEGIN
    SELECT 
        EQ.ExamID,
        QB.QuestionID,
        QB.QuestionText,
        QB.QuestionType,
        CASE 
            WHEN QB.QuestionType IN ('MCQ', 'True/False') THEN C.ChoiceText
            ELSE QB.ModelAnswer 
        END AS ModelAnswer
    FROM ExamQuestions EQ
    JOIN QuestionBank QB ON EQ.QuestionID = QB.QuestionID
    LEFT JOIN Choices C ON QB.QuestionID = C.QuestionID 
        AND C.ChoiceLetter = QB.ModelAnswer -- Match the correct choice
    WHERE EQ.ExamID = @ExamID;
END;
 declare @Student_answer

select ExamID,ModelAnswer From  ExamSubmissions ES join StudentAnswers sa
on ES.SubmissionID=sa.SubmissionID  
join QuestionBank QB on QB.QuestionID =sa.QuestionID



----------------------------------
Create procedure correctio @StId INt
AS
declare @Studentanswer table
declare @modelanswer table
declare @cout_of_all_Questions int;
declare @couter=0;
 


 select  @Studentanswer=SA.StudentAnswer, SA.QuestionID 
 from ExamSubmissions ES 
 join StudentAnswers SA on ES.SubmissionID = SA.SubmissionID

 SELECT 
         @modelanswer=QB.ModelAnswer
        CASE 
            WHEN QB.QuestionType IN ('MCQ', 'True/False') THEN C.ChoiceText
            ELSE QB.ModelAnswer 
        END AS ModelAnswer
    FROM ExamQuestions EQ
    JOIN QuestionBank QB ON EQ.QuestionID = QB.QuestionID
    LEFT JOIN Choices C ON QB.QuestionID = C.QuestionID 
        AND C.ChoiceLetter = QB.ModelAnswer
    WHERE EQ.ExamID = @ExamID;
	for(int i=0;i<@studentanswer.length;i++){
	 if(@studentanswer==@model answe)
	 count++;}
	 declare @grade=count/@cout_of_all_Questions*100;
	 END;

	
	--------------------------------------------------------------------------
	 CREATE PROCEDURE CorrectExam 
    @StudentID INT,  -- Input parameter for the student's ID
    @ExamID INT      -- Input parameter for the exam's ID
AS
BEGIN
    SET NOCOUNT ON; -- Prevents extra messages from interfering with the output

    -- Declare variables to store total questions and correct answers
    DECLARE @TotalQuestions INT;
    DECLARE @CorrectAnswers INT = 0; -- Initialize correct answers counter to 0

    -- Step 1: Count the total number of questions in the exam
    SELECT @TotalQuestions = COUNT(*) 
    FROM ExamQuestions 
    WHERE ExamID = @ExamID;

    -- Step 2: Compare student answers with model answers and count correct ones
    SELECT @CorrectAnswers = COUNT(*) -- Count the number of correct answers
    FROM StudentAnswers SA
    JOIN ExamSubmissions ES ON SA.SubmissionID = ES.SubmissionID -- Join to get the student's exam submission
    JOIN QuestionBank QB ON SA.QuestionID = QB.QuestionID -- Join to get the model answers
    LEFT JOIN Choices C ON QB.QuestionID = C.QuestionID 
        AND C.ChoiceLetter = QB.ModelAnswer -- Match the correct choice for MCQ/True-False questions
    WHERE ES.StudentID = @StudentID  -- Ensure it's the correct student
      AND ES.ExamID = @ExamID -- Ensure it's the correct exam
      AND (SA.StudentAnswer = 
            CASE 
                WHEN QB.QuestionType IN ('MCQ', 'True/False') THEN C.ChoiceText -- If it's an MCQ or True/False, compare with choice text
                ELSE QB.ModelAnswer -- Otherwise, compare with the model answer from the QuestionBank
            END
          );

    -- Step 3: Calculate the student's grade as a percentage
    DECLARE @Grade FLOAT;
    IF @TotalQuestions > 0
        SET @Grade = (@CorrectAnswers * 100.0) / @TotalQuestions; -- Calculate percentage score
    ELSE
        SET @Grade = 0; -- Avoid division by zero error if there are no questions

    -- Step 4: Return the student's score
    SELECT 
        @StudentID AS StudentID, 
        @ExamID AS ExamID, 
        @CorrectAnswers AS CorrectAnswers, 
        @TotalQuestions AS TotalQuestions, 
        @Grade AS Grade; -- Output the results
END;























