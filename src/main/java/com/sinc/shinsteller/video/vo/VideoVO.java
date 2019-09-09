package com.sinc.shinsteller.video.vo;

import java.util.ArrayList;
import java.util.List;

public class VideoVO {
	private List<Double> timestamps = new ArrayList<Double>();

	public VideoVO() {
		super();
	}

	public VideoVO(List<Double> timestamps) {
		super();
		this.timestamps = timestamps;
	}

	public List<Double> getTimestamps() {
		return timestamps;
	}

	public void setTimestamps(List<Double> timestamps) {
		this.timestamps = timestamps;
	}
	
	
}
