package com.zeiss.cms.task;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Component;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.zeiss.cms.model.ProjectRegHead;
import com.zeiss.cms.service.IProjectRegHeadService;

@Component
public class ProjectRemind {
	
	protected Logger logger = LogManager.getLogger(getClass());
	
	private IProjectRegHeadService iProjectRegHeadService;
	
	
	public void sendMsg2PrjCharge(){
		
		 EntityWrapper<ProjectRegHead> ew = new EntityWrapper<ProjectRegHead>();
		 
		// ew.
		 
		//iProjectRegHeadService.selectList(wrapper)
	}

}
