-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2025 at 11:31 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hibookdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `biography` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id`, `fullname`, `email`, `birthDate`, `biography`) VALUES
('TG01', 'Huỳnh Chí Bảo', 'bao@gmail.com', '2004-05-17', 'Nhà văn nổi tiếng của Đồng Tháp với nhiều tác phẩm lãng mạn và hài hước về tình yêu, cuộc sống.'),
('TG02', 'Brian Bennet', 'brian@gmail.com', '2004-05-17', 'Brian được biết đến như một Fullstack developer với gần 10 năm kinh nghiệm. Anh đã chia sẻ những kinh nghiệm vào tác phẩm của mình.'),
('TG03', 'Nhà xuất bản kim đồng', 'nxbkimdong@gmail.com', NULL, 'Nhà xuất bản Kim Đồng là nhà xuất bản chuyên về sách văn học thiếu nhi của Việt Nam được thành lập vào ngày 17 tháng 6 năm 1957[1] tại Hà Nội'),
('TG04', 'Hoàng Khánh Duy', NULL, NULL, 'Hoàng Khánh Duy tên thật là Phạm Khánh Duy, sinh ngày 16/8 tại Cà Mau. Hiện đang sống và viết lách tại TP. Cần Thơ. Hội viên Hội nhà văn TP. Cần Thơ.'),
('TG05', 'Nam Cao', NULL, NULL, 'Nam Cao (nguyên danh Trần Hữu Tri, thánh danh Giuse[1], 29 tháng 10, năm 1915 hoặc 1917 – 30 tháng 11 năm 1951[2]) là một nhà văn, nhà báo và cũng là một chiến sĩ, liệt sĩ,Anh hùng Lực lượng vũ trang nhân dân Việt Nam(truy tặng năm 1996).'),
('TG06', 'Hajime Isayama', NULL, NULL, 'Hajime Isayama sinh ra tại thị trấn Ōyama (nay thuộc thành phố Hita), tỉnh Ōita, Nhật Bản. Anh bắt đầu gửi những tác phẩm của mình đến các cuộc thi sáng tác manga khi đang theo học tại Trường Trung học Hita Rinko'),
('TG07', 'Akira Toriyama', NULL, NULL, 'Toriyama Akira (5 tháng 4 năm 1955 – 1 tháng 3 năm 2024) là một họa sĩ và tác giả truyện tranh người Nhật Bản, nổi tiếng với tác phẩm Dr. Slump và Dragon Ball.'),
('TG08', 'Johann van Tonder', NULL, NULL, 'Johann van Tonder is COO at AWA Digital, working with brands such as Canon, Avis and Interflora. He has trained and coached big and small e-commerce businesses around the world, and is a regular speaker at international conferences.'),
('TG09', 'Vương Cát Vỹ', NULL, NULL, NULL),
('TG10', 'Nguyễn Văn Trung', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  `billStatus` bit(1) DEFAULT b'0',
  `totalPrice` double DEFAULT 0,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `city` text DEFAULT NULL,
  `district` text DEFAULT NULL,
  `ward` text DEFAULT NULL,
  `shippingAddress` text DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(11) NOT NULL,
  `bill_id` varchar(255) NOT NULL,
  `book_id` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT 0,
  `price` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` varchar(255) NOT NULL,
  `cateBook_id` int(11) NOT NULL,
  `author_id` varchar(255) NOT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `price` double DEFAULT 0,
  `amount` int(11) DEFAULT 0,
  `description` text DEFAULT NULL,
  `createDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `cateBook_id`, `author_id`, `promotion_id`, `name`, `price`, `amount`, `description`, `createDate`) VALUES
('B001', 1, 'TG03', NULL, 'Thám Tử Lừng Danh Conan - Tiểu Thuyết - Dư Ảnh Của Độc Nhãn', 55000, 100, 'Ông Kogoro bất ngờ nhận được cuộc gọi từ thanh tra Wani – đồng nghiệp thời còn công tác tại Sở Cảnh sát Tokyo. Người bạn cũ liên hệ để hỏi thăm về vụ tai nạn liên quan đến thanh tra Yamato Kansuke của Sở Cảnh sát Nagano, từng hợp tác phá án với ông Kogoro và Conan.', '2025-07-30 16:37:13'),
('B0010', 3, 'TG07', NULL, 'Dragon Ball - 7 Viên Ngọc Rồng - Tập 9 - Bà Thầy Bói', 25000, 50, 'Bộ truyện kể về một cậu bé đuôi khỉ tên là Son Goku sống một mình trong chốn rừng sâu. Cậu rất coi trọng viên ngọc kỉ vật quý giá ông nội để lại trước khi mất.', '2025-07-30 17:37:22'),
('B0011', 3, 'TG07', NULL, 'Dragon Ball - 7 Viên Ngọc Rồng - Tập 16 - Kì Phùng Địch Thủ', 25000, 40, 'Bộ truyện kể về một cậu bé đuôi khỉ tên là Son Goku sống một mình trong chốn rừng sâu. Cậu rất coi trọng viên ngọc kỉ vật quý giá ông nội để lại trước khi mất.', '2025-07-30 17:41:05'),
('B0012', 4, 'TG08', NULL, 'Tối Ưu Toàn Diện Website Doanh Nghiệp', 175000, 127, 'Chúng tôi viết cuốn sách này cho bản thân chúng tôi, cái thời chúng tôi còn trẻ. Ngày xưa, cả hai chúng tôi quản lý việc kinh doanh trực tuyến - đây là nơi đã cho chúng tôi nhiều thách thức là làm sao để có thể tăng doanh số một cách ồ ạt. Lúc đó, chúng tôi làm việc ở hai châu lục khác nhau, và cả hai đều rất áp lực khi phải tìm cách phát triển doanh nghiệp của mình bằng mọi giá.', '2025-07-30 17:46:41'),
('B0013', 4, 'TG09', NULL, 'AI Agent - Thực Chiến', 259000, 170, 'Cuốn sách đầu tiên được xuất bản tại Việt Nam về chủ đề “AI Agent”, cung cấp một góc nhìn toàn diện về những xu hướng mới nhất trong lĩnh vực AI Agent - những tác nhân thông minh dựa trên mô hình ngôn ngữ lớn (LLM) đang dần định hình lại cách chúng ta làm việc, học tập và vận hành xã hội.', '2025-07-30 17:50:52'),
('B0014', 4, 'TG10', NULL, 'Clean Code - Mã Sạch Và Con Đường Trở Thành Lập Trình Viên Giỏi', 386000, 30, 'Hiện nay, lập trình viên là một trong những nghề nghiệp được nhiều người lựa chọn theo đuổi và gắn bó. Đây là công việc đòi hỏi sự tỉ mỉ, nhiều công sức nhưng mang lại giá trị cao và một tương lai công việc hứa hẹn. Là một trong số những chuyên gia giàu kinh nghiệm, điêu luyện và lành nghề trong ngành, tác giả đã đúc rút từ kinh nghiệm của mình, viết về những tình huống trong thực tế, đôi khi có thể trái ngược với lý thuyết để xây dựng nên cuốn cẩm nang này, nhằm hỗ trợ những người đang muốn trở thành một lập trình viên chuyên nghiệp.', '2025-07-30 17:55:20'),
('B002', 1, 'TG04', NULL, 'Cõi Người Mắc Cạn', 65000, 50, 'Cõi người mắc cạn là tiểu thuyết 12 chương của Hoàng Khánh Duy, được tác giả sáng tác theo phương thức huyền thoại hóa, chú trọng yếu tố văn hóa và môi trường “xanh”. Trong tác phẩm, tác giả đã tạo dựng một không gian nghệ thuật vừa lạ, vừa quen. Lạ vì đó là một không gian mang sắc màu huyền ảo, mơ hồ nhưng cũng là một không gian quen thuộc vì nó thấm đượm linh hồn của sông nước Tây Nam Bộ.  Xuyên suốt tiểu thuyết là hành trình đi tìm chân lý, đi tìm lẽ sống và đấng cứu rỗi một vùng quê đã khô cằn vì hạn mặn của nhân vật “hắn”. Nỗi bàng hoàng trước sự méo mó của phong cảnh và nỗi đau của con người là điểm khởi nguồn của dòng sông chữ Cõi người mắc cạn.', '2025-07-30 16:51:50'),
('B003', 2, 'TG04', NULL, 'Hoàng Hôn Màu Đỏ', 88000, 66, 'Cuốn sách là tuyển tập 14 truyện ngắn về số phận, mảnh đời éo le, khắc nghiệt của con người miền Tây sông nước, làm bật lên sức sống kiên cường, sự lạc quan, luôn hướng về ánh sáng, về tương lai phía trước, dù hi vọng có mong manh cũng không mất đi niềm tin vào cuộc sống.', '2025-07-30 16:59:51'),
('B004', 1, 'TG04', NULL, 'Biết Khi Nào Mới Gặp Lại Nhau', 79000, 30, '“Biết khi nào mới gặp lại nhau” là hồi tưởng về tuổi thơ của nhân vật Khang cùng cô bạn học gần nhà tên Bụp và các bạn đồng trang lứa khác. Tuổi thơ của Khang đầy ắp những kỉ niệm với những trò tinh nghịch như hái trộm hoa quả, trêu đùa với các bạn học cùng xóm, những trận đòn roi và cả những yêu thương vô bờ của gia đình. Nhưng tuổi thơ ấy đã ghi dấu tổn thương trong tâm hồn khi cậu bé phải chia li với cô bạn học.', '2025-07-30 17:05:00'),
('B005', 2, 'TG05', NULL, 'Danh Tác Văn Học Việt Nam - Chí Phèo', 95000, 200, 'Chí Phèo - Với những tình tiết hấp hẫn Nam Cao đã đưa người đọc tái hiện bức tranh chân thực nông thôn Việt Nam trước 1945, nghèo đói, xơ xác trên con đường phá sản, bần cùng, hết sức thê thảm, người nông dân bị đẩy vào con đường tha hóa, lưu manh hóa.', '2025-07-30 17:11:25'),
('B006', 2, 'TG05', NULL, 'Lão Hạc', 55000, 90, 'Lão Hạc là một truyện ngắn của nhà văn Nam Cao được viết năm 1943. Tác phẩm được đánh giá là một trong những truyện ngắn khá tiêu biểu của dòng văn học hiện thực, nội dung truyện đã phần nào phản ánh được hiện trạng xã hội Việt Nam trong giai đoạn trước Cách mạng tháng Tám.', '2025-07-30 17:16:51'),
('B007', 2, 'TG05', NULL, 'Tập Truyện Ngắn Đôi Mắt - Nam Cao', 56000, 130, 'Tập truyện ngắn \"Đôi mắt\" gồm 21 tác phẩm tiêu biểu trong giai đoạn sáng tác từ 1941 - 1950 của Nam Cao, bao gồm: Đui mù, Nửa đêm, Quái dị, Cười, Nước mắt, Mua danh, Ở hiền, Rửa hờn, Rình trộm, Lang rận, Trẻ con không được ăn thịt chó, Sao lại thế này?, Điếu văn, Một chuyện xú-vơ-nia, Dì Hảo, Nỗi truân chuyên của khách má hồng, Từ ngày mẹ chết, Mò sâm banh, Chuyện buồn giữa đêm vui, Những bàn tay đẹp ấy, Đôi mắt.', '2025-07-30 17:21:44'),
('B008', 3, 'TG06', NULL, 'Attack On Titan - Tập 33', 48000, 23, 'Sau nhiều năm sống yên ổn sau những bức tường thành cao lừng lững, loài người đã bắt đầu cảm nhận được nguy cơ diệt vong đến từ một giống loài khổng lồ mang tên Titan. Dù muốn dù không, họ buộc phải đứng lên, và đã đứng lên một cách đầy quyết tâm, mạnh mẽ để chống lại những kẻ thù hùng mạnh nhất.', '2025-07-30 17:28:32'),
('B009', 3, 'TG06', NULL, 'Attack On Titan - Tập 32', 48000, 25, 'Sau nhiều năm sống yên ổn sau những bức tường thành cao lừng lững, loài người đã bắt đầu cảm nhận được nguy cơ diệt vong đến từ một giống loài khổng lồ mang tên Titan. Dù muốn dù không, họ buộc phải đứng lên, và đã đứng lên một cách đầy quyết tâm, mạnh mẽ để chống lại những kẻ thù hùng mạnh nhất.', '2025-07-30 17:30:41');

-- --------------------------------------------------------

--
-- Table structure for table `cate_book`
--

CREATE TABLE `cate_book` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cate_book`
--

INSERT INTO `cate_book` (`id`, `name`) VALUES
(1, 'Tiểu thuyết'),
(2, 'Truyện ngắn'),
(3, 'Manga'),
(4, 'Tin học');

-- --------------------------------------------------------

--
-- Table structure for table `cate_user`
--

CREATE TABLE `cate_user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cate_user`
--

INSERT INTO `cate_user` (`id`, `name`) VALUES
(1, 'Administrator'),
(2, 'Quản trị viên'),
(3, 'Khách hàng');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`id`, `name`, `price`) VALUES
(1, 'Giao hàng nhanh', 20000),
(2, 'Giao hàng tiết kiệm', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `cateUser_id` int(11) NOT NULL,
  `addPermission` bit(1) DEFAULT b'0',
  `editPermission` bit(1) DEFAULT b'0',
  `deletePermission` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `cateUser_id`, `addPermission`, `editPermission`, `deletePermission`) VALUES
(1, 1, b'1', b'1', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `id` int(11) NOT NULL,
  `book_id` varchar(255) NOT NULL,
  `pathname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `discountPercent` int(11) DEFAULT 0,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `book_id` varchar(255) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `comment_date` datetime DEFAULT NULL,
  `rate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `book_id`, `user_name`, `message`, `comment_date`, `rate`) VALUES
(1, 'B001', 'Huỳnh Chí Bảo', 'Sách quá hay', '2025-07-30 18:22:33', 4),
(2, 'B002', 'Huỳnh Chí Bảo', 'Sách tuyệt vời ', '2025-07-30 18:23:07', 5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `cateUser_id` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `birthDate` date DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `cateUser_id`, `email`, `password`, `fullname`, `birthDate`, `avatar`) VALUES
('HB202508231257284920', 3, 'baohc170504@gmail.com', 'NIANccYzIE2VN2P9t2a+0IFDngE=', 'Huỳnh Chí Bảo', '2004-05-17', NULL),
('HB202508241549481339', 3, 'baohc2004@gmail.com', 'NauamnGIwKacuAWObDkfvmTy090=', 'Huỳnh Chí Bảo', '2004-05-17', '471d5964-d6fa-44ad-b2eb-9aba6843c833.png');

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expiry_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `salt` varchar(255) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `createAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`id`, `user_id`, `token`, `expiry_time`, `salt`, `used`, `createAt`) VALUES
(69, 'HB202508241549481339', 'qhKcWc2W/bdD+jQRc8y1iWgDule3SEc4nG/5qiex2Qo=', '2025-08-24 08:50:26', 'sLgvW06dzpuP3FNcgAXlUA==', 1, '2025-08-24 08:50:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bill_delivery` (`delivery_id`),
  ADD KEY `fk_bill_user` (`user_id`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_billDetail_bill` (`bill_id`),
  ADD KEY `fk_billDetail_book` (`book_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_book_cateBook` (`cateBook_id`),
  ADD KEY `fk_book_promotion` (`promotion_id`),
  ADD KEY `fk_book_author` (`author_id`);

--
-- Indexes for table `cate_book`
--
ALTER TABLE `cate_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cate_user`
--
ALTER TABLE `cate_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fK_permission_user` (`cateUser_id`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_photo_book` (`book_id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_review_book` (`book_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_cateUser` (`cateUser_id`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_passwpord_reset_token` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cate_book`
--
ALTER TABLE `cate_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cate_user`
--
ALTER TABLE `cate_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `fk_bill_delivery` FOREIGN KEY (`delivery_id`) REFERENCES `delivery` (`id`),
  ADD CONSTRAINT `fk_bill_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD CONSTRAINT `fk_billDetail_bill` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`),
  ADD CONSTRAINT `fk_billDetail_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_book_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  ADD CONSTRAINT `fk_book_cateBook` FOREIGN KEY (`cateBook_id`) REFERENCES `cate_book` (`id`),
  ADD CONSTRAINT `fk_book_promotion` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`);

--
-- Constraints for table `permission`
--
ALTER TABLE `permission`
  ADD CONSTRAINT `fK_permission_user` FOREIGN KEY (`cateUser_id`) REFERENCES `cate_user` (`id`);

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `fk_photo_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_review_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_cateUser` FOREIGN KEY (`cateUser_id`) REFERENCES `cate_user` (`id`);

--
-- Constraints for table `user_token`
--
ALTER TABLE `user_token`
  ADD CONSTRAINT `fk_user_passwpord_reset_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
