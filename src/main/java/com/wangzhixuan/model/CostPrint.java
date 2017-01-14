package com.wangzhixuan.model;

public class CostPrint {

	private String address;  //地址
	private String roomNum; //房间号
	private String monRent;//月租
	private String startDate;//计费开始日期
	private String endDate; //计费结束日期
	private String copyDate;//抄表日期
    private String waterNum;//水表数
	private String crMonWaterNum;//当月用水数
	private String elecNum;
    
	private String lsMonWaterNum ;
	private String crMonElecNum ;
	private String lsMonElecNum ;
	private String waterCount ;
	private String elecCount ;
	private String  perWaterRMB ; //每吨单价
	private String  perElecRMB ;
	private String  managerCount ;
	private String  sumCN ;
	private String  sum ;
	private String  tvCount ;
	private String other;
	private String writeBiller;
	private String internetCount;
	
	public String getCurrentGasNum() {
		return currentGasNum;
	}

	public String getMonRent() {
		return monRent;
	}

	public void setMonRent(String monRent) {
		this.monRent = monRent;
	}

	public void setCurrentGasNum(String currentGasNum) {
		this.currentGasNum = currentGasNum;
	}

	public String getLastGasNum() {
		return lastGasNum;
	}

	public void setLastGasNum(String lastGasNum) {
		this.lastGasNum = lastGasNum;
	}

	public String getGasUnitPrice() {
		return gasUnitPrice;
	}

	public void setGasUnitPrice(String gasUnitPrice) {
		this.gasUnitPrice = gasUnitPrice;
	}

	private String gasCharge;
	private String currentGasNum;
	private String lastGasNum;
	private String gasUnitPrice;
	
	public String getGasCharge() {
		return gasCharge;
	}

	public void setGasCharge(String gasCharge) {
		this.gasCharge = gasCharge;
	}

	public String getInternetCount() {
		return internetCount;
	}

	public void setInternetCount(String internetCount) {
		this.internetCount = internetCount;
	}

	public String getWriteBiller() {
		return writeBiller;
	}

	public void setWriteBiller(String writeBiller) {
		this.writeBiller = writeBiller;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	
	
	
	public String getLsMonWaterNum() {
		return lsMonWaterNum;
	}

	public void setLsMonWaterNum(String lsMonWaterNum) {
		this.lsMonWaterNum = lsMonWaterNum;
	}

	public String getCrMonElecNum() {
		return crMonElecNum;
	}

	public void setCrMonElecNum(String crMonElecNum) {
		this.crMonElecNum = crMonElecNum;
	}

	public String getLsMonElecNum() {
		return lsMonElecNum;
	}

	public void setLsMonElecNum(String lsMonElecNum) {
		this.lsMonElecNum = lsMonElecNum;
	}

	public String getWaterCount() {
		return waterCount;
	}

	public void setWaterCount(String waterCount) {
		this.waterCount = waterCount;
	}

	public String getElecCount() {
		return elecCount;
	}

	public void setElecCount(String elecCount) {
		this.elecCount = elecCount;
	}

	public String getPerWaterRMB() {
		return perWaterRMB;
	}

	public void setPerWaterRMB(String perWaterRMB) {
		this.perWaterRMB = perWaterRMB;
	}

	public String getPerElecRMB() {
		return perElecRMB;
	}

	public void setPerElecRMB(String perElecRMB) {
		this.perElecRMB = perElecRMB;
	}

	public String getManagerCount() {
		return managerCount;
	}

	public void setManagerCount(String managerCount) {
		this.managerCount = managerCount;
	}

	public String getSumCN() {
		return sumCN;
	}

	public void setSumCN(String sumCN) {
		this.sumCN = sumCN;
	}

	public String getSum() {
		return sum;
	}

	public void setSum(String sum) {
		this.sum = sum;
	}

	public String getTvCount() {
		return tvCount;
	}

	public void setTvCount(String tvCount) {
		this.tvCount = tvCount;
	}

	public String getElecNum() {
		return elecNum;
	}

	public void setElecNum(String elecNum) {
		this.elecNum = elecNum;
	}

	public String getCrMonWaterNum() {
		return crMonWaterNum;
	}

	public void setCrMonWaterNum(String crMonWaterNum) {
		this.crMonWaterNum = crMonWaterNum;
	}

	public String getAddress() {
		return address;
	}

	public String getWaterNum() {
		return waterNum;
	}

	public void setWaterNum(String waterNum) {
		this.waterNum = waterNum;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
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
