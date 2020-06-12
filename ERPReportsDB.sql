USE [ERPReports]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsers'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsers'

GO
/****** Object:  StoredProcedure [dbo].[UserPageAccess_Validate]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP PROCEDURE [dbo].[UserPageAccess_Validate]
GO
/****** Object:  StoredProcedure [dbo].[UserPageAccess_UpdateUserRole]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP PROCEDURE [dbo].[UserPageAccess_UpdateUserRole]
GO
/****** Object:  StoredProcedure [dbo].[UserPageAccess_INSERT_UPDATE]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP PROCEDURE [dbo].[UserPageAccess_INSERT_UPDATE]
GO
/****** Object:  StoredProcedure [dbo].[UserPageAccess_GetAccessList]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP PROCEDURE [dbo].[UserPageAccess_GetAccessList]
GO
/****** Object:  StoredProcedure [dbo].[User_Login]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP PROCEDURE [dbo].[User_Login]
GO
/****** Object:  StoredProcedure [dbo].[User_InsertUpdate]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP PROCEDURE [dbo].[User_InsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[User_GetList]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP PROCEDURE [dbo].[User_GetList]
GO
/****** Object:  StoredProcedure [dbo].[User_Delete]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP PROCEDURE [dbo].[User_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Type_InsertUpdate]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP PROCEDURE [dbo].[Type_InsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[Type_Delete]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP PROCEDURE [dbo].[Type_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Page_InsertUpdate]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP PROCEDURE [dbo].[Page_InsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[Page_Delete]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP PROCEDURE [dbo].[Page_Delete]
GO
/****** Object:  StoredProcedure [dbo].[GeneralIndirect_Delete]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP PROCEDURE [dbo].[GeneralIndirect_Delete]
GO
/****** Object:  StoredProcedure [dbo].[General_InsertUpdate]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP PROCEDURE [dbo].[General_InsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[General_Delete]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP PROCEDURE [dbo].[General_Delete]
GO
/****** Object:  Index [Username_mUsers]    Script Date: 6/12/2020 7:50:21 PM ******/
ALTER TABLE [dbo].[mUsers] DROP CONSTRAINT [Username_mUsers]
GO
/****** Object:  View [dbo].[vUsers]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP VIEW [dbo].[vUsers]
GO
/****** Object:  Table [dbo].[mUsers]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP TABLE [dbo].[mUsers]
GO
/****** Object:  Table [dbo].[mUserPageAccess]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP TABLE [dbo].[mUserPageAccess]
GO
/****** Object:  Table [dbo].[mUser_CostCenters]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP TABLE [dbo].[mUser_CostCenters]
GO
/****** Object:  Table [dbo].[mTypes]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP TABLE [dbo].[mTypes]
GO
/****** Object:  Table [dbo].[mPages]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP TABLE [dbo].[mPages]
GO
/****** Object:  Table [dbo].[mGeneral]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP TABLE [dbo].[mGeneral]
GO
/****** Object:  Table [dbo].[mCostCenter]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP TABLE [dbo].[mCostCenter]
GO
/****** Object:  UserDefinedFunction [dbo].[fnSplitString]    Script Date: 6/12/2020 7:50:21 PM ******/
DROP FUNCTION [dbo].[fnSplitString]
GO
/****** Object:  UserDefinedFunction [dbo].[fnSplitString]    Script Date: 6/12/2020 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnSplitString] 
( 
    @string NVARCHAR(MAX), 
    @delimiter CHAR(1) 
) 
RETURNS @output TABLE(splitdata NVARCHAR(MAX) 
) 
BEGIN 


    DECLARE @start INT, @end INT 
    SELECT @start = 1, @end = CHARINDEX(@delimiter, @string) 
    WHILE @start < LEN(@string) + 1 BEGIN 
        IF @end = 0  
            SET @end = LEN(@string) + 1
       
        INSERT INTO @output (splitdata)  
        VALUES(SUBSTRING(@string, @start, @end - @start)) 
        SET @start = @end + 1 
        SET @end = CHARINDEX(@delimiter, @string, @start)
        
    END 

	
    RETURN 
END

GO
/****** Object:  Table [dbo].[mCostCenter]    Script Date: 6/12/2020 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mCostCenter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Department] [int] NOT NULL,
	[CostCenterCode] [nvarchar](10) NOT NULL,
	[CostCenterDescription] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NULL CONSTRAINT [DF_mCostCenter_IsDeleted]  DEFAULT ((0)),
	[CreateID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_mCostCenter_CreateDate]  DEFAULT (getdate()),
	[UpdateID] [nvarchar](50) NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_mCostCenter_UpdateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_mCostCenter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mGeneral]    Script Date: 6/12/2020 7:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mGeneral](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NULL,
	[Value] [varchar](255) NOT NULL,
	[IsDeleted] [bit] NULL CONSTRAINT [DF_mGeneralMaster_IsDeleted]  DEFAULT ((0)),
	[CreateID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_mGeneralMaster_CreateDate]  DEFAULT (getdate()),
	[UpdateID] [nvarchar](50) NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_mGeneralMaster_UpdateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_mGeneral] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mPages]    Script Date: 6/12/2020 7:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mPages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupLabel] [nvarchar](max) NULL,
	[PageName] [nvarchar](50) NOT NULL,
	[PageLabel] [nvarchar](max) NULL,
	[URL] [nvarchar](100) NOT NULL,
	[HasSub] [bit] NOT NULL,
	[ParentMenu] [nvarchar](50) NOT NULL,
	[ParentOrder] [int] NOT NULL CONSTRAINT [DF_mPages_ParentOrder]  DEFAULT ((0)),
	[Order] [int] NOT NULL,
	[Icon] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_mPages_IsDeleted]  DEFAULT ((0)),
	[CreateID] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_mPagses_CreateDate]  DEFAULT (getdate()),
	[UpdateID] [nvarchar](50) NOT NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_mPagses_UpdateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_mPagses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mTypes]    Script Date: 6/12/2020 7:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](255) NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_mTypes_IsDeleted]  DEFAULT ((0)),
	[CreateID] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_mTypes_CreateDate]  DEFAULT (getdate()),
	[UpdateID] [nvarchar](50) NOT NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_mTypes_UpdateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_mTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mUser_CostCenters]    Script Date: 6/12/2020 7:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mUser_CostCenters](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CostCenterID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_mUser_CostCenters_IsDeleted]  DEFAULT ((0)),
	[CreateID] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_mUser_CostCenters_CreateDate]  DEFAULT (getdate()),
	[UpdateID] [nvarchar](50) NOT NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_mUser_CostCenters_UpdateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_mUser_CostCenters] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mUserPageAccess]    Script Date: 6/12/2020 7:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mUserPageAccess](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PageID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[ReadAndWrite] [bit] NOT NULL CONSTRAINT [DF_mUserPageAccess_Write]  DEFAULT ((0)),
	[Delete] [bit] NULL,
	[CreateID] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_mUserPageAccess_CreateDate]  DEFAULT (getdate()),
	[UpdateID] [nvarchar](50) NOT NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_mUserPageAccess_UpdateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_mUserPageAccess] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mUsers]    Script Date: 6/12/2020 7:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Department] [nvarchar](max) NULL,
	[PostFunction_Approver] [bit] NULL,
	[Role] [nvarchar](50) NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_mUsers_IsDeleted]  DEFAULT ((0)),
	[CreateID] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_mUsers_CreateDate]  DEFAULT (getdate()),
	[UpdateID] [nvarchar](50) NOT NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_mUsers_UpdateDate]  DEFAULT (getdate()),
 CONSTRAINT [ID_mUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[vUsers]    Script Date: 6/12/2020 7:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vUsers]
AS
SELECT        u.[ID], u.[Username], u.[Password], u.[Email], u.[FirstName], u.[LastName], u.[Department], u.[PostFunction_Approver], u.[Role],
                             (SELECT        Value
                               FROM            mGeneral
                               WHERE        ID = u.[Department]) AS DepartmentDesc, STUFF
                             ((SELECT        ', ' + c.CostCenterCode+'-'+c.CostCenterDescription
                                 FROM            mCostCenter c LEFT JOIN
                                                          mUser_CostCenters AS uc ON u.ID = uc.UserID
                                 WHERE        c.ID = uc.CostCenterID FOR XML PATH('')), 1, 1, '') CostCenters, CASE WHEN
                             (SELECT        COUNT(*)
                               FROM            mUserPageAccess AS up LEFT JOIN
                                                         mPages AS p ON up.PageID = p.ID
                               WHERE        p.GroupLabel = 'Direct' AND up.Status = 1 AND p.IsDeleted = 0 AND up.UserID = u.ID) = 0 THEN 'Indirect' WHEN
                             (SELECT        COUNT(*)
                               FROM            mUserPageAccess AS up LEFT JOIN
                                                         mPages AS p ON up.PageID = p.ID
                               WHERE        p.GroupLabel = 'Indirect' AND up.Status = 1 AND p.IsDeleted = 0 AND up.UserID = u.ID) = 0 THEN 'Direct' ELSE 'Common' END AS UserCategory
FROM            mUsers u
WHERE        u.IsDeleted = 0
GROUP BY u.ID, u.[Username], u.[Password], u.[Email], u.[FirstName], u.[LastName], u.[Department], u.[PostFunction_Approver], u.[Role]



GO
SET IDENTITY_INSERT [dbo].[mCostCenter] ON 

INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (1, 53, N'TEST', N'asdasd', 1, N'joms', CAST(N'2020-02-03 17:06:21.547' AS DateTime), N'jayr', CAST(N'2020-03-02 08:27:03.073' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (2, 53, N'IKAW', N'asdasd', 1, N'joms', CAST(N'2020-02-03 17:15:43.720' AS DateTime), N'joms', CAST(N'2020-02-03 18:11:37.877' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (3, 53, N'TEST BOSSz', N'asdasd', 1, N'joms', CAST(N'2020-02-03 17:22:59.377' AS DateTime), N'jayr', CAST(N'2020-03-02 08:27:11.717' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (4, 53, N'TEST 22222', N'asdasd', 1, N'joms', CAST(N'2020-02-03 17:23:28.597' AS DateTime), N'jayr', CAST(N'2020-03-02 08:27:07.407' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (5, 53, N'TEST122', N'asdasd', 1, N'joms', CAST(N'2020-02-03 17:27:22.027' AS DateTime), N'jayr', CAST(N'2020-03-02 08:27:15.340' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (6, 53, N'TEST 2', N'ad', 1, N'joms', CAST(N'2020-02-03 17:52:09.667' AS DateTime), N'jayr', CAST(N'2020-02-11 13:58:26.887' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (7, 53, N'TEST', N'asd', 1, N'joms', CAST(N'2020-02-03 18:11:43.347' AS DateTime), N'joms', CAST(N'2020-02-03 18:11:50.113' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (8, 53, N'HDF', N'asd', 1, N'joms', CAST(N'2020-02-04 15:32:34.953' AS DateTime), N'jayr', CAST(N'2020-02-11 13:58:21.607' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (9, 63, N'00001', N'00001 Desc1', 1, N'jayr', CAST(N'2020-02-11 13:31:36.943' AS DateTime), N'jayr', CAST(N'2020-03-02 08:26:58.353' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (10, 63, N'00002', N'sfsdsd', 1, N'jayr', CAST(N'2020-02-11 13:55:02.287' AS DateTime), N'jayr', CAST(N'2020-02-11 13:58:17.527' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (11, 72, N'111', N'HRA/MIS/Executives', 0, N'jayr', CAST(N'2020-03-02 08:34:49.197' AS DateTime), N'jayr', CAST(N'2020-03-30 12:40:45.880' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (12, 72, N'121', N'Accounting', 0, N'jayr', CAST(N'2020-03-02 08:35:15.050' AS DateTime), N'jayr', CAST(N'2020-03-02 08:35:15.050' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (13, 72, N'141', N'Sales', 0, N'jayr', CAST(N'2020-03-02 08:35:33.237' AS DateTime), N'jayr', CAST(N'2020-03-02 08:35:33.237' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (14, 72, N'161', N'Cost Management Dept.', 0, N'jayr', CAST(N'2020-03-02 08:35:51.047' AS DateTime), N'jayr', CAST(N'2020-03-02 08:35:51.047' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (15, 72, N'171', N'General Affairs', 0, N'jayr', CAST(N'2020-03-02 08:36:06.630' AS DateTime), N'jayr', CAST(N'2020-03-02 08:36:06.630' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (16, 72, N'181', N'Interpretation / Translation Group', 0, N'jayr', CAST(N'2020-03-02 08:36:28.520' AS DateTime), N'jayr', CAST(N'2020-03-02 08:36:28.520' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (17, 73, N'211', N'Purchasing', 0, N'jayr', CAST(N'2020-03-02 08:36:43.210' AS DateTime), N'jayr', CAST(N'2020-03-02 08:36:43.210' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (18, 73, N'231', N'QC/QA/QMS', 0, N'jayr', CAST(N'2020-03-02 08:37:02.777' AS DateTime), N'jayr', CAST(N'2020-03-02 08:37:02.777' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (19, 73, N'241', N'Maintenance', 0, N'jayr', CAST(N'2020-03-02 08:37:19.440' AS DateTime), N'jayr', CAST(N'2020-03-02 08:37:19.440' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (20, 73, N'251', N'Production Office Personnel', 0, N'jayr', CAST(N'2020-03-02 08:37:42.790' AS DateTime), N'jayr', CAST(N'2020-03-02 08:37:42.790' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (21, 73, N'261', N'Production Control', 0, N'jayr', CAST(N'2020-03-02 08:37:56.830' AS DateTime), N'jayr', CAST(N'2020-03-02 08:37:56.830' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (22, 73, N'271', N'TPS Kaizen', 0, N'jayr', CAST(N'2020-03-02 08:38:14.970' AS DateTime), N'jayr', CAST(N'2020-03-02 08:38:14.970' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (23, 73, N'281', N'PE', 0, N'jayr', CAST(N'2020-03-02 08:38:31.597' AS DateTime), N'jayr', CAST(N'2020-03-02 08:38:31.597' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (24, 74, N'313', N'LCS (Assembly)', 0, N'jayr', CAST(N'2020-03-02 08:38:45.780' AS DateTime), N'jayr', CAST(N'2020-03-02 08:38:45.780' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (25, 74, N'315', N'Small SW/Blower SW (Assembly)', 0, N'jayr', CAST(N'2020-03-02 08:39:02.443' AS DateTime), N'jayr', CAST(N'2020-03-02 08:39:02.443' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (26, 74, N'317', N'WRS (Assembly)', 0, N'jayr', CAST(N'2020-03-02 08:39:20.980' AS DateTime), N'jayr', CAST(N'2020-03-02 08:39:20.980' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (27, 74, N'411', N'Injection (Horizontal)', 0, N'jayr', CAST(N'2020-03-02 08:39:42.200' AS DateTime), N'jayr', CAST(N'2020-03-02 08:39:42.200' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (28, 74, N'412', N'Printing', 0, N'jayr', CAST(N'2020-03-02 08:39:58.000' AS DateTime), N'jayr', CAST(N'2020-03-02 08:39:58.000' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (29, 74, N'413', N'Injection (Vertical)', 0, N'jayr', CAST(N'2020-03-02 08:40:15.597' AS DateTime), N'jayr', CAST(N'2020-03-02 08:40:15.597' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (30, 74, N'414', N'Double Injection', 0, N'jayr', CAST(N'2020-03-02 08:40:31.823' AS DateTime), N'jayr', CAST(N'2020-03-02 08:40:31.823' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (31, 74, N'415', N'Painting', 0, N'jayr', CAST(N'2020-03-02 08:40:46.177' AS DateTime), N'jayr', CAST(N'2020-03-02 08:40:46.177' AS DateTime))
INSERT [dbo].[mCostCenter] ([ID], [Department], [CostCenterCode], [CostCenterDescription], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (32, 74, N'416', N'Laser', 0, N'jayr', CAST(N'2020-03-02 08:41:03.490' AS DateTime), N'jayr', CAST(N'2020-03-02 08:41:03.490' AS DateTime))
SET IDENTITY_INSERT [dbo].[mCostCenter] OFF
SET IDENTITY_INSERT [dbo].[mGeneral] ON 

INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (1, 1, N'BK', 0, N'jayr', CAST(N'2020-01-08 13:14:29.347' AS DateTime), N'nikki', CAST(N'2020-01-10 11:49:18.370' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (2, 1, N'N', 0, N'jayr', CAST(N'2020-01-08 15:48:04.167' AS DateTime), N'nikki', CAST(N'2020-01-10 11:49:24.683' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (3, 2, N'Mass Pro', 0, N'jayr', CAST(N'2020-01-08 15:48:29.227' AS DateTime), N'nikki', CAST(N'2020-01-08 18:21:07.857' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (4, 1, N'CL', 0, N'nikki', CAST(N'2020-01-08 18:20:20.790' AS DateTime), N'nikki', CAST(N'2020-01-10 11:49:30.733' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (5, 2, N'Trial', 0, N'nikki', CAST(N'2020-01-08 18:21:00.137' AS DateTime), N'nikki', CAST(N'2020-01-08 18:21:00.137' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (6, 2, N'Service Part', 0, N'nikki', CAST(N'2020-01-08 18:21:18.257' AS DateTime), N'nikki', CAST(N'2020-01-08 18:21:18.257' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (7, 2, N'Prototype', 0, N'nikki', CAST(N'2020-01-08 18:21:26.550' AS DateTime), N'nikki', CAST(N'2020-01-08 18:21:26.550' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (8, 3, N'Mass Pro', 0, N'nikki', CAST(N'2020-01-08 18:21:54.517' AS DateTime), N'nikki', CAST(N'2020-01-08 18:21:54.517' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (9, 3, N'Development', 0, N'nikki', CAST(N'2020-01-08 18:22:02.527' AS DateTime), N'nikki', CAST(N'2020-01-08 18:22:02.527' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (10, 3, N'Service Part', 0, N'nikki', CAST(N'2020-01-08 18:22:13.900' AS DateTime), N'nikki', CAST(N'2020-01-08 18:22:13.900' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (11, 6, N'Local', 0, N'nikki', CAST(N'2020-01-08 18:26:59.527' AS DateTime), N'nikki', CAST(N'2020-01-08 18:26:59.527' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (12, 6, N'Imported', 0, N'nikki', CAST(N'2020-01-08 18:27:06.843' AS DateTime), N'nikki', CAST(N'2020-01-08 18:27:06.843' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (13, 6, N'Resin', 0, N'nikki', CAST(N'2020-01-08 18:27:14.737' AS DateTime), N'nikki', CAST(N'2020-01-08 18:27:14.737' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (14, 6, N'Z Parts', 0, N'nikki', CAST(N'2020-01-08 18:27:24.537' AS DateTime), N'nikki', CAST(N'2020-01-08 18:27:24.537' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (15, 6, N'Pass Thru - Local', 0, N'nikki', CAST(N'2020-01-08 18:27:46.410' AS DateTime), N'nikki', CAST(N'2020-01-08 18:27:46.410' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (16, 6, N'Pass Thru - Imported', 0, N'nikki', CAST(N'2020-01-08 18:27:57.683' AS DateTime), N'nikki', CAST(N'2020-01-08 18:27:57.683' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (17, 6, N'Pass Thru - Z Parts', 0, N'nikki', CAST(N'2020-01-08 18:28:14.053' AS DateTime), N'nikki', CAST(N'2020-01-08 18:28:14.053' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (18, 7, N'Y Parts', 0, N'nikki', CAST(N'2020-01-08 18:28:41.260' AS DateTime), N'nikki', CAST(N'2020-01-08 18:28:41.260' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (19, 7, N'Z Parts', 0, N'nikki', CAST(N'2020-01-08 18:28:50.523' AS DateTime), N'nikki', CAST(N'2020-01-08 18:28:50.523' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (20, 7, N'TR Subsidiary', 0, N'nikki', CAST(N'2020-01-08 18:29:02.907' AS DateTime), N'nikki', CAST(N'2020-01-08 18:29:02.907' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (21, 7, N'Resin', 0, N'nikki', CAST(N'2020-01-08 18:29:11.353' AS DateTime), N'nikki', CAST(N'2020-01-08 18:29:11.353' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (22, 8, N'Z Part', 0, N'nikki', CAST(N'2020-01-08 18:30:04.540' AS DateTime), N'nikki', CAST(N'2020-01-08 18:30:04.540' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (23, 8, N'General Molding', 0, N'nikki', CAST(N'2020-01-08 18:30:17.803' AS DateTime), N'nikki', CAST(N'2020-01-08 18:30:17.803' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (24, 8, N'Insert Molding', 0, N'nikki', CAST(N'2020-01-08 18:30:27.693' AS DateTime), N'nikki', CAST(N'2020-01-08 18:30:27.693' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (25, 8, N'Decorated Molding', 0, N'nikki', CAST(N'2020-01-08 18:30:41.357' AS DateTime), N'nikki', CAST(N'2020-01-08 18:30:41.357' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (26, 8, N'EMS', 0, N'nikki', CAST(N'2020-01-08 18:30:49.027' AS DateTime), N'nikki', CAST(N'2020-01-08 18:30:49.027' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (27, 8, N'Electric Parts', 0, N'nikki', CAST(N'2020-01-08 18:30:59.240' AS DateTime), N'nikki', CAST(N'2020-01-08 18:30:59.240' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (28, 8, N'Wire Harness', 0, N'nikki', CAST(N'2020-01-08 18:31:16.820' AS DateTime), N'nikki', CAST(N'2020-01-08 18:31:16.820' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (29, 8, N'FPC', 0, N'nikki', CAST(N'2020-01-08 18:31:25.010' AS DateTime), N'nikki', CAST(N'2020-01-08 18:31:25.010' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (30, 8, N'Spring', 0, N'nikki', CAST(N'2020-01-08 18:32:05.447' AS DateTime), N'nikki', CAST(N'2020-01-10 11:49:49.273' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (31, 8, N'Resin', 0, N'nikki', CAST(N'2020-01-08 18:32:18.180' AS DateTime), N'nikki', CAST(N'2020-01-08 18:32:18.180' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (32, 8, N'Press - Copper', 0, N'nikki', CAST(N'2020-01-08 18:33:47.410' AS DateTime), N'nikki', CAST(N'2020-01-08 18:33:47.410' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (33, 8, N'Rubber', 0, N'nikki', CAST(N'2020-01-08 18:34:08.880' AS DateTime), N'nikki', CAST(N'2020-01-08 18:34:08.880' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (34, 8, N'SRC', 0, N'nikki', CAST(N'2020-01-08 18:34:22.060' AS DateTime), N'nikki', CAST(N'2020-01-08 18:34:22.060' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (35, 8, N'Foam', 0, N'nikki', CAST(N'2020-01-08 18:34:43.567' AS DateTime), N'nikki', CAST(N'2020-01-08 18:34:43.567' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (36, 8, N'Label/Seal', 0, N'nikki', CAST(N'2020-01-08 18:35:00.350' AS DateTime), N'nikki', CAST(N'2020-01-08 18:35:00.350' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (37, 8, N'Assembly', 0, N'nikki', CAST(N'2020-01-08 18:35:27.990' AS DateTime), N'nikki', CAST(N'2020-01-08 18:35:27.990' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (38, 8, N'Sheet', 0, N'nikki', CAST(N'2020-01-08 18:35:40.173' AS DateTime), N'nikki', CAST(N'2020-01-08 18:35:40.173' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (39, 8, N'Subcon', 0, N'nikki', CAST(N'2020-01-08 18:35:53.030' AS DateTime), N'nikki', CAST(N'2020-01-08 18:35:53.030' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (40, 8, N'Screw', 0, N'nikki', CAST(N'2020-01-10 11:50:03.070' AS DateTime), N'nikki', CAST(N'2020-01-10 11:50:03.070' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (41, 8, N'Ball', 0, N'nikki', CAST(N'2020-01-10 11:50:12.067' AS DateTime), N'nikki', CAST(N'2020-01-10 11:50:12.067' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (42, 8, N'Electronic Parts', 0, N'jayr', CAST(N'2020-01-11 21:42:21.420' AS DateTime), N'jayr', CAST(N'2020-01-11 21:42:21.420' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (43, 8, N'Others', 0, N'jayr', CAST(N'2020-01-11 21:42:28.970' AS DateTime), N'jayr', CAST(N'2020-01-11 21:42:28.970' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (44, 8, N'Press Part', 0, N'jayr', CAST(N'2020-01-11 21:42:35.423' AS DateTime), N'jayr', CAST(N'2020-01-11 21:42:35.423' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (45, 10, N'BHT', 0, N'jayr', CAST(N'2020-01-14 10:53:55.123' AS DateTime), N'jayr', CAST(N'2020-01-14 10:53:55.123' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (46, 10, N'PHP', 0, N'jayr', CAST(N'2020-01-14 10:54:04.230' AS DateTime), N'jayr', CAST(N'2020-01-14 10:54:04.230' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (47, 10, N'JPY', 0, N'jayr', CAST(N'2020-01-14 10:54:16.327' AS DateTime), N'jayr', CAST(N'2020-01-14 10:54:16.327' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (48, 10, N'USD', 0, N'jayr', CAST(N'2020-01-14 10:54:22.950' AS DateTime), N'jayr', CAST(N'2020-01-14 10:54:22.950' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (49, 19, N'FACTORY SUPPLIES', 1, N'jayr', CAST(N'2020-01-22 10:46:07.757' AS DateTime), N'nikki', CAST(N'2020-03-03 16:37:13.483' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (50, 12, N'Domestic', 0, N'jayr', CAST(N'2020-01-22 10:47:25.040' AS DateTime), N'jayr', CAST(N'2020-03-05 07:25:38.227' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (51, 19, N'Kyoden Thailand', 1, N'jayr', CAST(N'2020-01-22 10:49:49.170' AS DateTime), N'nikki', CAST(N'2020-03-03 16:36:57.333' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (53, 19, N'Kyosha', 1, N'nikki', CAST(N'2020-01-22 19:09:13.380' AS DateTime), N'nikki', CAST(N'2020-03-03 16:37:01.310' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (56, 14, N'Plastic Injection/Molding', 0, N'nikki', CAST(N'2020-02-01 11:20:45.133' AS DateTime), N'nikki', CAST(N'2020-02-01 11:20:45.133' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (57, 14, N'Annealing', 0, N'nikki', CAST(N'2020-02-01 11:21:00.247' AS DateTime), N'nikki', CAST(N'2020-02-01 11:21:00.247' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (58, 14, N'Inspection - Appearance', 0, N'nikki', CAST(N'2020-02-01 11:21:29.810' AS DateTime), N'nikki', CAST(N'2020-02-01 11:21:29.810' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (59, 14, N'Trimming/cutting', 0, N'nikki', CAST(N'2020-02-01 11:21:43.750' AS DateTime), N'nikki', CAST(N'2020-02-01 11:21:43.750' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (60, 15, N'Single Injection', 0, N'nikki', CAST(N'2020-02-01 11:24:49.640' AS DateTime), N'nikki', CAST(N'2020-02-01 11:24:49.640' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (61, 15, N'Double Injection', 0, N'nikki', CAST(N'2020-02-01 11:25:11.373' AS DateTime), N'nikki', CAST(N'2020-02-01 11:25:11.373' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (62, 16, N'Purchasing', 0, N'nikki', CAST(N'2020-02-01 14:01:04.187' AS DateTime), N'nikki', CAST(N'2020-02-01 14:01:04.187' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (63, 16, N'Human Resources', 0, N'nikki', CAST(N'2020-02-01 14:01:15.920' AS DateTime), N'nikki', CAST(N'2020-02-01 14:01:15.920' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (64, 16, N'Parts Production', 0, N'nikki', CAST(N'2020-02-01 14:01:27.030' AS DateTime), N'nikki', CAST(N'2020-02-01 14:01:27.030' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (65, 17, N'Danpla Box', 0, N'nikki', CAST(N'2020-02-01 15:42:01.183' AS DateTime), N'nikki', CAST(N'2020-02-01 15:42:01.183' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (66, 18, N'Transport', 0, N'nikki', CAST(N'2020-02-01 15:51:35.167' AS DateTime), N'nikki', CAST(N'2020-02-01 15:51:35.167' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (67, 18, N'Profit', 0, N'nikki', CAST(N'2020-02-01 15:51:45.653' AS DateTime), N'nikki', CAST(N'2020-02-01 15:51:45.653' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (68, 18, N'Other Losses - Material', 0, N'nikki', CAST(N'2020-02-01 15:52:13.413' AS DateTime), N'nikki', CAST(N'2020-02-01 15:52:13.413' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (69, 19, N'AN1', 1, N'jayr', CAST(N'2020-02-05 13:18:00.017' AS DateTime), N'nikki', CAST(N'2020-03-03 16:37:09.997' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (70, 19, N'AN2', 1, N'jayr', CAST(N'2020-02-05 13:18:25.203' AS DateTime), N'nikki', CAST(N'2020-03-03 16:37:16.870' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (72, 20, N'Selling, General & Adminitrative', 0, N'jayr', CAST(N'2020-03-02 08:30:28.820' AS DateTime), N'jayr', CAST(N'2020-03-02 08:30:28.820' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (73, 20, N'Indirect (Support Group)', 0, N'jayr', CAST(N'2020-03-02 08:30:43.530' AS DateTime), N'jayr', CAST(N'2020-03-02 08:30:43.530' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (74, 20, N'Direct (Production)', 0, N'jayr', CAST(N'2020-03-02 08:30:59.790' AS DateTime), N'jayr', CAST(N'2020-03-02 08:30:59.790' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (75, 19, N'SUBSIDIARY MATERIALS', 1, N'jayr', CAST(N'2020-03-03 11:04:31.460' AS DateTime), N'nikki', CAST(N'2020-03-03 16:37:20.283' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (76, 16, N'General Affairs', 0, N'nikki', CAST(N'2020-03-03 16:33:09.167' AS DateTime), N'nikki', CAST(N'2020-03-03 16:33:09.167' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (77, 16, N'Cost Management', 0, N'nikki', CAST(N'2020-03-03 16:33:33.000' AS DateTime), N'nikki', CAST(N'2020-03-03 16:33:33.000' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (78, 16, N'Sales', 0, N'nikki', CAST(N'2020-03-03 16:33:45.327' AS DateTime), N'nikki', CAST(N'2020-03-03 16:33:45.327' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (79, 16, N'Maintenance', 0, N'nikki', CAST(N'2020-03-03 16:33:55.580' AS DateTime), N'nikki', CAST(N'2020-03-03 16:33:55.580' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (80, 16, N'Assembly 1', 0, N'nikki', CAST(N'2020-03-03 16:34:06.967' AS DateTime), N'nikki', CAST(N'2020-03-03 16:34:06.967' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (81, 16, N'Assembly 2', 0, N'nikki', CAST(N'2020-03-03 16:34:16.180' AS DateTime), N'nikki', CAST(N'2020-03-03 16:34:16.180' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (82, 16, N'Production Control', 0, N'nikki', CAST(N'2020-03-03 16:34:37.643' AS DateTime), N'nikki', CAST(N'2020-03-03 16:34:37.643' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (83, 16, N'Production Engineering', 0, N'nikki', CAST(N'2020-03-03 16:34:49.600' AS DateTime), N'nikki', CAST(N'2020-03-03 16:34:49.600' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (84, 16, N'Quality Control/Assurance', 0, N'nikki', CAST(N'2020-03-03 16:35:08.103' AS DateTime), N'nikki', CAST(N'2020-03-03 16:35:08.103' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (85, 21, N'LCS', 0, N'nikki', CAST(N'2020-03-03 16:38:13.177' AS DateTime), N'nikki', CAST(N'2020-03-03 16:38:13.177' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (86, 21, N'Small Switches', 1, N'nikki', CAST(N'2020-03-03 16:38:27.260' AS DateTime), N'nikki', CAST(N'2020-03-10 14:46:27.767' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (87, 21, N'SWS', 0, N'nikki', CAST(N'2020-03-03 16:38:52.250' AS DateTime), N'nikki', CAST(N'2020-03-03 16:38:52.250' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (88, 21, N'Small Std. Sw', 0, N'nikki', CAST(N'2020-03-03 16:39:12.497' AS DateTime), N'nikki', CAST(N'2020-03-03 16:39:12.497' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (89, 21, N'EPB', 0, N'nikki', CAST(N'2020-03-03 16:39:22.007' AS DateTime), N'nikki', CAST(N'2020-03-03 16:39:22.007' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (104, 12, N'Overseas', 0, N'jayr', CAST(N'2020-03-05 07:25:44.633' AS DateTime), N'jayr', CAST(N'2020-03-05 07:25:44.633' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (580, 16, N'Accounting', 0, N'jayr', CAST(N'2020-03-10 13:59:58.910' AS DateTime), N'jayr', CAST(N'2020-03-10 13:59:58.910' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (581, 22, N'FC001', 0, N'jayr', CAST(N'2020-04-14 19:57:45.020' AS DateTime), N'jayr', CAST(N'2020-04-14 19:57:45.020' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (582, 17, N'SPM1', 0, N'jayr', CAST(N'2020-04-27 16:40:11.863' AS DateTime), N'jayr', CAST(N'2020-04-27 16:40:11.863' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (583, 17, N'SPM2', 0, N'jayr', CAST(N'2020-04-27 16:40:19.037' AS DateTime), N'jayr', CAST(N'2020-04-27 16:40:19.037' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (584, 17, N'SPM3', 0, N'jayr', CAST(N'2020-04-27 16:40:25.897' AS DateTime), N'jayr', CAST(N'2020-04-27 16:40:25.897' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (585, 23, N'Molding', 0, N'jayr', CAST(N'2020-05-06 09:38:28.183' AS DateTime), N'jayr', CAST(N'2020-05-06 09:38:28.183' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (586, 24, N'New Product Activities', 0, N'jayr', CAST(N'2020-05-15 14:52:02.937' AS DateTime), N'jayr', CAST(N'2020-05-19 13:59:41.960' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (587, 24, N'ActivitiesB', 0, N'jayr', CAST(N'2020-05-15 14:52:12.920' AS DateTime), N'jayr', CAST(N'2020-05-15 15:22:32.460' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (588, 24, N'ActivitiesC', 0, N'jayr', CAST(N'2020-05-15 14:52:19.640' AS DateTime), N'jayr', CAST(N'2020-05-15 15:22:39.147' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (589, 24, N'ActivitiesD', 0, N'jayr', CAST(N'2020-05-15 14:52:28.013' AS DateTime), N'jayr', CAST(N'2020-05-15 15:22:44.100' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (590, 25, N'Activity 1', 0, N'jayr', CAST(N'2020-05-22 18:36:35.740' AS DateTime), N'jayr', CAST(N'2020-05-22 18:36:35.740' AS DateTime))
INSERT [dbo].[mGeneral] ([ID], [TypeID], [Value], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (591, 25, N'Activity 2', 0, N'jayr', CAST(N'2020-05-22 18:36:44.757' AS DateTime), N'jayr', CAST(N'2020-05-22 18:36:44.757' AS DateTime))
SET IDENTITY_INSERT [dbo].[mGeneral] OFF
GO
SET IDENTITY_INSERT [dbo].[mPages] ON 

INSERT [dbo].[mPages] ([ID], [GroupLabel], [PageName], [PageLabel], [URL], [HasSub], [ParentMenu], [ParentOrder], [Order], [Icon], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (1, N'', N'Master', N'Maintenance', N'/MasterMaintenance', 1, N'0', 3, 0, N'fa fa-cogs', 0, N'jayr', CAST(N'2019-11-06 14:48:10.613' AS DateTime), N'jayr', CAST(N'2020-02-03 09:55:16.703' AS DateTime))
INSERT [dbo].[mPages] ([ID], [GroupLabel], [PageName], [PageLabel], [URL], [HasSub], [ParentMenu], [ParentOrder], [Order], [Icon], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (3, NULL, N'UserMaster', N'User Master', N'/MasterMaintenance/UserMaster', 0, N'Master', 0, 2, N'0', 0, N'jayr', CAST(N'2019-11-06 14:54:10.383' AS DateTime), N'jayr', CAST(N'2019-11-06 16:36:25.200' AS DateTime))
INSERT [dbo].[mPages] ([ID], [GroupLabel], [PageName], [PageLabel], [URL], [HasSub], [ParentMenu], [ParentOrder], [Order], [Icon], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (4, NULL, N'PageMaster', N'Page Master', N'/MasterMaintenance/PageMaster', 0, N'Master', 0, 3, N'0', 0, N'jayr', CAST(N'2019-11-06 14:54:47.453' AS DateTime), N'jayr', CAST(N'2019-11-06 16:36:29.330' AS DateTime))
INSERT [dbo].[mPages] ([ID], [GroupLabel], [PageName], [PageLabel], [URL], [HasSub], [ParentMenu], [ParentOrder], [Order], [Icon], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (22, N'', N'FieldMaster', N'Field Master', N'/MasterMaintenance/GeneralMaster', 0, N'FieldMaster', 5, 22, N'fa fa-list', 0, N'jayr', CAST(N'2019-12-10 18:29:09.880' AS DateTime), N'jayr', CAST(N'2020-06-07 18:54:08.207' AS DateTime))
INSERT [dbo].[mPages] ([ID], [GroupLabel], [PageName], [PageLabel], [URL], [HasSub], [ParentMenu], [ParentOrder], [Order], [Icon], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (56, N'', N'LSPDirectMaterial', N'LSP Direct Material', N'/Reports/LSPDirectMaterial', 0, N'Reports', 0, 1, N'0', 0, N'jayr', CAST(N'2020-06-07 20:20:00.340' AS DateTime), N'jayr', CAST(N'2020-06-07 20:24:32.050' AS DateTime))
INSERT [dbo].[mPages] ([ID], [GroupLabel], [PageName], [PageLabel], [URL], [HasSub], [ParentMenu], [ParentOrder], [Order], [Icon], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (57, N'', N'Reports', N'Reports', N'/Reports', 1, N'0', 4, 0, N'fa fa-chart-bar', 0, N'jayr', CAST(N'2020-06-07 20:22:26.237' AS DateTime), N'jayr', CAST(N'2020-06-07 20:22:26.237' AS DateTime))
SET IDENTITY_INSERT [dbo].[mPages] OFF
SET IDENTITY_INSERT [dbo].[mTypes] ON 

INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (1, N'Color', 0, N'jayr', CAST(N'2020-01-08 10:42:19.380' AS DateTime), N'jenny', CAST(N'2020-01-16 14:07:01.510' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (2, N'Price Type', 0, N'jayr', CAST(N'2020-01-08 10:53:14.013' AS DateTime), N'jayr', CAST(N'2020-01-08 10:53:14.013' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (3, N'Product Stage', 0, N'jayr', CAST(N'2020-01-08 11:04:42.597' AS DateTime), N'jayr', CAST(N'2020-01-08 11:04:42.597' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (4, N'Grade', 1, N'jayr', CAST(N'2020-01-08 11:04:54.800' AS DateTime), N'nikki', CAST(N'2020-01-08 18:20:33.260' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (5, N'Color Code', 1, N'jayr', CAST(N'2020-01-08 11:07:46.823' AS DateTime), N'nikki', CAST(N'2020-01-08 18:20:25.577' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (6, N'Data Class', 0, N'nikki', CAST(N'2020-01-08 18:26:48.663' AS DateTime), N'nikki', CAST(N'2020-01-08 18:26:48.663' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (7, N'Subgroup', 0, N'nikki', CAST(N'2020-01-08 18:28:24.720' AS DateTime), N'nikki', CAST(N'2020-01-08 18:28:24.720' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (8, N'Commodity', 0, N'nikki', CAST(N'2020-01-08 18:29:49.793' AS DateTime), N'nikki', CAST(N'2020-01-08 18:29:49.793' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (9, N'Price Status', 1, N'nikki', CAST(N'2020-01-08 18:37:12.757' AS DateTime), N'nikki', CAST(N'2020-01-08 18:37:24.293' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (10, N'Currency Code', 0, N'jayr', CAST(N'2020-01-14 10:53:00.027' AS DateTime), N'jayr', CAST(N'2020-01-14 10:53:00.027' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (11, N'Item Type', 1, N'jayr', CAST(N'2020-01-22 10:45:44.990' AS DateTime), N'nikki', CAST(N'2020-03-03 16:32:40.813' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (12, N'Purchase Type', 0, N'jayr', CAST(N'2020-01-22 10:47:13.790' AS DateTime), N'nikki', CAST(N'2020-03-03 16:35:39.790' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (13, N'Maker Name', 0, N'jayr', CAST(N'2020-01-22 10:48:51.577' AS DateTime), N'jayr', CAST(N'2020-01-22 10:48:51.577' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (14, N'Production Process', 0, N'nikki', CAST(N'2020-02-01 11:20:11.430' AS DateTime), N'nikki', CAST(N'2020-02-01 11:20:11.430' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (15, N'Injection molding process', 0, N'nikki', CAST(N'2020-02-01 11:24:29.147' AS DateTime), N'nikki', CAST(N'2020-02-01 11:24:29.147' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (16, N'Department Names', 0, N'nikki', CAST(N'2020-02-01 14:00:49.123' AS DateTime), N'nikki', CAST(N'2020-02-01 14:00:49.123' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (17, N'Supplier Packaging Material', 0, N'nikki', CAST(N'2020-02-01 15:41:44.293' AS DateTime), N'nikki', CAST(N'2020-02-01 15:41:44.293' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (18, N'General Expenses', 0, N'nikki', CAST(N'2020-02-01 15:51:22.527' AS DateTime), N'nikki', CAST(N'2020-02-01 15:51:22.527' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (19, N'Account Name', 1, N'jayr', CAST(N'2020-02-05 13:17:50.830' AS DateTime), N'nikki', CAST(N'2020-03-03 16:37:27.967' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (20, N'Cost Center Group', 0, N'jayr', CAST(N'2020-03-02 08:30:03.207' AS DateTime), N'jayr', CAST(N'2020-03-02 08:30:03.207' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (21, N'FG/Product', 0, N'nikki', CAST(N'2020-03-03 16:37:58.537' AS DateTime), N'nikki', CAST(N'2020-03-03 16:37:58.537' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (22, N'Forex Code', 0, N'jayr', CAST(N'2020-04-14 19:46:51.873' AS DateTime), N'jayr', CAST(N'2020-04-14 19:46:51.873' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (23, N'Types of Tooling', 0, N'jayr', CAST(N'2020-05-06 09:38:20.230' AS DateTime), N'jayr', CAST(N'2020-05-06 09:38:20.230' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (24, N'Activities', 0, N'jayr', CAST(N'2020-05-15 14:51:49.980' AS DateTime), N'jayr', CAST(N'2020-05-15 14:51:49.980' AS DateTime))
INSERT [dbo].[mTypes] ([ID], [Type], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (25, N'Task Manager', 0, N'jayr', CAST(N'2020-05-22 18:36:19.680' AS DateTime), N'jayr', CAST(N'2020-05-22 18:36:19.680' AS DateTime))
SET IDENTITY_INSERT [dbo].[mTypes] OFF
SET IDENTITY_INSERT [dbo].[mUser_CostCenters] ON 

INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (15, 33, 11, 0, N'jayr', CAST(N'2020-03-05 11:16:27.400' AS DateTime), N'jayr', CAST(N'2020-03-05 11:16:27.400' AS DateTime))
INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (16, 22, 17, 0, N'nikki', CAST(N'2020-03-10 15:23:59.250' AS DateTime), N'nikki', CAST(N'2020-03-10 15:23:59.250' AS DateTime))
INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (17, 40, 17, 0, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (18, 41, 11, 0, N'nikki', CAST(N'2020-03-10 15:54:46.597' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.597' AS DateTime))
INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (19, 41, 12, 0, N'nikki', CAST(N'2020-03-10 15:54:46.597' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.597' AS DateTime))
INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (20, 41, 14, 0, N'nikki', CAST(N'2020-03-10 15:54:46.597' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.597' AS DateTime))
INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (21, 41, 15, 0, N'nikki', CAST(N'2020-03-10 15:54:46.597' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.597' AS DateTime))
INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (22, 42, 23, 0, N'nikki', CAST(N'2020-03-10 15:55:57.227' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.227' AS DateTime))
INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (23, 43, 17, 0, N'nikki', CAST(N'2020-03-10 16:04:51.327' AS DateTime), N'nikki', CAST(N'2020-03-10 16:04:51.327' AS DateTime))
INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (24, 44, 24, 0, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (25, 44, 25, 0, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (26, 44, 26, 0, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (27, 2, 17, 0, N'jayr', CAST(N'2020-03-16 14:24:29.317' AS DateTime), N'jayr', CAST(N'2020-03-16 14:24:29.317' AS DateTime))
INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (28, 22, 19, 0, N'nikki', CAST(N'2020-03-25 13:52:44.717' AS DateTime), N'nikki', CAST(N'2020-03-25 13:52:44.717' AS DateTime))
INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (29, 2, 24, 0, N'jayr', CAST(N'2020-03-30 11:07:34.277' AS DateTime), N'jayr', CAST(N'2020-03-30 11:07:34.277' AS DateTime))
INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (30, 2, 25, 0, N'jayr', CAST(N'2020-03-30 11:40:16.793' AS DateTime), N'jayr', CAST(N'2020-03-30 11:40:16.793' AS DateTime))
INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (31, 2, 27, 0, N'jayr', CAST(N'2020-03-31 14:22:41.580' AS DateTime), N'jayr', CAST(N'2020-03-31 14:22:41.580' AS DateTime))
INSERT [dbo].[mUser_CostCenters] ([ID], [UserID], [CostCenterID], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (32, 2, 19, 0, N'jayr', CAST(N'2020-04-13 12:29:51.680' AS DateTime), N'jayr', CAST(N'2020-04-13 12:29:51.680' AS DateTime))
SET IDENTITY_INSERT [dbo].[mUser_CostCenters] OFF
SET IDENTITY_INSERT [dbo].[mUserPageAccess] ON 

INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (5, 2, 1, 1, 1, 1, N'2', CAST(N'2019-11-07 13:24:32.267' AS DateTime), N'2', CAST(N'2020-06-07 20:24:41.530' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (7, 2, 3, 1, 1, 1, N'2', CAST(N'2019-11-07 13:24:32.270' AS DateTime), N'2', CAST(N'2020-06-07 20:24:41.533' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (8, 2, 4, 1, 1, 1, N'2', CAST(N'2019-11-07 13:24:32.270' AS DateTime), N'2', CAST(N'2020-06-07 20:24:41.537' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (202, 33, 16, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:05:37.917' AS DateTime), N'2', CAST(N'2020-01-10 13:10:22.040' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (203, 33, 17, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:05:37.917' AS DateTime), N'2', CAST(N'2020-01-10 13:10:22.040' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (204, 33, 18, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:05:37.917' AS DateTime), N'2', CAST(N'2020-01-10 13:10:22.040' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (205, 33, 19, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:05:37.917' AS DateTime), N'2', CAST(N'2020-01-10 13:10:22.053' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (206, 33, 20, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:05:37.917' AS DateTime), N'2', CAST(N'2020-01-10 13:10:22.053' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (207, 33, 21, 1, 0, 1, N'jayr', CAST(N'2020-01-10 10:05:37.917' AS DateTime), N'2', CAST(N'2020-01-10 13:10:22.040' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (208, 33, 22, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:05:37.917' AS DateTime), N'2', CAST(N'2020-01-10 13:10:22.070' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (209, 33, 23, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:05:37.917' AS DateTime), N'2', CAST(N'2020-01-10 13:10:22.053' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (210, 34, 1, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.250' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (211, 34, 2, 1, 1, 1, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.250' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (212, 34, 3, 1, 1, 1, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.263' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (213, 34, 4, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 13:53:12.500' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (214, 34, 5, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.233' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (215, 34, 6, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'jayr', CAST(N'2020-01-10 13:11:35.337' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (216, 34, 7, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.233' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (217, 34, 8, 1, 1, 1, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.250' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (218, 34, 9, 1, 1, 1, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.263' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (219, 34, 10, 1, 1, 1, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.263' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (220, 34, 11, 1, 1, 1, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.250' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (221, 34, 12, 1, 1, 1, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.250' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (222, 34, 13, 1, 0, 1, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.263' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (223, 34, 14, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.250' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (224, 34, 15, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.250' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (225, 34, 16, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.250' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (226, 34, 17, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.250' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (227, 34, 18, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.250' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (228, 34, 19, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.250' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (229, 34, 20, 1, 0, 0, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.250' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (230, 34, 21, 1, 0, 1, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.233' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (231, 34, 22, 1, 1, 1, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.263' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (232, 34, 23, 1, 1, 1, N'jayr', CAST(N'2020-01-10 10:06:29.747' AS DateTime), N'2', CAST(N'2020-01-16 15:53:32.263' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (233, 2, 24, 1, 1, 1, N'2', CAST(N'2020-01-21 08:17:35.093' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.233' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (234, 2, 25, 1, 1, 1, N'2', CAST(N'2020-01-21 11:04:28.813' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.233' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (235, 2, 26, 1, 1, 1, N'2', CAST(N'2020-01-22 08:35:41.970' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.220' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (236, 2, 27, 1, 1, 1, N'2', CAST(N'2020-01-22 11:36:48.497' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.220' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (237, 2, 28, 1, 1, 1, N'jayr', CAST(N'2020-01-24 09:24:04.883' AS DateTime), N'jayr', CAST(N'2020-05-15 12:49:04.163' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (238, 2, 29, 1, 1, 1, N'jayr', CAST(N'2020-01-24 09:24:04.883' AS DateTime), N'jayr', CAST(N'2020-05-15 12:49:04.163' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (239, 3, 1, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (240, 3, 2, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (241, 3, 3, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (242, 3, 4, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (243, 3, 5, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (244, 3, 6, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (245, 3, 7, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (246, 3, 8, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (247, 3, 9, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (248, 3, 10, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (249, 3, 11, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (250, 3, 12, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (251, 3, 13, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (252, 3, 14, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (253, 3, 15, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (254, 3, 16, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (255, 3, 17, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (256, 3, 18, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (257, 3, 19, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (258, 3, 20, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (259, 3, 21, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (260, 3, 22, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (261, 3, 23, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (262, 3, 24, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (263, 3, 25, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (264, 3, 26, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (265, 3, 27, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (266, 3, 28, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (267, 3, 29, 1, 1, 1, N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime), N'jayr', CAST(N'2020-01-31 18:31:22.023' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (268, 31, 23, 0, 0, 0, N'3', CAST(N'2020-01-31 18:33:38.763' AS DateTime), N'3', CAST(N'2020-01-31 18:33:38.763' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (269, 31, 22, 0, 0, 0, N'3', CAST(N'2020-01-31 18:33:38.763' AS DateTime), N'3', CAST(N'2020-01-31 18:33:38.763' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (270, 31, 24, 0, 0, 0, N'3', CAST(N'2020-01-31 18:33:38.763' AS DateTime), N'3', CAST(N'2020-01-31 18:33:38.763' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (271, 31, 25, 0, 0, 0, N'3', CAST(N'2020-01-31 18:33:38.763' AS DateTime), N'3', CAST(N'2020-01-31 18:33:38.763' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (272, 31, 28, 0, 0, 0, N'3', CAST(N'2020-01-31 18:33:38.763' AS DateTime), N'3', CAST(N'2020-01-31 18:33:38.763' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (273, 31, 29, 0, 0, 0, N'3', CAST(N'2020-01-31 18:33:38.780' AS DateTime), N'3', CAST(N'2020-01-31 18:33:38.780' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (274, 31, 26, 0, 0, 0, N'3', CAST(N'2020-01-31 18:33:38.780' AS DateTime), N'3', CAST(N'2020-01-31 18:33:38.780' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (275, 31, 27, 0, 0, 0, N'3', CAST(N'2020-01-31 18:33:38.780' AS DateTime), N'3', CAST(N'2020-01-31 18:33:38.780' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (276, 35, 1, 1, 0, 0, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.760' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (277, 35, 2, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.773' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (278, 35, 3, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.760' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (279, 35, 4, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.760' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (280, 35, 5, 1, 0, 0, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.743' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (281, 35, 6, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (282, 35, 7, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.743' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (283, 35, 8, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.760' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (284, 35, 9, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.760' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (285, 35, 10, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.760' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (286, 35, 11, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.760' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (287, 35, 12, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.760' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (288, 35, 13, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.773' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (289, 35, 14, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.760' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (290, 35, 15, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.743' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (291, 35, 16, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.743' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (292, 35, 17, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.743' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (293, 35, 18, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.743' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (294, 35, 19, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.760' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (295, 35, 20, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.760' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (296, 35, 21, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (297, 35, 22, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.773' AS DateTime))
GO
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (298, 35, 23, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.760' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (299, 35, 24, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.760' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (300, 35, 25, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.773' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (301, 35, 26, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.773' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (302, 35, 27, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.790' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (303, 35, 28, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (304, 35, 29, 1, 1, 1, N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime), N'jayr', CAST(N'2020-02-03 10:19:00.060' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (305, 35, 30, 1, 1, 1, N'35', CAST(N'2020-02-03 10:32:11.743' AS DateTime), N'35', CAST(N'2020-02-03 10:32:23.760' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (306, 2, 30, 1, 1, 1, N'2', CAST(N'2020-02-03 11:50:39.007' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.173' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (307, 2, 31, 1, 1, 1, N'2', CAST(N'2020-02-03 11:50:39.020' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.187' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (308, 2, 32, 1, 1, 1, N'2', CAST(N'2020-02-04 10:35:10.613' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.220' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (309, 2, 33, 1, 1, 1, N'2', CAST(N'2020-02-04 15:39:16.577' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.233' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (310, 2, 34, 1, 1, 1, N'2', CAST(N'2020-02-05 11:03:50.897' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.173' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (311, 22, 30, 1, 1, 1, N'22', CAST(N'2020-02-06 10:26:52.433' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.050' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (312, 22, 34, 1, 1, 1, N'22', CAST(N'2020-02-06 10:26:52.433' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.063' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (313, 22, 23, 1, 1, 1, N'22', CAST(N'2020-02-06 10:26:52.433' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.080' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (314, 22, 31, 1, 1, 1, N'22', CAST(N'2020-02-06 10:26:52.433' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.080' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (315, 22, 26, 1, 1, 1, N'22', CAST(N'2020-02-06 10:26:52.433' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.157' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (316, 22, 27, 1, 1, 1, N'22', CAST(N'2020-02-06 10:26:52.433' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.157' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (317, 22, 32, 1, 1, 1, N'22', CAST(N'2020-02-06 10:26:52.433' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.173' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (318, 22, 33, 1, 1, 1, N'22', CAST(N'2020-02-06 10:26:52.433' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (319, 22, 24, 1, 1, 1, N'22', CAST(N'2020-02-06 10:26:52.450' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (320, 22, 25, 1, 1, 1, N'22', CAST(N'2020-02-06 10:26:52.450' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (321, 2, 35, 1, 1, 1, N'2', CAST(N'2020-02-06 15:12:45.050' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.173' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (322, 22, 35, 1, 1, 1, N'22', CAST(N'2020-02-13 15:49:40.580' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.063' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (323, 39, 7, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.073' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (324, 39, 30, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.080' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (325, 39, 13, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.080' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (326, 39, 19, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.077' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (327, 39, 27, 1, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.083' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (328, 39, 33, 1, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.087' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (329, 39, 16, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.073' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (330, 39, 10, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.080' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (331, 39, 5, 0, 0, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.073' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (332, 39, 11, 1, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (333, 39, 25, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.087' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (334, 39, 8, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.077' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (335, 39, 31, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.083' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (336, 39, 2, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.080' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (337, 39, 14, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.077' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (338, 39, 22, 1, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.083' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (339, 39, 28, 1, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (340, 39, 34, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.080' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (341, 39, 3, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.080' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (342, 39, 9, 1, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (343, 39, 17, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.073' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (344, 39, 23, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.083' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (345, 39, 29, 1, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (346, 39, 6, 1, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (347, 39, 20, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.077' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (348, 39, 26, 1, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.083' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (349, 39, 32, 1, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.087' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (350, 39, 1, 1, 0, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.077' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (351, 39, 15, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.073' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (352, 39, 21, 1, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (353, 39, 35, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.080' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (354, 39, 4, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.080' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (355, 39, 12, 1, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.077' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (356, 39, 18, 0, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.073' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (357, 39, 24, 1, 1, 0, N'nikki', CAST(N'2020-02-13 15:51:00.193' AS DateTime), N'22', CAST(N'2020-02-13 15:59:30.087' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (358, 22, 36, 1, 1, 1, N'22', CAST(N'2020-02-27 13:37:50.810' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.173' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (359, 2, 37, 1, 1, 1, N'2', CAST(N'2020-03-02 16:56:58.647' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.157' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (360, 2, 36, 1, 1, 1, N'2', CAST(N'2020-03-02 16:56:58.660' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.233' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (361, 22, 37, 1, 1, 1, N'22', CAST(N'2020-03-02 19:00:21.217' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.033' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (362, 27, 37, 0, 0, 0, N'22', CAST(N'2020-03-05 14:56:28.550' AS DateTime), N'22', CAST(N'2020-03-05 14:56:28.550' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (363, 27, 30, 0, 0, 0, N'22', CAST(N'2020-03-05 14:56:28.553' AS DateTime), N'22', CAST(N'2020-03-05 14:56:28.553' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (364, 27, 35, 0, 0, 0, N'22', CAST(N'2020-03-05 14:56:28.553' AS DateTime), N'22', CAST(N'2020-03-05 14:56:28.553' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (365, 27, 34, 0, 0, 0, N'22', CAST(N'2020-03-05 14:56:28.557' AS DateTime), N'22', CAST(N'2020-03-05 14:56:28.557' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (366, 27, 23, 0, 0, 0, N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime), N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (367, 27, 31, 0, 0, 0, N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime), N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (368, 27, 26, 0, 0, 0, N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime), N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (369, 27, 27, 0, 0, 0, N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime), N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (370, 27, 32, 0, 0, 0, N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime), N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (371, 27, 36, 0, 0, 0, N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime), N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (372, 27, 33, 0, 0, 0, N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime), N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (373, 27, 24, 0, 0, 0, N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime), N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (374, 27, 25, 0, 0, 0, N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime), N'22', CAST(N'2020-03-05 14:56:28.560' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (375, 2, 38, 1, 1, 1, N'2', CAST(N'2020-03-10 14:00:58.693' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.233' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (376, 22, 38, 1, 1, 1, N'22', CAST(N'2020-03-10 14:56:34.090' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (377, 22, 28, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:23:59.267' AS DateTime), N'jayr', CAST(N'2020-03-25 16:12:06.790' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (378, 22, 29, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:23:59.267' AS DateTime), N'jayr', CAST(N'2020-03-25 16:12:06.790' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (379, 22, 6, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:23:59.267' AS DateTime), N'jayr', CAST(N'2020-03-25 16:12:06.790' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (380, 2, 39, 1, 1, 1, N'2', CAST(N'2020-03-10 15:47:19.490' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.173' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (381, 22, 39, 1, 1, 1, N'2', CAST(N'2020-03-10 15:50:20.200' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.050' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (382, 40, 17, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (383, 40, 23, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (384, 40, 34, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (385, 40, 3, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (386, 40, 20, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (387, 40, 26, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (388, 40, 14, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (389, 40, 37, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (390, 40, 6, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (391, 40, 29, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (392, 40, 21, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (393, 40, 9, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (394, 40, 15, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (395, 40, 38, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (396, 40, 32, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (397, 40, 18, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
GO
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (398, 40, 35, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (399, 40, 12, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (400, 40, 27, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (401, 40, 13, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (402, 40, 36, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (403, 40, 7, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (404, 40, 1, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (405, 40, 30, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (406, 40, 24, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (407, 40, 10, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (408, 40, 16, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (409, 40, 33, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (410, 40, 4, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (411, 40, 25, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (412, 40, 2, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (413, 40, 19, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (414, 40, 31, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (415, 40, 11, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (416, 40, 5, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (417, 40, 22, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (418, 40, 28, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (419, 40, 39, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (420, 40, 8, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime), N'nikki', CAST(N'2020-03-10 15:52:53.190' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (421, 41, 18, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (422, 41, 30, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (423, 41, 4, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (424, 41, 24, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (425, 41, 10, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (426, 41, 38, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (427, 41, 7, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (428, 41, 1, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (429, 41, 27, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (430, 41, 21, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (431, 41, 33, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (432, 41, 39, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (433, 41, 2, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (434, 41, 22, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (435, 41, 16, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (436, 41, 19, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (437, 41, 36, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (438, 41, 5, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (439, 41, 25, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (440, 41, 13, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (441, 41, 20, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (442, 41, 37, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (443, 41, 8, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (444, 41, 28, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (445, 41, 14, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (446, 41, 17, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (447, 41, 34, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (448, 41, 31, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (449, 41, 11, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (450, 41, 35, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (451, 41, 6, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (452, 41, 32, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (453, 41, 26, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (454, 41, 12, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (455, 41, 29, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (456, 41, 3, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (457, 41, 23, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (458, 41, 9, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (459, 41, 15, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime), N'nikki', CAST(N'2020-03-10 15:54:46.600' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (460, 42, 34, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (461, 42, 11, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (462, 42, 5, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (463, 42, 17, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (464, 42, 25, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (465, 42, 31, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (466, 42, 37, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (467, 42, 14, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (468, 42, 2, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (469, 42, 8, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (470, 42, 28, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (471, 42, 9, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (472, 42, 3, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (473, 42, 23, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (474, 42, 29, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (475, 42, 6, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (476, 42, 20, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (477, 42, 26, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (478, 42, 32, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (479, 42, 38, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (480, 42, 15, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (481, 42, 1, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (482, 42, 21, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (483, 42, 27, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (484, 42, 12, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (485, 42, 35, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (486, 42, 4, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (487, 42, 24, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (488, 42, 18, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (489, 42, 36, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (490, 42, 13, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (491, 42, 7, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (492, 42, 19, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (493, 42, 33, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (494, 42, 10, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (495, 42, 39, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (496, 42, 16, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (497, 42, 22, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
GO
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (498, 42, 30, 1, 1, 1, N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime), N'nikki', CAST(N'2020-03-10 15:55:57.230' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (499, 43, 29, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (500, 43, 21, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (501, 43, 15, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (502, 43, 38, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.457' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (503, 43, 1, 1, 0, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.440' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (504, 43, 32, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.453' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (505, 43, 9, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (506, 43, 18, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (507, 43, 12, 0, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.440' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (508, 43, 35, 0, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.447' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (509, 43, 27, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.450' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (510, 43, 4, 0, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.443' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (511, 43, 10, 0, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.443' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (512, 43, 13, 0, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.447' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (513, 43, 36, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.453' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (514, 43, 30, 0, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.443' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (515, 43, 7, 0, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.450' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (516, 43, 24, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.453' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (517, 43, 16, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (518, 43, 33, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.453' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (519, 43, 2, 0, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.447' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (520, 43, 25, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.453' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (521, 43, 8, 0, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.440' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (522, 43, 31, 0, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.450' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (523, 43, 19, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (524, 43, 28, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (525, 43, 5, 0, 0, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.447' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (526, 43, 22, 0, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.450' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (527, 43, 11, 0, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.440' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (528, 43, 39, 0, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.443' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (529, 43, 6, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (530, 43, 23, 0, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.450' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (531, 43, 17, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (532, 43, 34, 0, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.447' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (533, 43, 3, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.443' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (534, 43, 26, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.450' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (535, 43, 20, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (536, 43, 14, 0, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.450' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (537, 43, 37, 1, 1, 0, N'nikki', CAST(N'2020-03-10 16:04:51.330' AS DateTime), N'22', CAST(N'2020-03-10 16:10:43.440' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (538, 44, 22, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (539, 44, 39, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (540, 44, 28, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (541, 44, 2, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (542, 44, 16, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (543, 44, 19, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (544, 44, 25, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (545, 44, 36, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (546, 44, 13, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (547, 44, 5, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (548, 44, 20, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (549, 44, 37, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (550, 44, 8, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (551, 44, 14, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (552, 44, 17, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (553, 44, 34, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (554, 44, 31, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (555, 44, 11, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (556, 44, 26, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (557, 44, 35, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (558, 44, 32, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (559, 44, 6, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (560, 44, 12, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (561, 44, 23, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (562, 44, 38, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (563, 44, 29, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (564, 44, 3, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (565, 44, 15, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (566, 44, 9, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (567, 44, 18, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (568, 44, 24, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (569, 44, 30, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (570, 44, 33, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (571, 44, 4, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (572, 44, 10, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (573, 44, 21, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (574, 44, 27, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (575, 44, 1, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (576, 44, 7, 1, 1, 1, N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime), N'jane_b', CAST(N'2020-03-13 12:02:27.260' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (577, 2, 40, 1, 1, 1, N'2', CAST(N'2020-04-14 19:32:33.533' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.187' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (578, 2, 41, 1, 1, 1, N'2', CAST(N'2020-04-16 13:37:03.517' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.203' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (579, 22, 40, 1, 1, 1, N'22', CAST(N'2020-04-20 17:06:02.033' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.097' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (580, 22, 41, 1, 1, 1, N'22', CAST(N'2020-04-20 17:06:02.033' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.127' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (581, 2, 42, 1, 1, 1, N'2', CAST(N'2020-04-20 19:20:33.073' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.173' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (582, 2, 43, 1, 1, 1, N'2', CAST(N'2020-04-21 11:37:32.310' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.203' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (583, 22, 42, 1, 1, 1, N'22', CAST(N'2020-04-21 12:25:04.080' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.063' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (584, 22, 43, 1, 1, 1, N'22', CAST(N'2020-04-21 12:25:04.130' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.127' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (585, 2, 44, 1, 1, 1, N'2', CAST(N'2020-04-21 14:03:32.750' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.187' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (586, 2, 45, 1, 1, 1, N'2', CAST(N'2020-04-21 20:54:56.163' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.203' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (587, 22, 44, 1, 1, 1, N'22', CAST(N'2020-04-22 10:05:16.550' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.097' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (588, 22, 45, 1, 1, 1, N'22', CAST(N'2020-04-22 10:05:16.597' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.127' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (589, 2, 46, 1, 1, 1, N'2', CAST(N'2020-04-22 12:02:17.760' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.187' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (590, 22, 46, 0, 0, 0, N'22', CAST(N'2020-04-22 16:09:35.277' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.110' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (591, 22, 48, 1, 0, 0, N'22', CAST(N'2020-04-22 16:09:35.340' AS DateTime), N'22', CAST(N'2020-05-01 12:50:29.080' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (592, 2, 47, 1, 1, 1, N'jayr', CAST(N'2020-04-22 19:08:08.327' AS DateTime), N'jayr', CAST(N'2020-05-15 12:49:04.163' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (593, 2, 48, 1, 1, 1, N'jayr', CAST(N'2020-04-22 19:08:08.327' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.173' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (594, 2, 49, 1, 1, 1, N'2', CAST(N'2020-05-04 14:50:05.677' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.220' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (595, 2, 50, 1, 1, 1, N'2', CAST(N'2020-05-04 15:31:18.197' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.233' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (596, 2, 51, 1, 1, 1, N'2', CAST(N'2020-05-07 14:05:26.270' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.220' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (597, 2, 53, 1, 1, 1, N'2', CAST(N'2020-05-14 19:55:11.087' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.173' AS DateTime))
GO
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (598, 2, 54, 1, 1, 1, N'2', CAST(N'2020-05-22 10:07:18.317' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.173' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (599, 2, 55, 1, 1, 1, N'2', CAST(N'2020-05-26 12:30:29.267' AS DateTime), N'2', CAST(N'2020-05-26 12:31:26.203' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (600, 2, 57, 1, 0, 0, N'2', CAST(N'2020-06-07 20:23:59.067' AS DateTime), N'2', CAST(N'2020-06-07 20:24:41.540' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (601, 2, 22, 0, 0, 0, N'2', CAST(N'2020-06-07 20:23:59.070' AS DateTime), N'2', CAST(N'2020-06-07 20:24:41.547' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (602, 2, 56, 1, 1, 1, N'2', CAST(N'2020-06-07 20:24:41.543' AS DateTime), N'2', CAST(N'2020-06-07 20:24:41.543' AS DateTime))
SET IDENTITY_INSERT [dbo].[mUserPageAccess] OFF
SET IDENTITY_INSERT [dbo].[mUsers] ON 

INSERT [dbo].[mUsers] ([ID], [Username], [Password], [Email], [FirstName], [LastName], [Department], [PostFunction_Approver], [Role], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (2, N'jayr', N'MTIzNDU2', N'jj.magdaluyo@seiko-it.com.ph', N'Jay-R', N'Magdaluyo', N'76', 1, N'Custom', 0, N'jayr', CAST(N'2019-10-24 13:22:42.957' AS DateTime), N'jayr', CAST(N'2020-06-07 20:24:41.600' AS DateTime))
SET IDENTITY_INSERT [dbo].[mUsers] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [Username_mUsers]    Script Date: 6/12/2020 7:50:24 PM ******/
ALTER TABLE [dbo].[mUsers] ADD  CONSTRAINT [Username_mUsers] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[General_Delete]    Script Date: 6/12/2020 7:50:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[General_Delete](
	@ID	varchar(50)
   ,@UpdateID		varchar(10)
   ,@Error			bit OUTPUT
   ,@ErrorMessage	varchar(50) OUTPUT
) AS
BEGIN
	UPDATE mGeneral
		SET IsDeleted = 1,
			UpdateID = @UpdateID,
			UpdateDate = GETDATE()
		WHERE ID = @ID

	SET @Error = 0
	SET @ErrorMessage = '';
END

				







GO
/****** Object:  StoredProcedure [dbo].[General_InsertUpdate]    Script Date: 6/12/2020 7:50:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[General_InsertUpdate](
	 @ID int
	,@TypeID int
	,@Value VARCHAR(255)
	,@CreateID VARCHAR(20)
    ,@Error Bit OUTPUT
    ,@ErrorMessage VARCHAR(50) OUTPUT
	,@EndMsg VARCHAR(50) OUTPUT
) AS
SET NOCOUNT ON
BEGIN 
	SET @Error = 0
	SET @ErrorMessage = ''

	IF(@ID = 0)
		BEGIN
			SET @EndMsg = 'saved.'
			
			IF EXISTS(SELECT [TypeID] FROM[dbo].[mGeneral] WHERE [TypeID] = @TypeID AND Value=@Value AND IsDeleted = 0)
				BEGIN
					SET @Error = 1
					SET @ErrorMessage = 'Type and Value comibination already exists. Please try different value.'
				END
			ELSE IF EXISTS(SELECT [TypeID] FROM[dbo].[mGeneral] WHERE [TypeID] = @TypeID AND Value=@Value AND IsDeleted = 1)
				BEGIN
					UPDATE [dbo].[mGeneral]
						SET IsDeleted = '0',
							UpdateID = @CreateID,
							UpdateDate = GETDATE()
						WHERE [TypeID] = @TypeID AND Value=@Value
					SET @Error = 0
					SET @ErrorMessage = ''
				END
			ELSE
				BEGIN
					INSERT INTO mGeneral(
						 [TypeID]
						,Value
						,CreateID
						,CreateDate
						,UpdateID
						,UpdateDate
					)VALUES(
						 @TypeID
						,@Value
						,@CreateID
						,GETDATE()
						,@CreateID
						,GETDATE()
					)
				END
		END
	ELSE
		BEGIN
			SET @EndMsg = 'updated.'
			UPDATE mGeneral SET
				 [TypeID]=@TypeID
				,Value=@Value
				,UpdateID = @CreateID
				,UpdateDate = GETDATE()
			WHERE ID=@ID
		END
END






GO
/****** Object:  StoredProcedure [dbo].[GeneralIndirect_Delete]    Script Date: 6/12/2020 7:50:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GeneralIndirect_Delete](
	@ID	varchar(50)
   ,@UpdateID		varchar(10)
   ,@Error			bit OUTPUT
   ,@ErrorMessage	varchar(50) OUTPUT
) AS
BEGIN
	UPDATE mGeneralIndirect
		SET IsDeleted = 1,
			UpdateID = @UpdateID,
			UpdateDate = GETDATE()
		WHERE ID = @ID

	SET @Error = 0
	SET @ErrorMessage = '';
END

				







GO
/****** Object:  StoredProcedure [dbo].[Page_Delete]    Script Date: 6/12/2020 7:50:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Page_Delete](
	@PageName		varchar(50)
   ,@UpdateID		varchar(50)
   ,@Error			bit OUTPUT
   ,@ErrorMessage	varchar(50) OUTPUT
) AS
BEGIN
	UPDATE mPages
		SET IsDeleted = 1,
			UpdateID = @UpdateID,
			UpdateDate = GETDATE()
		WHERE PageName = @PageName

	SET @Error = 0
	SET @ErrorMessage = '';
END

				







GO
/****** Object:  StoredProcedure [dbo].[Page_InsertUpdate]    Script Date: 6/12/2020 7:50:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Page_InsertUpdate](
	 @ID int
	,@GroupLabel VARCHAR(50)
	,@PageName VARCHAR(50)
	,@PageLabel VARCHAR(50)
	,@URL VARCHAR(100)
    ,@HasSub int
    ,@ParentMenu VARCHAR(50)
	,@ParentOrder int
    ,@Order int
    ,@Icon VARCHAR(50)
	,@CreateID VARCHAR(20)
    ,@Error Bit OUTPUT
    ,@ErrorMessage VARCHAR(50) OUTPUT
	,@EndMsg VARCHAR(50) OUTPUT
) AS
SET NOCOUNT ON
BEGIN 
	IF(@ID = 0)
	BEGIN
		SET @EndMsg = 'saved.'
		INSERT INTO mPages(
			GroupLabel
			,PageName
			,PageLabel
			,URL
		    ,HasSub
		    ,ParentMenu
			,ParentOrder
		    ,[Order]
		    ,Icon
			,CreateID
            ,CreateDate
            ,UpdateID
            ,UpdateDate
		)VALUES(
			 @GroupLabel
			,@PageName
			,@PageLabel
			,@URL
		    ,@HasSub
		    ,@ParentMenu
			,@ParentOrder
		    ,@Order
		    ,@Icon
			,@CreateID
			,GETDATE()
			,@CreateID
			,GETDATE()
		)
	END

	ELSE
	BEGIN
		SET @EndMsg = 'updated.'
		UPDATE mPages SET
			GroupLabel=@GroupLabel
			,PageName=@PageName
			,PageLabel=@PageLabel
			,URL=@URL
		    ,HasSub=@HasSub
		    ,ParentMenu=@ParentMenu
			,ParentOrder=@ParentOrder
		    ,[Order]=@Order
		    ,Icon=@Icon
            ,UpdateID = @CreateID
            ,UpdateDate = GETDATE()
		WHERE PageName=@PageName

	END

	SET @Error = 0
    SET @ErrorMessage = ''
END






GO
/****** Object:  StoredProcedure [dbo].[Type_Delete]    Script Date: 6/12/2020 7:50:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Type_Delete](
	@ID	varchar(50)
   ,@UpdateID		varchar(10)
   ,@Error			bit OUTPUT
   ,@ErrorMessage	varchar(50) OUTPUT
) AS
BEGIN
	UPDATE mTypes
		SET IsDeleted = 1,
			UpdateID = @UpdateID,
			UpdateDate = GETDATE()
		WHERE ID = @ID

	SET @Error = 0
	SET @ErrorMessage = '';
END





GO
/****** Object:  StoredProcedure [dbo].[Type_InsertUpdate]    Script Date: 6/12/2020 7:50:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Type_InsertUpdate](
	 @ID int
	,@Type VARCHAR(50)
	,@CreateID VARCHAR(20)
    ,@Error Bit OUTPUT
    ,@ErrorMessage VARCHAR(50) OUTPUT
	,@EndMsg VARCHAR(50) OUTPUT
) AS
SET NOCOUNT ON
BEGIN 
	IF(@ID = 0)
		BEGIN
			SET @EndMsg = 'saved.'
			IF EXISTS(SELECT [Type] FROM[dbo].[mTypes] WHERE [Type] = @Type AND IsDeleted = 1)
				BEGIN
					UPDATE [dbo].[mTypes]
						SET IsDeleted = '0',
							UpdateID = @CreateID,
							UpdateDate = GETDATE()
						WHERE [Type] = @Type
					SET @Error = 0
					SET @ErrorMessage = ''
				END
			ELSE
				BEGIN
					INSERT INTO mTypes(
						 [Type]
						,CreateID
						,CreateDate
						,UpdateID
						,UpdateDate
					)VALUES(
						 @Type
						,@CreateID
						,GETDATE()
						,@CreateID
						,GETDATE()
					)
				END
		END
	ELSE
		BEGIN
			SET @EndMsg = 'updated.'
			UPDATE mTypes SET
				 [Type]=@Type
				,UpdateID = @CreateID
				,UpdateDate = GETDATE()
			WHERE ID=@ID

		END

	SET @Error = 0
    SET @ErrorMessage = ''
END






GO
/****** Object:  StoredProcedure [dbo].[User_Delete]    Script Date: 6/12/2020 7:50:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_Delete](
	@Username		varchar(50)
   ,@UpdateID		varchar(50)
   ,@Error			bit OUTPUT
   ,@ErrorMessage	varchar(50) OUTPUT
) AS
BEGIN
	UPDATE mUsers
		SET IsDeleted = 1,
			UpdateID = @UpdateID,
			UpdateDate = GETDATE()
		WHERE Username = @Username

	DELETE FROM mUser_CostCenters WHERE UserID=(SELECT ID FROM mUsers WHERE Username=@Username)
	SET @Error = 0
	SET @ErrorMessage = '';
END

				







GO
/****** Object:  StoredProcedure [dbo].[User_GetList]    Script Date: 6/12/2020 7:50:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_GetList] AS
	BEGIN
		SELECT  * from vUsers
	END




GO
/****** Object:  StoredProcedure [dbo].[User_InsertUpdate]    Script Date: 6/12/2020 7:50:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_InsertUpdate](
	 @ID int
	,@Username varchar(20)
	,@Password varchar(255)
	,@Email varchar(255)
	,@FirstName varchar(255)
    ,@LastName varchar(255)
    ,@Department varchar(255)
    ,@PostFunction_Approver bit
    ,@Role varchar(255)
	,@CreateID VARCHAR(20)
	,@ReadAndWrite bit
	,@CanDelete bit
	,@CostCenterIDs varchar(100)
    ,@Error Bit OUTPUT
    ,@ErrorMessage VARCHAR(50) OUTPUT
	,@EndMsg VARCHAR(50) OUTPUT
) AS
SET NOCOUNT ON
BEGIN TRY
	DECLARE @UserID AS int;
	BEGIN TRANSACTION		
	IF(@ID = 0)
		BEGIN
			SET @EndMsg = 'saved.'
			IF EXISTS(SELECT Username FROM[dbo].[mUsers] WHERE Username = @Username AND IsDeleted = 0)
				BEGIN
					SET @Error = 1
					SET @ErrorMessage = 'Username already exist. Please try again.'
				END
			ELSE IF EXISTS(SELECT Username FROM[dbo].[mUsers] WHERE Username = @Username AND IsDeleted = 1)
				BEGIN
					UPDATE [dbo].[mUsers]
						SET IsDeleted = '0'
							,[Password] = @Password
							,Email = @Email
							,FirstName = @FirstName
						    ,LastName = @LastName 
						    ,Department = @Department 
						    ,PostFunction_Approver = @PostFunction_Approver 
						    ,Role = @Role 
							,UpdateID = @CreateID
							,UpdateDate = GETDATE()
						WHERE Username = @Username
					SET @Error = 0
					SET @ErrorMessage = ''
					SET @UserID = (SELECT ID FROM mUsers WHERE Username = @Username)
				END
			ELSE
				BEGIN
					INSERT INTO mUsers(
						Username
						,[Password]
						,Email
						,FirstName 
					    ,LastName 
					    ,Department 
					    ,PostFunction_Approver 
					    ,Role 
						,CreateID
						,CreateDate
						,UpdateID
						,UpdateDate
					)VALUES(
						@Username
						,@Password
						,@Email
						,@FirstName
					    ,@LastName
					    ,@Department
					    ,@PostFunction_Approver
					    ,@Role
						,@CreateID
						,GETDATE()
						,@CreateID
						,GETDATE()
					)
					SET @UserID = @@IDENTITY
				END
		END
	ELSE
		BEGIN
			SET @EndMsg = 'updated.'
			UPDATE mUsers SET
					[Password] = @Password
					,Email = @Email
					,FirstName = @FirstName
				    ,LastName = @LastName 
				    ,Department = @Department 
				    ,PostFunction_Approver = @PostFunction_Approver 
				    ,Role = @Role 
					,UpdateID = @CreateID
					,UpdateDate = GETDATE()
			WHERE Username=@Username
			SET @UserID = @ID
		END

	
	IF OBJECT_ID('tempdb..#tmpUserCostCenters') IS NOT NULL
	BEGIN
		DROP TABLE #tmpUserCostCenters
	END

	CREATE TABLE #tmpUserCostCenters (
		[UserID] [int] NOT NULL,
		[CostCenterID] [int] NOT NULL,
		[IsDeleted] [bit] NOT NULL,
		[CreateID] [nvarchar](50) NOT NULL,
		[CreateDate] [datetime] NOT NULL,
		[UpdateID] [nvarchar](50) NOT NULL,
		[UpdateDate] [datetime] NOT NULL
	)

	INSERT INTO #tmpUserCostCenters
	SELECT @UserID,*,0,@CreateID,GETDATE(),@CreateID,GETDATE() from fnSplitString(@CostCenterIDs,',');

	MERGE mUser_CostCenters AS TARGET
	USING #tmpUserCostCenters AS SOURCE 
	ON (TARGET.[UserID] = SOURCE.[UserID] AND TARGET.[CostCenterID]=SOURCE.[CostCenterID]) 
	WHEN MATCHED
		THEN UPDATE SET TARGET.[IsDeleted] = 0
	WHEN NOT MATCHED BY TARGET 
		THEN INSERT ([UserID],[CostCenterID],[IsDeleted],[CreateID],[CreateDate],[UpdateID],[UpdateDate]) 
		VALUES ([UserID],[CostCenterID],[IsDeleted],@CreateID,GETDATE(),@CreateID,GETDATE())
	WHEN NOT MATCHED BY SOURCE AND TARGET.[UserID]=@UserID
		THEN DELETE;
	IF(@Role!='Custom')
		BEGIN
			IF OBJECT_ID('tempdb..#tmpUserPages') IS NOT NULL
			BEGIN
				DROP TABLE #tmpUserPages
			END

			CREATE TABLE #tmpUserPages ([UserID] Int,PageID Int,[Status] bit, ReadAndWrite bit, [Delete] bit,CreateID nvarchar(50), CreateDate datetime, UpdateID nvarchar(50), UpdateDate datetime)

			INSERT INTO #tmpUserPages
			SELECT @UserID, ID, '1', @ReadAndWrite, @CanDelete,@CreateID,GETDATE(),@CreateID,GETDATE() FROM mPages;

			MERGE mUserPageAccess AS TARGET
			USING #tmpUserPages AS SOURCE 
			ON (TARGET.[UserID] = SOURCE.[UserID] AND TARGET.[PageID]=SOURCE.[PageID]) 
			WHEN MATCHED AND (TARGET.[Status] <> SOURCE.[Status] OR TARGET.ReadAndWrite<>SOURCE.ReadAndWrite OR TARGET.[Delete]<>SOURCE.[Delete])
				THEN UPDATE SET TARGET.[Status] = SOURCE.[Status],TARGET.ReadAndWrite=SOURCE.ReadAndWrite,TARGET.[Delete]=SOURCE.[Delete],TARGET.UpdateID=SOURCE.UpdateID,TARGET.UpdateDate=SOURCE.UpdateDate
			WHEN NOT MATCHED BY TARGET 
				THEN INSERT ([UserID], [PageID], [Status], ReadAndWrite,[Delete],CreateID, CreateDate, UpdateID, UpdateDate) 
				VALUES ([UserID], [PageID], [Status], ReadAndWrite,[Delete],@CreateID,GETDATE(),@CreateID,GETDATE());
		END 
	SET @Error = 0
    SET @ErrorMessage = ''
COMMIT TRANSACTION

END TRY
BEGIN CATCH
	IF (XACT_STATE()) <> 0
	BEGIN
		PRINT 'An error occured. Rolling back transaction'
		SELECT @ErrorMessage = ERROR_MESSAGE()
			 , @Error = 0

		PRINT ERROR_MESSAGE()

		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN

		SELECT @ErrorMessage = ''
			 , @Error = 0

		PRINT 'Commiting transaction'
		COMMIT TRANSACTION
	END
	
END CATCH






GO
/****** Object:  StoredProcedure [dbo].[User_Login]    Script Date: 6/12/2020 7:50:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_Login](
	 @Username varchar(20),
	 @Password varchar(255)
) AS
SET NOCOUNT ON
BEGIN 
	SELECT * FROM [dbo].[mUsers]
	WHERE Username = @Username AND [Password] = @Password AND IsDeleted = 0
END






GO
/****** Object:  StoredProcedure [dbo].[UserPageAccess_GetAccessList]    Script Date: 6/12/2020 7:50:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserPageAccess_GetAccessList](
	 @ID int
) AS
SET NOCOUNT ON
BEGIN 
	IF(@ID != 0)
	BEGIN
		IF(@ID=2)
			BEGIN
				SELECT P.*, A.* FROM mPages AS P
				LEFT JOIN mUserPageAccess AS A ON P.ID = A.PageID AND A.UserID=@ID
				WHERE P.IsDeleted=0
			END
		ELSE
			BEGIN
				SELECT P.*, A.* FROM mPages AS P
				LEFT JOIN mUserPageAccess AS A ON P.ID = A.PageID AND A.UserID=@ID 
				WHERE P.PageName!='Page Master' AND  P.IsDeleted=0
			END
	END
END






GO
/****** Object:  StoredProcedure [dbo].[UserPageAccess_INSERT_UPDATE]    Script Date: 6/12/2020 7:50:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserPageAccess_INSERT_UPDATE](
	 @UserID int
	,@PageID int
	,@Status bit
	,@ReadAndWrite bit
	,@Delete bit
	,@CreateID int
    ,@Error Bit OUTPUT
    ,@ErrorMessage VARCHAR(50) OUTPUT
) AS
SET NOCOUNT ON
BEGIN 

	IF EXISTS(SELECT PageID FROM mUserPageAccess WHERE UserID=@UserID and PageID=@PageID)
	BEGIN
		UPDATE mUserPageAccess SET 
            [Status] = @Status,
			ReadAndWrite = @ReadAndWrite,
			[Delete] = @Delete,
            UpdateID = @CreateID,
            UpdateDate = GETDATE()
		WHERE UserID=@UserID AND PageID = @PageID;
	END

	ELSE
	BEGIN
		INSERT INTO mUserPageAccess(
            UserID,
            PageID,
            [Status],
			ReadAndWrite,
			[Delete],
            CreateID,
            CreateDate,
			UpdateID,
			UpdateDate
        )
        VALUES(
            @UserID,
            @PageID,
            @Status,
			@ReadAndWrite,
			@Delete,
            @CreateID,
            GETDATE(),
            @CreateID,
            GETDATE()
        );
	END

	SET @Error = 0
    SET @ErrorMessage = ''
END






GO
/****** Object:  StoredProcedure [dbo].[UserPageAccess_UpdateUserRole]    Script Date: 6/12/2020 7:50:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserPageAccess_UpdateUserRole](
	@UserID			int
   ,@Role			varchar(50)
   ,@UpdateID		varchar(50)
   ,@Error			bit OUTPUT
   ,@ErrorMessage	varchar(50) OUTPUT
) AS
BEGIN
	UPDATE mUsers
		SET [Role] = @Role,
			UpdateID = @UpdateID,
			UpdateDate = GETDATE()
		WHERE ID = @UserID
	SET @Error = 0
	SET @ErrorMessage = '';
END

				







GO
/****** Object:  StoredProcedure [dbo].[UserPageAccess_Validate]    Script Date: 6/12/2020 7:50:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserPageAccess_Validate](
	 @UserID int,
	 @PURL varchar(225),
	 @Error Bit OUTPUT,
     @ErrorMessage VARCHAR(50) OUTPUT
) AS
SET NOCOUNT ON
BEGIN 
	DECLARE @PageCount int;
    
	SET @PageCount =(SELECT COUNT(*) FROM mUserPageAccess AS A 
						LEFT JOIN mPages AS P ON P.ID = A.PageID
						WHERE P.IsDeleted=0  AND A.UserID=@UserID AND CHARINDEX(P.URL,@PURL) > 0 AND A.[Status]=1)
                        
	IF @PageCount = 0 AND @PURL != '/' AND (NOT CHARINDEX('/Profile',@PURL) > 0) 
		BEGIN
			SET @ErrorMessage = 'You don not have access to this page.';
			SET @Error = 1;
		END
    ELSE
		BEGIN
			if(@UserID=2)
				BEGIN
					SELECT P.*, A.ReadAndWrite, A.[Delete] as DeleteEnabled FROM mUserPageAccess AS A 
					LEFT JOIN mPages AS P ON P.ID = A.PageID
					WHERE P.IsDeleted=0  AND A.UserID=@UserID AND  A.[Status]=1
				END
			else
				BEGIN
					SELECT P.*, A.ReadAndWrite, A.[Delete] as DeleteEnabled FROM mUserPageAccess AS A 
					LEFT JOIN mPages AS P ON P.ID = A.PageID
					WHERE P.IsDeleted=0  AND A.UserID=@UserID AND  A.[Status]=1 AND (P.PageName!='Page Master')
				END
			SET @ErrorMessage= '';
			SET @Error = 0;
		END
END






GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[16] 4[5] 2[73] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsers'
GO
