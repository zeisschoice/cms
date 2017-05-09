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
    private String projectType;
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
    
    @TableField(value="background_info")
    private String backgroundInfo;

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
    private String contactTel;
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
    
    @TableField(value="contract_singer")
    private String contractSigner;
    
   

	@TableField(value="business_type")
    private String businessType;
    /**
     * 
     */
    @TableField(value="aprove_department")
    private String aproveDepartment;
    /**
     * 
     */
    @TableField(value="is_contract")
    private String isContract;
    /**
     * 
     */
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

    public String getProjectType() {
        return projectType;
    }

    public void setProjectType(String projectType) {
        this.projectType = projectType;
    }

    public String getBackgroundInfo() {
		return backgroundInfo;
	}

	public void setBackgroundInfo(String backgroundInfo) {
		this.backgroundInfo = backgroundInfo;
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

    public String getContactTel() {
        return contactTel;
    }

    public void setContactTel(String contactTel) {
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

    public String getBusinessType() {
        return businessType;
    }

    public void setBusinessType(String businessType) {
        this.businessType = businessType;
    }

    public String getAproveDepartment() {
        return aproveDepartment;
    }

    public void setAproveDepartment(String aproveDepartment) {
        this.aproveDepartment = aproveDepartment;
    }

    public String getIsContract() {
        return isContract;
    }

    public void setIsContract(String isContract) {
        this.isContract = isContract;
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

    
    public String getContractSigner() {
		return contractSigner;
	}

	public void setContractSigner(String contractSigner) {
		this.contractSigner = contractSigner;
	}
	
	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return null;
	}

}
