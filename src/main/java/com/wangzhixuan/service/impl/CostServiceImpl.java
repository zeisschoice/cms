package com.wangzhixuan.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.wangzhixuan.mapper.CostMapper;
import com.wangzhixuan.model.Cost;
import com.wangzhixuan.service.ICostService;


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
