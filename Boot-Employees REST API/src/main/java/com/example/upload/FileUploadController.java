package com.example.upload;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class FileUploadController {
	
	@GetMapping("/upload_form")
	public String showUploadForm() {
	    return "upload_form";
	}

    @PostMapping("/upload_result")
    public String handleUpload(@RequestParam("files") MultipartFile[] files,
                               HttpServletRequest request) throws IOException {

            String uploadPath = "C:/upload";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            List<String> uploadedFileNames = new ArrayList<>();
            for(MultipartFile file : files) {
            if(!file.isEmpty()) {
            String filePath = uploadPath + File.separator + file.getOriginalFilename();
            file.transferTo(new File(filePath));
            uploadedFileNames.add(file.getOriginalFilename());
            //request.setAttribute("fileName", file.getOriginalFilename());
            	}
            }
        request.setAttribute("uploadedFiles", uploadedFileNames);
        return "upload_result";
    }
}