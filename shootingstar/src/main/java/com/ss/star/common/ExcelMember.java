package com.ss.star.common;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.ss.star.member.model.MemberVO;

public class ExcelMember {

	
	public void xlsxWiter(List<MemberVO> list, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String sFileName = "memberList" + ".xlsx";

		sFileName = new String ( sFileName.getBytes("KSC5601"), "8859_1");

		response.reset();  //엑셀 한글 깨짐 방지
		 

		String strClient = request.getHeader("User-Agent");
		String fileName = sFileName;

		if (strClient.indexOf("MSIE 5.5") > -1) {
		    response.setHeader("Content-Disposition", "filename=" + fileName + ";");
		} else {
		    response.setContentType("application/vnd.ms-excel");
		    response.setHeader("Content-Disposition", "attachment; filename=" + fileName + ";");
		}
		
		//워크북 생성
		XSSFWorkbook workbook = new XSSFWorkbook();
		//워크시트 생성
		XSSFSheet sheet = workbook.createSheet("MEMBER_LIST");
		//행 생성
		XSSFRow row = sheet.createRow(0);
		//셀 생성
		XSSFCell cell = null;

		// 스타일 설정
        CellStyle style = workbook.createCellStyle();
        // 폰트 설정
        XSSFFont font = workbook.createFont();
        font.setFontName("맑은 고딕");                  // 폰트 이름
        font.setFontHeightInPoints((short) 12);		//폰트 크기
        font.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);	    // 볼드체
        font.setColor(IndexedColors.DARK_RED.getIndex());    // 폰트 컬러
        style.setFont(font);
        
        // 헤더 정보 구성
        sheet.setColumnWidth(0, 30*256);		//셀 넓이
        sheet.setColumnWidth(1, 10*256);
        sheet.setColumnWidth(2, 15*256);
        sheet.setColumnWidth(3, 20*256);


        cell = row.createCell(0);
        cell.setCellValue("아이디");
        cell.setCellStyle(style);
        
        cell = row.createCell(1);
        cell.setCellValue("이름");
        cell.setCellStyle(style);
        
        cell = row.createCell(2);
        cell.setCellValue("전화번호");
        cell.setCellStyle(style);
        
        cell = row.createCell(3);
        cell.setCellValue("가입일");
        cell.setCellStyle(style);

        // 리스트의 size 만큼 row를 생성
        MemberVO vo;
        for(int rowIdx=0; rowIdx < list.size(); rowIdx++) {
            vo = list.get(rowIdx);
            
            // 행 생성
            row = sheet.createRow(rowIdx+1);
            
            cell = row.createCell(0);
            cell.setCellValue(vo.getMemberId());
            
            cell = row.createCell(1);
            cell.setCellValue(vo.getName());
            
            cell = row.createCell(2);
            cell.setCellValue(vo.getTel());
            
            cell = row.createCell(3);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");		
            String regdate = sdf.format(vo.getRegdate());		//Timestamp를 String으로 변형
            cell.setCellValue(regdate);

        }

	}
}
