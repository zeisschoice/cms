package com.wangzhixuan.model;


import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.annotations.TableField;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author zeiss
 * @since 2016-12-14
 */
@TableName("dict_type")
public class DictType implements Serializable {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	private String dicttypeid;
	/**
	 * 
	 */
	private String dicttypename;
	/**
	 * 
	 */
	private String rank;
	/**
	 * 
	 */
	private Integer parentid;
	/**
	 * 
	 */
	private Integer seqno;
	/**
	 * 
	 */
	@TableField(value="business_id")
	private Integer businessId;
	/**
	 * 
	 */
	@TableField(value="catalog_id")
	private Integer catalogId;
	/**
	 * 
	 */
	private String dicttypecode;
	/**
	 * 
	 */
	private Integer dictlevel;
	/**
	 * 
	 */
	private String dictcat;


	public String getDicttypeid() {
		return dicttypeid;
	}

	public void setDicttypeid(String dicttypeid) {
		this.dicttypeid = dicttypeid;
	}

	public String getDicttypename() {
		return dicttypename;
	}

	public void setDicttypename(String dicttypename) {
		this.dicttypename = dicttypename;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public Integer getParentid() {
		return parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	public Integer getSeqno() {
		return seqno;
	}

	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}

	public Integer getBusinessId() {
		return businessId;
	}

	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
	}

	public Integer getCatalogId() {
		return catalogId;
	}

	public void setCatalogId(Integer catalogId) {
		this.catalogId = catalogId;
	}

	public String getDicttypecode() {
		return dicttypecode;
	}

	public void setDicttypecode(String dicttypecode) {
		this.dicttypecode = dicttypecode;
	}

	public Integer getDictlevel() {
		return dictlevel;
	}

	public void setDictlevel(Integer dictlevel) {
		this.dictlevel = dictlevel;
	}

	public String getDictcat() {
		return dictcat;
	}

	public void setDictcat(String dictcat) {
		this.dictcat = dictcat;
	}

	

}
