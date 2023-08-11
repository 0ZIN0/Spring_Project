package com.ezen.smg.mapper;

import java.util.List;

import com.ezen.smg.dto.SalesDTO;

public interface ChartMapper {
	
	List<SalesDTO> getWeeklySales();
}
