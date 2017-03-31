package com.zeiss.cms.model.vo;

import java.util.List;

import com.zeiss.cms.model.ProjectFinanceItem;
import com.zeiss.cms.model.ProjectRegHead;
import com.zeiss.cms.model.ProjectRegItem;

public class ProjectRegVo {
	
	private ProjectRegHead projectRegHead;
	
	private List<ProjectFinanceItem> projectFinanceItems;
	
	private List<ProjectRegItem> projectRegItems;

	
	
	public ProjectRegHead getProjectRegHead() {
		return projectRegHead;
	}

	public void setProjectRegHead(ProjectRegHead projectRegHead) {
		this.projectRegHead = projectRegHead;
	}

	public List<ProjectFinanceItem> getProjectFinanceItems() {
		return projectFinanceItems;
	}

	public void setProjectFinanceItems(List<ProjectFinanceItem> projectFinanceItems) {
		this.projectFinanceItems = projectFinanceItems;
	}

	public List<ProjectRegItem> getProjectRegItems() {
		return projectRegItems;
	}

	public void setProjectRegItems(List<ProjectRegItem> projectRegItems) {
		this.projectRegItems = projectRegItems;
	}
	
	
	

}
