package com.ss.star.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUploadUtil2 {
	private static final Logger logger=LoggerFactory.getLogger(FileUploadUtil2.class);
	
	@Resource(name="fileUploadProperties2")		//name의 값으로 찾아옴 autowired는 타입을 찾아서 넣어줌
	private Properties fileUploadProps2;
	
	public static final int PATH_FLAG_IDENTI=11;	//신분증
	public static final int PATH_FLAG_ACCOUNT=22;	//계좌사본
	
	public String getUploadPath(HttpServletRequest request, int pathFlag) {
		//업로드 폴더 구하는 메서드
		String upPath="";
		String type=fileUploadProps2.getProperty("file.upload.type");
		
		
		if(type.equals("test")) {
			//테스트 경로
			if(pathFlag==PATH_FLAG_IDENTI) { //신분증
				upPath=fileUploadProps2.getProperty("identification.upload.path.test");
			}else {	//계좌사본
				upPath=fileUploadProps2.getProperty("accountCopy.upload.path.test");
			}
		}else {
			//실제 물리적인 경로 구하기
			if(pathFlag==PATH_FLAG_IDENTI) { //신분증
				upPath=fileUploadProps2.getProperty("identification.upload.path");
			}else {//계좌사본
				upPath=fileUploadProps2.getProperty("accountCopy.upload.path");
			}
			upPath=request.getSession().getServletContext().getRealPath(upPath);
		}
		logger.info("업로드 경로 : {}", upPath);
		return upPath;
	}
	
	public String getCurrentTime() {
		//현재 시간을 밀리초까지 표현
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String today = sdf.format(d);
		logger.info("현재시간(밀리초) - {}", today);
		
		return today;
	}
	
	public List<Map<String, String>> fileUpload(HttpServletRequest request) throws IllegalStateException, IOException {
		//파일 업로드 처리하는 메서드
		MultipartHttpServletRequest multiRequest =(MultipartHttpServletRequest)request;
		
		Map<String, MultipartFile> fileMap = multiRequest.getFileMap();
		//Map<String, MultipartFile> getFileMap();
		//MultipartFile은 임시파일상태
		
		//파일정보를 저장할 컬렉션
		List<Map<String, String>> list=  new ArrayList<>();
		
		Iterator<String> iter = fileMap.keySet().iterator();
		while(iter.hasNext()) {
			String key = iter.next();
			MultipartFile tempFile = fileMap.get(key);
			//업로드된 파일이 있으면
			if(!tempFile.isEmpty()) {
				//업로드된 파일 정보 구하기
				String originalFileName=tempFile.getOriginalFilename();
				String fileName = getUniqueFileName(originalFileName);
				
				//업로드 처리하기
				if(key.equals("identi")) {
					File file = new File(getUploadPath(request, PATH_FLAG_IDENTI), fileName);
					tempFile.transferTo(file);
				}else {
					File file = new File(getUploadPath(request, PATH_FLAG_ACCOUNT), fileName);
					tempFile.transferTo(file);
				}
				
				//파일 정보를 map에 저장
				Map<String, String> map = new HashMap<>();
				map.put("originalFileName", fileName);
				map.put("identiCopy", key);
				
				//map을 list에 저장
				list.add(map);
			}
		}
		return list;
	}

	public String getUniqueFileName(String originalFileName) {
		//Original 파일이름을 unique한 파일 이름으로 변경하는 메서드
		//abc.txt => abc20180615112150123.txt
		
		int index = originalFileName.lastIndexOf(".");
		String name = originalFileName.substring(0, index);
		String ext = originalFileName.substring(index);
		String fileName = name+getCurrentTime()+ext;
		logger.info("변경된 파일 이름 : {}", fileName);
		
		return fileName;
	}
	
}
