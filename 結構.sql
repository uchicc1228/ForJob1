USE [Questionnaires]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 2022/4/18 上午 11:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QID] [uniqueidentifier] NULL,
	[QuestionID] [uniqueidentifier] NOT NULL,
	[QNumber] [int] IDENTITY(1,1) NOT NULL,
	[QQuestion] [nvarchar](500) NULL,
	[QAnswer] [nvarchar](100) NULL,
	[QIsNecessary] [nvarchar](10) NULL,
	[QQMode] [nvarchar](10) NULL,
	[QCatrgory] [nvarchar](10) NULL,
	[QTitle] [nvarchar](max) NULL,
 CONSTRAINT [PK_Question_1] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questionary]    Script Date: 2022/4/18 上午 11:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questionary](
	[QID] [uniqueidentifier] NOT NULL,
	[QTitle] [nvarchar](max) NOT NULL,
	[QContent] [nvarchar](max) NOT NULL,
	[QStatus] [nvarchar](10) NOT NULL,
	[QStartTime] [datetime] NOT NULL,
	[QEndTime] [nvarchar](50) NULL,
	[QNumber] [int] IDENTITY(1,1) NOT NULL,
	[QuestionUrl] [nvarchar](max) NULL,
	[QuestionEditUrl] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserManager]    Script Date: 2022/4/18 上午 11:45:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserManager](
	[UserID] [uniqueidentifier] NULL,
	[QuestionID] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserPhone] [nvarchar](50) NULL,
	[UserEmail] [nvarchar](50) NULL,
	[UserAge] [nchar](10) NULL,
	[UserAnswer] [nvarchar](max) NULL,
	[UserWriteTime] [datetime] NULL,
	[QuestionTitle] [nvarchar](max) NULL,
	[QuestionContent] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF_Question_QAnswer1]  DEFAULT (' ') FOR [QAnswer]
GO
ALTER TABLE [dbo].[Questionary] ADD  CONSTRAINT [DF_Questionary_QStartTime]  DEFAULT (getdate()) FOR [QStartTime]
GO
ALTER TABLE [dbo].[UserManager] ADD  CONSTRAINT [DF_Account_WriteTime]  DEFAULT (getdate()) FOR [UserWriteTime]
GO
