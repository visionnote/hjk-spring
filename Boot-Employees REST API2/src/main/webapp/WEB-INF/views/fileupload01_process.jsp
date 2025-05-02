<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.example.upload.CustomFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.FileRenamePolicy" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%

    out.println("CustomFileRenamePolicy 클래스: " + (new CustomFileRenamePolicy()).getClass().getName());

    // 실제로 존재하는 디렉토리여야 함
    String savePath = "C:\\upload";
    int maxSize = 5 * 1024 * 1024;  // 5MB
    String encoding = "utf-8";

    // MultipartRequest 객체 생성
    MultipartRequest multi = new MultipartRequest(
        request,
        savePath,
        maxSize,
        encoding,
        new CustomFileRenamePolicy()
    );
	
	
	
	String filename = multi.getFilesystemName("uploadFile");
	
	out.println("업로드된 파일 이름:" + filename);

    // 파라미터 출력
    Enumeration params = multi.getParameterNames();
    while (params.hasMoreElements()) {
        String name = (String) params.nextElement();
        String value = multi.getParameter(name);
        out.println(name + " = " + value + "<br>");
    }

    out.println("-------------------------<br>");

    // 파일 관련 정보 출력
    Enumeration files = multi.getFileNames();
    while (files.hasMoreElements()) {
        String name = (String) files.nextElement();
        filename = multi.getFilesystemName(name);
        String original = multi.getOriginalFileName(name);
        String type = multi.getContentType(name);
        File file = multi.getFile(name);

        out.println("요청 파라미터 이름: " + name + "<br>");
        out.println("실제 파일 이름: " + original + "<br>");
        out.println("저장 파라미터 이름: " + filename + "<br>");
        out.println("파일 콘텐츠 유형: " + type + "<br>");

        if (file != null) {
            out.println("파일 크기: " + file.length() + " bytes<br>");
        }
    }
%>