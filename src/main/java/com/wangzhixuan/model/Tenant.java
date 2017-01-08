package com.wangzhixuan.model;

import java.io.Serializable;
import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;

/**
 * <p>
 * tenant
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public class Tenant implements Serializable {

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
	@TableField(value="tenant_name")
	private String tenantName;

	/**
	 * 
	 */
	@TableField(value="room_id")
	private Integer roomId;

	/**
	 * 
	 */
	private String sex;

	/**
	 * 
	 */
	private BigDecimal tel;

	/**
	 * 
	 */
	@TableField(value="identity_card")
	private String identityCard;

	

	/**
	 * 
	 */
	private String remark;


	@TableField(value="is_del")
	private Integer isDel;
	
	@TableField(value="start_date")
	private String startDate;
	/**
	 * 
	 */
	 
	@TableField(value="end_date")
	private String endDate;

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTenantName() {
		return tenantName;
	}

	public void setTenantName(String tenantName) {
		this.tenantName = tenantName;
	}

	public Integer getRoomId() {
		return roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public BigDecimal getTel() {
		return tel;
	}

	public void setTel(BigDecimal tel) {
		this.tel = tel;
	}

	public String getIdentityCard() {
		return identityCard;
	}

	public void setIdentityCard(String identityCard) {
		this.identityCard = identityCard;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getIsDel() {
		return isDel;
	}

	public void setIsDel(Integer isDel) {
		this.isDel = isDel;
	}
}
