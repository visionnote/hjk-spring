package com.example.upload;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;

@Controller
public class FileUploadController {
	
	@GetMapping("/upload_form")
	public String showUploadForm() {
	    return "upload_form";
	}

    @PostMapping("/upload_result")
    public String handleUpload(@RequestParam("file") MultipartFile file,
                               HttpServletRequest request) throws IOException {
        if (!file.isEmpty()) {
            String uploadPath = "C:/upload";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            String filePath = uploadPath + File.separator + file.getOriginalFilename();
            file.transferTo(new File(filePath));
            request.setAttribute("fileName", file.getOriginalFilename());
        }
        return "upload_result";
    }
}
