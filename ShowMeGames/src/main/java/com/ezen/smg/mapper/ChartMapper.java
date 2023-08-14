package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.SalesDTO;

public interface ChartMapper {
	
	List<SalesDTO> getWeeklySales();
	
	List<SalesDTO> getMonthSales();
	
	List<SalesDTO> getYearSales(@Param("year") int year);
}
