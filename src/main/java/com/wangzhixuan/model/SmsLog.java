package com.wangzhixuan.model;


import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author zeiss
 * @since 2016-12-10
 */
@TableName("sms_log")
public class SmsLog implements Serializable {
	@TableField(exist = false)
    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
    @TableId(type = IdType.AUTO)
	@TableField(value="id")
	private Long id;
	/**
	 * 登录名称
	 */
	@TableField(value="login_name")
	private String loginName;
	/**
	 * 角色
	 */
	@TableField(value="login_role")
	private String loginRole;
	/**
	 * 
	 */
	@TableField(value="is_success")
	private String isSuccess;
	/**
	 * 
	 */
	@TableField(value="time_consuming")
	private Long timeConsuming;
	/**
	 * 发送参数
	 */
	private String params;
	/**
	 * 
	 */
	@TableField(value="resp_body")
	private String respBody;
	/**
	 * 
	 */
	@TableField(value="create_date")
	private Date createDate;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginRole() {
		return loginRole;
	}

	public void setLoginRole(String loginRole) {
		this.loginRole = loginRole;
	}

	public String getIsSuccess() {
		return isSuccess;
	}

	public void setIsSuccess(String isSuccess) {
		this.isSuccess = isSuccess;
	}

	public Long getTimeConsuming() {
		return timeConsuming;
	}

	public void setTimeConsuming(Long timeConsuming) {
		this.timeConsuming = timeConsuming;
	}

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	public String getRespBody() {
		return respBody;
	}

	public void setRespBody(String respBody) {
		this.respBody = respBody;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	protected Serializable getPrimaryKey() {
		return this.id;
	}

}
