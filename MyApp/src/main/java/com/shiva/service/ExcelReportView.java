package com.shiva.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.shiva.model.Protocol;

import org.springframework.web.servlet.view.document.AbstractXlsView;

@SuppressWarnings("unused")
public class ExcelReportView extends AbstractXlsView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception 
	{
		//response.setHeader("Content-Disposition", "attachment;<span id="IL_AD8" class="IL_AD">filename</span>=\"student.xls\"");
		response.setContentType( "application/ms-excel" );
        response.setHeader( "Content-disposition", "attachment; filename=ProtocolList.xls" ); 
		List<Protocol> protocolList=(List<Protocol>) model.get("protocolList");
		Sheet sheet=(Sheet) workbook.createSheet("Protocol Data");
		Row header=sheet.createRow(0);
		header.createCell(0).setCellValue("Protocol Id");
		header.createCell(1).setCellValue("Protocol Name");
		header.createCell(2).setCellValue("Descreption");
		int rowNum=1;
		for(Protocol protocol:protocolList)
		{
			Row row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(protocol.getId());
			row.createCell(1).setCellValue(protocol.getProtocolName());
			row.createCell(2).setCellValue(protocol.getDescription());
		}
	}

}
