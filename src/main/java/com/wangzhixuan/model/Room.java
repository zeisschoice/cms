package com.wangzhixuan.model;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public class Room implements Serializable {

	@TableField(exist = false)
    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.AUTO)
	@TableField(value="id")
	private Integer id;

	
	@TableField(value="building_id")
	private Integer buildingId;
	/**
	 * 
	 */
	@TableField(value="room_name")
	private String roomName;

	public Integer getBuildingId() {
		return buildingId;
	}

	public void setBuildingId(Integer buildingId) {
		this.buildingId = buildingId;
	}

	/**
	 * 
	 */
	private Integer type;

	/**
	 * 
	 */
	@TableField(value="mon_rent")
	private Double monRent;

	/**
	 * 
	 */
	private Integer status;

	/**
	 * 
	 */
	@TableField(value="begin_date")
	private Date beginDate;

	/**
	 * 
	 */
	@TableField(value="end_date")
	private Date endDate;

	/**
	 * 
	 */
	private Integer liver;

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

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Double getMonRent() {
		return monRent;
	}

	public void setMonRent(Double monRent) {
		this.monRent = monRent;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Integer getLiver() {
		return liver;
	}

	public void setLiver(Integer liver) {
		this.liver = liver;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
