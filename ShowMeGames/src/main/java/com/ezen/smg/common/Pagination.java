package com.ezen.smg.common;

import java.util.ArrayList;
import java.util.List;

public class Pagination {

	private int pageNum;
	private int posiNum;
	private int firstPage;
	private int lastPage;
	private int currPage;
	private int totalNum;
	
	public Pagination(int totalNum) {
		this(totalNum, 10, 5);
	}
	
	public Pagination(int totalNum, int pageNum) {
		this(totalNum, pageNum, 5);
	}
	
	public Pagination(int totalNum, int pageNum, int posiNum) {
		firstPage = 1;
		lastPage = calLastPage(totalNum);
		this.pageNum = pageNum;
		this.posiNum = posiNum;
		this.totalNum = totalNum;
	}
	
	private int calLastPage(int totalNum) {
		return totalNum % pageNum == 0 ? totalNum / pageNum : totalNum / pageNum + 1;
	}
	
	public int getFirstPage() {
		return firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public int getCurrPage() {
		return currPage;
	}

	public int getTotalNum() {
		return totalNum;
	}
	
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public List<Integer> getPageList() {
		if(currPage > lastPage || currPage < 0) return null;
		
		List<Integer> list = new ArrayList<>();
		
		int currPosition = currPage % posiNum == 0 ? currPage / posiNum : currPage / posiNum + 1; 
		int firstBtn = (currPosition - 1) * posiNum + 1;
		int lastBtn = firstBtn + posiNum - 1;
		
		for(int i = firstBtn; i <= lastBtn && i <= lastPage; ++i) {
			list.add(i);
		}
		
		return list;
	}
	
}
