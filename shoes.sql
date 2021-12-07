-- Adminer 4.7.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `brand` (`id`, `name`) VALUES
(1,	'Blue');

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `category` (`id`, `name`) VALUES
(1,	'Nam'),
(2,	'Nữ'),
(3,	'Trẻ Em');

DROP TABLE IF EXISTS `oder`;
CREATE TABLE `oder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `oderDate` date DEFAULT NULL,
  `status` int NOT NULL,
  `total` float NOT NULL,
  `userId` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1wagi9ts0f1g5nnb8k5443wtr` (`userId`),
  CONSTRAINT `FK1wagi9ts0f1g5nnb8k5443wtr` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `oder` (`id`, `oderDate`, `status`, `total`, `userId`) VALUES
(1,	'2021-11-30',	2,	20000,	2),
(2,	'2021-11-30',	2,	8000,	2),
(3,	'2021-11-30',	2,	20000,	1),
(4,	'2021-11-30',	2,	120000,	2),
(5,	'2021-11-30',	1,	20000,	2),
(6,	'2021-12-01',	0,	6000.09,	2),
(7,	'2021-11-30',	1,	20000,	1),
(8,	'2021-11-30',	2,	2000.02,	1),
(9,	'2021-11-30',	0,	20000,	1);

DROP TABLE IF EXISTS `oderdetail`;
CREATE TABLE `oderdetail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `total` float NOT NULL,
  `unitPrice` float NOT NULL,
  `oderId` bigint NOT NULL,
  `productId` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhw943wf28anbwlglthm4jx6ex` (`oderId`),
  KEY `FK2b2fi4slsjni9rmu2mj5mwu1v` (`productId`),
  CONSTRAINT `FK2b2fi4slsjni9rmu2mj5mwu1v` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `FKhw943wf28anbwlglthm4jx6ex` FOREIGN KEY (`oderId`) REFERENCES `oder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `oderdetail` (`id`, `quantity`, `total`, `unitPrice`, `oderId`, `productId`) VALUES
(2,	1,	20000,	20000,	1,	10),
(3,	4,	8000,	2000,	2,	11),
(4,	1,	20000,	20000,	3,	10),
(5,	5,	100000,	20000,	4,	10),
(6,	1,	20000,	20000,	5,	10),
(8,	2,	4000,	2000,	6,	11),
(9,	1,	20000,	20000,	7,	10),
(10,	1,	2000,	2000,	8,	11),
(11,	1,	0.0222,	0.0222,	8,	13),
(12,	1,	20000,	20000,	9,	10),
(13,	4,	0.0888,	0.0222,	6,	13);

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` text,
  `name` varchar(255) DEFAULT NULL,
  `price` float NOT NULL DEFAULT '3000',
  `size` varchar(255) DEFAULT '36',
  `brandId` bigint NOT NULL DEFAULT '1',
  `categoryId` bigint NOT NULL DEFAULT '2',
  `stock` int NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `FKa6of0r92t61g7xd5li0pi9xji` (`brandId`),
  KEY `FK42iy97xlo64j31dslbn36vmyh` (`categoryId`),
  CONSTRAINT `FK42iy97xlo64j31dslbn36vmyh` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `FKa6of0r92t61g7xd5li0pi9xji` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `product` (`id`, `description`, `name`, `price`, `size`, `brandId`, `categoryId`, `stock`) VALUES
(10,	'Mô tả A',	'Tên a',	20000,	'S',	1,	1,	2),
(11,	'Mô tả B',	'Tên B',	2000,	'M',	1,	3,	2),
(12,	'Mô tả C',	'Tên C',	3000,	'M',	1,	2,	5),
(13,	'ád',	'huan',	0.0222,	'S',	1,	3,	20),
(15,	'123',	'San phẩm D',	0.0222,	'S',	1,	3,	10),
(16,	'123',	'san pham d',	2000,	'S',	1,	1,	20),
(17,	'It may be cold outside, but the Nike Air Force 1 \'07 LV8, made from at least 20% recycled materials by weight, heats up your wardrobe.This essential puts a winterized spin on what you know best, with quilted details and a super-soft, fleece-like lining that\'s designed to help keep you cosy.The speckled rubber outsoles are made from Nike Grind, which is recycled waste (i.e. the scraps) from the footwear manufacturing process.',	'Nike Air Force 1',	20000,	'S',	1,	1,	2),
(18,	'The radiance lives on in the Nike Air Force 1 \'07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.',	'Nike Air Force 1 07',	30000,	'S',	1,	1,	2),
(19,	'Blending features from 2 classic \'90s style influences, the Nike Aqua Rift takes retro beach style into the present with a futuristic silhouette and an exaggerated stance. Featuring the iconic split toe from Nike Air Rift, it looks like nothing else on the streets. Larger-than-life shapes and cartoonish colours from the Nike Aqua line put the upper in a time and place all of its own',	'Nike Aqua Rift',	30000,	'S',	1,	1,	2),
(20,	'Bringing back the sporty aesthetic imagined by a famed Nike designer, the Nike Air Max 96 II remake is a wardrobe essential.With winter colours on top of a classic \'90s construction, it pairs sophisticated style with fast-paced, athletics-inspired details.Its large Nike Air unit keeps the perfect amount of casual while adding lasting comfort.',	'Nike Air Max 96 II',	30000,	'S',	1,	1,	2),
(21,	'The original Nike Air Max 90 was renowned for its clean lines and timeless style. The Nike Air Max 90 G stays true to the OG icon with a few updates made for golf, like integrated traction and a thin overlay that helps keep out water.',	'Nike Air Max 90 G',	30000,	'S',	1,	1,	2),
(22,	'While these speedsters could easily pass the test on race day, they double as your go-to shoe for your training routine. The supportive fit and soft cushioning work together to make them comfortable enough to withstand those double-digit mileage days, and light enough to help quicken your tempo when the time is right.',	'\r\nNike Air Zoom Tempo NEXT%',	30000,	'S',	1,	1,	2),
(26,	'The Nike Renew In-Season TR 11 has a deep, comfortable footbed with soft foam that gives you superior cushioning and energy return for HIIT classes that take you from floor exercises to the treadmill. The sole adds a supportive arc to the side to help keep your foot contained during lateral moves.',	'Nike Renew In-Season TR 11\r\n',	3000,	'36',	1,	2,	100),
(27,	'Made from at least 20% recycled material by weight, the sock-like boot of this Nike Free is designed to transition from running to training to your everyday routine. With a breathable knit upper, it combines the flexibility you love with a secure design that will help keep you close to the ground for that barefoot feeling. New cushioning is lighter, softer and more responsive than previous versions so you can keep moving in comfort whether you\'re on the tarmac or track.\r\n\r\n',	'Nike Free Run 5.0',	3000,	'36',	1,	2,	100),
(28,	'The Air Force 1 Mid \'07 is everything you know best: crisp overlays, bold details and the perfect amount of flash to let your shoe game shine.The padded, mid-height collar with a classic hook-and-loop closure adds heritage b-ball comfort.Perforations on the toe help keep you cool.',	'Nike Air Force 1 Mid',	3000,	'36',	1,	2,	100),
(29,	'What\'s cooler than cool? \'Cool Grey\', of course. Taking inspiration from the original that MJ wore en route to his fourth championship ring, the Air Jordan 11 \'Cool Grey\' is back for its heralded 20th anniversary. This classic colourway, worn by MJ during his return to the league, features premium patent and nubuck leathers, full-length Nike Air cushioning and an icy outsole.',	'Cool Grey',	3000,	'36',	1,	2,	100),
(30,	'Following in the footsteps of the OG from \'79, the marathon-winning Nike Daybreak is a blast from the past that brings style and history through every detail. It has the iconic Waffle outsole, wool upper and a heritage sports colourway that brings varsity-level design to the streets.',	'Nike Daybreak',	3000,	'36',	1,	2,	100),
(31,	'The faster Kyrie slows down, the quicker he can speed up or change direction. His ability to control his movement keeps defenders guessing—and him in control. The Kyrie Infinity EP provides a cushioned, custom fit and traction up the sides, allowing players to accelerate and decelerate on demand and take advantage of the separation they create.',	'Kyrie Infinity EP',	3000,	'36',	1,	2,	100),
(32,	'This edition of Kyrie Irving\'s signature kicks for little ones is made to feel super-flexible and snug, meaning each crawl, step and hop will be light and make tiny feet feel confident. This colourway represents one of Kyrie\'s fascinations: shadows.\r\n\r\n',	'Kyrie Infinity SE',	3000,	'36',	1,	2,	100),
(33,	'Make sport heritage come to life with the Nike Dunk Low By You.Choose from premium leathers—including a special basketball-pebbled option—and suedes inspired by the Dunk\'s archival vault. Accent your foundation with classic varsity colours for a tribute to basketball history.',	'Nike Dunk Low By You',	3000,	'36',	1,	2,	100),
(34,	'ÔI GIÀY BÓNG RỔ TRỨ DANH TRONG THIẾT KẾ CỔ THẤP.\r\nKhông chỉ là một đôi giày, mà chính là một tuyên ngôn. Dòng adidas Forum ra mắt năm 1984 và cực kỳ được ưa chuộng cả trên sân bóng rổ lẫn trong giới âm nhạc. Mẫu mới của dòng giày kinh điển này tái hiện tinh thần thập niên 80, nguồn năng lượng bùng nổ trên sân đấu cũng như thiết kế quai cổ chân chữ X đặc trưng, kết tinh thành phiên bản cổ thấp đậm chất đường phố.',	'GIÀY CỔ THẤP FORUM',	3000,	'36',	1,	2,	100),
(35,	'm chất adidas. Tuyệt đối dễ chịu. Đôi giày mule Stan Smith này kế thừa mọi yếu tố đầy tính biểu tượng đã gây dựng nên một tượng đài trên sân tennis. Hãy xỏ giày và khoe trọn phong cách laid-back đến từ kiểu dáng mới mẻ. Tản bộ trong công viên hay dạo chơi khắp phố phường? Luôn để giày ngay cửa để tận hưởng cảm giác casual dễ chịu trên suốt hành trình. Rồi tháo ra để ngay cửa khi về nhà. Và cứ thế.\r\n\r\nSản phẩm này may bằng vải công nghệ Primegreen, thuộc dòng chất liệu tái chế hiệu năng cao. Thân giày chứa 50% thành phần tái chế. Không sử dụng polyester nguyên sinh.',	'GIÀY MULE STAN SMITH',	3000,	'36',	1,	2,	100),
(36,	'Thêm chút lực đẩy. Giày chạy bộ Ultraboost đem lại sự thoải mái và đàn hồi ở mọi cự ly và tốc độ. Thân giày adidas PRIMEKNIT có mút xốp quanh gót giày giúp tránh gây phồng rộp bàn chân. Đế giữa BOOST mang đến nguồn năng lượng bất tận, cùng hệ thống Linear Energy Push cho độ đàn hồi hơn bao giờ hết. Đế ngoài bằng cao su Continental™ Rubber siêu bám trong cả điều kiện thời tiết khô ráo và ẩm ướt để bạn tự tin sải bước.\r\n\r\nThân giày làm từ loại sợi hiệu năng cao có chứa ít nhất 50% chất liệu Parley Ocean Plastic — rác thải nhựa tái chế thu gom từ các vùng đảo xa, bãi biển, khu dân cư ven biển và đường bờ biển, nhằm ngăn chặn ô nhiễm đại dương. 50% thành phần còn lại của sợi dệt là polyester tái chế.',	'GIÀY ULTRABOOST 22',	3000,	'36',	1,	2,	100),
(37,	'Xuống phố đầy nổi bật. Lấy cảm hứng từ một mẫu giày chạy bộ thập niên 80 trứ danh trong kho di sản adidas, đôi giày NMD_R1 này vừa vặn như một đôi tất với thân giày bằng vải dệt kim co giãn và nâng đỡ. Lớp đệm Boost hoàn trả năng lượng cho cảm giác thoải mái suốt ngày dài, cùng các miếng bịt đế giữa nổi bật hai bên hông là dấu ấn đặc trưng của phong cách NMD đầy tính biểu tượng. Và nếu chừng đó còn chưa đủ thu hút chú ý thì sắc màu thời thượng chắc chắn sẽ khiến ai nấy cũng phải ngoái nhìn.',	'GIÀY NMD_R1',	3000,	'36',	1,	2,	100),
(38,	'Lợi thế cạnh tranh mà bạn đang tìm kiếm? Đương nhiên là đến từ thói quen tập luyện của bạn rồi. Đôi giày chạy bộ adidas này giúp bạn luôn thoải mái khi tập gym cũng như chạy bộ cự ly ngắn đến trung bình. Với thiết kế nâng đỡ mà linh hoạt, đôi giày này mang lại cảm giác ổn định trong các bài tập cần chuyển động sang hai bên như trượt băng. Lớp đệm Bounce đàn hồi dưới lòng bàn chân.',	' 4 GIÀY ALPHABOUNCE',	3000,	'36',	1,	2,	100),
(39,	'Cùng dành một phút giây để tôn vinh một biểu tượng. Phải chăng là huyền thoại bóng rổ thách thức trọng lực từ thập niên 80? Hay chính là đôi giày lừng danh điểm trang đôi chân các rapper? Thực ra là cả hai. Dòng giày adidas Forum vẫn luôn thống trị sân bóng rổ cũng như đường phố, nay trở lại với phiên bản cổ lửng giúp đưa các chuyển động của bạn lên một tầm cao mới. Cho đôi chân phong cách không thể hòa lẫn cùng chất liệu da phủ sang trọng và thể hiện đẳng cấp.',	'GIÀY CỔ LỬNG FORUM',	3000,	'36',	1,	2,	100),
(40,	'ĐÔI GIÀY TẬP DÀNH CHO MỌI NGÀY.\r\nTừ nâng tạ đến boxing và bootcamp. Đôi giày tập luyện adidas này giúp bạn luôn cảm thấy thoải mái bất kể bạn lựa chọn kiểu tập nào. Thân giày bằng vải dệt siêu nhẹ được gia cố ở mũi giày và gót giày. Đế giữa Bounce tạo độ linh hoạt khi di chuyển.',	'GIÀY ALPHAMAGMA',	3000,	'36',	1,	2,	100),
(41,	'Hòa cùng nhịp bước với đôi giày chạy bộ adidas này. Hít vào. Thở ra. Bước nối bước. Và rồi thăng hoa. Chinh phục mục tiêu cùng cảm giác thoải mái. Đế giữa có đệm lót siêu êm ái cho bạn cảm giác có thể chạy mãi không thôi. Kể cả điều đó là không thể, ít nhất bạn cũng chạy được thêm vài vòng nữa. Thậm chí thêm cả một dặm nữa.',	'GIÀY RESPONSE SR',	3000,	'36',	1,	2,	100),
(42,	'Dòng adidas Forum ra mắt là một mẫu giày bóng rổ thập niên 80, nhưng đã nhanh chóng lấn sân sang địa hạt thời trang. Phiên bản này bóc tách yếu tố đặc trưng nhất của phong cách ấy rồi tôn bật lên bằng sắc màu cực kỳ bắt mắt. Thân giày cổ thấp làm từ chất liệu da mịn và bên dưới là đế ngoài bằng cao su.',	'GIÀY FORUM LOW',	3000,	'36',	1,	2,	100),
(43,	'Nhân dịp phát hành phần phim James Bond thứ 25, \"No Time to Die\", adidas cho ra mắt đôi giày chạy bộ này với nguồn cảm hứng từ Safin, nhân vật phản diện mới nhất của Bond. Họa tiết in trên thân giày bằng vải dệt kim ôm chân tạo hiệu ứng bê tông thô. Khung giày màu trắng sứ mô phỏng chiếc mặt nạ bằng sứ của Safin. Bản vẽ khu vườn thiền của hắn được in trên lót giày.',	'GIÀY ULTRABOOST 20 X JAMES BOND',	3000,	'36',	1,	2,	100),
(44,	'X9000L2 GUARD',	'X9000L2 GUARD',	3000,	'36',	1,	2,	100);

DROP TABLE IF EXISTS `product_img`;
CREATE TABLE `product_img` (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `productId` bigint DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `FKonxxoh9y2ml0qja9uvwk4hb1x` (`productId`),
  CONSTRAINT `FKonxxoh9y2ml0qja9uvwk4hb1x` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `product_img` (`name`, `id`, `productId`) VALUES
('c26ff56b60892917bf2bd341659208d8-15609686669901.jpeg',	82,	10),
('333e4b6ada3fffcaef4908e993d07189-15609726592616.jpeg',	83,	10),
('0cd1abf333c523b0bedc747826b9a315-15617736097078.jpeg',	84,	11),
('1e8821555cd21352df7e65529e1b3cca-15617742484022.jpeg',	85,	11),
('3416a4e4620d6ef4111dd6b780996ef0-15625051941424.jpeg',	86,	12),
('eddc5c8df57a7ca907ecbc5f13e9e205-15625057067383.jpeg',	87,	12),
('79ef309e5d24e6b6aa688d475511bc57-15631578241290.jpeg',	88,	13),
('96f012c9dece399229c0c9deb2e4cee6-15631583517484.jpeg',	89,	13),
('79004b305001e2e8bddcb661c5b751ab-15653151979036.jpeg',	90,	15),
('1ee50094a884e867873af50dff711b9e-15653155823667.jpeg',	91,	15),
('e911e4a985041111137870f6997273ae-15673965182192.jpeg',	92,	16),
('1e3afcd667353757cbcfc0e57687a9c2-15673970620587.jpeg',	93,	16),
('air-force-1-07-lv8-shoes-hSh6R4 (2).png',	94,	17),
('air-force-1-07-lv8-shoes-hSh6R4 (1).png',	95,	17),
('air-force-1-07-lv8-shoes-hSh6R4 (3).png',	96,	17),
('air-force-1-07-shoe-WrLlWX.jpg',	97,	18),
('air-force-1-07-shoe-WrLlWX (1).png',	98,	18),
('air-force-1-07-shoe-WrLlWX (2).png',	99,	18),
('air-force-1-mid-shoes-HrXlb2.jpg',	100,	19),
('air-jordan-11-cool-grey-ct8012-005-release-date.jpg',	101,	19),
('air-max-90-g-golf-shoe-qlD3wL.jpg',	102,	20),
('air-max-90-g-golf-shoe-qlD3wL.png',	103,	21),
('air-max-96-ii-shoes-J0szvR.jpg',	104,	21),
('air-max-96-ii-shoes-J0szvR.png',	105,	22),
('air-zoom-tempo-next-road-running-shoes-chNfdw.jpg',	109,	26),
('aqua-rift-shoes-C3VX3v.jpg',	110,	27),
('aqua-rift-shoes-C3VX3v.png',	111,	27),
('aqua-rift-shoes-C3VX3v (1).png',	112,	27),
('aqua-rift-shoes-C3VX3v (2).png',	113,	27),
('c26ff56b60892917bf2bd341659208d8.jpeg',	114,	28),
('daybreak-shoes-Wc1sDS.jpg',	115,	29),
('Giay_Alphabounce_DJen_GY5402.jpg',	116,	30),
('Giay_co_lung_Forum_trang_FY4975_01_standard.jpg',	118,	31),
('Giay_Co_Thap_Forum_trang_FY7756_01_standard.jpg',	119,	32),
('Giay_Forum_Low_Xam_GX3657_01_standard.jpg',	120,	33),
('Giay_NMD_R1_trang_GZ7925.jpg',	121,	34),
('Giay_Ultraboost_20_x_James_Bond_Xam_FY0647_01_standard.jpg',	122,	35),
('Giay_UltraBoost_22_Mau_xanh_da_troi_GX3061.jpg',	123,	36),
('kyrie-infinity-ep-basketball-shoes-QJ01t9.jpg',	124,	37),
('kyrie-infinity-se-shoes-gs22L6.jpg',	125,	38),
('renew-in-season-tr-11-training-shoe-xXF9dt.jpg',	126,	39),
('X9000L2_GUARD_DJen_GX3555_01_standard.jpg',	127,	39),
('X9000L2_GUARD_DJen_GX3555_42_detail.jpg',	128,	41),
('X9000L2_GUARD_DJen_GX3556_01_standard.jpg',	129,	42),
('e911e4a985041111137870f6997273ae',	130,	43),
('c26ff56b60892917bf2bd341659208d8.jpeg',	131,	44);

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userType` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `user` (`id`, `address`, `email`, `password`, `phoneNumber`, `userName`, `userType`) VALUES
(1,	'Hà Nha - Đại Đồng - Đại Lộc - Quảng Nam',	'votuonghuan185@gmail.com',	'202cb962ac59075b964b07152d234b70',	'0969272682',	'admin',	0),
(2,	'ha nha',	'admin@gmail.com',	'202cb962ac59075b964b07152d234b70',	'0969272682',	'admin',	1);

-- 2021-12-07 15:01:12
