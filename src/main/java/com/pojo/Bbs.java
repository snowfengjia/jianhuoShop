package com.pojo;

public class Bbs {
    private Integer id;

    private String pubtime;

    private String etime;

    private String isdel;
    private String btype;
    private Integer gid;
    private Integer uid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPubtime() {
        return pubtime;
    }

    public void setPubtime(String pubtime) {
        this.pubtime = pubtime == null ? null : pubtime.trim();
    }

    public String getEtime() {
        return etime;
    }

    public void setEtime(String etime) {
        this.etime = etime == null ? null : etime.trim();
    }

    public String getIsdel() {
        return isdel;
    }

    public void setIsdel(String isdel) {
        this.isdel = isdel == null ? null : isdel.trim();
    }

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getBtype() {
		return btype;
	}

	public void setBtype(String btype) {
		this.btype = btype;
	}

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}
    
}