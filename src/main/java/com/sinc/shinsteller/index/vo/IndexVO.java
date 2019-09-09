package com.sinc.shinsteller.index.vo;


public class IndexVO {
	
	// PRDNO, PRDNAME, PRDTITLE, PRICE
	private int prdno;
	private String prdname;
	private String prdtitle;
	private int price;
	
	public IndexVO() {
		super();
	}

	public IndexVO(int prdno, String prdname, String prdtitle, int price) {
		super();
		this.prdno = prdno;
		this.prdname = prdname;
		this.prdtitle = prdtitle;
		this.price = price;
	}
	
	public int getPrdno() {
		return prdno;
	}
	public void setPrdno(int prdno) {
		this.prdno = prdno;
	}
	public String getPrdname() {
		return prdname;
	}
	public void setPrdname(String prdname) {
		this.prdname = prdname;
	}
	public String getPrdtitle() {
		return prdtitle;
	}
	public void setPrdtitle(String prdtitle) {
		this.prdtitle = prdtitle;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "IndexVO[ prdno=" + prdno + ", prdname=" + prdname + ", prdtitle=" + prdtitle + ", price=" + price+ "]";
	}

}
