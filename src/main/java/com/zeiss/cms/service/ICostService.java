package com.zeiss.cms.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.zeiss.cms.commons.utils.PageInfo;
import com.zeiss.cms.model.Cost;
import com.zeiss.cms.model.MonCost;


/**
 * <p>
 * 服务类
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public interface ICostService extends IService<Cost> {
	
	void selectDataGrid(PageInfo pageInfo);
	
	List<MonCost> selectMonCost();
}
