package com.wangzhixuan.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.wangzhixuan.mapper.RoomMapper;
import com.wangzhixuan.model.Room;
import com.wangzhixuan.service.IRoomService;


/**
 * <p>
 *   服务实现类
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
@Service
public class RoomServiceImpl extends SuperServiceImpl<RoomMapper, Room> implements IRoomService {
	
}
