package com.wangzhixuan.model;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import java.io.Serializable;

/**
 * <p>
 * cost
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public class Cost implements Serializable {

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
	@TableField(value="room_id")
	private Integer roomId;

	/**
	 * 
	 */
	@TableField(value="electric_charge")
	private Double electricCharge;

	/**
	 * 
	 */
	@TableField(value="water_charge")
	private Double waterCharge;

	/**
	 * 
	 */
	@TableField(value="internet_charge")
	private Double internetCharge;

	/**
	 * 
	 */
	@TableField(value="tv_charge")
	private Double tvCharge;

	/**
	 * 
	 */
	@TableField(value="gas_charge")
	private Double gasCharge;

	/**
	 * 
	 */
	@TableField(value="equally_charge")
	private Double equallyCharge;

	/**
	 * 
	 */
	@TableField(value="other_charge")
	private Double otherCharge;

	/**
	 * 
	 */
	private Integer year;

	/**
	 * 
	 */
	private Integer month;

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

	public Integer getRoomId() {
		return roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	public Double getElectricCharge() {
		return electricCharge;
	}

	public void setElectricCharge(Double electricCharge) {
		this.electricCharge = electricCharge;
	}

	public Double getWaterCharge() {
		return waterCharge;
	}

	public void setWaterCharge(Double waterCharge) {
		this.waterCharge = waterCharge;
	}

	public Double getInternetCharge() {
		return internetCharge;
	}

	public void setInternetCharge(Double internetCharge) {
		this.internetCharge = internetCharge;
	}

	public Double getTvCharge() {
		return tvCharge;
	}

	public void setTvCharge(Double tvCharge) {
		this.tvCharge = tvCharge;
	}

	public Double getGasCharge() {
		return gasCharge;
	}

	public void setGasCharge(Double gasCharge) {
		this.gasCharge = gasCharge;
	}

	public Double getEquallyCharge() {
		return equallyCharge;
	}

	public void setEquallyCharge(Double equallyCharge) {
		this.equallyCharge = equallyCharge;
	}

	public Double getOtherCharge() {
		return otherCharge;
	}

	public void setOtherCharge(Double otherCharge) {
		this.otherCharge = otherCharge;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
