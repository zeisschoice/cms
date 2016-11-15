package com.zeiss.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.zeiss.entity.Tenant;
import com.zeiss.mapper.TenantMapper;
import com.zeiss.service.ITenantService;

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
	
}
