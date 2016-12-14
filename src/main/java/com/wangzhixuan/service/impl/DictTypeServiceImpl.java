package com.wangzhixuan.service.impl;


import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.wangzhixuan.mapper.DictTypeMapper;
import com.wangzhixuan.model.DictType;
import com.wangzhixuan.service.IDictTypeService;

/**
 * <p>
 *   服务实现类
 * </p>
 *
 * @author zeiss
 * @since 2016-12-14
 */
@Service
public class DictTypeServiceImpl extends SuperServiceImpl<DictTypeMapper, DictType> implements IDictTypeService {
	
}
