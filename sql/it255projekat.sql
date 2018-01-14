-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2018 at 03:01 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `it255projekat`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategorija`
--

CREATE TABLE `kategorija` (
  `id` int(11) NOT NULL,
  `naziv` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategorija`
--

INSERT INTO `kategorija` (`id`, `naziv`) VALUES
(1, 'Gume'),
(2, 'Felne'),
(3, 'Radio'),
(4, 'Navigacija'),
(5, 'Akumulatori');

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `id` int(11) NOT NULL,
  `ime` varchar(128) NOT NULL,
  `prezime` varchar(128) NOT NULL,
  `adresa` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `lozinka` varchar(128) NOT NULL,
  `role_id` int(11) NOT NULL,
  `token` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`id`, `ime`, `prezime`, `adresa`, `email`, `lozinka`, `role_id`, `token`) VALUES
(6, 'Ivan', 'Petrovic', 'Brdo Banovo', 'brdo@gmail.com', '9cda68744c8d3ca090289f416e5289e2', 1, '70428980f0e63057620d79c370be5ba856cde5d0'),
(7, 'Mitar', 'Miric', 'Pozeska 94', 'tarmi@gmail.com', '8c97a844248a27645343e70d4981ff8a', 0, 'b30c50a8ac3478673b3bd3167d2aa9855c0b4dfc');

-- --------------------------------------------------------

--
-- Table structure for table `korpa`
--

CREATE TABLE `korpa` (
  `id` int(11) NOT NULL,
  `idKorisnika` int(11) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korpa`
--

INSERT INTO `korpa` (`id`, `idKorisnika`, `flag`) VALUES
(16, 2, 2),
(17, 3, 2),
(18, 2, 2),
(19, 2, 2),
(20, 2, 2),
(21, 2, 2),
(22, 3, 2),
(23, 2, 2),
(24, 3, 1),
(25, 2, 2),
(26, 5, 2),
(27, 5, 2),
(28, 5, 1),
(29, 4, 2),
(30, 4, 1),
(31, 2, 1),
(32, 6, 1),
(33, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `narudzbina`
--

CREATE TABLE `narudzbina` (
  `id` int(11) NOT NULL,
  `idKorpe` int(11) NOT NULL,
  `idProizvoda` int(11) NOT NULL,
  `kolicina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `narudzbina`
--

INSERT INTO `narudzbina` (`id`, `idKorpe`, `idProizvoda`, `kolicina`) VALUES
(81, 18, 1, 6),
(82, 18, 27, 1),
(83, 19, 5, 5),
(84, 20, 1, 6),
(85, 21, 1, 6),
(86, 17, 3, 1),
(87, 22, 1, 3),
(88, 23, 1, 6),
(89, 0, 5, 1),
(90, 0, 6, 1),
(91, 26, 1, 1),
(92, 27, 5, 6),
(93, 29, 3, 4),
(94, 29, 4, 1),
(95, 25, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `prodavnica`
--

CREATE TABLE `prodavnica` (
  `id` int(11) NOT NULL,
  `naziv` varchar(128) NOT NULL,
  `adresa` varchar(128) NOT NULL,
  `radnoVreme` varchar(128) NOT NULL,
  `katObjektaID` int(11) NOT NULL,
  `urlMape` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prodavnica`
--

INSERT INTO `prodavnica` (`id`, `naziv`, `adresa`, `radnoVreme`, `katObjektaID`, `urlMape`) VALUES
(1, 'TSS Novi Sad', 'Strazilovska 31, Novi Sad', 'Ponedeljak - Petak 09h-20h\r\nSubota 09h-14h', 1, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2844.171348881987!2d19.22077685119773!3d44.53212400306642!2m3!1f0!2f0!3f0!'),
(2, 'TSS Nis', 'Bulevar Medijana 21, Nis', 'Ponedeljak - Nedelja 10h-22h', 2, ''),
(3, 'TSS Delta City', 'I Sprat\r\nJurija Gagarina 16, Beograd', 'Ponedeljak - Nedelja 10h-22h', 1, ''),
(4, 'TSS Stadion', 'II sprat\r\nZaplanjska 32, Beograd', 'Ponedeljak - Nedjelja 10h-22h', 2, ''),
(5, 'TSS Usce', 'II sprat\r\nBulevar Mihajla Pupina 4, Beograd', 'Ponedeljak - Nedjelja 10h-22h', 1, ''),
(6, 'TSS Big Fashion', 'Visnjicka 84, Beograd', 'Ponedeljak - Nedjelja 10h-22h', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `proizvod`
--

CREATE TABLE `proizvod` (
  `id` int(11) NOT NULL,
  `katID` int(11) NOT NULL,
  `ime` varchar(128) NOT NULL,
  `opis` varchar(512) NOT NULL,
  `cena` int(11) NOT NULL,
  `url` varchar(256) NOT NULL,
  `akcija` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proizvod`
--

INSERT INTO `proizvod` (`id`, `katID`, `ime`, `opis`, `cena`, `url`, `akcija`) VALUES
(1, 2, 'OZ Zeus', 'Velicina: 20" ili 21", Aluminijum, Dostupno u vise boja', 23500, 'http://www.ozracing.com/cache/images/images/products/wheels/zeus/hand-brushed/01_zeus-hand-brushed-default_233x194.png', 0),
(2, 2, 'OZ Botticelli III', 'Velicina: 19", 20", 21". Aluminijum. Dostupno u vise boja', 25000, 'http://www.ozracing.com/cache/images/images/products/wheels/botticelli-iii/matt-black/01_botticelli-iii-matt-black-default_233x194.png', 10),
(3, 2, 'OZ Ego', 'Velicina: 16", 17", 18". Aluminijum i silicijum. Dostupno u crnoj boji', 20000, 'http://www.ozracing.com/cache/images/images/products/wheels/ego/matt-black-diamond-cut/01_ego-matt-black-diamond-cut-default_233x194.png', 10),
(4, 2, 'BBS RX-R', 'Velicine: 19" i 20". Aluminijum. Dostupno u vise boja', 18000, 'https://bbs.com/images/produkte/performance_line/rx_gold_matt_produktteaser_vorschau.png', 10),
(5, 2, 'Summit Racing RLW', 'Velicina: 13", 14", 15". Celik. Dostupno u crnoj boji.', 2500, 'https://static.summitracing.com/global/images/prod/mediumlarge/rlw-rt8150012_ml.jpg', 10),
(6, 1, 'Michelin PRIMACY 4', 'Dugotrajne performanse Optimalan gazeci sloj. Zahvaljujuci novom dizajnu sare radi ve?e bezbednosti, MICHELIN Primacy 4 zadrzava visok nivo izbacivanja vode cak i kada je istrošen.\r\nNjegov novi gazeci sloj omogucava +22% prostora za izbacivanje vode.', 22221, 'http://www.michelin.rs/content/img/tyres/2.1/primacy-4/150x200_desktop_primacy_4.png', 0),
(7, 1, 'LASSA SNOWAYS 2+', '165/70 R14 81T', 4130, 'https://www.kemoimpex.com/upload/tires/24227.jpg', 10),
(8, 1, 'STARFIRE WT200', '185/65 R15 88T', 4023, 'https://www.kemoimpex.com/upload/tires/26955.jpg', 10),
(9, 1, 'PIRELLI CINTURATO P7', '225/45 R17 91W', 11002, 'https://www.kemoimpex.com/upload/tires/31512.jpg', 10),
(10, 1, 'PIRELLI SOTTOZERO 3', '315/30 R21 105V', 93086, 'https://www.kemoimpex.com/upload/tires/41064.jpg', 10),
(11, 3, 'Sony GS Series MEXGS810BH', 'Bluetooth audio streaming sa jednostavnim sigurnim uparivanjem, prigodnim za slušanjem sa jednim dodirom pomo?u NFC tehnologije, daljinskim upravlja?em sa glasovnom kontrolom za odabrane pametne telefone, integrisani HD radio tjuner10 sa RDS i iTunes ozna?avanjem.', 10250, 'https://images-na.ssl-images-amazon.com/images/I/81vyls1cPnL._SL1500_.jpg', 10),
(12, 3, 'Pioneer AVH-X2800BS', 'Omogucava pustanje DVD i CD. \r\nUgra?eni Bluetooth za handsfree poziv i audio streaming; podržava dva telefona odjednom.\r\nUgra?eni iPod, iPhone i iPad kontrolni opcioni adapter potreban za gledanje video sadržaja.', 23000, 'https://images-na.ssl-images-amazon.com/images/I/51w6E5RDB9L.jpg', 0),
(13, 3, 'Bluetooth Car Audio Stereo Receiver - LESHP', 'Pogodno za nova vozila, zahteva manje prostora za ugradnju.\r\nNema CD ili DVD plejer, pu[ta sa USB / SD, MP3, VMA, FM i pametne telefone.\r\nOvaj automobil stereo plejer ima ugra?eni Bluetooth i mikrofon za handsfree pozivanje.\r\nFM radio, 18 radio stanica može se ?uvati', 2450, 'https://images-na.ssl-images-amazon.com/images/I/61bRXE8ZqiL._SL1500_.jpg', 10),
(14, 3, 'Alpine CDE-W265BT', 'CD / MP3 prijemnik sa podrškom za Bluetooth i iPhone / iPod\r\nCD prijemnik sa AM / FM tjunerom\r\nUgra?eno MOSFET poja?alo (18 vati RMS CEA-2006/50 maksimalno k 4 kanala)\r\nReprodukuje CD-ove, uklju?uju?i diskove sa MP3 i VMA datotekama\r\n2-linijski displej sa promenljivom bojom osvetljenja', 28900, 'https://images-na.ssl-images-amazon.com/images/I/51qegSOi35L.jpg', 10),
(15, 3, 'Pioneer DEH-X7800BHS', 'Ugra?eni Bluetooth za handsfree pozivanje i beži?ni audio streaming\r\nUgra?eni HD radio\r\nSpotifi, radi sa Pandora, SiriusKSM-Readi\r\nPioneer ARC App kompatibilan\r\nFLAC audio reprodukcija', 21000, 'https://images-na.ssl-images-amazon.com/images/I/61PWA--VYbL._SL1000_.jpg', 10),
(16, 4, 'G-TEXNIK 001', '7", Podrska za FM Radio, 800 * 480 rezolucija, 8GB interne memorije.', 7800, 'https://images-na.ssl-images-amazon.com/images/I/61MvFhZCT8L._SL1000_.jpg', 0),
(17, 4, 'PRESTIGIO GeoVision 5058', 'Dijagonala ekrana: 5.0"\r\nRezolucija ekrana: 480 x 272', 9500, 'https://www.gigatron.rs/img/products/large/image565c1df9442c3.png', 10),
(18, 4, 'GARMIN Drive 50 LM', 'Dijagonala ekrana: 5.0"\r\nRezolucija ekrana: 480 x 272\r\n', 27000, 'https://www.gigatron.rs/img/products/large/image5a2fdda05975c.png', 10),
(19, 4, 'GARMIN DriveLuxe 50 LMT', 'Dijagonala ekrana: 5.1"\r\nRezolucija ekrana: 800 x 480\r\nBluetooth: Da', 58000, 'https://www.gigatron.rs/img/products/large/image580ddfced4e96.png', 10),
(20, 4, 'Pioneer AVIC-F860BT', 'Dijagonala ekrana: 6.1"\r\n', 92000, 'https://www.gigatron.rs/img/products/large/image54ec4a4212769.jpg', 10),
(21, 5, 'Power-Max Eco PM1350', 'Polaritet: Levi +\r\nKapacitet: 135 Ah\r\nStartna snaga: 800 A(EN)', 14820, 'http://www.akumulator-shop.rs/images/stories/virtuemart/product/pe1350-jo.jpg', 0),
(22, 5, 'Varta Silver Dynamic', 'Polaritet: Desni\r\nKapacitet: 63Ah\r\nStartna snaga: 610 A(EN)', 11340, 'http://www.akumulator-shop.rs/images/stories/virtuemart/product/resized/magictoolbox_cache/edae1e15551de3322abb8a2a6d8950db/4/5/456/original/7e304cddd70f272a2c8bd12f2d6f82a4.jpg', 10),
(23, 5, 'Varta Blue Dynamic', 'Polaritet: Desni +\r\nKapacitet: 95 Ah\r\nStartna snaga: 800 A(EN)', 15588, 'http://www.akumulator-shop.rs/images/stories/virtuemart/product/resized/magictoolbox_cache/edae1e15551de3322abb8a2a6d8950db/4/6/462/original/5515ae1170bd1bbaac8e964549d0ba6a.jpg', 10),
(24, 5, 'Exide Start-Stop AGM EK600', 'Polaritet: Desni +\r\nKapacitet: 60 Ah\r\nStartna snaga: 680 A(EN)', 14686, 'http://www.akumulator-shop.rs/images/stories/virtuemart/product/ek600.jpg', 10),
(25, 5, 'Exide Start-Stop AGM EK700', 'Polaritet: Desni +\r\nKapacitet: 70 Ah\r\nStartna snaga: 760 A(EN)', 17074, 'http://www.akumulator-shop.rs/images/stories/virtuemart/product/ek700.jpg', 10);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(0, 'Korisnik'),
(1, 'Administrator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `korpa`
--
ALTER TABLE `korpa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `narudzbina`
--
ALTER TABLE `narudzbina`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prodavnica`
--
ALTER TABLE `prodavnica`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proizvod`
--
ALTER TABLE `proizvod`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `korpa`
--
ALTER TABLE `korpa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `narudzbina`
--
ALTER TABLE `narudzbina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT for table `prodavnica`
--
ALTER TABLE `prodavnica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `proizvod`
--
ALTER TABLE `proizvod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
