<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Admin: Book management</title>
	<%@include file="../../assets/allLibary.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <script src="${pageContext.request.contextPath}/assets/js/admin.js" defer></script>
</head>
<body>
	<!-- Sidebar navagition -->
	<%@include file="../../components/sidebar.jsp" %>
	
	<!-- Main body -->
	<main class="px-3">
		<!-- Admin navigation bar-->
		<%@include file="../../components/adminNavbar.jsp" %>
		
		<!-- Data table -->
		<section class="body container mb-2 p-0">
            <div class="wrapper-tools p-3 glass-border glass glass d-flex align-items-center rounded-3 mb-3">

                <!-- sort tool-->
                <div class="dropdown">
                    <button class="btn text_dark-blue-50 filter dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa-solid fa-sort"></i>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item text_dark-blue-50" href="#">Số lượng tăng dần</a></li>
                        <li><a class="dropdown-item text_dark-blue-50" href="#">Số lượng giảm dần</a></li>
                        <li><a class="dropdown-item text_dark-blue-50" href="#">Sách mới nhất</a></li>
                    </ul>
                </div>

                <div class="filter-category">
                    <select name="" id="" class="">
                        <option value="" selected>Lọc theo thể loại sách</option>
                        <option value="">Tiểu thuyết</option>
                        <option value="">Truyện ngắn</option>
                    </select>
                </div>
                
                <ul class="list_filter small">
                    <li class="d-flex align-items-center">
                        <span class="me-2">Tiểu thuyết</span>
                        <span class="material-symbols-rounded text-danger">cancel</span>
                    </li>
                    <li><span class="">Reset</span></li>
                </ul>
                
                <form action="" class="ms-auto d-flex me-3">
                    <input type="text" class="nav-search" placeholder="Tìm kiếm 1.750 sách">
                    <a href="#" class="nav-search-icon d-flex justify-content-center align-items-center">
                        <span class="nav-icon material-symbols-rounded">search</span>
                    </a>
                </form>
                <button class="add-btn d-flex align-items-center">
                    <span class="add-btn_icon material-symbols-rounded">add_circle</span>
                    <span class="add-btn_label">Thêm sách mới</span>
                </button>
            </div>

            <div class="wrapper-table">
                <!-- nav & tabs -->
                <ul class="nav-tab mb-3">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Thông tin sách</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Loại sách</a>
                    </li>
                </ul>

                <!-- data table -->
                 <div class="table-container mb-3" >
                    <table class="small">
                        <thead>
                            <tr>
                                <th>
                                    <input class="form-check-input" type="checkbox" value="" id="checkDefault">
                                </th>
                                <th>#</th>
                                <th>Mã sách</th>
                                <th>Ảnh bìa</th>
                                <th>Tên sách</th>
                                <th>Số lượng</th>
                                <th>Mô tả</th>
                                <th>Loại sách</th>
                                <th>Tác giả</th>
                                <th>Ngày thêm</th>
                                <th>Hành động</th>
                            </tr> 
                        </thead>

                        <tbody>
                            <tr>
                                <td>
                                    <input class="form-check-input" type="checkbox" value="" id="checkDefault">
                                </td>
                                <td>1</td>
                                <td>#B001</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="d-block object-fit-contain" width="100" height="100">
                                </td>
                                <td ><span class="truncate-mutiline">Biết khi nào mới gặp lại nhau</span></td>
                                <td>200</td>
                                <td ><span class="truncate-mutiline">“Biết khi nào mới gặp lại nhau” là hồi tưởng về tuổi thơ của nhân vật Khang cùng cô bạn học gần nhà tên Bụp và các bạn đồng trang lứa khác. Tuổi thơ của Khang đầy ắp những kỉ niệm với những trò tinh nghịch như hái trộm hoa quả, trêu đùa với các bạn học cùng xóm, những trận đòn roi và cả những yêu thương vô bờ của gia đình. Nhưng tuổi thơ ấy đã ghi dấu tổn thương trong tâm hồn khi cậu bé phải chia li với cô bạn học.</span></td>
                                <td>
                                    <span class="p-2 bg-primary rounded-pill">Tiểu thuyết</span>
                                </td>
                                <td>
                                    <a href="" class="nav-link">Hoàng Khánh Duy</a>
                                </td>
                                <td>13/08/2025</td>
                                <td>
                                    <span class="d-flex justify-content-between align-items-center">
                                        <a href=""><i class="fa-solid fa-eye text_dark-blue-200"></i></a>
                                        <a href=""><i class="fa-solid fa-pen-to-square text-purple"></i></a>
                                        <a href=""><i class="fa-solid fa-trash text-danger"></i></a>
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <input class="form-check-input" type="checkbox" value="" id="checkDefault">
                                </td>
                                <td>2</td>
                                <td>#B002</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/assets/images/books/dragonball-tap16-bia.png" alt="" class="d-block object-fit-contain" width="100" height="100">
                                </td>
                                <td ><span class="truncate-mutiline">Dragon Ball - 7 Viên Ngọc Rồng - Tập 16 - Kì Phùng Địch Thủ</span></td>
                                <td>200</td>
                                <td ><span class="truncate-mutiline">Bộ truyện kể về một cậu bé đuôi khỉ tên là Son Goku sống một mình trong chốn rừng sâu. Cậu rất coi trọng viên ngọc kỉ vật quý giá ông nội để lại trước khi mất.</span></td>
                                <td>
                                    <span class="p-2 bg-primary rounded-pill">Tiểu thuyết</span>
                                </td>
                                <td>
                                    <a href="" class="nav-link">Hoàng Khánh Duy</a>
                                </td>
                                <td>13/08/2025</td>
                                <td>
                                    <span class="d-flex justify-content-between align-items-center">
                                        <a href=""><i class="fa-solid fa-eye text_dark-blue-200"></i></a>
                                        <a href=""><i class="fa-solid fa-pen-to-square text-purple"></i></a>
                                        <a href=""><i class="fa-solid fa-trash text-danger"></i></a>
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <input class="form-check-input" type="checkbox" value="" id="checkDefault">
                                </td>
                                <td>3</td>
                                <td>#B003</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/assets/images/books/hoang-hon-mau-do-bia.png" alt="" class="d-block object-fit-contain" width="100" height="100">
                                </td>
                                <td ><span class="truncate-mutiline">Hoàng hôn màu đỏ</span></td>
                                <td>200</td>
                                <td ><span class="truncate-mutiline">Cuốn sách là tuyển tập 14 truyện ngắn về số phận, mảnh đời éo le, khắc nghiệt của con người miền Tây sông nước, làm bật lên sức sống kiên cường, sự lạc quan, luôn hướng về ánh sáng, về tương lai phía trước, dù hi vọng có mong manh cũng không mất đi niềm tin vào cuộc sống.</span></td>
                                <td>
                                    <span class="p-2 bg-primary rounded-pill">Tiểu thuyết</span>
                                </td>
                                <td>
                                    <a href="" class="nav-link">Hoàng Khánh Duy</a>
                                </td>
                                <td>13/08/2025</td>
                                <td>
                                    <span class="d-flex justify-content-between align-items-center">
                                        <a href=""><i class="fa-solid fa-eye text_dark-blue-200"></i></a>
                                        <a href=""><i class="fa-solid fa-pen-to-square text-purple"></i></a>
                                        <a href=""><i class="fa-solid fa-trash text-danger"></i></a>
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <input class="form-check-input" type="checkbox" value="" id="checkDefault">
                                </td>
                                <td>4</td>
                                <td>#B004</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/assets/images/books/toi-uu-toan-dien-website-bia.png" alt="" class="d-block object-fit-contain" width="100" height="100">
                                </td>
                                <td ><span class="truncate-mutiline">Biết khi nào mới gặp lại nhau</span></td>
                                <td>200</td>
                                <td ><span class="truncate-mutiline">“Biết khi nào mới gặp lại nhau” là hồi tưởng về tuổi thơ của nhân vật Khang cùng cô bạn học gần nhà tên Bụp và các bạn đồng trang lứa khác. Tuổi thơ của Khang đầy ắp những kỉ niệm với những trò tinh nghịch như hái trộm hoa quả, trêu đùa với các bạn học cùng xóm, những trận đòn roi và cả những yêu thương vô bờ của gia đình. Nhưng tuổi thơ ấy đã ghi dấu tổn thương trong tâm hồn khi cậu bé phải chia li với cô bạn học.</span></td>
                                <td>
                                    <span class="p-2 bg-primary rounded-pill">Tiểu thuyết</span>
                                </td>
                                <td>
                                    <a href="" class="nav-link">Hoàng Khánh Duy</a>
                                </td>
                                <td>13/08/2025</td>
                                <td>
                                    <span class="d-flex justify-content-between align-items-center">
                                        <a href=""><i class="fa-solid fa-eye text_dark-blue-200"></i></a>
                                        <a href=""><i class="fa-solid fa-pen-to-square text-purple"></i></a>
                                        <a href=""><i class="fa-solid fa-trash text-danger"></i></a>
                                    </span>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <input class="form-check-input" type="checkbox" value="" id="checkDefault">
                                </td>
                                <td>5</td>
                                <td>#B005</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/assets/images/books/biet-khi-nao-moi-gap-nhau-bia.png" alt="" class="d-block object-fit-contain" width="100" height="100">
                                </td>
                                <td ><span class="truncate-mutiline">Biết khi nào mới gặp lại nhau</span></td>
                                <td>200</td>
                                <td ><span class="truncate-mutiline">“Biết khi nào mới gặp lại nhau” là hồi tưởng về tuổi thơ của nhân vật Khang cùng cô bạn học gần nhà tên Bụp và các bạn đồng trang lứa khác. Tuổi thơ của Khang đầy ắp những kỉ niệm với những trò tinh nghịch như hái trộm hoa quả, trêu đùa với các bạn học cùng xóm, những trận đòn roi và cả những yêu thương vô bờ của gia đình. Nhưng tuổi thơ ấy đã ghi dấu tổn thương trong tâm hồn khi cậu bé phải chia li với cô bạn học.</span></td>
                                <td>
                                    <span class="p-2 bg-primary rounded-pill">Tiểu thuyết</span>
                                </td>
                                <td>
                                    <a href="" class="nav-link">Hoàng Khánh Duy</a>
                                </td>
                                <td>13/08/2025</td>
                                <td>
                                    <span class="d-flex justify-content-between align-items-center">
                                        <a href=""><i class="fa-solid fa-eye text_dark-blue-200"></i></a>
                                        <a href=""><i class="fa-solid fa-pen-to-square text-purple"></i></a>
                                        <a href=""><i class="fa-solid fa-trash text-danger"></i></a>
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                 </div>

                <!-- page navigation -->
                <div class="wrapper_page-navigation">
                    <nav class="nav-page">
                        <ul class="nav-list m-0 p-0">
                            <li class="list-group-item"><a class="nav-link" href=""><span class="nav-icon p-2 rounded-circle"><i class=" fa-solid fa-arrow-left"></i></span></a></li>
                            <li class="list-group-item"><a class="nav-link" href=""><span class="nav-label px-3 py-2 rounded-3 active">1</span></a></li>
                            <li class="list-group-item"><a class="nav-link" href=""><span class="nav-label px-3 py-2 rounded-3">2</span></a></li>
                            <li class="list-group-item"><a class="nav-link" href=""><span class="nav-label px-3 py-2 rounded-3">3</span></a></li>
                            <li class="list-group-item"><a class="nav-link" href=""><span class="nav-icon  p-2 rounded-circle"><i class=" fa-solid fa-arrow-right"></i></span></a></li>
                        </ul>
                    </nav>
                </div>
            </div>
         </section>   
         <!-- Chat box -->
		<%@include file="../../components/chatbox.jsp" %>
	</main>
</body>
</html>