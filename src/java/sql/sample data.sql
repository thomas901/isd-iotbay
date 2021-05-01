INSERT INTO Customer (CustomerID, Name, Password, PhoneNumber, Email, Activated, DateOfBirth) VALUES
(756,'Brianna Warren','nulla.','(09) 7842 1323','briannawarren@justo.edu','False','09/08/1998'),
(376,'Kaitlin Patel','elit,','(05) 7402 6028','kaitlin.patel@convallisconvallisdolor.edu','True','02/08/1984'),
(797,'Kendall Roman','luctus','(02) 7933 5071','kendallroman1@rhoncusNullamvelit.ca','True','12/04/1993'),
(262,'Madaline Cantrell','Donec','(05) 7549 0202','madaline.c.cantrell@molestie.edu','False','06/03/1996'),
(435,'Elliott Hampton','odio.','(09) 1393 8890','elliotthampton@lectus.org','False','10/07/1997'),
(508,'Roth Jefferson','Phasellus','(02) 6625 0672','roth123@ullamcorper.com','False','11/05/2000'),
(972,'Travis Munoz','Sed','(04) 9891 7674','munoz465@fermentum.edu','False','03/10/1985'),
(187,'Lacy Patrick','Nullam','(01) 8195 3027','lacy.patrick@idsapienCras.ca','False','12/07/1986'),
(737,'Olympia Calderon','neque','(02) 0472 1883','olympia.c@dignissimpharetra.edu','False','03/10/1983'),
(798,'Scarlett Ramsey','risus.','(04) 8151 2419','s.ramsey12@euismodurna.edu','True','05/02/1989'),
(286,'Tatyana Moon','lacinia','(04) 9967 2427','tatyama.a.m@lectus.com','True','02/04/1999'),
(870,'Preston Mercer','nibh','(07) 1698 2734','preston@fringilla.org','True','12/12/1986'),
(625,'Kieran Bentley','Etiam','(07) 6232 6730','bentleykieran@Phasellusvitaemauris.net','False','12/04/1995'),
(584,'Autumn Luna','Cras','(07) 1650 1401','autumn.luna@congueaaliquet.edu','True','04/10/1997'),
(695,'Victor Farley','eget','(02) 7598 8137','vic12@lacinia.net','True','09/11/1996'),
(184,'Martena Franklin','penatibus','(04) 6809 7696','martena.franklin@morbisitamet.net','False','03/04/1993'),
(136,'Fitzgerald Hobbs','odio.','(04) 3916 6598','hobbs.f@fuscemi.org','True','04/02/1990'),
(401,'Marny Wooten','pulvinar','(03) 7509 1499','marny.s.wooten3@ipsum.com','False','11/03/1989'),
(837,'Nathaniel Woodward','Sed','(03) 5644 3264','nathaniel.woodward@magnaCras.net','True','06/10/1998'),
(337,'Ima Stanley','feugiat.','(08) 5943 0330','ima123@ligula.co.uk','True','08/11/1995');

INSERT INTO Staff (StaffID, Name, Password, Email, PhoneNumber, AccountType) VALUES
(624,'Blossom Navarro','ipsum','feugiat.metus@magnaPraesentinterdum.edu','(06) 2624 7462',1),
(919,'Yoshio Downs','elit,','Nulla@Maecenaslibero.co.uk','(07) 0512 0066',0),
(769,'Jelani Ratliff','faucibus','Cum@Suspendisse.com','(07) 3438 0249',1),
(745,'Mia Wolfe','malesuada','in@lacinia.co.uk','(04) 3847 2496',0),
(135,'Martha Carlson','Mauris','mauris.erat@loremeumetus.net','(02) 8187 6532',0),
(881,'Eagan Terry','quis,','ligula.tortor.dictum@inmagnaPhasellus.org','(01) 6457 6736',1),
(733,'Dolan Robertson','ligula.','dis.parturient@utlacus.org','(04) 0943 7348',1),
(447,'Griffith Harrell','ut','bibendum.sed.est@aliquamarcu.com','(02) 2996 4415',1),
(786,'Paula Hansen','natoque','Suspendisse.commodo@euultricessit.org','(07) 3515 0151',0),
(125,'Jillian Adkins','vulputate','eu.odio.Phasellus@blanditmattis.co.uk','(01) 0448 1577',1),
(856,'Ifeoma Rocha','urna','et.netus@laoreet.ca','(07) 0592 9252',0),
(956,'Robin Santana','auctor','facilisis.eget@faucibusorciluctus.edu','(07) 0616 3232',1),
(514,'Conan Good','varius','Vivamus.nibh@justo.edu','(02) 6172 9546',0),
(115,'Jaden Lawson','erat','diam@ProinmiAliquam.co.uk','(01) 1775 4723',0),
(829,'Lewis Gilmore','Phasellus','sapien.Nunc.pulvinar@Nulla.edu','(09) 7827 3251',1),
(337,'Vera Dickerson','pede','gravida.Aliquam@interdumCurabiturdictum.com','(06) 2219 9583',1),
(928,'Hanae Mayer','fringilla','eleifend.egestas.Sed@semperet.edu','(06) 3442 1821',0),
(433,'Aidan Bartlett','blandit','at.arcu@ligulaeuenim.com','(05) 1374 7814',1),
(632,'Haley Sherman','penatibus','feugiat@doloregestas.com','(02) 4574 6975',1),
(119,'Kyra Little','ante','quis.tristique.ac@semperauctor.ca','(02) 8946 7676',0);

INSERT INTO Category (CategoryID, Name) VALUES
(100, 'Antennas'),
(101, 'Computers'),
(102, 'Components'),
(103, 'Development Platforms'),
(104, 'Gateways'),
(105, 'Peripheral Modules'),
(106, 'Security'),
(107, 'Sensors'),
(108, 'Tools'),
(109, 'Kits'),
(110, 'Devices'),
(111, 'Motors'),
(112, 'Wiring'),
(113, 'Actuators'),
(114, 'Lights'),
(115, 'GPS'),
(116, 'Accessories'),
(117, 'Power'),
(118, 'Tape'),
(119, 'Clock');

INSERT INTO Product (ProductID, Name, Stock, Description, CategoryID, Brand, Price) VALUES
(100, 'Globalsat Temperature & Humidity Sensor', 15, 'Senses temperature', 107, 'Globalsat', 300.00),
(101, 'XOR Gate', 133, 'Provides basic XOR functionality', 112 , 'Enovo', 12.00),
(102, 'AND Gate', 156, 'Provides basic AND functionality', 112, 'Enovo', 12.00),
(103, 'OR Gate', 465, 'Provides basic OR functionality', 112, 'Enovo', 12.00),
(104, 'NOT Gate', 32, 'Provides basic NOT functionality', 112, 'Enovo', 12.00),
(105, 'Temperature Sensor', 21, 'Senses temperatures from -100C to 150C', 107, 'Samsara', 30.50),
(106, 'Red LED Light', 845, 'Red LED light with brightness of 30 lum', 114, 'Inspire', 11.50),
(107, 'Blue LED Light', 1230, 'Blue LED light with brightness of 30 lum', 114, 'Inspire', 11.50),
(108, 'Yellow LED Light', 654, 'Yellow LED light with brightness of 30 lum', 114, 'Inspire', 11.50),
(109, 'Green LED Light', 135, 'Green LED light with brightness of 30 lum', 114, 'Inspire', 11.50),
(110, 'Purple LED Light', 146, 'Purple LED light with brightness of 30 lum', 114, 'Inspire', 11.50),
(111, 'Positional Servomotor', 13, 'Positional Servomotor capable of 180 degree rotation at a torque ratio of 3', 111, 'Tive', 79.00),
(112, 'Continuous Servomotor', 4, 'Continuous Servomotor capable of unlimited rotation at a torque ratio of 3.5', 111, 'Tive', 85.00),
(113, 'Linear Servomotor', 6, 'Linear Servomotor capable of discrete movement with a torque ratio of 2', 111, 'Tive', 65.00),
(114, '30MP Imaging Camera', 9, 'Imaging Camera with 30MP lens and full colour', 107, 'Simplisafe', 265.00),
(115, 'Digital Clock', 46, 'Basic programmble digital clock with custom display', 119, 'Enovo', 31.00),
(116, 'Beginner Arduino Kit', 7, 'Beginner Arduino Kit perfect for anyone new to IoT', 109, 'Arduino', 150.00),
(117, 'IoT Tool Set', 14, 'Stainless steel tool set', 108, 'IoTEssentials', 65.00),
(118, '5V 2A Transformer', 66, '5V 2A Transformer from 240V', 117, 'IoTEssentials', 58.00),
(119, '30m Electrical Tape (5mm thick)', 198, '30m electrical tape with thickness of 5mm', 118, 'IoTEssentials', 20.00);

INSERT INTO "ORDER" (OrderID, CustomerID, OrderedDate, Status, ShippedDate, TotalPrice, FulfilledBy, AddressID, Address, PaymentID, Paid, DatePaid) VALUES
(100, 756, '01/01/2020', 'Fulfilled', '01/05/20', 56.00, 624, ###, '', ###, 'True', '01/01/2020'),
(101, , '', '', '', , , , '', , '', ''),
(102, , '', '', '', , , , '', , '', ''),
(103, , '', '', '', , , , '', , '', ''),
(104, , '', '', '', , , , '', , '', ''),
(105, , '', '', '', , , , '', , '', ''),
(106, , '', '', '', , , , '', , '', ''),
(107, , '', '', '', , , , '', , '', ''),
(108, , '', '', '', , , , '', , '', ''),
(109, , '', '', '', , , , '', , '', ''),
(110, , '', '', '', , , , '', , '', ''),
(111, , '', '', '', , , , '', , '', ''),
(112, , '', '', '', , , , '', , '', ''),
(113, , '', '', '', , , , '', , '', ''),
(114, , '', '', '', , , , '', , '', ''),
(115, , '', '', '', , , , '', , '', ''),
(116, , '', '', '', , , , '', , '', ''),
(117, , '', '', '', , , , '', , '', ''),
(118, , '', '', '', , , , '', , '', ''),
(119, , '', '', '', , , , '', , '', '');

--orderlineitem

INSERT INTO PaymentMethod (PaymentMethodID, CustomerID, CardNumber, CardExpiryYear, CardExpiryMonth, CVC) VALUES
(100, 756, 5621463535262158, 2022, 01, 356),
(101, 756, 7954621458536254, 2025, 03, 156),
(102, 376, 3564918457316458, 2024, 11, 124),
(103, 797, 4365134265925465, 2021, 10, 125),
(104, 435, 6565337326167778, 2021, 06, 369),
(105, 435, 5654643231645647, 2026, 05, 989),
(106, 508, 5649161346465584, 2024, 07, 135),
(107, 972, 5692818435356564, 2023, 12, 468),
(108, 187, 2316497672616558, 2023, 06, 124),
(109, 737, 2326169584673856, 2023, 06, 168),
(110, 401, 5649731646465727, 2021, 05, 267),
(111, 136, 4656594928231645, 2026, 08, 154),
(112, 584, 4659594816434687, 2025, 02, 698),
(113, 337, 5356462928643568, 2024, 01, 247),
(114, 870, 5659494323264584, 2022, 06, 264),
(115, 870, 3146499134345688, 2023, 09, 398),
(116, 625, 3467946432565638, 2021, 10, 761),
(117, 401, 6595946464665377, 2027, 10, 186),
(118, 337, 3164997282213278, 2023, 12, 346),
(119, 972, 6494643527631645, 2021, 04, 658);

--cartlineitem

INSERT INTO Address (AddressID, CustomerID, AddressLine1, AddressLine2, City, State, PostalCode, Country) VALUES
(100, 756, '1 Street Road', 'Floor 3', 'Sydney', 'NSW', '4653', 'Australia'),
(101, 376, '56 Road Avenue', 'Level 4a', 'Sydney', 'NSW', '6465', 'Australia'),
(102, 797, '98 Street Lane', 'Office 45', 'Wollongong', 'NSW', '1354', 'Australia'),
(103, 262, '3 Road Road', 'NSW 1568', 'Wagga Wagga', 'NSW', '1568', 'Australia'),
(104, 435, '8 Avenue Street', 'NSW', 'Sydney', 'NSW', '1568', 'Australia'),
(105, 508, '98 Street Street', '9283', 'Sydney', 'NSW', '9283', 'Australia'),
(106, 972, '77 Road Road', 'Sydney', 'Sydney', 'NSW', '1356', 'Australia'),
(107, 187, '69 Lane Road', 'Building 3a', 'Newcastle', 'NSW', '6845', 'Australia'),
(108, 737, '33 Avenue Lane', 'Floor 2', 'Central Coast', 'NSW', '9898', 'Australia'),
(109, 798, '2 Street Road', 'Floor 2', 'Sydney', 'NSW', '1369', 'Australia'),
(110, 286, '4 Avenue Avenue', 'Buidling 2', 'Sydney', 'NSW', '4463', 'Australia'),
(111, 870, '8 Lane Lane', 'Office 2b', 'Sydney', 'NSW', '6933', 'Australia'),
(112, 625, '19 Road Avenue', 'NSW 9022', 'Newcastle', 'NSW', '9022', 'Australia'),
(113, 584, '397 Main Road', 'Building 17', 'Sydney', 'NSW', '4563', 'Australia'),
(114, 695, '9 Avenue Street', 'NSW', 'Sydney', 'NSW', '1568', 'Australia'),
(115, 187, '13 Main Street', 'Floor 1', 'Central Coast', 'NSW', '4646', 'Australia'),
(116, 136, '59 Main Avenue', '2901', 'Sydney', 'NSW', '2901', 'Australia'),
(117, 401, '688 Road Street', '1778 NSW', 'Sydney', 'NSW', '1778', 'Australia'),
(118, 837, '34 Lane Road', 'Level 4 cell 17', 'Coffs Harbour', 'NSW', '6764', 'Australia'),
(119, 337, '468 Road Road', 'Sydney', 'Sydney', 'NSW', '1356', 'Australia');

--access
