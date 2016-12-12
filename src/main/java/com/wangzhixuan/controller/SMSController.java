package com.wangzhixuan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;
import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.result.Result;
import com.wangzhixuan.commons.utils.SMSUtils;
import com.wangzhixuan.mapper.SmsLogMapper;
import com.wangzhixuan.model.Cost;
import com.wangzhixuan.model.SMSConfig;
import com.wangzhixuan.model.SmsLog;

@Controller
@RequestMapping("/sms")
public class SMSController extends BaseController {

	@Autowired
	private SMSConfig smsConifg;
	
	@Autowired
	private SmsLogMapper smsLogmapper;
	
	@RequestMapping(value = "/send", method = RequestMethod.POST)
    @ResponseBody
	public Object smsCurrentMonCost(Cost cost,String phone){
		
		Long start = System.currentTimeMillis();
		 
		 Result rs = SMSUtils.sendMsg(smsConifg.getUrl(), smsConifg.getAppKey(), smsConifg.getSecret(), "交租短信", "{name:'张三',room:'108',cost:'100'}", "13450761833", "SMS_25620786");
		
		Long end = System.currentTimeMillis(); 
		 
		 AlibabaAliqinFcSmsNumSendResponse rsp  = (AlibabaAliqinFcSmsNumSendResponse) rs.getObj();
		 
		 SmsLog smslog = new SmsLog();		 
		 smslog.setIsSuccess(rsp.isSuccess()?"成功":"失败");	
		 smslog.setParams(rsp.getParams().toString());
		 smslog.setRespBody(rsp.getBody());
		 smslog.setTimeConsuming(start - end);
		 smslog.setLoginName(getCurrentUser().getLoginName());
		 smslog.setLoginRole(getCurrentUser().getUserType().toString());
		 smsLogmapper.insert(smslog) ;
		 
		 
		 rs.setObj(null);
		 return rs;
	}
	
	
}
