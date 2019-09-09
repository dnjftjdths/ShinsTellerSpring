package com.sinc.shinsteller.product.vo;

public class ProductVO {
	// PRDNO, PRDNAME, PRDTITLE, PRICE
		private int prdno;
		private String prdname;
		private String prdtitle;
		private int price;
		private String brand;
		private String manufacturer;
		private String category1;
		private String category2;
		private String vod_name;
		
		public ProductVO() {
			super();
		}

		public ProductVO(int prdno, String prdname, String prdtitle, int price, String brand, String manufacturer,
				String category1, String category2, String vod_name) {
			super();
			this.prdno = prdno;
			this.prdname = prdname;
			this.prdtitle = prdtitle;
			this.price = price;
			this.brand = brand;
			this.manufacturer = manufacturer;
			this.category1 = category1;
			this.category2 = category2;
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
		public String getBrand() {
			return brand;
		}
		public void setBrand(String brand) {
			this.brand = brand;
		}
		public String getManufacturer() {
			return manufacturer;
		}
		public void setManufacturer(String manufacturer) {
			this.manufacturer = manufacturer;
		}

		public String getCategory1() {
			return category1;
		}

		public void setCategory1(String category1) {
			this.category1 = category1;
		}

		public String getCategory2() {
			return category2;
		}

		public void setCategory2(String category2) {
			this.category2 = category2;
		}

		public String getVod_name() {
			return vod_name;
		}

		public void setVod_name(String vod_name) {
			this.vod_name = vod_name;
		}

		@Override
		public String toString() {
			return "ProductVO[ prdno=" + prdno + ", prdname=" + prdname + ", prdtitle=" + prdtitle + ", price=" + price+ ", brand=" + brand + ", manufacturer=" + manufacturer + ", category1="+ category1 + ", category2=" + category2 + ", vod_name=" + vod_name + "]";
		}
}
