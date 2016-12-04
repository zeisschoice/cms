package com.wangzhixuan.service;

import com.baomidou.framework.service.ISuperService;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.model.Tenant;


/**
 * <p>
 * 服务类
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public interface ITenantService extends ISuperService<Tenant> {
		
	void selectDataGrid(PageInfo pageInfo);
	
	Tenant selectTenantByRoomId(Long id);
}
