USE [Ankita_Rahul]
GO
/****** Object:  Table [dbo].[Calender_tbl]    Script Date: 3/2/2023 10:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Calender_tbl](
	[Event_Id] [int] NULL,
	[Date] [varchar](50) NULL,
	[EmpId] [int] NULL,
	[Event] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Calender_tbl$]    Script Date: 3/2/2023 10:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calender_tbl$](
	[Event_Id] [float] NULL,
	[Date] [nvarchar](max) NULL,
	[EmpId] [float] NULL,
	[Event] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[city_tbl]    Script Date: 3/2/2023 10:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[city_tbl](
	[city_id] [int] NOT NULL,
	[city_name] [varchar](50) NOT NULL,
	[state_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[country_tbl]    Script Date: 3/2/2023 10:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[country_tbl](
	[Country_id] [int] NOT NULL,
	[shortname] [varchar](10) NULL,
	[country_name] [varchar](50) NOT NULL,
	[phonecode] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dpmt_tbl]    Script Date: 3/2/2023 10:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dpmt_tbl](
	[dpt_id] [int] IDENTITY(1,1) NOT NULL,
	[department] [varchar](50) NULL,
 CONSTRAINT [PK_dpmt_tbl] PRIMARY KEY CLUSTERED 
(
	[dpt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Emp_attendance]    Script Date: 3/2/2023 10:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Emp_attendance](
	[Attedance_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_id] [int] NULL,
	[Date] [varchar](50) NULL,
	[Time_In] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Time_Out] [varchar](50) NULL,
	[Work_Hours] [varchar](50) NULL,
	[Week_Day] [varchar](50) NULL,
	[Month] [varchar](50) NULL,
	[Year] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Attedance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee_details]    Script Date: 3/2/2023 10:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee_details](
	[emp_id] [int] NOT NULL,
	[emp_name] [varchar](50) NOT NULL,
	[emp_email] [varchar](50) NOT NULL,
	[emp_password] [varchar](50) NULL,
	[emp_contact] [varchar](13) NOT NULL,
	[emp_gender] [varchar](10) NULL,
	[emp_usertype] [varchar](50) NULL,
	[emp_country] [varchar](15) NOT NULL,
	[emp_state] [varchar](15) NOT NULL,
	[emp_city] [varchar](15) NOT NULL,
	[emp_pincode] [int] NOT NULL,
	[emp_address] [nvarchar](max) NOT NULL,
	[emp_department] [varchar](20) NOT NULL,
	[emp_designation] [varchar](50) NOT NULL,
	[emp_system] [varchar](50) NULL,
	[emp_worklocation] [varchar](50) NULL,
	[emp_vactionleaves] [int] NULL,
	[emp_sickleaves] [int] NULL,
	[emp_profileimg] [varchar](max) NULL,
 CONSTRAINT [PK__Employee__1299A861481C05F2] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[graph]    Script Date: 3/2/2023 10:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[graph](
	[id_] [bigint] NOT NULL,
	[city_name] [nvarchar](50) NULL,
	[population] [bigint] NULL,
	[year_of] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[myEmp_attendanceex]    Script Date: 3/2/2023 10:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[myEmp_attendanceex](
	[Attedance_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_id] [int] NULL,
	[Date] [date] NULL,
	[Time_In] [time](7) NULL,
	[Status] [varchar](50) NULL,
	[Time_Out] [time](7) NULL,
	[Work_Hours] [time](7) NULL,
	[Week_Day] [varchar](50) NULL,
	[Month] [varchar](50) NULL,
	[Year] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[state_tbl]    Script Date: 3/2/2023 10:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[state_tbl](
	[state_id] [int] NOT NULL,
	[state_name] [varchar](50) NOT NULL,
	[Country_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[suraj2]    Script Date: 3/2/2023 10:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[suraj2](
	[name] [varchar](20) NULL,
	[status] [char](5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[city_tbl]  WITH CHECK ADD FOREIGN KEY([state_id])
REFERENCES [dbo].[state_tbl] ([state_id])
GO
ALTER TABLE [dbo].[Emp_attendance]  WITH CHECK ADD FOREIGN KEY([emp_id])
REFERENCES [dbo].[Employee_details] ([emp_id])
GO
ALTER TABLE [dbo].[Emp_attendance]  WITH CHECK ADD FOREIGN KEY([emp_id])
REFERENCES [dbo].[Employee_details] ([emp_id])
GO
ALTER TABLE [dbo].[state_tbl]  WITH CHECK ADD FOREIGN KEY([Country_id])
REFERENCES [dbo].[country_tbl] ([Country_id])
GO
ALTER TABLE [dbo].[suraj2]  WITH CHECK ADD  CONSTRAINT [CK__suraj2__status__5812160E] CHECK  (([status]='F' OR [status]='M'))
GO
ALTER TABLE [dbo].[suraj2] CHECK CONSTRAINT [CK__suraj2__status__5812160E]
GO
/****** Object:  StoredProcedure [dbo].[Attendance_sprocs]    Script Date: 3/2/2023 10:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Attendance_sprocs](
@emp_id int=NULL,
@emp_name varchar(50)= NULL,
@emp_email varchar(50) = NULL,
@emp_password varchar(50)= NULL,
@emp_contact varchar(13) = NULL,
@emp_gender varchar(10)= NULL,
@emp_usertype varchar (50)= NULL,
@emp_country varchar (15)= NULL,
@emp_state varchar(15) =NULL,
@emp_city varchar(15) = NULL,
@emp_pincode int= NULL,
@emp_address nvarchar(max) = NULL,
@emp_department varchar(20) = NULL,
@emp_designation varchar(50) = NULL,
@emp_system varchar(50)= NULL,
@emp_worklocation varchar(50)= NULL,
@emp_vactionleaves int= NULL,
@emp_sickleaves int= NULL,
@emp_profileimg varchar(max)= NULL,
@Date varchar(50)=null,
@Time_In varchar(50)=null,
@Status varchar(50)=null,
@Time_Out varchar(50)=null,
@Work_Hours varchar(50)=null,
@FromDate varchar(50) = null,
@ToDate varchar(50) = null,
@Action varchar(50) 
)
As
Begin
if @Action='select' select * from Employee_details where emp_id = @emp_id
--For InsertData
if @Action='insertData' insert into Employee_details values(@emp_id,@emp_name, @emp_email, @emp_password, @emp_contact, @emp_gender, @emp_usertype, @emp_country, @emp_state, @emp_city, @emp_pincode, @emp_address, @emp_department, @emp_designation, @emp_system, @emp_worklocation, @emp_vactionleaves, @emp_sickleaves, @emp_profileimg)

--For Duplicate Data
if @Action='duplicate' select emp_id , emp_email from Employee_details where emp_id=@emp_id or emp_email=@emp_email

--login
if @Action='login' select * from Employee_details where emp_email=@emp_email and emp_password = @emp_password


--Team member
if @Action='alldata' select  * from Employee_details
--Filter Data
if @Action='filterData' select * from Employee_details where emp_department=@emp_department

--Delete Data
if @Action='delete' delete from Employee_details where emp_id=@emp_id

--Update Data
if @Action='update' update Employee_details set emp_name=@emp_name, emp_email=@emp_email,emp_contact=@emp_contact,emp_department=@emp_department, emp_designation=@emp_designation, emp_vactionleaves=@emp_vactionleaves, emp_sickleaves=@emp_sickleaves where emp_id=@emp_id

--upadte assets
if @Action='updateasset' update Employee_details set emp_system = @emp_system, emp_worklocation=@emp_worklocation where emp_id=@emp_id

-- emp team members data
if @Action='dptmemberdata' select emp_profileimg,emp_name,emp_designation,Employee_details.emp_id,emp_email,emp_contact,emp_gender,department,emp_worklocation  from Employee_details  join dpmt_tbl on Employee_details.emp_department=dpmt_tbl.dpt_id where emp_department=@emp_department and emp_usertype = @emp_usertype

-- update self Data
if @Action='updateselfdata' update Employee_details set emp_name=@emp_name,emp_contact=@emp_contact,emp_address=@emp_address,emp_profileimg=@emp_profileimg where emp_id=@emp_id

-- join two tables for current date
if @Action='joinTwoTables' select Emp_attendance.Date,Employee_details.emp_id,Employee_details.emp_name,Employee_details.emp_designation,Emp_attendance.Time_In,Emp_attendance.Status,Emp_attendance.Time_Out,Emp_attendance.Work_Hours from Emp_attendance INNER JOIN Employee_details on Emp_attendance.emp_id=Employee_details.emp_id where Date=convert(varchar,getdate(),105)

-- join two tables for fromdate to todate
if @Action='datefilter' select Date, Employee_details.emp_id , emp_name, emp_designation, Time_In, Status, Time_Out, Work_Hours from Employee_details join Emp_attendance on Employee_details.emp_id = Emp_attendance.emp_id where (Date  between @FromDate and @ToDate )

--For DuplicateEmail Data
if @Action='duplicateEmail' select emp_email from Employee_details where  emp_email=@emp_email

--For DuplicateEmail Data
if @Action='changepass' update Employee_details set emp_password=@emp_password where emp_email=@emp_email

--For UserAttendanceRecord
if @Action='showidattendance' select Date, Employee_details.emp_id , emp_name, emp_designation, Time_In, Status, Time_Out, Work_Hours from Employee_details join Emp_attendance on Employee_details.emp_id = Emp_attendance.emp_id where Employee_details.emp_id=@emp_id  and Date=convert(varchar,getdate(),105) 

--user date filter attendance
if @Action='userdatefilter' select Date , Employee_details.emp_id , emp_name, emp_designation, Time_In, Status, Time_Out, Work_Hours from Employee_details join Emp_attendance on Employee_details.emp_id = Emp_attendance.emp_id where Employee_details.emp_id=@emp_id and  (Date  between @FromDate and @ToDate )


if @Action='MonthPresentdata' select count(Status) from Emp_attendance where  emp_id=@emp_id and Status = 'p' and Month =MONTH(CURRENT_TIMESTAMP)  and YEAR=YEAR(CURRENT_TIMESTAMP)

if @Action='MonthAbsentdata' select count(Status) from Emp_attendance where  emp_id=@emp_id and Status != 'p' and Month =MONTH(CURRENT_TIMESTAMP)  and YEAR=YEAR(CURRENT_TIMESTAMP)



--Team member cards
if @Action='empdetailscards' select  emp_profileimg,emp_name,emp_designation,Employee_details.emp_id,emp_email,emp_contact,emp_gender,department,emp_worklocation  from Employee_details  join dpmt_tbl on Employee_details.emp_department=dpmt_tbl.dpt_id 

--Filter Data
if @Action='DepartmentDataFilter' select  emp_profileimg,emp_name,emp_designation,Employee_details.emp_id,emp_email,emp_contact,emp_gender,department,emp_worklocation  from Employee_details  join dpmt_tbl on Employee_details.emp_department=dpmt_tbl.dpt_id   where emp_department=@emp_department

end




GO
/****** Object:  StoredProcedure [dbo].[Emp_Attendance_sprocs]    Script Date: 3/2/2023 10:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Emp_Attendance_sprocs](
@Attedance_id int= null,
@emp_id int ,
@Date varchar(50)= null,
@Time_In varchar(50)= null,
@Status varchar(50) =null,
@Time_Out varchar(50) =null,
@Work_Hours varchar(50) =null,
@Week_Day varchar(50) =null,
@Month varchar(50) =null,
@Year int= null,
@Action varchar(50)
)

As 
Begin
if @Action='select' select * from Emp_attendance
if @Action ='insert' insert into Emp_attendance values(@emp_id,convert(varchar,getdate(),105), RIGHT(CONVERT(VARCHAR, getdate(), 100), 7), 'p',NULL,NULL, Day(CURRENT_TIMESTAMP), MONTH(CURRENT_TIMESTAMP), YEAR(CURRENT_TIMESTAMP))

if @Action='check' select count(Time_In ),COUNT(Time_Out) from  Emp_attendance where emp_id=@emp_id and Date=convert(varchar,getdate(),105)

if @Action='updatetimeout' update Emp_attendance set Time_Out=RIGHT(CONVERT(VARCHAR, getdate(), 100), 7), Work_Hours=@Work_Hours where emp_id=@emp_id and Date=convert(varchar,getdate(),105)

if @Action='getattendata' select * from Emp_attendance where  emp_id=@emp_id and Date=convert(varchar,getdate(),105)
end



GO
/****** Object:  StoredProcedure [dbo].[MyCountryData]    Script Date: 3/2/2023 10:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MyCountryData](
@Country_id int =null,
@shortname varchar(20)=null,
@country_name varchar(20)=null,
@phonecode varchar(20)=null,
@state_id int =null,
@state_name varchar(50)=null,
@city_id int =null,
@city_name varchar(50)=null,
@dpt_id int=null,
@department varchar(50)=null,
@Action varchar(50)
)
As 
begin
-- Get Country Data
if @Action='SeletCountry'  select country_name, Country_id from country_tbl
-- Get State Data
if @Action='SeletState'  select state_name, state_id from state_tbl where Country_id =@Country_id
-- Get City Data
if @Action='SeletCity'  select * from city_tbl where  state_id=@state_id
-- Get Department Data
if @Action='GetDepartment'  select * from dpmt_tbl
end
GO
