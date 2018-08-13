package com.ss.star.category.model;

import java.util.List;

public interface CategoryDAO {
	public List<CategoryVO> selectCategoryAll();
	public String getCtgName(int no);
	public int getCtgNum(String name);
	
}
