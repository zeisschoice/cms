package com.wangzhixuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.baomidou.mybatisplus.plugins.Page;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.mapper.TenantMapper;
import com.wangzhixuan.model.Room;
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

	@Autowired
	private TenantMapper tenantMapper;
	
	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		
		Page<Tenant> page = new Page<Tenant>(pageInfo.getNowpage(), pageInfo.getSize());
		   
	    List<Tenant> list = tenantMapper.selectTenantPage(page, pageInfo.getCondition());
	   
	    pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}

	@Override
	public Tenant selectTenantByRoomId(Long id) {
		// TODO Auto-generated method stub
		Tenant tenant = tenantMapper.selectTenantByRoomId(id);
		return tenant;
	}
	
}
