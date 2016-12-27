package com.wangzhixuan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.model.DictEntry;
import com.wangzhixuan.service.IDictEntryService;

/**
 * <p>
 *   前端控制器
 * </p>
 *
 * @author zeiss
 * @since 2016-12-16
 */
@Controller
@RequestMapping("/dictEntry")
public class DictEntryController extends BaseController{
	
	@Autowired
	private IDictEntryService iDictEntryService;
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
    @ResponseBody
    public Object delete(String id) {
		//iDictType.deleteById(id);
		
		//DictEntry entity = new DictEntry();
		//entity.setDicttypeid(id);
		
		iDictEntryService.deleteById(id);
        return renderSuccess("删除成功！");
    }
}
