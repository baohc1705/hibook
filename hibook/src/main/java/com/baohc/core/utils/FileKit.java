package com.baohc.core.utils;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class FileKit {
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
			//Lấy đuôi file
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
}
