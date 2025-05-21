package com.example.myapp.model;

import java.sql.Timestamp;

public class Member {
    private String id;
    private String passwd;
    private String name;
    private Timestamp regDate;
    private Timestamp modDate;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getPasswd() { return passwd; }
    public void setPasswd(String passwd) { this.passwd = passwd; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public Timestamp getRegDate() { return regDate; }
    public void setRegDate(Timestamp regDate) { this.regDate = regDate; }
    public Timestamp getModDate() { return modDate; }
    public void setModDate(Timestamp modDate) { this.modDate = modDate; }
}