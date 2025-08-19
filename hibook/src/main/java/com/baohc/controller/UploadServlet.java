package com.baohc.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UploadServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,      // 1MB
    maxFileSize = 1024 * 1024 * 5,        // 5MB/file
    maxRequestSize = 1024 * 1024 * 25     // 25MB tổng request
)
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR = "assets/images/avatars";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // đường dẫn thư mục upload 
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        // lấy file từ form
        Part filePart = request.getPart("file");
        String originalFileName = filePart.getSubmittedFileName();

        if (originalFileName != null && !originalFileName.isEmpty()) {
            // lấy phần mở rộng
            String fileExt = "";
            int i = originalFileName.lastIndexOf('.');
            if (i > 0) {
                fileExt = originalFileName.substring(i).toLowerCase();
            }

            // lấy MIME type
            String mimeType = filePart.getContentType();

            // validate extension + MIME type
            boolean isValidExtension = fileExt.equals(".jpg") || fileExt.equals(".png");
            boolean isValidMime = mimeType != null &&
                                  (mimeType.equals("image/jpeg") || mimeType.equals("image/png"));

            if (!isValidExtension || !isValidMime) {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<h3 style='color:red'>❌ Chỉ được upload file JPG hoặc PNG hợp lệ!</h3>");
                return;
            }

            // tạo tên file mới với UUID
            String uniqueFileName = UUID.randomUUID().toString() + fileExt;

            // lưu file
            filePart.write(uploadPath + File.separator + uniqueFileName);

            // gửi sang JSP hiển thị ảnh
            request.setAttribute("uploadedFile", uniqueFileName);
            request.getRequestDispatcher("uploadfile.jsp").forward(request, response);

        } else {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h3 style='color:red'>⚠ Không có file nào được chọn!</h3>");
        }
    }
}
