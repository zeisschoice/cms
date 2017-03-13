package com.zeiss.cms.service;

import com.baomidou.mybatisplus.service.IService;
import com.zeiss.cms.commons.utils.PageInfo;
import com.zeiss.cms.model.DictType;
import com.zeiss.cms.model.vo.DictTypeVo;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author zeiss
 * @since 2016-12-14
 */
public interface IDictTypeService extends IService<DictType> {
	
	 void selectDataGrid(PageInfo pageInfo);
	 
	 DictTypeVo selectDictData(String id);
}
