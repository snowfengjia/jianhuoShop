package com.pojo;

public class Goods {
    private Integer id;

    private String fid;

    private String mark;

    private String img;

    private String name;

    private Double price;

    private String pubtime;

    private String isdel;

    private String uid;

    private Integer kcnum;

    private Integer xnum;

    private String tpstatus;

    private String shuoming;

    private String ftype;

    private String ftime;

    private String fprice;

    private String isshow;

    private String miaoshu;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid == null ? null : fid.trim();
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark == null ? null : mark.trim();
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getPubtime() {
        return pubtime;
    }

    public void setPubtime(String pubtime) {
        this.pubtime = pubtime == null ? null : pubtime.trim();
    }

    public String getIsdel() {
        return isdel;
    }

    public void setIsdel(String isdel) {
        this.isdel = isdel == null ? null : isdel.trim();
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }

    public Integer getKcnum() {
        return kcnum;
    }

    public void setKcnum(Integer kcnum) {
        this.kcnum = kcnum;
    }

    public Integer getXnum() {
        return xnum;
    }

    public void setXnum(Integer xnum) {
        this.xnum = xnum;
    }

    public String getTpstatus() {
        return tpstatus;
    }

    public void setTpstatus(String tpstatus) {
        this.tpstatus = tpstatus == null ? null : tpstatus.trim();
    }


    public String getShuoming() {
		return shuoming;
	}

	public void setShuoming(String shuoming) {
		this.shuoming = shuoming;
	}

	public String getFtype() {
        return ftype;
    }

    public void setFtype(String ftype) {
        this.ftype = ftype == null ? null : ftype.trim();
    }

    public String getFtime() {
        return ftime;
    }

    public void setFtime(String ftime) {
        this.ftime = ftime == null ? null : ftime.trim();
    }

    public String getFprice() {
        return fprice;
    }

    public void setFprice(String fprice) {
        this.fprice = fprice == null ? null : fprice.trim();
    }

    public String getIsshow() {
        return isshow;
    }

    public void setIsshow(String isshow) {
        this.isshow = isshow == null ? null : isshow.trim();
    }

    public String getMiaoshu() {
        return miaoshu;
    }

    public void setMiaoshu(String miaoshu) {
        this.miaoshu = miaoshu == null ? null : miaoshu.trim();
    }
}