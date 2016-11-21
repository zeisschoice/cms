package com.wangzhixuan.service;

import com.baomidou.framework.service.ISuperService;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.model.Room;


/**
 * <p>
 * 服务类
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public interface IRoomService extends ISuperService<Room> {
	
	void selectDataGrid(PageInfo pageInfo);
}
