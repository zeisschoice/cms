package com.wangzhixuan.service;

import com.baomidou.framework.service.ISuperService;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.model.DictType;
import com.wangzhixuan.model.vo.DictTypeVo;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author zeiss
 * @since 2016-12-14
 */
public interface IDictTypeService extends ISuperService<DictType> {
	
	 void selectDataGrid(PageInfo pageInfo);
	 
	 DictTypeVo selectDictData(String id);
}
