package com.ss.star.smember.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ss.star.smember.model.SMemberDAO;
 
@Component
public class Scheduler {
    Logger logger = Logger.getLogger(this.getClass());
 
    @Autowired SMemberDAO sMemberDao;
    
    /*매월 1일 0시 30분 명예의전당 입력*/
    @Scheduled(cron="5 * * * * *")
    public void HofScheduler() {
    	int cnt = sMemberDao.autoAuthority();
    	if(cnt>0) {
    		System.out.println("멤버십 권한 변경 cnt: "+cnt);
    	}
    	
    }
    
}
