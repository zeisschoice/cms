package com.zeiss.cms.service;

import com.baomidou.mybatisplus.service.IService;
import com.zeiss.cms.commons.utils.PageInfo;
import com.zeiss.cms.model.Tenant;


/**
 * <p>
 * 服务类
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public interface ITenantService extends IService<Tenant> {
		
	void selectDataGrid(PageInfo pageInfo);
	
	Tenant selectTenantByRoomId(Long id);
}
