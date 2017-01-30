package com.zeiss.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.zeiss.cms.commons.utils.PageInfo;
import com.zeiss.cms.mapper.TenantMapper;
import com.zeiss.cms.model.Room;
import com.zeiss.cms.model.Tenant;
import com.zeiss.cms.service.ITenantService;


/**
 * <p>
 * tenant  服务实现类
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
@Service
public class TenantServiceImpl extends ServiceImpl<TenantMapper, Tenant> implements ITenantService {

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
