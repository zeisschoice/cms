package com.wangzhixuan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.utils.SMSUtils;
import com.wangzhixuan.model.Cost;
import com.wangzhixuan.model.SMSConfig;

@Controller
@RequestMapping("/sms")
public class SMSController extends BaseController {

	@Autowired
	private SMSConfig smsConifg;
	
	@RequestMapping(value = "/send", method = RequestMethod.GET)
    @ResponseBody
	public Object smsCurrentMonCost(Cost cost){
		
		 
		SMSUtils.sendMsg(smsConifg.getUrl(), smsConifg.getAppKey(), smsConifg.getSecret(), "交租短信", "{name:'张三',room:'108',cost:'100'}", "13450761833", "SMS_25620786");
		
		 return renderSuccess("发送成功！");
	}
	
	
}
