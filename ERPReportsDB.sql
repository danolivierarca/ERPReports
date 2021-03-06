USE [ERPReports]
GO
/****** Object:  StoredProcedure [dbo].[spUserPageAccess_Validate]    Script Date: 11/21/2020 2:01:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUserPageAccess_Validate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spUserPageAccess_Validate]
GO
/****** Object:  StoredProcedure [dbo].[spUserPageAccess_INSERT_UPDATE]    Script Date: 11/21/2020 2:01:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUserPageAccess_INSERT_UPDATE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spUserPageAccess_INSERT_UPDATE]
GO
/****** Object:  StoredProcedure [dbo].[spUserPageAccess_GetAccessList]    Script Date: 11/21/2020 2:01:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUserPageAccess_GetAccessList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spUserPageAccess_GetAccessList]
GO
/****** Object:  StoredProcedure [dbo].[spUserLogin]    Script Date: 11/21/2020 2:01:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUserLogin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spUserLogin]
GO
/****** Object:  StoredProcedure [dbo].[spUser_ValidateEmailAddress]    Script Date: 11/21/2020 2:01:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUser_ValidateEmailAddress]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spUser_ValidateEmailAddress]
GO
/****** Object:  StoredProcedure [dbo].[spUser_InsertUpdate]    Script Date: 11/21/2020 2:01:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUser_InsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spUser_InsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[spUser_GetUserList]    Script Date: 11/21/2020 2:01:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUser_GetUserList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spUser_GetUserList]
GO
/****** Object:  StoredProcedure [dbo].[spUser_GetDetails]    Script Date: 11/21/2020 2:01:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUser_GetDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spUser_GetDetails]
GO
/****** Object:  StoredProcedure [dbo].[spUser_Delete]    Script Date: 11/21/2020 2:01:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUser_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spUser_Delete]
GO
/****** Object:  StoredProcedure [dbo].[spPage_ValidatePageName]    Script Date: 11/21/2020 2:01:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPage_ValidatePageName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spPage_ValidatePageName]
GO
/****** Object:  StoredProcedure [dbo].[spPage_InsertUpdate]    Script Date: 11/21/2020 2:01:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPage_InsertUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spPage_InsertUpdate]
GO
/****** Object:  StoredProcedure [dbo].[spPage_GetPageList]    Script Date: 11/21/2020 2:01:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPage_GetPageList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spPage_GetPageList]
GO
/****** Object:  StoredProcedure [dbo].[spPage_GetPageDetails]    Script Date: 11/21/2020 2:01:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPage_GetPageDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spPage_GetPageDetails]
GO
/****** Object:  StoredProcedure [dbo].[spPage_Delete]    Script Date: 11/21/2020 2:01:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPage_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spPage_Delete]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_mType_UpdateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mType] DROP CONSTRAINT [DF_mType_UpdateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_mType_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mType] DROP CONSTRAINT [DF_mType_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_mType_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mType] DROP CONSTRAINT [DF_mType_IsDeleted]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_mGeneralMaster_UpdateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mGeneral] DROP CONSTRAINT [DF_mGeneralMaster_UpdateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_mGeneralMaster_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mGeneral] DROP CONSTRAINT [DF_mGeneralMaster_CreateDate]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_mGeneralMaster_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mGeneral] DROP CONSTRAINT [DF_mGeneralMaster_IsDeleted]
END

GO
/****** Object:  Index [Username_mUser]    Script Date: 11/21/2020 2:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[mUser]') AND name = N'Username_mUser')
ALTER TABLE [dbo].[mUser] DROP CONSTRAINT [Username_mUser]
GO
/****** Object:  Table [dbo].[mUserPageAccess]    Script Date: 11/21/2020 2:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mUserPageAccess]') AND type in (N'U'))
DROP TABLE [dbo].[mUserPageAccess]
GO
/****** Object:  Table [dbo].[mUser]    Script Date: 11/21/2020 2:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mUser]') AND type in (N'U'))
DROP TABLE [dbo].[mUser]
GO
/****** Object:  Table [dbo].[mType]    Script Date: 11/21/2020 2:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mType]') AND type in (N'U'))
DROP TABLE [dbo].[mType]
GO
/****** Object:  Table [dbo].[mPage]    Script Date: 11/21/2020 2:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mPage]') AND type in (N'U'))
DROP TABLE [dbo].[mPage]
GO
/****** Object:  Table [dbo].[mGeneral]    Script Date: 11/21/2020 2:01:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mGeneral]') AND type in (N'U'))
DROP TABLE [dbo].[mGeneral]
GO
/****** Object:  Table [dbo].[mGeneral]    Script Date: 11/21/2020 2:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mGeneral]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[mGeneral](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NULL,
	[Value] [varchar](255) NOT NULL,
	[IsDeleted] [bit] NULL,
	[CreateID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateID] [nvarchar](50) NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_mGeneral] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mPage]    Script Date: 11/21/2020 2:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mPage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[mPage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupLabel] [nvarchar](max) NULL,
	[PageName] [nvarchar](50) NOT NULL,
	[PageLabel] [nvarchar](max) NULL,
	[URL] [nvarchar](100) NOT NULL,
	[HasSub] [bit] NOT NULL,
	[ParentMenu] [nvarchar](50) NOT NULL,
	[ParentOrder] [int] NOT NULL CONSTRAINT [DF_mPage_ParentOrder]  DEFAULT ((0)),
	[Order] [int] NOT NULL,
	[Icon] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_mPage_IsDeleted]  DEFAULT ((0)),
	[CreateID] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_mPagses_CreateDate]  DEFAULT (getdate()),
	[UpdateID] [nvarchar](50) NOT NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_mPagses_UpdateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_mPagses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[mType]    Script Date: 11/21/2020 2:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[mType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](255) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateID] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateID] [nvarchar](50) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_mType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[mUser]    Script Date: 11/21/2020 2:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[mUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[EmailAddress] [nvarchar](255) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[MiddleName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_mUser_IsDeleted]  DEFAULT ((0)),
	[CreateID] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_mUser_CreateDate]  DEFAULT (getdate()),
	[UpdateID] [nvarchar](50) NOT NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_mUser_UpdateDate]  DEFAULT (getdate()),
 CONSTRAINT [ID_mUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[mUserPageAccess]    Script Date: 11/21/2020 2:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mUserPageAccess]') AND type in (N'U'))
BEGIN
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
END
GO
SET IDENTITY_INSERT [dbo].[mPage] ON 

INSERT [dbo].[mPage] ([ID], [GroupLabel], [PageName], [PageLabel], [URL], [HasSub], [ParentMenu], [ParentOrder], [Order], [Icon], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (1, N'', N'Master', N'Maintenance', N'/MasterMaintenance', 1, N'0', 3, 0, N'fa fa-cogs', 0, N'jayr', CAST(N'2019-11-06 14:48:10.613' AS DateTime), N'jayr', CAST(N'2020-02-03 09:55:16.703' AS DateTime))
INSERT [dbo].[mPage] ([ID], [GroupLabel], [PageName], [PageLabel], [URL], [HasSub], [ParentMenu], [ParentOrder], [Order], [Icon], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (2, N'', N'UserMaster', N'User Master', N'/MasterMaintenance/UserMaster', 0, N'Master', 0, 2, N'0', 0, N'jayr', CAST(N'2019-11-06 14:54:10.383' AS DateTime), N'jayr', CAST(N'2019-11-06 16:36:25.200' AS DateTime))
INSERT [dbo].[mPage] ([ID], [GroupLabel], [PageName], [PageLabel], [URL], [HasSub], [ParentMenu], [ParentOrder], [Order], [Icon], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (3, N'', N'PageMaster', N'Page Master', N'/MasterMaintenance/PageMaster', 0, N'Master', 0, 3, N'0', 0, N'jayr', CAST(N'2019-11-06 14:54:47.453' AS DateTime), N'jayr', CAST(N'2019-11-06 16:36:29.330' AS DateTime))
INSERT [dbo].[mPage] ([ID], [GroupLabel], [PageName], [PageLabel], [URL], [HasSub], [ParentMenu], [ParentOrder], [Order], [Icon], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (4, N'', N'FieldMaster', N'Field Master', N'/MasterMaintenance/GeneralMaster', 0, N'Master', 0, 4, N'0', 0, N'jayr', CAST(N'2019-12-10 18:29:09.880' AS DateTime), N'jayr', CAST(N'2020-06-07 18:54:08.207' AS DateTime))
INSERT [dbo].[mPage] ([ID], [GroupLabel], [PageName], [PageLabel], [URL], [HasSub], [ParentMenu], [ParentOrder], [Order], [Icon], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (5, N'', N'LSPDirectMaterial', N'LSP Direct Material', N'/Reports/LSPDirectMaterial', 0, N'Reports', 0, 1, N'0', 0, N'jayr', CAST(N'2020-06-07 20:20:00.340' AS DateTime), N'jayr', CAST(N'2020-06-07 20:24:32.050' AS DateTime))
INSERT [dbo].[mPage] ([ID], [GroupLabel], [PageName], [PageLabel], [URL], [HasSub], [ParentMenu], [ParentOrder], [Order], [Icon], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (6, N'', N'Reports', N'Reports', N'/Reports', 1, N'0', 4, 0, N'fa fa-chart-bar', 0, N'jayr', CAST(N'2020-06-07 20:22:26.237' AS DateTime), N'jayr', CAST(N'2020-06-07 20:22:26.237' AS DateTime))
SET IDENTITY_INSERT [dbo].[mPage] OFF
SET IDENTITY_INSERT [dbo].[mUser] ON 

INSERT [dbo].[mUser] ([ID], [UserName], [Password], [EmailAddress], [FirstName], [MiddleName], [LastName], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (1, N'admin', N'ANpVMvgTXPz1iIaGEzwqD18MdsJzPTArqtp16qtIc59hz0tte+OfCabV3WOXLEfJHw==', N'magdaluyoja@gmail.com', N'Jay-R', N'A', N'Magdaluyo', 0, N'admin', CAST(N'2020-08-09 00:00:00.000' AS DateTime), N'admin', CAST(N'2020-11-15 22:09:58.340' AS DateTime))
INSERT [dbo].[mUser] ([ID], [UserName], [Password], [EmailAddress], [FirstName], [MiddleName], [LastName], [IsDeleted], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (2, N'dan', N'AG5JvYyjvoBhWvpS9yt1CE2QtssHJMWwiuhKkDrZHlYcUN5KrY22FAC09vLrka7jaA==', N'dan@gmail.com', N'Dan Olivier', N'A', N'Arca', 0, N'admin', CAST(N'2020-11-15 22:10:47.327' AS DateTime), N'admin', CAST(N'2020-11-15 22:10:47.327' AS DateTime))
SET IDENTITY_INSERT [dbo].[mUser] OFF
SET IDENTITY_INSERT [dbo].[mUserPageAccess] ON 

INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (1, 1, 1, 1, 1, 1, N'2', CAST(N'2019-11-07 13:24:32.267' AS DateTime), N'1', CAST(N'2020-11-21 13:18:35.007' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (2, 1, 2, 1, 1, 1, N'2', CAST(N'2019-11-07 13:24:32.270' AS DateTime), N'1', CAST(N'2020-11-21 13:18:35.027' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (3, 2, 1, 1, 0, 0, N'1', CAST(N'2020-11-15 22:11:27.960' AS DateTime), N'1', CAST(N'2020-11-15 22:11:27.960' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (4, 2, 2, 1, 1, 1, N'1', CAST(N'2020-11-15 22:11:27.970' AS DateTime), N'1', CAST(N'2020-11-15 22:11:27.970' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (5, 2, 3, 1, 1, 1, N'1', CAST(N'2020-11-15 22:11:27.970' AS DateTime), N'1', CAST(N'2020-11-15 22:11:27.970' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (6, 2, 6, 1, 0, 0, N'1', CAST(N'2020-11-15 22:11:27.973' AS DateTime), N'1', CAST(N'2020-11-15 22:11:27.973' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (7, 2, 5, 1, 0, 0, N'1', CAST(N'2020-11-15 22:11:27.977' AS DateTime), N'1', CAST(N'2020-11-15 22:11:27.977' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (8, 2, 4, 1, 1, 1, N'1', CAST(N'2020-11-15 22:11:27.980' AS DateTime), N'1', CAST(N'2020-11-15 22:11:27.980' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (9, 1, 3, 1, 1, 1, N'1', CAST(N'2020-11-21 11:25:37.827' AS DateTime), N'1', CAST(N'2020-11-21 13:18:35.030' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (10, 1, 6, 1, 0, 0, N'1', CAST(N'2020-11-21 11:25:37.857' AS DateTime), N'1', CAST(N'2020-11-21 13:18:35.033' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (11, 1, 5, 1, 1, 1, N'1', CAST(N'2020-11-21 11:25:37.860' AS DateTime), N'1', CAST(N'2020-11-21 13:18:35.037' AS DateTime))
INSERT [dbo].[mUserPageAccess] ([ID], [UserID], [PageID], [Status], [ReadAndWrite], [Delete], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (12, 1, 4, 1, 1, 1, N'1', CAST(N'2020-11-21 11:25:37.863' AS DateTime), N'1', CAST(N'2020-11-21 13:18:35.037' AS DateTime))
SET IDENTITY_INSERT [dbo].[mUserPageAccess] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [Username_mUser]    Script Date: 11/21/2020 2:01:24 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[mUser]') AND name = N'Username_mUser')
ALTER TABLE [dbo].[mUser] ADD  CONSTRAINT [Username_mUser] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_mGeneralMaster_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mGeneral] ADD  CONSTRAINT [DF_mGeneralMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_mGeneralMaster_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mGeneral] ADD  CONSTRAINT [DF_mGeneralMaster_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_mGeneralMaster_UpdateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mGeneral] ADD  CONSTRAINT [DF_mGeneralMaster_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_mType_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mType] ADD  CONSTRAINT [DF_mType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_mType_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mType] ADD  CONSTRAINT [DF_mType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_mType_UpdateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mType] ADD  CONSTRAINT [DF_mType_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
END

GO
/****** Object:  StoredProcedure [dbo].[spPage_Delete]    Script Date: 11/21/2020 2:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPage_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPage_Delete] AS' 
END
GO
ALTER PROCEDURE [dbo].[spPage_Delete](
	@PageName		varchar(50)
   ,@UpdateID		varchar(50)
   ,@IsError		bit
   ,@ErrorMessage	varchar(50)
)AS
BEGIN
	UPDATE mPage
		SET IsDeleted = 1,
			UpdateID = @UpdateID,
			UpdateDate = GETDATE()
		WHERE PageName = @PageName;

	SET @IsError = 0;
	SET @ErrorMessage = '';
END
GO
/****** Object:  StoredProcedure [dbo].[spPage_GetPageDetails]    Script Date: 11/21/2020 2:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPage_GetPageDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPage_GetPageDetails] AS' 
END
GO
ALTER PROCEDURE [dbo].[spPage_GetPageDetails](
		@PageName varchar(100)
)AS
BEGIN
	SELECT * 
    FROM mPage
    WHERE IsDeleted = 0 
      AND PageName=@PageName;
END
GO
/****** Object:  StoredProcedure [dbo].[spPage_GetPageList]    Script Date: 11/21/2020 2:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPage_GetPageList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPage_GetPageList] AS' 
END
GO
ALTER PROCEDURE [dbo].[spPage_GetPageList](
    @GroupLabel		VARCHAR(100)
  , @PageName		VARCHAR(100)
  , @PageLabel		VARCHAR(100)
  , @URL			VARCHAR(100)
  , @HasSub			VARCHAR(100)
  , @ParentMenu		VARCHAR(100)
  , @ParentOrder	VARCHAR(100)
  , @Order			VARCHAR(100)

  , @StartPage		INT
  , @RowCount		INT
  , @SearchValue		VARCHAR(50)
  , @SortColumnName	VARCHAR(50)
  , @SortDirection	VARCHAR(10)
  , @TotalRecords		INT OUTPUT
  , @FilteredRecords		INT	OUTPUT
)AS
BEGIN
  DECLARE @ListQuery NVARCHAR(max)
  DECLARE @ListFilterQuery NVARCHAR(max)
    SET @ListQuery = ' SELECT * '
                + ' FROM mPage'
                              + ' WHERE IsDeleted = 0 '
                              + ' AND (GroupLabel LIKE '''+'%'+ @GroupLabel +'%'''
                              + ' AND PageName LIKE '''+'%'+ @PageName +'%'''
                              + ' AND PageLabel LIKE '''+'%'+ @PageLabel +'%'''
                              + ' AND URL LIKE '''+'%'+ @URL +'%'''
                              + ' AND HasSub LIKE '''+'%'+ @HasSub +'%'''
                              + ' AND ParentMenu LIKE '''+'%'+ @ParentMenu +'%'''
                              + ' AND ParentOrder LIKE '''+'%'+ @ParentOrder +'%'''
                              + ' AND Order LIKE '''+'%'+ @Order + '%'')'
                              + ' AND (GroupLabel LIKE '''+'%'+ @SearchValue +'%'''
                              + ' OR PageName LIKE '''+'%'+ @SearchValue +'%'''
                              + ' OR PageLabel LIKE '''+'%'+ @SearchValue +'%'''
                              + ' OR URL LIKE '''+'%'+ @SearchValue +'%'''
                              + ' OR HasSub LIKE '''+'%'+ @SearchValue +'%'''
                              + ' OR ParentMenu LIKE '''+'%'+ @SearchValue +'%'''
                              + ' OR ParentOrder LIKE '''+'%'+ @SearchValue +'%'''
                              + ' OR Order LIKE '''+'%'+ @SearchValue + '%'')'
                              + ' ORDER BY '+ @SortColumnName+ ' '+ @SortDirection
                              + ' LIMIT '+ @RowCount+' OFFSET '+ @StartPage+ ';'
    
    --PREPARE @queryStmt FROM @ListQuery;
  --EXECUTE queryStmt;
  EXECUTE @ListQuery;
  --DEALLOCATE PREPARE queryStmt;  

  SET @ListFilterQuery = 'SET @FilteredRecords = ( SELECT COUNT(*) '
                + ' FROM mPage'
                              + ' WHERE IsDeleted = 0 '
                              + ' AND (GroupLabel LIKE '''+'%'+ @GroupLabel +'%'''
                              + ' AND PageName LIKE '''+'%'+ @PageName +'%'''
                              + ' AND PageLabel LIKE '''+'%'+ @PageLabel +'%'''
                              + ' AND URL LIKE '''+'%'+ @URL +'%'''
                              + ' AND HasSub LIKE '''+'%'+ @HasSub +'%'''
                              + ' AND ParentMenu LIKE '''+'%'+ @ParentMenu +'%'''
                              + ' AND ParentOrder LIKE '''+'%'+ @ParentOrder +'%'''
                              + ' AND Order LIKE '''+'%'+ @Order + '%'')'
                              + ' AND (GroupLabel LIKE '''+'%'+ @SearchValue +'%'''
                              + ' OR PageName LIKE '''+'%'+ @SearchValue +'%'''
                              + ' OR PageLabel LIKE '''+'%'+ @SearchValue +'%'''
                              + ' OR URL LIKE '''+'%'+ @SearchValue +'%'''
                              + ' OR HasSub LIKE '''+'%'+ @SearchValue +'%'''
                              + ' OR ParentMenu LIKE '''+'%'+ @SearchValue +'%'''
                              + ' OR ParentOrder LIKE '''+'%'+ @SearchValue +'%'''
                              + ' OR Order LIKE '''+'%'+ @SearchValue+'%'')' 
                              
              
    
    --PREPARE filterQueryStmt FROM @ListFilterQuery;
  --EXECUTE filterQueryStmt;
  EXECUTE @ListFilterQuery
  --DEALLOCATE PREPARE filterQueryStmt;  
    
    SET @TotalRecords = (SELECT COUNT(*)
            FROM mPage
                        WHERE IsDeleted = 0);

  SET @FilteredRecords = @FilteredRecords;
END
GO
/****** Object:  StoredProcedure [dbo].[spPage_InsertUpdate]    Script Date: 11/21/2020 2:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPage_InsertUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPage_InsertUpdate] AS' 
END
GO
ALTER PROCEDURE [dbo].[spPage_InsertUpdate](
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
    ,@IsError Bit OUTPUT
    ,@ErrorMessage VARCHAR(50) OUTPUT
    ,@EndMsg VARCHAR(50) OUTPUT
)AS
BEGIN 
  IF(@ID = 0) 
  BEGIN
  
    SET @EndMsg = 'saved.';
        
    INSERT INTO mPage(
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
    );
  END
  ELSE
  BEGIN
    SET @EndMsg = 'updated.';
    UPDATE mPage SET
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
    WHERE PageName=@PageName;

  END 

    SET @IsError = 0;
    SET @ErrorMessage = '';
END
GO
/****** Object:  StoredProcedure [dbo].[spPage_ValidatePageName]    Script Date: 11/21/2020 2:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPage_ValidatePageName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPage_ValidatePageName] AS' 
END
GO
ALTER PROCEDURE [dbo].[spPage_ValidatePageName](
		@PageName varchar(100)
)AS
BEGIN
	SELECT PageName FROM mPage WHERE IsDeleted=0 AND PageName=@PageName;
END
GO
/****** Object:  StoredProcedure [dbo].[spUser_Delete]    Script Date: 11/21/2020 2:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUser_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spUser_Delete] AS' 
END
GO
ALTER PROCEDURE [dbo].[spUser_Delete](
	@ID		INT
  , @UserID	NVARCHAR(25)
)AS
BEGIN
	UPDATE mUser
    SET IsDeleted = 1
	  , UpdateID = @UserID
      , UpdateDate = GETDATE()
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[spUser_GetDetails]    Script Date: 11/21/2020 2:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUser_GetDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spUser_GetDetails] AS' 
END
GO
ALTER PROCEDURE [dbo].[spUser_GetDetails](
	@ID INT
)AS
BEGIN
	SELECT 
		  u.ID
		, u.UserName
		, u.[Password]
		, u.FirstName
		, u.MiddleName
		, u.LastName
		, u.EmailAddress
    FROM mUser as u
    WHERE u.IsDeleted=0 AND u.ID=@ID;
END
GO
/****** Object:  StoredProcedure [dbo].[spUser_GetUserList]    Script Date: 11/21/2020 2:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUser_GetUserList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spUser_GetUserList] AS' 
END
GO
ALTER PROCEDURE [dbo].[spUser_GetUserList] AS
BEGIN
	SELECT *
    FROM mUser as u
    WHERE IsDeleted=0;
END
GO
/****** Object:  StoredProcedure [dbo].[spUser_InsertUpdate]    Script Date: 11/21/2020 2:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUser_InsertUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spUser_InsertUpdate] AS' 
END
GO
ALTER PROCEDURE [dbo].[spUser_InsertUpdate](
	  @ID int
	, @UserName nvarchar(200)
	, @Password text
	, @FirstName nvarchar(200)
	, @MiddleName nvarchar(200)
	, @LastName nvarchar(200)
	, @EmailAddress nvarchar(200)
	, @UserID VARCHAR(20)
) AS
BEGIN
	IF(@ID = 0) 
		BEGIN
			INSERT INTO mUser(
				 UserName
				,[Password]
				,FirstName
				,MiddleName
				,LastName
				,EmailAddress
				,CreateID
				,CreateDate
				,UpdateID
				,UpdateDate
			)VALUES(
				 @UserName
				,@Password
				,@FirstName
				,@MiddleName
				,@LastName
				,@EmailAddress
				,@UserID
				,GETDATE()
				,@UserID
				,GETDATE()
			);
		END
	ELSE
	BEGIN
		UPDATE mUser SET
			 UserName=@UserName
			,[Password]=@Password
			,FirstName=@FirstName
			,MiddleName=@MiddleName
			,LastName=@LastName
			,EmailAddress=@EmailAddress
            ,UpdateID = @UserID
            ,UpdateDate = GETDATE()
		WHERE ID = @ID and IsDeleted=0;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spUser_ValidateEmailAddress]    Script Date: 11/21/2020 2:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUser_ValidateEmailAddress]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spUser_ValidateEmailAddress] AS' 
END
GO
ALTER PROCEDURE [dbo].[spUser_ValidateEmailAddress](
		@EmailAddress nvarchar(200)
) AS 
BEGIN
	SELECT 
		  EmailAddress
    FROM mUser 
    WHERE IsDeleted=0 AND EmailAddress=@EmailAddress;
END
GO
/****** Object:  StoredProcedure [dbo].[spUserLogin]    Script Date: 11/21/2020 2:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUserLogin]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spUserLogin] AS' 
END
GO
ALTER PROCEDURE [dbo].[spUserLogin](
	 @UserName nvarchar(50)
    ,@Password nvarchar(500)
)AS
BEGIN
		SELECT * FROM mUser AS u 
        WHERE UPPER(UserName)=UPPER(@UserName) AND IsDeleted=0;
END

GO
/****** Object:  StoredProcedure [dbo].[spUserPageAccess_GetAccessList]    Script Date: 11/21/2020 2:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUserPageAccess_GetAccessList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spUserPageAccess_GetAccessList] AS' 
END
GO
ALTER PROCEDURE [dbo].[spUserPageAccess_GetAccessList](
	@ID int
)AS
BEGIN
	IF(@ID != 0) BEGIN
		IF(@ID=1) 
			BEGIN
				SELECT P.*, A.* FROM mPage AS P
				LEFT JOIN mUserPageAccess AS A ON P.ID = A.PageID AND A.UserID=@ID
                WHERE P.IsDeleted = 0;
			END
		ELSE
			BEGIN
				SELECT P.*, A.* FROM mPage AS P
				LEFT JOIN mUserPageAccess AS A ON P.ID = A.PageID AND A.UserID=@ID 
				WHERE P.PageName <> 'Page Master'
                  AND P.IsDeleted = 0;
			END;
	END;
END

GO
/****** Object:  StoredProcedure [dbo].[spUserPageAccess_INSERT_UPDATE]    Script Date: 11/21/2020 2:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUserPageAccess_INSERT_UPDATE]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spUserPageAccess_INSERT_UPDATE] AS' 
END
GO
ALTER PROCEDURE [dbo].[spUserPageAccess_INSERT_UPDATE](
	 @UserID 	int			
	,@PageID 	int			
	,@Status 	bit			
	,@ReadAndWrite bit			
    ,@Delete 	bit			
	,@CreateID 	int			
    ,@IsError 	Bit OUTPUT 			
    ,@ErrorMessage VARCHAR(255) OUTPUT
)AS
BEGIN 
	IF EXISTS(SELECT PageID FROM mUserPageAccess WHERE UserID=@UserID and PageID=@PageID)
	BEGIN
		UPDATE mUserPageAccess SET 
            [Status] = @Status,
			ReadAndWrite = @ReadAndWrite,
			[Delete] = @Delete,
            UpdateID = @CreateID,
            UpdateDate = GETDATE()
		WHERE UserID = @UserID AND PageID = @PageID;
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
	END;
	SET @IsError = 0;
	SET @ErrorMessage = '';
END
GO
/****** Object:  StoredProcedure [dbo].[spUserPageAccess_Validate]    Script Date: 11/21/2020 2:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spUserPageAccess_Validate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spUserPageAccess_Validate] AS' 
END
GO
ALTER PROCEDURE [dbo].[spUserPageAccess_Validate](
	 @UserID int,
	 @PURL varchar(225),
	 @IsError Bit OUTPUT,
     @ErrorMessage VARCHAR(50) OUTPUT
) AS
SET NOCOUNT ON
BEGIN 
	DECLARE @PageCount int;
    
	SET @PageCount =(SELECT COUNT(*) FROM mUserPageAccess AS A 
						LEFT JOIN mPage AS P ON P.ID = A.PageID
						WHERE P.IsDeleted=0  AND A.UserID=@UserID AND CHARINDEX(P.URL,@PURL) > 0 AND A.[Status]=1)
                        
	IF @PageCount = 0 AND @PURL != '/' AND (NOT CHARINDEX('/Profile',@PURL) > 0) 
		BEGIN
			SET @ErrorMessage = 'You don not have access to this page.';
			SET @IsError = 1;
		END
    ELSE
		BEGIN
			if(@UserID=2)
				BEGIN
					SELECT P.*, A.ReadAndWrite, A.[Delete] as DeleteEnabled FROM mUserPageAccess AS A 
					LEFT JOIN mPage AS P ON P.ID = A.PageID
					WHERE P.IsDeleted=0  AND A.UserID=@UserID AND  A.[Status]=1
				END
			else
				BEGIN
					SELECT P.*, A.ReadAndWrite, A.[Delete] as DeleteEnabled FROM mUserPageAccess AS A 
					LEFT JOIN mPage AS P ON P.ID = A.PageID
					WHERE P.IsDeleted=0  AND A.UserID=@UserID AND  A.[Status]=1 AND (P.PageName!='Page Master')
				END
			SET @ErrorMessage= '';
			SET @IsError = 0;
		END
END
GO
