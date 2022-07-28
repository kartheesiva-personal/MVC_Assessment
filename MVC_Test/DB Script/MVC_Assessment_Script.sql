USE [RetailTest_DB]
GO
/****** Object:  Table [dbo].[RetailLogs]    Script Date: 28/7/2022 10:19:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RetailLogs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RetailId] [bigint] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[ECS] [nvarchar](255) NULL,
	[BCat] [nvarchar](255) NULL,
	[Series] [nvarchar](255) NULL,
	[Jan] [int] NULL,
	[Feb] [int] NULL,
	[Mar] [int] NULL,
	[Apr] [int] NULL,
	[May] [int] NULL,
	[Jun] [int] NULL,
	[Jul] [int] NULL,
	[Aug] [int] NULL,
	[Sep] [int] NULL,
	[Oct] [int] NULL,
	[Nov] [int] NULL,
	[Dec] [int] NULL,
	[IsDeleted] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[SystemIp] [nvarchar](200) NULL,
	[DeletedBy] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[Action] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Retails]    Script Date: 28/7/2022 10:19:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Retails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[ECS] [nvarchar](255) NULL,
	[BCat] [nvarchar](255) NULL,
	[Series] [nvarchar](255) NULL,
	[Jan] [int] NULL,
	[Feb] [int] NULL,
	[Mar] [int] NULL,
	[Apr] [int] NULL,
	[May] [int] NULL,
	[Jun] [int] NULL,
	[Jul] [int] NULL,
	[Aug] [int] NULL,
	[Sep] [int] NULL,
	[Oct] [int] NULL,
	[Nov] [int] NULL,
	[Dec] [int] NULL,
	[IsDeleted] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[SystemIp] [nvarchar](200) NULL,
	[DeletedBy] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[CalendarYear] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RetailLogs] ADD  DEFAULT ((0)) FOR [Jan]
GO
ALTER TABLE [dbo].[RetailLogs] ADD  DEFAULT ((0)) FOR [Feb]
GO
ALTER TABLE [dbo].[RetailLogs] ADD  DEFAULT ((0)) FOR [Mar]
GO
ALTER TABLE [dbo].[RetailLogs] ADD  DEFAULT ((0)) FOR [Apr]
GO
ALTER TABLE [dbo].[RetailLogs] ADD  DEFAULT ((0)) FOR [May]
GO
ALTER TABLE [dbo].[RetailLogs] ADD  DEFAULT ((0)) FOR [Jun]
GO
ALTER TABLE [dbo].[RetailLogs] ADD  DEFAULT ((0)) FOR [Jul]
GO
ALTER TABLE [dbo].[RetailLogs] ADD  DEFAULT ((0)) FOR [Aug]
GO
ALTER TABLE [dbo].[RetailLogs] ADD  DEFAULT ((0)) FOR [Sep]
GO
ALTER TABLE [dbo].[RetailLogs] ADD  DEFAULT ((0)) FOR [Oct]
GO
ALTER TABLE [dbo].[RetailLogs] ADD  DEFAULT ((0)) FOR [Nov]
GO
ALTER TABLE [dbo].[RetailLogs] ADD  DEFAULT ((0)) FOR [Dec]
GO
ALTER TABLE [dbo].[RetailLogs] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RetailLogs] ADD  DEFAULT ((0)) FOR [DeletedBy]
GO
ALTER TABLE [dbo].[Retails] ADD  DEFAULT ((0)) FOR [Jan]
GO
ALTER TABLE [dbo].[Retails] ADD  DEFAULT ((0)) FOR [Feb]
GO
ALTER TABLE [dbo].[Retails] ADD  DEFAULT ((0)) FOR [Mar]
GO
ALTER TABLE [dbo].[Retails] ADD  DEFAULT ((0)) FOR [Apr]
GO
ALTER TABLE [dbo].[Retails] ADD  DEFAULT ((0)) FOR [May]
GO
ALTER TABLE [dbo].[Retails] ADD  DEFAULT ((0)) FOR [Jun]
GO
ALTER TABLE [dbo].[Retails] ADD  DEFAULT ((0)) FOR [Jul]
GO
ALTER TABLE [dbo].[Retails] ADD  DEFAULT ((0)) FOR [Aug]
GO
ALTER TABLE [dbo].[Retails] ADD  DEFAULT ((0)) FOR [Sep]
GO
ALTER TABLE [dbo].[Retails] ADD  DEFAULT ((0)) FOR [Oct]
GO
ALTER TABLE [dbo].[Retails] ADD  DEFAULT ((0)) FOR [Nov]
GO
ALTER TABLE [dbo].[Retails] ADD  DEFAULT ((0)) FOR [Dec]
GO
ALTER TABLE [dbo].[Retails] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Retails] ADD  DEFAULT ((0)) FOR [DeletedBy]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetRetailByYear]    Script Date: 28/7/2022 10:19:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--usp_GetRetailByYear 2022
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetRetailByYear]
	-- Add the parameters for the stored procedure here
	
	@Year INT=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	SELECT 
Id
,UniqueId
,ECS
,BCat
,Series
,Jan
,Feb
,Mar
,Apr
,May
,Jun
,Jul
,Aug
,Sep
,Oct
,Nov
,Dec
,CalendarYear
,(ISNULL(Jan,0)+ISNULL(Feb,0)+ISNULL(Mar,0)+ISNULL(Apr,0)+ISNULL(May,0)+ISNULL(Jun,0)+ISNULL(Jul,0)+ISNULL(Aug,0)+ISNULL(Sep,0)+ISNULL(Oct,0)+ISNULL(Nov,0)+ISNULL(Dec,0)) AS Total

FROM Retails WHERE CalendarYear=@Year AND ISNULL(IsDeleted,0)=0

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Retail_Delete]    Script Date: 28/7/2022 10:19:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[usp_Retail_Delete]
	-- Add the parameters for the stored procedure here
@UniqueId UNIQUEIDENTIFIER 
,@SystemIp Nvarchar(200)=NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	


	insert into RetailLogs

	(
	
	 RetailId,UniqueId,ECS,BCat,Series
    ,Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec
    ,IsDeleted,ModifiedOn,SystemIp,DeletedBy,DeletedOn
    ,Action
	)

	select Id,UniqueId,ECS,BCat,Series
    ,Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec
    ,IsDeleted,ModifiedOn,@SystemIp,DeletedBy,DeletedOn
    ,'Delete' from Retails	WHERE UniqueId=@UniqueId


	
UPDATE Retails SET

 IsDeleted=1
,ModifiedOn=GETDATE()
,SystemIp=@SystemIp

WHERE UniqueId=@UniqueId



END
GO
/****** Object:  StoredProcedure [dbo].[usp_Retail_Logs]    Script Date: 28/7/2022 10:19:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Retail_Logs]
	-- Add the parameters for the stored procedure here
	@Year INT=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into RetailLogs

	(
	
	 RetailId,UniqueId,ECS,BCat,Series
    ,Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec
    ,IsDeleted,ModifiedOn,SystemIp,DeletedBy,DeletedOn
    ,Action
	)

	select Id,UniqueId,ECS,BCat,Series
    ,Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec
    ,IsDeleted,ModifiedOn,SystemIp,DeletedBy,DeletedOn
    ,'View' from Retails	WHERE CalendarYear=@Year

	END
GO
/****** Object:  StoredProcedure [dbo].[usp_Retail_Save]    Script Date: 28/7/2022 10:19:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Retail_Save]
	-- Add the parameters for the stored procedure here
@UniqueId UNIQUEIDENTIFIER 
,@Jul INT=0
,@Aug INT=0
,@Sep INT=0
,@Oct INT=0
,@Nov INT=0
,@Dec INT=0
,@SystemIp Nvarchar(200)=NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	


	insert into RetailLogs

	(
	
	 RetailId,UniqueId,ECS,BCat,Series
    ,Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec
    ,IsDeleted,ModifiedOn,SystemIp,DeletedBy,DeletedOn
    ,Action
	)

	select Id,UniqueId,ECS,BCat,Series
    ,Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec
    ,IsDeleted,ModifiedOn,SystemIp,DeletedBy,DeletedOn
    ,'UPDATE' from Retails	WHERE UniqueId=@UniqueId


	
UPDATE Retails SET

 Jul=@Jul
,Aug=@Aug
,Sep=@Sep
,Oct=@Oct
,Nov=@Nov
,Dec=@Dec
,ModifiedOn=GETDATE()
,SystemIp=@SystemIp

WHERE UniqueId=@UniqueId



END
GO
USE [RetailTest_DB]
GO

INSERT INTO [dbo].[Retails]
           ([UniqueId]
           ,[ECS]
           ,[BCat]
           ,[Series]
           ,[Jan]
           ,[Feb]
           ,[Mar]
           ,[Apr]
           ,[May]
           ,[Jun]
           ,[Jul]
           ,[Aug]
           ,[Sep]
           ,[Oct]
           ,[Nov]
           ,[Dec]
           ,[IsDeleted]
           ,[ModifiedOn]
           ,[SystemIp]
           ,[DeletedBy]
           ,[DeletedOn]
           ,[CalendarYear])
     VALUES
           ('206BD919-1D0E-49CE-AB23-F5C602AD79E7',
		   'F44',
		   'COU',
		   '4 Series',
		   1
		   ,1
		   ,1
		   ,1
		   ,1
		   ,1
		   ,15
		   ,12
		   ,2
		   ,11
		   ,11
		   ,1
		   ,0
		   ,'2022-07-28 02:44:31.600'
		   ,'::1'
		   ,0
		   ,NULL
		   ,2022)
GO


