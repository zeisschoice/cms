package com.wangzhixuan.model;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;



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

	@TableField(value="tenant_id")
	private Integer tenantId;
	
	@TableField(value="is_pay")
	private Integer isPay;
	
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

	/**
	 * 当月水表数
	 */
	@TableField(value="current_water_num")
	private Double currentWaterNum;
	/**
	 * 上个月水表数
	 */
	@TableField(value="last_water_num")
	private Double lastWaterNum;
	/**
	 * 
	 */
	@TableField(value="current_gas_num")
	private Double currentGasNum;
	/**
	 * 
	 */
	@TableField(value="last_gas_num")
	private Double lastGasNum;
	/**
	 * 
	 */
	@TableField(value="current_electric_num")
	private Double currentElectricNum;
	/**
	 * 
	 */
	@TableField(value="last_electric_num")
	private Double lastElectricNum;

	/**
	 * 
	 */
	@TableField(value="water_unit_price")
	private Double waterUnitPrice;
	/**
	 * 
	 */
	@TableField(value="gas_unit_price")
	private Double gasUnitPrice;
	/**
	 * 
	 */
	@TableField(value="electric_unit_price")
	private Double electricUnitPrice;
	
	/**
	 * 管理费
	 */
	@TableField(value="manage_charge")
	private Double manageCharge;

	@TableField(value="mon_rent")
	private Double monRent; 

	private Double total;
	
	@TableField(value="send_count")
	private Integer sendCount;
	
	
	@TableField(value="start_date")
	private String startDate;
	/**
	 * 
	 */
	 
	@TableField(value="end_date")
	private String endDate;
	/**
	 * 
	 */
	
	@TableField(value="copy_date")
	private String copyDate;
	
	
	
	public Double getManageCharge() {
		return manageCharge;
	}

	public void setManageCharge(Double manageCharge) {
		this.manageCharge = manageCharge;
	}

	public Integer getSendCount() {
		return sendCount;
	}

	public void setSendCount(Integer sendCount) {
		this.sendCount = sendCount;
	}
	
	public Double getWaterUnitPrice() {
		return waterUnitPrice;
	}


	public void setWaterUnitPrice(Double waterUnitPrice) {
		this.waterUnitPrice = waterUnitPrice;
	}

	public Double getGasUnitPrice() {
		return gasUnitPrice;
	}

	public void setGasUnitPrice(Double gasUnitPrice) {
		this.gasUnitPrice = gasUnitPrice;
	}

	public Double getElectricUnitPrice() {
		return electricUnitPrice;
	}

	public void setElectricUnitPrice(Double electricUnitPrice) {
		this.electricUnitPrice = electricUnitPrice;
	}

	public Double getCurrentWaterNum() {
		return currentWaterNum;
	}

	public void setCurrentWaterNum(Double currentWaterNum) {
		this.currentWaterNum = currentWaterNum;
	}

	public Double getLastWaterNum() {
		return lastWaterNum;
	}

	public void setLastWaterNum(Double lastWaterNum) {
		this.lastWaterNum = lastWaterNum;
	}

	public Double getCurrentGasNum() {
		return currentGasNum;
	}

	public void setCurrentGasNum(Double currentGasNum) {
		this.currentGasNum = currentGasNum;
	}

	public Double getLastGasNum() {
		return lastGasNum;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public void setLastGasNum(Double lastGasNum) {
		this.lastGasNum = lastGasNum;
	}

	public Double getCurrentElectricNum() {
		return currentElectricNum;
	}

	public void setCurrentElectricNum(Double currentElectricNum) {
		this.currentElectricNum = currentElectricNum;
	}

	public Double getLastElectricNum() {
		return lastElectricNum;
	}

	public void setLastElectricNum(Double lastElectricNum) {
		this.lastElectricNum = lastElectricNum;
	}

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

	public Double getMonRent() {
		return monRent;
	}

	public void setMonRent(Double monRent) {
		this.monRent = monRent;
	}

	public Integer getTenantId() {
		return tenantId;
	}

	public void setTenantId(Integer tenantId) {
		this.tenantId = tenantId;
	}

	public Integer getIsPay() {
		return isPay;
	}

	public void setIsPay(Integer isPay) {
		this.isPay = isPay;
	}

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

	public String getCopyDate() {
		return copyDate;
	}

	public void setCopyDate(String copyDate) {
		this.copyDate = copyDate;
	}
}
