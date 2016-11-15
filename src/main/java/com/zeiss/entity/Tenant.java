package com.zeiss.entity;

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

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	@TableField(value="tenant_id")
	private Integer tenantId;

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
	private BigDecimal identityCard;

	/**
	 * 
	 */
	private String remark;



	public Integer getTenantId() {
		return tenantId;
	}

	public void setTenantId(Integer tenantId) {
		this.tenantId = tenantId;
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

	public BigDecimal getIdentityCard() {
		return identityCard;
	}

	public void setIdentityCard(BigDecimal identityCard) {
		this.identityCard = identityCard;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
