package com.wangzhixuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.baomidou.mybatisplus.plugins.Page;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.mapper.RoomMapper;
import com.wangzhixuan.model.Building;
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

	@Autowired
	private RoomMapper roomMapper;
	
	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		
		Page<Room> page = new Page<Room>(pageInfo.getNowpage(), pageInfo.getSize());
		   
	    List<Room> list = roomMapper.selectRoomPage(page, pageInfo.getCondition());
	   
	    pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}
	
}
