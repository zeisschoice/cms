package com.zeiss.entity;

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

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	@TableField(value="room_id")
	private Integer roomId;

	/**
	 * 
	 */
	@TableField(value="room_name")
	private String roomName;

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



	public Integer getRoomId() {
		return roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
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
