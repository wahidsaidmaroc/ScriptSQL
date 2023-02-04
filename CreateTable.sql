USE [FormationOumdinAcademy]
GO
/****** Object:  Table [dbo].[T_BonCommande]    Script Date: 04/02/2023 10:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BonCommande](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dateCommande] [date] NULL,
	[_idClient] [int] NULL,
	[etatCommande] [int] NULL,
 CONSTRAINT [PK_T_BonCommande] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Categorie]    Script Date: 04/02/2023 10:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Categorie](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categorie] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_Categorie] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Client]    Script Date: 04/02/2023 10:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Client](
	[id] [int] NOT NULL,
	[client] [nvarchar](50) NULL,
	[adresse] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_Client] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_DetailCommande]    Script Date: 04/02/2023 10:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DetailCommande](
	[id] [int] NOT NULL,
	[_idCommande] [int] NULL,
	[_idProduit] [int] NULL,
	[qnt] [decimal](18, 2) NULL,
	[prixUnitaire] [decimal](18, 2) NULL,
	[total] [decimal](18, 2) NULL,
 CONSTRAINT [PK_T_DetailCommande] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Produit]    Script Date: 04/02/2023 10:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Produit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NULL,
	[codeProduit] [nvarchar](50) NULL,
	[prixUnitaire] [decimal](18, 2) NULL,
	[_idCategorie] [int] NULL,
 CONSTRAINT [PK_T_Produit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[T_BonCommande]  WITH CHECK ADD  CONSTRAINT [FK_T_BonCommande_T_Client] FOREIGN KEY([_idClient])
REFERENCES [dbo].[T_Client] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_BonCommande] CHECK CONSTRAINT [FK_T_BonCommande_T_Client]
GO
ALTER TABLE [dbo].[T_DetailCommande]  WITH CHECK ADD  CONSTRAINT [FK_T_DetailCommande_T_BonCommande] FOREIGN KEY([_idCommande])
REFERENCES [dbo].[T_BonCommande] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_DetailCommande] CHECK CONSTRAINT [FK_T_DetailCommande_T_BonCommande]
GO
ALTER TABLE [dbo].[T_DetailCommande]  WITH CHECK ADD  CONSTRAINT [FK_T_DetailCommande_T_Produit] FOREIGN KEY([_idProduit])
REFERENCES [dbo].[T_Produit] ([id])
GO
ALTER TABLE [dbo].[T_DetailCommande] CHECK CONSTRAINT [FK_T_DetailCommande_T_Produit]
GO
ALTER TABLE [dbo].[T_Produit]  WITH CHECK ADD  CONSTRAINT [FK_T_Produit_T_Categorie] FOREIGN KEY([_idCategorie])
REFERENCES [dbo].[T_Categorie] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Produit] CHECK CONSTRAINT [FK_T_Produit_T_Categorie]
GO
