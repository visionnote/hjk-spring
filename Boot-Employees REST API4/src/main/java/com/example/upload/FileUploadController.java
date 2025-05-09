package com.example.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
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
	
	@Autowired
	private UploadedFileRepository fileRepository;
	
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
            
            UploadedFile saved = new UploadedFile();
            saved.setFileName(file.getOriginalFilename());
            fileRepository.save(saved);
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
    
    @GetMapping("/files")
    public String listFiles(HttpServletRequest request) {
//        String uploadDir = "C:/upload";
//        File folder = new File(uploadDir);
//        File[] files = folder.listFiles();
//
//        List<String> fileNames = new ArrayList<>();
//        if (files != null) {
//            for (File file : files) {
//                if (file.isFile()) {
//                    fileNames.add(file.getName());
//                }
//            }
//        }
    	 List<UploadedFile> files = fileRepository.findAll();

//         request.setAttribute("fileList", fileNames);
         request.setAttribute("fileList", files);
        return "file_list";
    }

    @PostMapping("/delete")
    public String deleteFile(@RequestParam("filename") String fileName,
                             HttpServletRequest request) {
        String uploadDir = "C:/upload";
        File file = new File(uploadDir, fileName);
        if (file.exists()) {
            file.delete();
        }
        
        UploadedFile uploaded = fileRepository.findByFileName(fileName);
        if (uploaded != null) fileRepository.delete(uploaded);
        
        return "redirect:/files";  // 삭제 후 목록 페이지로 리다이렉트
    }
    
    @GetMapping("/files/image")
    public ResponseEntity<Resource> serveImage(@RequestParam("filename") String fileName) throws IOException {
        String uploadDir = "C:/upload";
        File file = new File(uploadDir, fileName);

        if (!file.exists()) {
            return ResponseEntity.notFound().build();
        }

        String contentType = Files.probeContentType(file.toPath());
        if (contentType == null || !contentType.startsWith("image")) {
            return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE).build();
        }

        Resource resource = new InputStreamResource(new FileInputStream(file));
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(contentType))
                .body(resource);
    }
    
}