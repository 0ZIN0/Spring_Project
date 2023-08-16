package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.chart.GenderDTO;
import com.ezen.smg.dto.chart.GenreDTO;
import com.ezen.smg.dto.chart.SalesDTO;

public interface ChartMapper {
	
	List<SalesDTO> getWeeklySales();
	
	List<SalesDTO> getMonthSales(@Param("year") int year);
	
	List<SalesDTO> getYearsSales();
	
	List<GenderDTO> getGenderRate();
	
	List<GenreDTO> getGenreRate();
	
	List<GenreDTO> getEditorSales();
}
