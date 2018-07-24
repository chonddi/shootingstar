package com.ss.star.common;

import javax.servlet.http.HttpServletRequest;

public class Utility {
	public static final int BLOCK_SIZE=10;
	public static final int RECORD_COUNT_PER_PAGE=10;  //게시판에서 한 페이지에 보여줄 레코드 개수
	public static final int RECORD_COUNT_TEN=10;  //우편번호 찾기에서 한 페이지에 보여줄 레코드 개수
	
	public static String getFileInfo(String originalFileName,HttpServletRequest request) {
		String fileInfo="";
		
		if(originalFileName!=null && !originalFileName.isEmpty()) {
			fileInfo = "<img src='"+ request.getContextPath()+"/images/file.gif"
					+"' alt='파일 이미지' />";
		}
		
		return fileInfo;
		
	}
	
}