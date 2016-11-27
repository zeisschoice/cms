package com.wangzhixuan.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.mapper.TenantMapper;
import com.wangzhixuan.model.Tenant;
import com.wangzhixuan.service.ITenantService;


/**
 * <p>
 * tenant  服务实现类
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
@Service
public class TenantServiceImpl extends SuperServiceImpl<TenantMapper, Tenant> implements ITenantService {

	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		
	}
	
}
