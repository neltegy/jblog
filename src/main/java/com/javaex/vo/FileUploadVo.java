package com.javaex.vo;

public class FileUploadVo {
	private int no;
	private String orgname;
    private String exname;
    private String savename;
    private String filepath;
    private long filesize;
    private String reg_date;
    
	public FileUploadVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public FileUploadVo(int no, String orgname, String exname, String savename, String filepath, long filesize,
			String reg_date) {
		super();
		this.no = no;
		this.orgname = orgname;
		this.exname = exname;
		this.savename = savename;
		this.filepath = filepath;
		this.filesize = filesize;
		this.reg_date = reg_date;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getExname() {
		return exname;
	}
	public void setExname(String exname) {
		this.exname = exname;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "FileUploadVo [no=" + no + ", orgname=" + orgname + ", exname=" + exname + ", savename=" + savename
				+ ", filepath=" + filepath + ", filesize=" + filesize + ", reg_date=" + reg_date + "]";
	}
    
}
