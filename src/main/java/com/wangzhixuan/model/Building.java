package com.wangzhixuan.model;

import java.io.Serializable;

public class Building implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5418516341567518734L;
	
	private Integer buildingId;
	
	private String buidingName;
	
	private String buildingAddress;
	
	private String building_own;
	
	private String ownPhone;
	
	private String buildingManager;
	
	private String managerPhone;
	
	private int roomCount;
	
	public Integer getBuildingId() {
		return buildingId;
	}

	public void setBuildingId(Integer buildingId) {
		this.buildingId = buildingId;
	}

	public String getBuidingName() {
		return buidingName;
	}

	public void setBuidingName(String buidingName) {
		this.buidingName = buidingName;
	}

	public String getBuildingAddress() {
		return buildingAddress;
	}

	public void setBuildingAddress(String buildingAddress) {
		this.buildingAddress = buildingAddress;
	}

	public String getBuilding_own() {
		return building_own;
	}

	public void setBuilding_own(String building_own) {
		this.building_own = building_own;
	}

	public String getOwnPhone() {
		return ownPhone;
	}

	public void setOwnPhone(String ownPhone) {
		this.ownPhone = ownPhone;
	}

	public String getBuildingManager() {
		return buildingManager;
	}

	public void setBuildingManager(String buildingManager) {
		this.buildingManager = buildingManager;
	}

	public String getManagerPhone() {
		return managerPhone;
	}

	public void setManagerPhone(String managerPhone) {
		this.managerPhone = managerPhone;
	}

	public int getRoomCount() {
		return roomCount;
	}

	public void setRoomCount(int roomCount) {
		this.roomCount = roomCount;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	private String remark;
	

}
