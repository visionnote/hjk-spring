package com.example.upload;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
    
    @GetMapping("/download")
    public ResponseEntity<Resource> downloadFile(@RequestParam("filename") String fileName) throws IOException {
        String uploadDir = "C:/upload";
        File file = new File(uploadDir, fileName);

        if (!file.exists()) {
            return ResponseEntity.notFound().build();
        }

        Resource resource = new FileSystemResource(file);

        // 파일 이름이 한글이거나 특수문자 포함 시 인코딩 필요
        String encodedFileName = URLEncoder.encode(file.getName(), StandardCharsets.UTF_8).replaceAll("\\+", "%20");

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + encodedFileName + "\"")
                .contentLength(file.length())
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(resource);
    }
}