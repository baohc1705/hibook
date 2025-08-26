package com.baohc.core.utils;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class FileKit {
	private static final String UPLOAD_DIR = "/assets/images/avatars";

	public static String uploadFile(Part filePart, String UPLOAD_DIR, HttpServletRequest request)
			throws ServletException, IOException {
		String filename = "";

		// Lấy đường dẫn của dự án để lưu file
		String uploadPath = request.getServletContext().getRealPath("") + UPLOAD_DIR;

		File uploadDir = new File(uploadPath);

		if (!uploadDir.exists())
			uploadDir.mkdir();
		// lấy tên gốc của file
		String originalFileName = filePart.getSubmittedFileName();

		if (originalFileName != null && !originalFileName.isEmpty()) {
			// Lấy đuôi file
			String fileExit = "";
			int i = originalFileName.lastIndexOf('.');
			if (i > 0)
				fileExit = originalFileName.substring(i).toLowerCase();

			String mimeType = filePart.getContentType();

			boolean isValidExtensison = fileExit.equals(".jpg") || fileExit.equals(".png");
			boolean isValidMime = mimeType != null && (mimeType.equals("image/jpeg") || mimeType.equals("image/png"));

			if (isValidExtensison && isValidMime) {
				String uniqueFileName = UUID.randomUUID().toString() + fileExit;
				System.out.println("Đường dẫn ảnh: " + uploadPath + File.separator + uniqueFileName);

				filePart.write(uploadPath + File.separator + uniqueFileName);

				filename = uniqueFileName;
			}

		}
		return filename;
	}

	public static boolean delete(String filename, String UPLOAD_DIR, HttpServletRequest request) throws ServletException, IOException {
		 if (filename == null || filename.trim().isEmpty()) {
		        return false;
		    }

		    String filePath = request.getServletContext().getRealPath("") 
		            + UPLOAD_DIR + File.separator + filename;
		    File file = new File(filePath);

		    if (file.exists()) {
		        boolean deleted = file.delete();
		        if (deleted) {
		            System.out.println("Đã xóa file: " + filePath);
		        } else {
		            System.err.println("Không thể xóa file: " + filePath);
		        }
		        return deleted;
		    } else {
		        System.err.println("File không tồn tại: " + filePath);
		        return false;
		    }
	}

	public static void main(String[] args) {

	}
}
