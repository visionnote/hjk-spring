<%@ page import="java.util.*, java.io.*" %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
    String fileUploadPath = "C:\\upload";

    DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);

    List<FileItem> items = upload.parseRequest(request);
    for (FileItem item : items) {
        if (!item.isFormField()) {
            String fileName = item.getName();
            File uploadedFile = new File(fileUploadPath, fileName);
            item.write(uploadedFile);
        }
    }
%>
