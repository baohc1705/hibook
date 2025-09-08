-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2025 at 06:10 PM
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
  `isDisable` bit(1) DEFAULT b'0',
  `totalPrice` double DEFAULT 0,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `city` text DEFAULT NULL,
  `district` text DEFAULT NULL,
  `ward` text DEFAULT NULL,
  `shippingAddress` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `user_id`, `delivery_id`, `isDisable`, `totalPrice`, `fullname`, `email`, `phone`, `city`, `district`, `ward`, `shippingAddress`, `note`, `createAt`, `status`) VALUES
('250908225514cb1a', NULL, 1, b'0', 397000, 'Huỳnh Chí Bảo', 'baohc2004@gmail.com', '0337778965', 'DONG_THAP', 'QUAN_8', 'PHUONG_4', 'ấp Chiến Thắng', 'Đay la note doi them sau', '2025-09-08 15:55:14', 'Chờ xác nhận'),
('2509082257129630', NULL, 1, b'0', 103000, 'Huỳnh Chí Bảo', 'baohc2004@gmail.com', '0337778965', 'DONG_THAP', 'QUAN_8', 'PHUONG_4', 'ấp Chiến Thắng', 'Đay la note doi them sau', '2025-09-08 15:57:12', 'Chờ xác nhận'),
('250908225802ff4e', NULL, 1, b'0', 50000, 'Huỳnh Chí Bảo', 'baohc2004@gmail.com', '0337778965', 'DONG_THAP', 'QUAN_9', 'PHUONG_4', 'ấp Chiến Thắng', 'Đay la note doi them sau', '2025-09-08 15:58:03', 'Chờ xác nhận'),
('2509082258510d5e', NULL, 1, b'0', 375000, 'Huỳnh Chí Bảo', 'baohc2004@gmail.com', '0337778965', 'DONG_THAP', 'QUAN_8', 'PHUONG_4', 'ấp Chiến Thắng', 'Đay la note doi them sau', '2025-09-08 15:58:51', 'Chờ xác nhận'),
('2509082302257e20', 'HB202508241549481339', 2, b'0', 230000, 'Huỳnh Chí Bảo', 'baohc2004@gmail.com', '0337778965', 'DONG_THAP', 'TAN_HONG', 'TAN_HO_CO', 'ấp Chiến Thắng', 'Đay la note doi them sau', '2025-09-08 16:02:25', 'Chờ xác nhận');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `bill_id` varchar(255) NOT NULL,
  `book_id` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT 0,
  `price` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`bill_id`, `book_id`, `quantity`, `price`) VALUES
('250908225514cb1a', 'B250827103214', 3, 165000),
('250908225514cb1a', 'B250827104050', 1, 65000),
('250908225514cb1a', 'B250827104206', 1, 88000),
('250908225514cb1a', 'B250827104315', 1, 79000),
('2509082257129630', 'B250827103214', 1, 55000),
('2509082257129630', 'B250827104836', 1, 48000),
('250908225802ff4e', 'B250827103337', 1, 25000),
('250908225802ff4e', 'B250827103433', 1, 25000),
('2509082258510d5e', 'B250827103337', 6, 150000),
('2509082258510d5e', 'B250827103433', 9, 225000),
('2509082302257e20', 'B250827103214', 3, 165000),
('2509082302257e20', 'B250827104050', 1, 65000);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` varchar(255) NOT NULL,
  `cateBook_id` int(11) NOT NULL,
  `author_id` varchar(255) DEFAULT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `price` double DEFAULT 0,
  `amount` int(11) DEFAULT 0,
  `description` text DEFAULT NULL,
  `createDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `cateBook_id`, `author_id`, `promotion_id`, `name`, `price`, `amount`, `description`, `createDate`) VALUES
('B250827103214', 3, 'TG03', 1, 'Thám Tử Lừng Danh Conan - Tiểu Thuyết - Dư Ảnh Của Độc Nhãn', 55000, 90, 'Ông Kogoro bất ngờ nhận được cuộc gọi từ thanh tra Wani – đồng nghiệp thời còn công tác tại Sở Cảnh sát Tokyo. Người bạn cũ liên hệ để hỏi thăm về vụ tai nạn liên quan đến thanh tra Yamato Kansuke của Sở Cảnh sát Nagano, từng hợp tác phá án với ông Kogoro và Conan.', '2025-08-27 10:32:14'),
('B250827103337', 3, 'TG07', 3, 'Dragon Ball - 7 Viên Ngọc Rồng - Tập 9 - Bà Thầy Bói', 25000, 30, 'Bộ truyện kể về một cậu bé đuôi khỉ tên là Son Goku sống một mình trong chốn rừng sâu. Cậu rất coi trọng viên ngọc kỉ vật quý giá ông nội để lại trước khi mất.', '2025-08-27 10:33:37'),
('B250827103433', 3, 'TG07', 1, 'Dragon Ball - 7 Viên Ngọc Rồng - Tập 16 - Kì Phùng Địch Thủ', 25000, 190, 'Bộ truyện kể về một cậu bé đuôi khỉ tên là Son Goku sống một mình trong chốn rừng sâu. Cậu rất coi trọng viên ngọc kỉ vật quý giá ông nội để lại trước khi mất.', '2025-08-27 10:34:33'),
('B250827103543', 4, 'TG08', 3, 'Tối Ưu Toàn Diện Website Doanh Nghiệp', 175000, 127, 'Chúng tôi viết cuốn sách này cho bản thân chúng tôi, cái thời chúng tôi còn trẻ. Ngày xưa, cả hai chúng tôi quản lý việc kinh doanh trực tuyến - đây là nơi đã cho chúng tôi nhiều thách thức là làm sao để có thể tăng doanh số một cách ồ ạt. Lúc đó, chúng tôi làm việc ở hai châu lục khác nhau, và cả hai đều rất áp lực khi phải tìm cách phát triển doanh nghiệp của mình bằng mọi giá.', '2025-08-27 10:35:43'),
('B250827103632', 4, 'TG09', 1, 'AI Agent - Thực Chiến', 259000, 170, 'Cuốn sách đầu tiên được xuất bản tại Việt Nam về chủ đề “AI Agent”, cung cấp một góc nhìn toàn diện về những xu hướng mới nhất trong lĩnh vực AI Agent - những tác nhân thông minh dựa trên mô hình ngôn ngữ lớn (LLM) đang dần định hình lại cách chúng ta làm việc, học tập và vận hành xã hội.', '2025-08-27 10:36:32'),
('B250827103946', 4, 'TG10', 3, 'Clean Code - Mã Sạch Và Con Đường Trở Thành Lập Trình Viên Giỏi', 386000, 25, 'Hiện nay, lập trình viên là một trong những nghề nghiệp được nhiều người lựa chọn theo đuổi và gắn bó. Đây là công việc đòi hỏi sự tỉ mỉ, nhiều công sức nhưng mang lại giá trị cao và một tương lai công việc hứa hẹn. Là một trong số những chuyên gia giàu kinh nghiệm, điêu luyện và lành nghề trong ngành, tác giả đã đúc rút từ kinh nghiệm của mình, viết về những tình huống trong thực tế, đôi khi có thể trái ngược với lý thuyết để xây dựng nên cuốn cẩm nang này, nhằm hỗ trợ những người đang muốn trở thành một lập trình viên chuyên nghiệp.', '2025-08-27 10:39:46'),
('B250827104050', 1, 'TG04', 1, 'Cõi Người Mắc Cạn', 65000, 40, 'Cõi người mắc cạn là tiểu thuyết 12 chương của Hoàng Khánh Duy, được tác giả sáng tác theo phương thức huyền thoại hóa, chú trọng yếu tố văn hóa và môi trường “xanh”. Trong tác phẩm, tác giả đã tạo dựng một không gian nghệ thuật vừa lạ, vừa quen. Lạ vì đó là một không gian mang sắc màu huyền ảo, mơ hồ nhưng cũng là một không gian quen thuộc vì nó thấm đượm linh hồn của sông nước Tây Nam Bộ.  Xuyên suốt tiểu thuyết là hành trình đi tìm chân lý, đi tìm lẽ sống và đấng cứu rỗi một vùng quê đã khô cằn vì hạn mặn của nhân vật “hắn”. Nỗi bàng hoàng trước sự méo mó của phong cảnh và nỗi đau của con người là điểm khởi nguồn của dòng sông chữ Cõi người mắc cạn.', '2025-08-27 10:40:50'),
('B250827104206', 2, 'TG04', 3, 'Hoàng Hôn Màu Đỏ', 88000, 63, 'Cuốn sách là tuyển tập 14 truyện ngắn về số phận, mảnh đời éo le, khắc nghiệt của con người miền Tây sông nước, làm bật lên sức sống kiên cường, sự lạc quan, luôn hướng về ánh sáng, về tương lai phía trước, dù hi vọng có mong manh cũng không mất đi niềm tin vào cuộc sống.', '2025-08-27 10:42:06'),
('B250827104315', 1, 'TG04', 3, 'Biết Khi Nào Mới Gặp Lại Nhau', 79000, 22, '“Biết khi nào mới gặp lại nhau” là hồi tưởng về tuổi thơ của nhân vật Khang cùng cô bạn học gần nhà tên Bụp và các bạn đồng trang lứa khác. Tuổi thơ của Khang đầy ắp những kỉ niệm với những trò tinh nghịch như hái trộm hoa quả, trêu đùa với các bạn học cùng xóm, những trận đòn roi và cả những yêu thương vô bờ của gia đình. Nhưng tuổi thơ ấy đã ghi dấu tổn thương trong tâm hồn khi cậu bé phải chia li với cô bạn học.', '2025-08-27 10:43:15'),
('B250827104416', 2, 'TG05', 1, 'Danh Tác Văn Học Việt Nam - Chí Phèo', 95000, 195, 'Chí Phèo - Với những tình tiết hấp dẫn Nam Cao đã đưa người đọc tái hiện bức tranh chân thực nông thôn Việt Nam trước 1945, nghèo đói, xơ xác trên con đường phá sản, bần cùng, hết sức thê thảm, người nông dân bị đẩy vào con đường tha hóa, lưu manh hóa.', '2025-08-27 10:44:16'),
('B250827104556', 2, 'TG05', 1, 'Lão Hạc', 55000, 90, 'Lão Hạc là một truyện ngắn của nhà văn Nam Cao được viết năm 1943. Tác phẩm được đánh giá là một trong những truyện ngắn khá tiêu biểu của dòng văn học hiện thực, nội dung truyện đã phần nào phản ánh được hiện trạng xã hội Việt Nam trong giai đoạn trước Cách mạng tháng Tám.', '2025-08-27 10:45:56'),
('B250827104714', 2, 'TG05', 1, 'Tập Truyện Ngắn Đôi Mắt - Nam Cao', 56000, 117, 'Tập truyện ngắn \"Đôi mắt\" gồm 21 tác phẩm tiêu biểu trong giai đoạn sáng tác từ 1941 - 1950 của Nam Cao, bao gồm: Đui mù, Nửa đêm, Quái dị, Cười, Nước mắt, Mua danh, Ở hiền, Rửa hờn, Rình trộm, Lang rận, Trẻ con không được ăn thịt chó, Sao lại thế này?, Điếu văn, Một chuyện xú-vơ-nia, Dì Hảo, Nỗi truân chuyên của khách má hồng, Từ ngày mẹ chết, Mò sâm banh, Chuyện buồn giữa đêm vui, Những bàn tay đẹp ấy, Đôi mắt.', '2025-08-27 10:47:14'),
('B250827104836', 3, 'TG06', 3, 'Attack On Titan - Tập 33', 48000, 199, 'Sau nhiều năm sống yên ổn sau những bức tường thành cao lừng lững, loài người đã bắt đầu cảm nhận được nguy cơ diệt vong đến từ một giống loài khổng lồ mang tên Titan. Dù muốn dù không, họ buộc phải đứng lên, và đã đứng lên một cách đầy quyết tâm, mạnh mẽ để chống lại những kẻ thù hùng mạnh nhất.', '2025-08-27 10:48:36'),
('B250827104929', 3, 'TG06', 1, 'Attack On Titan - Tập 32', 48000, 25, 'Sau nhiều năm sống yên ổn sau những bức tường thành cao lừng lững, loài người đã bắt đầu cảm nhận được nguy cơ diệt vong đến từ một giống loài khổng lồ mang tên Titan. Dù muốn dù không, họ buộc phải đứng lên, và đã đứng lên một cách đầy quyết tâm, mạnh mẽ để chống lại những kẻ thù hùng mạnh nhất.', '2025-08-27 10:49:29'),
('B250905173703', 3, 'TG01', 1, 'Attack On Titan - Tập 99999', 48000, 20, 'haaaaaaaaaaaaaa', '2025-09-05 17:37:03');

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
(4, 'Công nghệ thông tin');

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
  `pathname` varchar(255) DEFAULT NULL,
  `isCover` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`id`, `book_id`, `pathname`, `isCover`) VALUES
(135, 'B250827103214', 'aa057c30-ba59-4fde-bd2e-fb97140943b4.jpg', 1),
(136, 'B250827103214', '39526fc8-6e13-4db6-96fb-83504af0edd0.jpg', 0),
(137, 'B250827103214', '6a06400b-cb9f-43c2-b075-37fab3c21023.jpg', 0),
(138, 'B250827103214', '331ecb1a-639c-4f08-8c4b-7fa3f1472548.jpg', 0),
(139, 'B250827103337', '1cb2c081-ce54-4226-bfa0-96454d8bcd2b.png', 1),
(140, 'B250827103337', 'fcac86da-0aa1-4a2f-ac2e-3238ff39d542.png', 0),
(141, 'B250827103337', '37b4fd17-a5dc-4db6-8dfb-59483c95bc19.png', 0),
(142, 'B250827103433', '1c82f50b-c1c3-4ffc-a746-800620c83b75.png', 1),
(143, 'B250827103433', '7e52fcc1-5143-4a8d-869a-3c0df98ad10c.png', 0),
(144, 'B250827103433', 'c86e2e5f-bfa6-433a-8f2c-1da729be7b00.png', 0),
(145, 'B250827103543', '43122f4b-4581-4fe2-b126-0af938ab6cdf.png', 1),
(146, 'B250827103543', '94615732-72ee-4a3e-ba8e-f336cd116f77.png', 0),
(147, 'B250827103543', 'c50e6c5e-8ca3-4785-9eb5-3ce5e0c3f4c1.png', 0),
(148, 'B250827103632', 'e37b3ce1-8865-47f2-9054-221ec1635ba5.png', 1),
(149, 'B250827103632', '32ef0c37-f5bf-4ce5-9559-07784726fe48.png', 0),
(150, 'B250827103632', '1eaf889e-2c55-4f10-a942-a5df0b1bfbf0.png', 0),
(151, 'B250827103946', '593090c9-8d51-40dc-85a5-adb4be7a6c19.png', 1),
(152, 'B250827103946', '35ab41d5-51eb-44a8-94e0-cb1cd3b11f42.png', 0),
(153, 'B250827104050', '16c95141-b32d-4f5e-b55e-9d4b099e2d07.png', 1),
(154, 'B250827104050', 'e174f571-5ff3-4e35-a156-53780f71d5b0.png', 0),
(155, 'B250827104050', '4c605c4b-ac00-4623-bbc5-e9f4ed456010.png', 0),
(156, 'B250827104050', 'ecdadc1e-8594-4c8c-b36c-c5eca29bac33.png', 0),
(157, 'B250827104050', '114e0ffe-3ad2-4e1b-8ff8-e3733fe297ff.png', 0),
(158, 'B250827104206', 'a4b38157-aa40-4998-ac3b-b093123d8bcc.png', 1),
(159, 'B250827104206', '174dccb7-44e9-40f3-b02a-b8c3a1ded594.png', 0),
(160, 'B250827104206', '24a2314a-75da-4ed7-9492-9679a9f0f61d.png', 0),
(161, 'B250827104206', '00ce64d1-eaa0-4c7b-b99d-a57133623396.png', 0),
(162, 'B250827104206', 'b8c388dc-093c-43d1-9012-06926781b272.png', 0),
(163, 'B250827104315', 'eeb80d12-5992-4c9d-8aae-87f9e4bd7a33.png', 1),
(164, 'B250827104315', 'd3679124-862b-4e1d-a04c-bc46d373804d.png', 0),
(165, 'B250827104315', '748cc271-28af-450d-8f26-9b6709405518.png', 0),
(166, 'B250827104315', 'a5de9e12-2090-43c3-8a7b-02b453ba5e45.png', 0),
(167, 'B250827104315', '8b32f7e1-1be0-4678-af68-f081fa50acf4.png', 0),
(168, 'B250827104416', '9950a3a3-9f82-45a2-9e4e-64aeca3d94d5.png', 1),
(169, 'B250827104416', '29c3cfdb-fdf9-47f4-a40a-d97d6ac91c8d.png', 0),
(170, 'B250827104416', '17f5030c-bc28-456a-a302-81739df8c4a0.png', 0),
(171, 'B250827104416', 'e67d284d-11b7-4d07-bb18-cd25c4d172dc.png', 0),
(172, 'B250827104556', '2d83bf77-0a66-4000-a04c-dc174a1cf3a8.png', 1),
(173, 'B250827104556', 'b58fcf0a-6c6b-4271-953f-449e18d03966.png', 0),
(174, 'B250827104556', '7edeac74-3296-4dc0-bfb1-03cd54d9b807.png', 0),
(175, 'B250827104556', '792a5b14-6eaa-403a-9a2b-e5f59363a16f.png', 0),
(176, 'B250827104714', '52abaa3a-0c2c-44eb-9d8b-e50d037fb019.png', 1),
(177, 'B250827104714', 'f44e3221-62aa-4fbd-b311-bc92fe6434fd.png', 0),
(178, 'B250827104714', 'c1d43ceb-9e90-4af7-94e0-e9f4337404c7.png', 0),
(179, 'B250827104714', '039ed1f6-4451-493c-b504-0e74669f50a0.png', 0),
(180, 'B250827104836', 'a7539da1-14ac-4a87-bd5e-4fe7d4d49b93.png', 1),
(181, 'B250827104836', 'f60c1257-792d-4564-869c-15ab79bb0c57.png', 0),
(182, 'B250827104929', 'c873d4e8-c03f-4e58-883d-34cc92a7419a.png', 1),
(183, 'B250827104929', 'd5a8b64a-41bd-4cc4-bf97-d9b74f9b69af.png', 0),
(184, 'B250827104929', '36cdabc8-87d6-4ee7-8306-8cec4f84224b.png', 0),
(203, 'B250905173703', '6d875070-3d40-422e-8693-2860d27e7b5b.png', 1),
(204, 'B250905173703', '70995869-c985-4d8c-8a6e-927fe0ec6a3a.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `discountPercent` int(11) DEFAULT 0,
  `startDate` timestamp NULL DEFAULT current_timestamp(),
  `endDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`id`, `name`, `discountPercent`, `startDate`, `endDate`) VALUES
(1, 'Super Summer Sale', 25, '2025-05-31 17:00:00', '2025-06-29 17:00:00'),
(3, 'Flash sale', 20, '2025-09-05 15:43:38', '2025-09-05 17:43:38');

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
('HB202508231257284920', 1, 'baohc170504@gmail.com', 'rnQHrxmHFs2Khh7qxeqV1PXB1E4=', 'Huỳnh Chí Bảo', '2004-05-17', '139d416a-cb96-44f2-ac5b-2a4c69612a24.png'),
('HB202508241549481339', 3, 'baohc2004@gmail.com', 'NIANccYzIE2VN2P9t2a+0IFDngE=', 'Huỳnh Chí Bảo', '2004-05-17', '60f9c822-7beb-44ae-aae9-14dcbb5416d0.jpg');

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
(69, 'HB202508241549481339', 'qhKcWc2W/bdD+jQRc8y1iWgDule3SEc4nG/5qiex2Qo=', '2025-08-24 08:50:26', 'sLgvW06dzpuP3FNcgAXlUA==', 1, '2025-08-24 08:50:16'),
(70, 'HB202508231257284920', 'AXe4nGWTSuuQEJhgg/rbyhMdWVRuZ+VP4+EXj1mDkr4=', '2025-08-25 04:02:18', 'C67XG9uH1ABodxvo72UxDg==', 1, '2025-08-25 04:01:56'),
(71, 'HB202508241549481339', 'HNtzBlGj8TLV+TiuEzWDJRWoChb16mgpz/j1CFT49ak=', '2025-09-08 13:36:58', 'pUWX3hJiV6V7I4uH7l4DgQ==', 0, '2025-09-08 13:35:59'),
(72, 'HB202508241549481339', 'TcEg6sgBibT46H2Pvr5cipN8et72T0/FDP/qt96zo/c=', '2025-09-08 13:37:35', 'aXdY1BCeeX/+cz2IhFudzA==', 1, '2025-09-08 13:37:21');

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
  ADD KEY `idx_bills_user` (`user_id`),
  ADD KEY `idx_bills_delivery` (`delivery_id`),
  ADD KEY `totalPrice` (`totalPrice`),
  ADD KEY `fullname` (`fullname`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`bill_id`,`book_id`) USING BTREE,
  ADD KEY `fk_billDetail_book` (`book_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_book_cateBook` (`cateBook_id`),
  ADD KEY `fk_book_promotion` (`promotion_id`),
  ADD KEY `fk_book_author` (`author_id`),
  ADD KEY `idx_books_name` (`name`(768)),
  ADD KEY `idx_books_price` (`price`),
  ADD KEY `idx_books_amount` (`amount`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

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
-- AUTO_INCREMENT for table `cate_book`
--
ALTER TABLE `cate_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

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
  ADD CONSTRAINT `fk_billDetail_bill` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_billDetail_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE;

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
