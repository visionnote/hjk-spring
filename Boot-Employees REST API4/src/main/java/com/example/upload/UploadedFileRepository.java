package com.example.upload;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UploadedFileRepository extends JpaRepository<UploadedFile, Long> {
    
    // 파일 이름으로 업로드된 파일을 조회
    UploadedFile findByFileName(String fileName);
}
