-- database by baohc1705

-- create database
DROP DATABASE if EXISTS hibookdb;
CREATE DATABASE if NOT EXISTS hibookdb;
USE hibookdb;
-- end

-- create table
DROP TABLE if EXISTS cate_user;
CREATE TABLE if NOT EXISTS cate_user (
	id INT AUTO_INCREMENT,
	name VARCHAR(255) not NULL,
	
	PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_UNICODE_CI;

DROP TABLE if EXISTS user;
CREATE TABLE if NOT EXISTS user (
	id VARCHAR(255) NOT NULL,
	cateUser_id INT,
	email VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL,
	fullname VARCHAR(255) NOT NULL,
	birthDate DATE DEFAULT NULL,
	
	
	PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_UNICODE_CI;

DROP TABLE if EXISTS cate_book;
CREATE TABLE if NOT EXISTS cate_book (
	id INT AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	
	PRIMARY KEY (id)	
)ENGINE = INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_UNICODE_CI;

DROP TABLE if EXISTS promotion;
CREATE TABLE if NOT EXISTS promotion (
	id INT AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	discountPercent INT DEFAULT 0,
	startDate DATE,
	endDate DATE,
	
	PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_UNICODE_CI;

DROP TABLE if EXISTS book;
CREATE TABLE if NOT EXISTS book (
	id VARCHAR(255),
	cateBook_id INT NOT NULL,
	author_id VARCHAR(255) NOT NULL,
	promotion_id INT DEFAULT NULL,
	name TEXT NOT NULL,
	price DOUBLE DEFAULT 0,
	amount INT DEFAULT 0,
	description TEXT,
	createDate DATETIME,
	
	PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_UNICODE_CI;

DROP TABLE if EXISTS photo;
CREATE TABLE if NOT EXISTS photo (
	id INT AUTO_INCREMENT,
	book_id VARCHAR(255) NOT NULL,
	pathname VARCHAR(255),
	
	PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_UNICODE_CI;

DROP TABLE if EXISTS author;
CREATE TABLE if NOT EXISTS author(
	id VARCHAR(255),
	fullname VARCHAR(255),
	email VARCHAR(255),
	birthDate DATE,
	biography TEXT,
	
	PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_UNICODE_CI;

DROP TABLE if EXISTS review;
CREATE TABLE if NOT EXISTS review (
	id INT AUTO_INCREMENT,
	book_id VARCHAR(255) NOT NULL,
	user_name VARCHAR(255),
	message TEXT,
	comment_date DATETIME,
	rate INT,
	
	PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_UNICODE_CI;

DROP TABLE if EXISTS bill;
CREATE TABLE if NOT EXISTS bill (
	id VARCHAR(255),
	user_id VARCHAR(255),
	delivery_id INT,
	billStatus BIT DEFAULT 0, -- 0: delivering 1: delivered
	totalPrice DOUBLE DEFAULT 0,
	fullname VARCHAR(255),
	email VARCHAR(255),
	phone VARCHAR(10),
	city TEXT,
	district TEXT,
	ward TEXT,
	shippingAddress TEXT,
	note TEXT,
	
	PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_UNICODE_CI;

DROP TABLE if EXISTS delivery;
CREATE TABLE if NOT EXISTS delivery (
	id INT AUTO_INCREMENT,
	name VARCHAR(255),
	price DOUBLE DEFAULT 0,
	
	PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_UNICODE_CI;

DROP TABLE if EXISTS bill_detail;
CREATE TABLE if NOT EXISTS bill_detail (
	id INT AUTO_INCREMENT,
	bill_id VARCHAR(255) NOT NULL,
	book_id VARCHAR(255) NOT NULL,
	quantity INT DEFAULT 0,
	price DOUBLE DEFAULT 0,
	
	PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_UNICODE_CI;

DROP TABLE if EXISTS permission;
CREATE TABLE if NOT EXISTS permission (
	id INT AUTO_INCREMENT,
	cateUser_id INT NOT NULL,
	addPermission BIT DEFAULT 0,
	editPermission BIT DEFAULT 0,
	deletePermission BIT DEFAULT 0,
	
	PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_UNICODE_CI;

DROP TABLE if EXISTS contact;
CREATE TABLE if NOT EXISTS contact (
	id INT AUTO_INCREMENT,
	user_id VARCHAR(255),
	message TEXT,
	PRIMARY KEY (id)
)ENGINE = INNODB DEFAULT CHARSET=UTF8MB4 COLLATE=UTF8MB4_UNICODE_CI;
-- end

-- create table connection
-- user -> cate_user
ALTER TABLE user ADD CONSTRAINT fk_user_cateUser
FOREIGN KEY (cateUser_id) REFERENCES cate_user(id);

-- book -> cate_book
ALTER TABLE book ADD CONSTRAINT fk_book_cateBook
FOREIGN KEY (cateBook_id) REFERENCES cate_book(id);

-- book -> promotion
ALTER TABLE book ADD CONSTRAINT fk_book_promotion
FOREIGN KEY (promotion_id) REFERENCES promotion(id);

-- book -> author
ALTER TABLE book ADD CONSTRAINT fk_book_author
FOREIGN KEY (author_id) REFERENCES author(id);

-- photo -> book
ALTER TABLE photo ADD CONSTRAINT fk_photo_book
FOREIGN KEY (book_id) REFERENCES book(id);

-- review -> book
ALTER TABLE review ADD CONSTRAINT fk_review_book
FOREIGN KEY (book_id) REFERENCES book(id);

-- bill -> delivery
ALTER TABLE bill ADD CONSTRAINT fk_bill_delivery
FOREIGN KEY (delivery_id) REFERENCES delivery(id);

-- bill -> user
ALTER TABLE bill ADD CONSTRAINT fk_bill_user
FOREIGN KEY (user_id) REFERENCES user(id);

-- bill_detail -> bill
ALTER TABLE bill_detail ADD CONSTRAINT fk_billDetail_bill
FOREIGN KEY (bill_id) REFERENCES bill(id);

-- bill_detail -> book
ALTER TABLE bill_detail ADD CONSTRAINT fk_billDetail_book
FOREIGN KEY (book_id) REFERENCES book(id);

-- permission -> cate_user
ALTER TABLE permission ADD CONSTRAINT fK_permission_user
FOREIGN KEY (cateUser_id) REFERENCES cate_user(id);

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

INSERT INTO `cate_book` (`id`, `name`) VALUES
(1, 'Tiểu thuyết'),
(2, 'Truyện ngắn'),
(3, 'Manga'),
(4, 'Tin học');

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

INSERT INTO `cate_user` (`id`, `name`) VALUES
(1, 'Administrator'),
(2, 'Quản trị viên'),
(3, 'Khách hàng');

INSERT INTO `user` (`id`, `cateUser_id`, `email`, `password`, `fullname`, `birthDate`) VALUES
('administrator404', 1, 'adminBrian@gmail.com', 'admin', 'Huỳnh Chí Bảo', '2004-05-17');

INSERT INTO `delivery` (`id`, `name`, `price`) VALUES
(1, 'Giao hàng nhanh', 20000),
(2, 'Giao hàng tiết kiệm', 15000);

INSERT INTO `permission` (`id`, `cateUser_id`, `addPermission`, `editPermission`, `deletePermission`) VALUES
(1, 1, b'1', b'1', b'1');

INSERT INTO `review` (`id`, `book_id`, `user_name`, `message`, `comment_date`, `rate`) VALUES
(1, 'B001', 'Huỳnh Chí Bảo', 'Sách quá hay', '2025-07-30 18:22:33', 4),
(2, 'B002', 'Huỳnh Chí Bảo', 'Sách tuyệt vời ', '2025-07-30 18:23:07', 5);


