package com.example.upload;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
public class UploadedFile {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "file_seq_gen")
    @SequenceGenerator(name = "file_seq_gen", sequenceName = "uploaded_file_seq", allocationSize = 1)
    private Long id;

    private String fileName;

    private LocalDateTime uploadedAt = LocalDateTime.now();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public LocalDateTime getUploadedAt() {
		return uploadedAt;
	}

	public void setUploadedAt(LocalDateTime uploadedAt) {
		this.uploadedAt = uploadedAt;
	}

    // Getters and setters
}