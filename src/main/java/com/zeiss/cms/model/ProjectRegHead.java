package com.zeiss.cms.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
/**
 * <p>
 * 
 * </p>
 *
 * @author zeiss
 * @since 2017-03-08
 */
@TableName("project_reg_head")
public class ProjectRegHead extends Model<ProjectRegHead> {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableId(value="project_id", type = IdType.AUTO)
    @TableField(value="project_id")
    private Long projectId;
    /**
     * 
     */
    @TableField(value="project_no")
    private String projectNo;
    /**
     * 
     */
    @TableField(value="project_name")
    private String projectName;
    /**
     * 
     */
    @TableField(value="project_type")
    private Integer projectType;
    /**
     * 
     */
    @TableField(value="build_org")
    private String buildOrg;
    /**
     * 
     */
    @TableField(value="contact_person")
    private String contactPerson;
    /**
     * 
     */
    @TableField(value="contacts_address")
    private String contactsAddress;
    /**
     * 
     */
    @TableField(value="contact_call")
    private String contactCall;
    /**
     * 
     */
    @TableField(value="contact_tel")
    private java.math.BigDecimal contactTel;
    /**
     * 
     */
    @TableField(value="contact_fax")
    private String contactFax;
    /**
     * 
     */
    @TableField(value="work_detail")
    private String workDetail;
    /**
     * 
     */
    @TableField(value="business_type")
    private Integer businessType;
    /**
     * 
     */
    @TableField(value="aprove_department")
    private String aproveDepartment;
    /**
     * 
     */
    @TableField(value="is_contract")
    private Integer isContract;
    /**
     * 
     */
    @TableField(value="start_date")
    private java.util.Date startDate;
    /**
     * 
     */
    @TableField(value="end_date")
    private java.util.Date endDate;
    /**
     * 
     */
    @TableField(value="project_punish_rate")
    private Double projectPunishRate;
    /**
     * 
     */
    @TableField(value="punish_reason")
    private String punishReason;
    /**
     * 
     */
    @TableField(value="business_room")
    private String businessRoom;
    /**
     * 
     */
    private String manager;
    /**
     * 
     */
    @TableField(value="record_room")
    private String recordRoom;
    /**
     * 
     */
    @TableField(value="branche_dean")
    private String brancheDean;
    /**
     * 
     */
    @TableField(value="fill_person")
    private String fillPerson;
    /**
     * 
     */
    @TableField(value="project_group_leader")
    private String projectGroupLeader;
    /**
     * 
     */
    @TableField(value="department_charger")
    private String departmentCharger;
    /**
     * 
     */
    @TableField(value="charge_dean")
    private String chargeDean;


    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public String getProjectNo() {
        return projectNo;
    }

    public void setProjectNo(String projectNo) {
        this.projectNo = projectNo;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public Integer getProjectType() {
        return projectType;
    }

    public void setProjectType(Integer projectType) {
        this.projectType = projectType;
    }

    public String getBuildOrg() {
        return buildOrg;
    }

    public void setBuildOrg(String buildOrg) {
        this.buildOrg = buildOrg;
    }

    public String getContactPerson() {
        return contactPerson;
    }

    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    public String getContactsAddress() {
        return contactsAddress;
    }

    public void setContactsAddress(String contactsAddress) {
        this.contactsAddress = contactsAddress;
    }

    public String getContactCall() {
        return contactCall;
    }

    public void setContactCall(String contactCall) {
        this.contactCall = contactCall;
    }

    public java.math.BigDecimal getContactTel() {
        return contactTel;
    }

    public void setContactTel(java.math.BigDecimal contactTel) {
        this.contactTel = contactTel;
    }

    public String getContactFax() {
        return contactFax;
    }

    public void setContactFax(String contactFax) {
        this.contactFax = contactFax;
    }

    public String getWorkDetail() {
        return workDetail;
    }

    public void setWorkDetail(String workDetail) {
        this.workDetail = workDetail;
    }

    public Integer getBusinessType() {
        return businessType;
    }

    public void setBusinessType(Integer businessType) {
        this.businessType = businessType;
    }

    public String getAproveDepartment() {
        return aproveDepartment;
    }

    public void setAproveDepartment(String aproveDepartment) {
        this.aproveDepartment = aproveDepartment;
    }

    public Integer getIsContract() {
        return isContract;
    }

    public void setIsContract(Integer isContract) {
        this.isContract = isContract;
    }

    public java.util.Date getStartDate() {
        return startDate;
    }

    public void setStartDate(java.util.Date startDate) {
        this.startDate = startDate;
    }

    public java.util.Date getEndDate() {
        return endDate;
    }

    public void setEndDate(java.util.Date endDate) {
        this.endDate = endDate;
    }

    public Double getProjectPunishRate() {
        return projectPunishRate;
    }

    public void setProjectPunishRate(Double projectPunishRate) {
        this.projectPunishRate = projectPunishRate;
    }

    public String getPunishReason() {
        return punishReason;
    }

    public void setPunishReason(String punishReason) {
        this.punishReason = punishReason;
    }

    public String getBusinessRoom() {
        return businessRoom;
    }

    public void setBusinessRoom(String businessRoom) {
        this.businessRoom = businessRoom;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getRecordRoom() {
        return recordRoom;
    }

    public void setRecordRoom(String recordRoom) {
        this.recordRoom = recordRoom;
    }

    public String getBrancheDean() {
        return brancheDean;
    }

    public void setBrancheDean(String brancheDean) {
        this.brancheDean = brancheDean;
    }

    public String getFillPerson() {
        return fillPerson;
    }

    public void setFillPerson(String fillPerson) {
        this.fillPerson = fillPerson;
    }

    public String getProjectGroupLeader() {
        return projectGroupLeader;
    }

    public void setProjectGroupLeader(String projectGroupLeader) {
        this.projectGroupLeader = projectGroupLeader;
    }

    public String getDepartmentCharger() {
        return departmentCharger;
    }

    public void setDepartmentCharger(String departmentCharger) {
        this.departmentCharger = departmentCharger;
    }

    public String getChargeDean() {
        return chargeDean;
    }

    public void setChargeDean(String chargeDean) {
        this.chargeDean = chargeDean;
    }

	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return null;
	}

}
