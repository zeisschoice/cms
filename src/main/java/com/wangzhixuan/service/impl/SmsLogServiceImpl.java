package com.wangzhixuan.service.impl;


import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.wangzhixuan.mapper.SmsLogMapper;
import com.wangzhixuan.model.SmsLog;
import com.wangzhixuan.service.ISmsLogService;

/**
 * <p>
 *   服务实现类
 * </p>
 *
 * @author zeiss
 * @since 2016-12-10
 */
@Service
public class SmsLogServiceImpl extends SuperServiceImpl<SmsLogMapper, SmsLog> implements ISmsLogService {
	
}
