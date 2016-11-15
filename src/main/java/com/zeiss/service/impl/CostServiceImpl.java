package com.zeiss.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.zeiss.entity.Cost;
import com.zeiss.mapper.CostMapper;
import com.zeiss.service.ICostService;

/**
 * <p>
 * cost  服务实现类
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
@Service
public class CostServiceImpl extends SuperServiceImpl<CostMapper, Cost> implements ICostService {
	
}
