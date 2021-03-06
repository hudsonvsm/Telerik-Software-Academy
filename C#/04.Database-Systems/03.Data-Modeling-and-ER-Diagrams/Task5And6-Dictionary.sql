USE [master]
GO
/****** Object:  Database [MultiLingualDictionaryDB]    Script Date: 24.8.2014 г. 9:33:33 ******/
CREATE DATABASE [MultiLingualDictionaryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MultiLingualDictionaryDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.HUDSONVSM\MSSQL\DATA\MultiLingualDictionaryDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MultiLingualDictionaryDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.HUDSONVSM\MSSQL\DATA\MultiLingualDictionaryDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MultiLingualDictionaryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET  MULTI_USER 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MultiLingualDictionaryDB', N'ON'
GO
USE [MultiLingualDictionaryDB]
GO
/****** Object:  Table [dbo].[Antonyms]    Script Date: 24.8.2014 г. 9:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Antonyms](
	[AntonimID] [int] IDENTITY(1,1) NOT NULL,
	[WordID] [int] NOT NULL,
 CONSTRAINT [PK_Antonyms] PRIMARY KEY CLUSTERED 
(
	[AntonimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Explenations]    Script Date: 24.8.2014 г. 9:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Explenations](
	[ExplenationID] [int] IDENTITY(1,1) NOT NULL,
	[ExplenationText] [nvarchar](200) NOT NULL,
	[WordID] [int] NULL,
 CONSTRAINT [PK_Explenations] PRIMARY KEY CLUSTERED 
(
	[ExplenationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hiponims]    Script Date: 24.8.2014 г. 9:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hiponims](
	[HiponimID] [int] NOT NULL,
	[WordID] [int] NULL,
 CONSTRAINT [PK_Hiponims] PRIMARY KEY CLUSTERED 
(
	[HiponimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hypernims]    Script Date: 24.8.2014 г. 9:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hypernims](
	[HipernimID] [int] NOT NULL,
	[WordID] [int] NOT NULL,
 CONSTRAINT [PK_Hypernims] PRIMARY KEY CLUSTERED 
(
	[HipernimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Languages]    Script Date: 24.8.2014 г. 9:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartOfSpeeches]    Script Date: 24.8.2014 г. 9:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartOfSpeeches](
	[PartOfSpeechID] [int] IDENTITY(1,1) NOT NULL,
	[PartOfSpeech] [nvarchar](50) NOT NULL,
	[WordID] [int] NOT NULL,
 CONSTRAINT [PK_PartOfSpeeches] PRIMARY KEY CLUSTERED 
(
	[PartOfSpeechID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Synonyms]    Script Date: 24.8.2014 г. 9:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Synonyms](
	[SynonymID] [int] IDENTITY(1,1) NOT NULL,
	[Synonym] [int] NOT NULL,
	[WordID] [int] NOT NULL,
 CONSTRAINT [PK_Synonims] PRIMARY KEY CLUSTERED 
(
	[SynonymID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TranslationWords]    Script Date: 24.8.2014 г. 9:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranslationWords](
	[TranslationID] [int] IDENTITY(1,1) NOT NULL,
	[WordID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[ExplenationID] [int] NOT NULL,
	[Translation] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TranslationWords] PRIMARY KEY CLUSTERED 
(
	[TranslationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words]    Script Date: 24.8.2014 г. 9:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words](
	[WordID] [int] IDENTITY(1,1) NOT NULL,
	[Word] [nvarchar](50) NOT NULL,
	[LanguageID] [int] NOT NULL,
 CONSTRAINT [PK_Words] PRIMARY KEY CLUSTERED 
(
	[WordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Antonyms]  WITH CHECK ADD  CONSTRAINT [FK_Antonyms_Words] FOREIGN KEY([WordID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Antonyms] CHECK CONSTRAINT [FK_Antonyms_Words]
GO
ALTER TABLE [dbo].[Explenations]  WITH CHECK ADD  CONSTRAINT [FK_Explenations_Words] FOREIGN KEY([WordID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Explenations] CHECK CONSTRAINT [FK_Explenations_Words]
GO
ALTER TABLE [dbo].[Hiponims]  WITH CHECK ADD  CONSTRAINT [FK_Hiponims_Words] FOREIGN KEY([WordID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Hiponims] CHECK CONSTRAINT [FK_Hiponims_Words]
GO
ALTER TABLE [dbo].[Hypernims]  WITH CHECK ADD  CONSTRAINT [FK_Hypernims_Words] FOREIGN KEY([WordID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Hypernims] CHECK CONSTRAINT [FK_Hypernims_Words]
GO
ALTER TABLE [dbo].[PartOfSpeeches]  WITH CHECK ADD  CONSTRAINT [FK_PartOfSpeeches_Words] FOREIGN KEY([WordID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[PartOfSpeeches] CHECK CONSTRAINT [FK_PartOfSpeeches_Words]
GO
ALTER TABLE [dbo].[Synonyms]  WITH CHECK ADD  CONSTRAINT [FK_Synonyms_Words1] FOREIGN KEY([WordID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[Synonyms] CHECK CONSTRAINT [FK_Synonyms_Words1]
GO
ALTER TABLE [dbo].[TranslationWords]  WITH CHECK ADD  CONSTRAINT [FK_TranslationWords_Explenations] FOREIGN KEY([ExplenationID])
REFERENCES [dbo].[Explenations] ([ExplenationID])
GO
ALTER TABLE [dbo].[TranslationWords] CHECK CONSTRAINT [FK_TranslationWords_Explenations]
GO
ALTER TABLE [dbo].[TranslationWords]  WITH CHECK ADD  CONSTRAINT [FK_TranslationWords_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[TranslationWords] CHECK CONSTRAINT [FK_TranslationWords_Languages]
GO
ALTER TABLE [dbo].[TranslationWords]  WITH CHECK ADD  CONSTRAINT [FK_TranslationWords_Words] FOREIGN KEY([WordID])
REFERENCES [dbo].[Words] ([WordID])
GO
ALTER TABLE [dbo].[TranslationWords] CHECK CONSTRAINT [FK_TranslationWords_Words]
GO
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_Antonyms] FOREIGN KEY([WordID])
REFERENCES [dbo].[Antonyms] ([AntonimID])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_Antonyms]
GO
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_Hiponims] FOREIGN KEY([WordID])
REFERENCES [dbo].[Hiponims] ([HiponimID])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_Hiponims]
GO
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_Hypernims] FOREIGN KEY([WordID])
REFERENCES [dbo].[Hypernims] ([HipernimID])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_Hypernims]
GO
ALTER TABLE [dbo].[Words]  WITH CHECK ADD  CONSTRAINT [FK_Words_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[Words] CHECK CONSTRAINT [FK_Words_Languages]
GO
USE [master]
GO
ALTER DATABASE [MultiLingualDictionaryDB] SET  READ_WRITE 
GO
