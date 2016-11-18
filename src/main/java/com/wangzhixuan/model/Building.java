package com.wangzhixuan.model;

import java.io.Serializable;
import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;

/**
 * <p>
 * 
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public class Building implements Serializable {

	@TableField(exist = false)
    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.AUTO)
	@TableField(value="id")
	private Integer id;

	/**
	 * 
	 */
	@TableField(value="building_name")
	private String buildingName;

	/**
	 * 
	 */
	@TableField(value="building_address")
	private String buildingAddress;

	/**
	 * 
	 */
	@TableField(value="building_own")
	private String buildingOwn;

	/**
	 * 
	 */
	@TableField(value="own_phone")
	private BigDecimal ownPhone;

	/**
	 * 
	 */
	@TableField(value="building_manager")
	private String buildingManager;

	/**
	 * 
	 */
	@TableField(value="manager_phone")
	private BigDecimal managerPhone;

	/**
	 * 
	 */
	@TableField(value="room_count")
	private Integer roomCount;

	/**
	 * 
	 */
	private String remark;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBuildingName() {
		return buildingName;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}

	public String getBuildingAddress() {
		return buildingAddress;
	}

	public void setBuildingAddress(String buildingAddress) {
		this.buildingAddress = buildingAddress;
	}

	public String getBuildingOwn() {
		return buildingOwn;
	}

	public void setBuildingOwn(String buildingOwn) {
		this.buildingOwn = buildingOwn;
	}

	public BigDecimal getOwnPhone() {
		return ownPhone;
	}

	public void setOwnPhone(BigDecimal ownPhone) {
		this.ownPhone = ownPhone;
	}

	public String getBuildingManager() {
		return buildingManager;
	}

	public void setBuildingManager(String buildingManager) {
		this.buildingManager = buildingManager;
	}

	public BigDecimal getManagerPhone() {
		return managerPhone;
	}

	public void setManagerPhone(BigDecimal managerPhone) {
		this.managerPhone = managerPhone;
	}

	public Integer getRoomCount() {
		return roomCount;
	}

	public void setRoomCount(Integer roomCount) {
		this.roomCount = roomCount;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	

}
