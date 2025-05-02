package com.example.upload;

import java.io.File;
import java.util.UUID;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class CustomFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File file) {
		// 원본 파일 이름 추출
		String parentDir = file.getParent();
		String name = file.getName();
		
		//확장자 분리 
		int dot = name.lastIndexOf(".");
		String baseName = (dot == -1) ? name : name.substring(0,dot);
		String ext = (dot == -1) ? "" : name.substring(dot);
		
		//UUID 추가
		String newName = baseName + "_" + UUID.randomUUID().toString() + ext;
		
		//새로운 파일 객체 반환
		return new File(parentDir, newName);
	}
	
}
