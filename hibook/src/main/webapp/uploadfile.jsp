<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload File Example</title>
</head>
<body>
    <h2>Upload Avatar (.jpg, .png)</h2>
    
    <!-- Form upload -->
    <form method="post" action="UploadServlet" enctype="multipart/form-data">
        <label>Choose a file: </label>
        <input type="file" name="file" accept=".jpg,.png" />
        <br/><br/>
        <input type="submit" value="Upload" />
    </form>

    <br/>
    <!-- Hiển thị ảnh nếu upload thành công -->
    <%
        String fileName = (String) request.getAttribute("uploadedFile");
        if (fileName != null) {
    %>
        <h3>Uploaded Image:</h3>
        <img src="<%= request.getContextPath() + "/assets/images/avatars/" + fileName %>" 
             alt="Uploaded Image" width="200"/>
    <%
        }
    %>
</body>
</html>
