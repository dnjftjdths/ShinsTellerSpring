package com.sinc.shinsteller.video.model;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sinc.shinsteller.video.dto.VideoDTO;

@Repository("videoD")
public class VideoDaoImpl implements VideoDao{

	@Resource(name="sqlSession")
	private SqlSession session;

	@Override
	public int updateVODcnt() {
		System.out.println("VideoDaoImpl >>>>> insertVODcnt");
		return session.update("com.sinc.shinsteller.video.plusVODcnt");
	}
	
	public int checkVOD_ID(String videoName) {
		int vod_id = 2;
		if(videoName.equals("GentHommeVOD")) {
			vod_id = 0;
		} else if(videoName.equals("ChesterPantsVOD")) {
			vod_id = 1;
		}
		return vod_id;
	}
	
	@Override
	public List<VideoDTO> getFirstVodResultList(String videoName) {
		System.out.println("VideoDaoImpl >>>>> getFirstVodResultList");
		return session.selectList("com.sinc.shinsteller.video.selectFirstVODResult", checkVOD_ID(videoName));
	}
	
	@Override
	public List<VideoDTO> getAllVodResultList(String videoName) {
		System.out.println("VideoDaoImpl >>>>> getAllVodResultList");
		return session.selectList("com.sinc.shinsteller.video.selectAllVODResult", checkVOD_ID(videoName));
	}
	
	@Override
	public List<VideoDTO> selectList(String videoName, List<String> keywords) {
		
		List<VideoDTO> rows=session.selectList("com.sinc.shinsteller.video.selectall", checkVOD_ID(videoName));
		List<VideoDTO> result = new ArrayList<VideoDTO>();
		String targetCtg = "null";
		List<String> targets = new ArrayList<String>();	//만약 타겟 카테고리가 중복될경우 result에 같은 row를 넣지 않도록 하는 체크 리스트
		
		
		for(String keyword : keywords) {
			for(VideoDTO row : rows) {
				if(row.getMap_word().equals(keyword)){	//키워드가 맵워드와 같다면 타겟 카테고리는 해당 맵의 상위 카테고리다.
					targetCtg = ( targets.contains(row.getCtg_name()) )? "null" : row.getCtg_name() ;
					break;
				}else if(row.getCtg_name().equals(keyword)) {	//키워드가 카테고리네임과와 같다면 타겟 카테고리는 해당 카테고리다.
					targetCtg = ( targets.contains(row.getCtg_name()) )? "null" : row.getCtg_name() ;
					break;
				}else {
					targetCtg = "null";		//키워드와 매칭되는걸 발견하지 못한 경우 암것두 없슴다
				}
			}
			if(!targetCtg.equals("null")) {	//타겟 키워드가 존재한다면
				targets.add(targetCtg);	//타겟 키워드를 처리했다는 의미에서 타겟 리스트에 넣습니다. 
				for(VideoDTO row : rows) {	//모든 row 중에서
					if(row.getCtg_name().equals(targetCtg)) {	//카테고리 이름이 타겟과 같은 row를 찾아서	
						result.add(row);						//result에 추가한다.
					}
				}
			}
		}
		
		return result;
	}
	
}
