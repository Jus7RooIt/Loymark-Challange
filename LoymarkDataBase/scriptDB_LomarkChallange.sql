USE [LoymarkChallange]
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 12/8/2022 12:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activities](
	[IdActivity] [int] IDENTITY(1,1) NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[IdUser] [int] NOT NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_Activities] PRIMARY KEY CLUSTERED 
(
	[IdActivity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 12/8/2022 12:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryCode] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/8/2022 12:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[BirthDate] [datetime2](7) NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[IsNewsletterConfirmed] [bit] NOT NULL,
	[LowDate] [datetime2](7) NULL,
	[CountryCode] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ABW', N'Aruba')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'AFG', N'Afganistán')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'AGO', N'Angola')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'AIA', N'Anguila')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ALA', N'Islas Áland')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ALB', N'Albania')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'AND', N'Andorra')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ANT', N'Antillas Neerlandesas')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ARE', N'Emiratos Árabes Unidos')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ARG', N'Argentina')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ARM', N'Armenia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ASM', N'Samoa Americana')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ATA', N'Antártida')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ATF', N'Territorios Australes Franceses')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ATG', N'Antigua y Barbuda')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'AUS', N'Australia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'AUT', N'Austria')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'AZE', N'Azerbaiyán')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BDI', N'Burundi')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BEL', N'Bélgica')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BEN', N'Benin')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BFA', N'Burkina Faso')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BGD', N'Bangladesh')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BGR', N'Bulgaria')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BHR', N'Bahréin')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BHS', N'Bahamas')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BIH', N'Bosnia y Herzegovina')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BLM', N'San Bartolomé')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BLR', N'Belarús')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BLZ', N'Belice')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BMU', N'Bermudas')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BOL', N'Bolivia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BRA', N'Brasil')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BRB', N'Barbados')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BRN', N'Brunéi')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BTN', N'Bhután')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BVT', N'Isla Bouvet')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'BWA', N'Botsuana')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'CAF', N'República Centro-Africana')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'CAN', N'Canadá')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'CCK', N'Islas Cocos')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'CHE', N'Suiza')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'CHL', N'Chile')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'CHN', N'China')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'CIV', N'Costa de Marfil')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'CMR', N'Camerún')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'COG', N'Congo')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'COK', N'Islas Cook')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'COL', N'Colombia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'COM', N'Comoros')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'CPV', N'Cabo Verde')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'CRI', N'Costa Rica')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'CUB', N'Cuba')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'CXR', N'Islas Christmas')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'CYM', N'Islas Caimán')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'CYP', N'Chipre')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'CZE', N'República Checa')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'DEU', N'Alemania')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'DJI', N'Yibuti')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'DMA', N'Domínica')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'DNK', N'Dinamarca')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'DOM', N'República Dominicana')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'DZA', N'Argel')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ECU', N'Ecuador')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'EGY', N'Egipto')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ERI', N'Eritrea')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ESH', N'Sahara Occidental')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ESP', N'España')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'EST', N'Estonia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ETH', N'Etiopía')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'FIN', N'Finlandia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'FJI', N'Fiji')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'FRA', N'Francia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'FRO', N'Islas Faroe')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'FSM', N'Micronesia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GAB', N'Gabón')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GBR', N'Reino Unido')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GEO', N'Georgia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GGY', N'Guernsey')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GHA', N'Ghana')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GIB', N'Gibraltar')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GIN', N'Guinea')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GLP', N'Guadalupe')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GMB', N'Gambia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GNB', N'Guinea-Bissau')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GNQ', N'Guinea Ecuatorial')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GRC', N'Grecia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GRD', N'Granada')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GRL', N'Groenlandia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GTM', N'Guatemala')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GUF', N'Guayana Francesa')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GUM', N'Guam')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'GUY', N'Guayana')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'HKG', N'Hong Kong')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'HMD', N'Islas Heard y McDonald')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'HND', N'Honduras')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'HRV', N'Croacia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'HTI', N'Haití')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'HUN', N'Hungría')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'IDN', N'Indonesia')
GO
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'IMN', N'Isla de Man')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'IND', N'India')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'IOT', N'Territorio Británico del Océano Índico')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'IRL', N'Irlanda')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'IRN', N'Irán')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'IRQ', N'Irak')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ISL', N'Islandia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ISR', N'Israel')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ITA', N'Italia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'JAM', N'Jamaica')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'JEY', N'Jersey')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'JOR', N'Jordania')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'JPN', N'Japón')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'KAZ', N'Kazajstán')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'KEN', N'Kenia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'KGZ', N'Kirguistán')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'KHM', N'Camboya')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'KIR', N'Kiribati')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'KLK', N'Islas Malvinas')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'KNA', N'San Cristóbal y Nieves')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'KOR', N'Corea del Sur')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'KWT', N'Kuwait')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'LAO', N'Laos')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'LBN', N'Líbano')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'LBR', N'Liberia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'LBY', N'Libia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'LCA', N'Santa Lucía')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'LIE', N'Liechtenstein')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'LKA', N'Sri Lanka')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'LSO', N'Lesotho')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'LTU', N'Lituania')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'LUX', N'Luxemburgo')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'LVA', N'Letonia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MAC', N'Macao')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MAR', N'Marruecos')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MCO', N'Mónaco')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MDA', N'Moldova')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MDG', N'Madagascar')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MDV', N'Maldivas')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MEX', N'México')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MHL', N'Islas Marshall')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MKD', N'Macedonia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MLI', N'Mali')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MLT', N'Malta')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MMR', N'Myanmar')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MNE', N'Montenegro')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MNG', N'Mongolia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MOZ', N'Mozambique')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MRT', N'Mauritania')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MSR', N'Montserrat')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MTQ', N'Martinica')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MUS', N'Mauricio')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MWI', N'Malawi')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MYS', N'Malasia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'MYT', N'Mayotte')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'NAM', N'Namibia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'NCL', N'Nueva Caledonia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'NER', N'Níger')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'NFK', N'Islas Norkfolk')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'NGA', N'Nigeria')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'NIC', N'Nicaragua')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'NIU', N'Niue')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'NLD', N'Países Bajos')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'NOR', N'Noruega')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'NPL', N'Nepal')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'NRU', N'Nauru')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'NZL', N'Nueva Zelanda')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'OMN', N'Omán')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'PAK', N'Pakistán')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'PAN', N'Panamá')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'PCN', N'Islas Pitcairn')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'PER', N'Perú')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'PHL', N'Filipinas')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'PLW', N'Islas Palaos')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'PNG', N'Papúa Nueva Guinea')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'POL', N'Polonia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'PRI', N'Puerto Rico')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'PRK', N'Corea del Norte')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'PRT', N'Portugal')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'PRY', N'Paraguay')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'PSE', N'Palestina')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'PYF', N'Polinesia Francesa')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'QAT', N'Qatar')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'REU', N'Reunión')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ROU', N'Rumanía')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'RUS', N'Rusia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'RWA', N'Ruanda')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SAU', N'Arabia Saudita')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SDN', N'Sudán')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SEN', N'Senegal')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SGP', N'Singapur')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SGS', N'Georgia del Sur e Islas Sandwich del Sur')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SHN', N'Santa Elena')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SJM', N'Islas Svalbard y Jan Mayen')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SLB', N'Islas Solomón')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SLE', N'Sierra Leona')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SLV', N'El Salvador')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SMR', N'San Marino')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SOM', N'Somalia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SPM', N'San Pedro y Miquelón')
GO
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SRB', N'Serbia y Montenegro')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'STP', N'Santo Tomé y Príncipe')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SUR', N'Surinam')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SVK', N'Eslovaquia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SVN', N'Eslovenia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SWE', N'Suecia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SWZ', N'Suazilandia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SYC', N'Seychelles')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'SYR', N'Siria')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'TCA', N'Islas Turcas y Caicos')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'TCD', N'Chad')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'TGO', N'Togo')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'THA', N'Tailandia')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'TJK', N'Tayikistán')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'TKL', N'Tokelau')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'TKM', N'Turkmenistán')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'TLS', N'Timor-Leste')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'TON', N'Tonga')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'TTO', N'Trinidad y Tobago')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'TUN', N'Túnez')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'TUR', N'Turquía')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'TUV', N'Tuvalu')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'TWN', N'Taiwán')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'TZA', N'Tanzania')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'UGA', N'Uganda')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'UKR', N'Ucrania')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'URY', N'Uruguay')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'USA', N'Estados Unidos de América')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'UZB', N'Uzbekistán')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'VAT', N'Ciudad del Vaticano')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'VCT', N'San Vicente y las Granadinas')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'VEN', N'Venezuela')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'VGB', N'Islas Vírgenes Británicas')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'VIR', N'Islas Vírgenes de los Estados Unidos de América')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'VNM', N'Vietnam')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'VUT', N'Vanuatu')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'WLF', N'Wallis y Futuna')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'WSM', N'Samoa')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'YEM', N'Yemen')
INSERT [dbo].[Countries] ([CountryCode], [Name]) VALUES (N'ZAF', N'Sudáfrica')
GO
ALTER TABLE [dbo].[Activities] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [CountryCode]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK_Activities_Users_IdUser] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK_Activities_Users_IdUser]
GO
