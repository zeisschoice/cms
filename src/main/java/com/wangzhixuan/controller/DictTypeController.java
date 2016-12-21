package com.wangzhixuan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * <p>
 *   前端控制器
 * </p>
 *
 * @author zeiss
 * @since 2016-12-16
 */
@Controller
@RequestMapping("/dictType")
public class DictTypeController {
	
	
	
	@RequestMapping(value="/dict", method = RequestMethod.GET)
	public String dictTypePage(){
		
		return "admin/dict";
	}
	
}
