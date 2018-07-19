package com.ss.star.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
	
	public String getUploadPath(int pathFlag) {
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
		
		MultipartFile identification=multiRequest.getFile("identifi");
		MultipartFile accountCopy=multiRequest.getFile("account");
		List<Map<String, String>> list = new ArrayList<>();
		
		if(identification!=null && !identification.isEmpty() 
				&&accountCopy!=null && !accountCopy.isEmpty()) {
			String originalFileName = identification.getOriginalFilename();
			String originalFileName2 = accountCopy.getOriginalFilename();
			logger.info("originalFileName: {}, originalFileName2: {} ", originalFileName,originalFileName2);
			
	        String path = getUploadPath(PATH_FLAG_IDENTI);
	        String path2 = getUploadPath(PATH_FLAG_ACCOUNT);
	        String safeFile = getUniqueFileName(originalFileName);
	        String safeFile2 =getUniqueFileName(originalFileName2);
	        try {
	            identification.transferTo(new File(path, safeFile));
	            accountCopy.transferTo(new File(path2, safeFile2));
	        } catch (IllegalStateException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        
	        Map<String, String> map = new HashMap<>();
	        map.put("identification", safeFile);
	        map.put("accountCopy", safeFile2);

			list.add(map);
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
