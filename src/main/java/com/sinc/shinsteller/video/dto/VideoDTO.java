package com.sinc.shinsteller.video.dto;

public class VideoDTO {
		// 데이터베이스 컬럼 이름 : CTG_NAME, MAP_WORD, RES_TIMESTMP
		// 데이터 베이스로부터의 row data 저장할 DTO
		// DB - > VideoDAO : List<VideoDTO>
		
		private String ctg_name = "";	// 카테고리명( ex. 컬러 )
		private String map_word = "";	// 매핑 단어 ( ex. 화이트 )
		private double res_timestmp;	// 타임 스탬프
		
		public VideoDTO() {
			super();
		}

		public VideoDTO(String ctg_name, String map_word, double res_timestmp) {
			super();
			this.ctg_name = ctg_name;
			this.map_word = map_word;
			this.res_timestmp = res_timestmp;
		}

		public String getCtg_name() {
			return ctg_name;
		}

		public void setCtg_name(String ctg_name) {
			this.ctg_name = ctg_name;
		}

		public String getMap_word() {
			return map_word;
		}

		public void setMap_word(String map_word) {
			this.map_word = map_word;
		}

		public double getRes_timestmp() {
			return res_timestmp;
		}

		public void setRes_timestmp(double res_timestmp) {
			this.res_timestmp = res_timestmp;
		}

		@Override
		public String toString() {
			return "[VideoDTO] ctg_name=" + ctg_name + ", map_word=" + map_word + ", res_timestmp" + res_timestmp;
		}
}
