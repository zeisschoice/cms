package com.zeiss.cms.model.vo;

import com.zeiss.cms.model.Cost;


public class CostVo extends Cost {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6461827573610589698L;
	
	private String phone;
	private String tenantName;
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTenantName() {
		return tenantName;
	}
	public void setTenantName(String tenantName) {
		this.tenantName = tenantName;
	}
	
	
}
