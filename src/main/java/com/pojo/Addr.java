package com.pojo;

public class Addr {
    private Integer fid;

    private String ftype;

    private String isdel;

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getFtype() {
        return ftype;
    }

    public void setFtype(String ftype) {
        this.ftype = ftype == null ? null : ftype.trim();
    }

    public String getIsdel() {
        return isdel;
    }

    public void setIsdel(String isdel) {
        this.isdel = isdel == null ? null : isdel.trim();
    }
}