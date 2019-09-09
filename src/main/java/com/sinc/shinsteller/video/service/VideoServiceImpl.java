package com.sinc.shinsteller.video.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sinc.shinsteller.video.dto.VideoDTO;
import com.sinc.shinsteller.video.model.VideoDao;
import com.sinc.shinsteller.video.vo.CategoryVO;
import com.sinc.shinsteller.video.vo.MappingVO;

import com.google.cloud.dialogflow.v2.DetectIntentRequest;
import com.google.cloud.dialogflow.v2.DetectIntentResponse;
import com.google.cloud.dialogflow.v2.QueryInput;
import com.google.cloud.dialogflow.v2.QueryResult;
import com.google.cloud.dialogflow.v2.SessionName;
import com.google.cloud.dialogflow.v2.SessionsClient;
import com.google.cloud.dialogflow.v2.TextInput;
import com.google.cloud.dialogflow.v2.TextInput.Builder;
import com.google.protobuf.Value;


@Service("videoS")
public class VideoServiceImpl implements VideoService{

	@Resource(name = "videoD")
	private VideoDao daoImpl;

	@Override
	public int plusVODcnt() {
		System.out.println("VideoServiceImpl >>>>> plusVODcnt");
		return daoImpl.updateVODcnt();
	}
	
	// DTO -> VO로 파일 변환
	public List<CategoryVO> getCategorys(List<VideoDTO> vodresult) {
		List<CategoryVO> categorys = new ArrayList<CategoryVO>();
		
		// 현재 카테고리명, 매핑단어
		String ctgname = vodresult.get(0).getCtg_name();
		String mapword = vodresult.get(0).getMap_word();
		
		// 초기 카테고리VO, 매핑VO
		CategoryVO categoryVO = new CategoryVO(ctgname);
		MappingVO mapVO = new MappingVO(mapword);
		
		// 마지막 mapVO를 추가했는지 여부(카테고리가 바뀌기 전에 categoryVO에 mapVO 추가)
		boolean addflag = false;
		
		for(int i = 0; i < vodresult.size(); i++) {
			
			VideoDTO vodResRow = vodresult.get(i);
			
			if(!vodResRow.getCtg_name().equals("")) {
				if(!ctgname.equals(vodResRow.getCtg_name())) {	// 카테고리가 바뀌면
					categoryVO.addSubMapping(mapVO);	// 카테고리에 매핑VO 추가
					addflag = true;
					
					categorys.add(categoryVO);
					
					ctgname = vodResRow.getCtg_name();
					categoryVO = new CategoryVO(ctgname);
					mapword = "new";
				}
				
				if(!mapword.equals(vodResRow.getMap_word())) {	// 매핑단어가 바뀌면
					if(addflag == false) {
						categoryVO.addSubMapping(mapVO);
					} else {
						addflag = false;
					}
					
					mapword = vodResRow.getMap_word();
					mapVO = new MappingVO(mapword);
				}
				mapVO.addTimeStamp(vodResRow.getRes_timestmp());	// 매핑단어의 타임스탬프 추가
			}
			
		}
		
		categoryVO.addSubMapping(mapVO);
		categorys.add(categoryVO);
		
		return categorys;
	}
	
	// 처음 재생했을 때 보여주는 카테고리
	@Override
	public List<CategoryVO> getFirstCategorys(String videoName) {
		System.out.println("VideoServiceImpl >>>>> getFirstCategorys");
		List<VideoDTO> vodresult = daoImpl.getFirstVodResultList(videoName);
		return getCategorys(vodresult);
	}

	// 음성 검색 후 전체 카테고리 불러오기
	@Override
	public List<CategoryVO> getAllCategorys(String videoName) {
		System.out.println("VideoServiceImpl >>>>> getAllCategorys");
		List<VideoDTO> vodresult = daoImpl.getAllVodResultList(videoName);
		return getCategorys(vodresult);
	}	
	
	// 음성 검색 관련 카테고리
	@Override
	public List<CategoryVO> searchService(String videoName, String record) throws Exception{
			String projectId = "shinsteller-bqeqfl";
			String sessionId = "251196e3-04fb-be8d-a5a0-1fd8efc44a6a";
			String languageCode = "ko";
			List<String> keywords = new ArrayList<String>();
			
			try (SessionsClient sessionsClient = SessionsClient.create()) {
				SessionName session = SessionName.of(projectId,sessionId);
				System.out.println("Session Path: " + session.toString());
				System.out.println("Session record: " + record);
		    	Builder textInput = TextInput.newBuilder().setText(record).setLanguageCode(languageCode);
		    	QueryInput queryInput = QueryInput.newBuilder().setText(textInput).build();

		    	DetectIntentRequest dr =
		          DetectIntentRequest.newBuilder()
		              .setQueryInput(queryInput)
		              .setSession(session.toString())
		              .build();
		    	
		    	// Performs the detect intent request
		    	DetectIntentResponse response = sessionsClient.detectIntent(dr);
		    	// Display the query result
		    	QueryResult queryResult = response.getQueryResult();
		    	
		    	Map<String, Value> param =  queryResult.getParameters().getFieldsMap();
		    	
		    	for(String key:param.keySet()) {
		    		List<Value> value = param.get(key).getListValue().getValuesList();
		    		for(Value val : value) {
		    			keywords.add(val.getStringValue());
		    		}
		    	}
			}
			
			List<VideoDTO> rows = daoImpl.selectList(videoName, keywords);
			//이미 result에 추가한 것인지 빠르게 알아보기 위한 색인용 리스트 두개 생성(매번 돌리기보다 해당 리스트에서 검색해버리기)
			List<String> ctg = new ArrayList<String>();
			List<String> map = new ArrayList<String>();
			List<CategoryVO> result = new ArrayList<CategoryVO>();
			
			//반환받은 맵 이름중 null값이 어떻게 넘어오는지 확인해야합니다. "" 으로 넘어온다고 우선 가정하고 진행했습니다.
			
			for(VideoDTO row : rows) {
				if(ctg.contains(row.getCtg_name())) {	//카테고리 리스트에 해당 row의 카테고리가 있다면 -> 이미 카테고리가 있습니다. -> 맵 분석하세요.
					if(map.contains( (row.getMap_word().equals(""))? "전체" : row.getMap_word() )) {	//해당 row의 맵 이름이 이미 맵 리스트에 있다면 -> 타임스탬프만 찍자.
						for(CategoryVO cat : result) {
							boolean done = false;
							if(cat.getCategory().equals(row.getCtg_name())) {			//카테고리 이름이 같은 cat을 뽑았습니다.
								for(MappingVO mpg : cat.getSubMappings()) {				//해당 cat의 맵 리스트중에서
									if(mpg.getMapWord().equals(row.getMap_word())){		//row와 맵 이름이 같은 경우
										done = mpg.getTimeStamp().add(row.getRes_timestmp());	//해당 맵에 row의 타임스탬프를 추가한다.
										break;
									}
								}
							}
							if(done == true) {	//만약 성공적으로 row값을 result에 추가했다면 done이 true가 되어서 해당 row에 대한 반복문은 종료. 다음 row 체크
								break;
							}
						}
					}else {			//카테고리는 있지만, 맵 이름은 없습니다. 맵VO를 만들어서 삽입하세요. 그리고 맵 이름을 리스트에 추가해주세요. 
						for(CategoryVO cat : result) {
							if(cat.getCategory().equals(row.getCtg_name())){
								List<Double> time = new ArrayList<Double>();
								time.add(row.getRes_timestmp());
								cat.getSubMappings().add(new MappingVO(row.getMap_word(),time));
								map.add( (row.getMap_word().equals(""))? "전체" : row.getMap_word() );	//맵을 추가했으므로 맵 리스트에 이름 넣기
								break;
							}
						}
					}
				}else {		//카테고리 이름자체가 없어요. 아예 새로운 카테고리VO를 만들어야합니다.
					MappingVO mtemp = new MappingVO(row.getMap_word());
					mtemp.addTimeStamp(row.getRes_timestmp());
					
					CategoryVO ctemp = new CategoryVO(row.getCtg_name());
					ctemp.addSubMapping(mtemp);
					result.add(ctemp);
					
					//카테고리와 맵 자체를 생성해서 넣었기 때문에 맵리스트와 카테고리 리스트에도 넣어줍시다.
					ctg.add(row.getCtg_name());
					map.add( (row.getMap_word().equals(""))? "전체" : row.getMap_word() );
				}
			}
			return result;
		}

}
