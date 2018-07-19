package com.ss.star.request.model;

import java.util.List;
import java.util.Map;

public interface RequestService {

	public int insertRequest(RequestVO vo, List<Map<String, Object>> fileList);
	
}
