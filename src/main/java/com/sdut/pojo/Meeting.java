package com.sdut.pojo;

public class Meeting {
    private Integer mid;

    private String mname;

    private String maddress;

    private String mbtime;

    private String metime;

    private Integer mnum;

    private String mintro;

    private String etc1;

    private String etc2;

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname == null ? null : mname.trim();
    }

    public String getMaddress() {
        return maddress;
    }

    public void setMaddress(String maddress) {
        this.maddress = maddress == null ? null : maddress.trim();
    }

    public String getMbtime() {
        return mbtime;
    }

    public void setMbtime(String mbtime) {
        this.mbtime = mbtime == null ? null : mbtime.trim();
    }

    public String getMetime() {
        return metime;
    }

    public void setMetime(String metime) {
        this.metime = metime == null ? null : metime.trim();
    }

    public Integer getMnum() {
        return mnum;
    }

    public void setMnum(Integer mnum) {
        this.mnum = mnum;
    }

    public String getMintro() {
        return mintro;
    }

    public void setMintro(String mintro) {
        this.mintro = mintro == null ? null : mintro.trim();
    }

    public String getEtc1() {
        return etc1;
    }

    public void setEtc1(String etc1) {
        this.etc1 = etc1 == null ? null : etc1.trim();
    }

    public String getEtc2() {
        return etc2;
    }

    public void setEtc2(String etc2) {
        this.etc2 = etc2 == null ? null : etc2.trim();
    }
}