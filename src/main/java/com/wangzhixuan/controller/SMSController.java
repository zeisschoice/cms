package com.wangzhixuan.controller;

import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	public Object smsCurrentMonCost(@RequestParam("total") String total,@RequestParam("phone") String phone,@RequestParam("tenantName") String tenantName,@RequestParam("roomName") String roomName) throws JsonProcessingException{
		
		
		Result rs  = new Result();
		SmsLog smslog = new SmsLog();
		ObjectMapper mapper = new ObjectMapper();
		
		if(total==null || phone==null || tenantName==null ||roomName== null){
			
			rs.setMsg("短信参数不全！");
			rs.setSuccess(false);
			return rs;
		}
		
		
		Long start = System.currentTimeMillis();
		 
		HashMap<String, Object> map = new HashMap();
		
		map.put("name", tenantName);
		map.put("room", roomName);
		map.put("cost", total);
		
		
		
		String params = mapper.writeValueAsString(map);
		
		System.out.println("params: "+params + "phone: " + phone + "tenantName:"+tenantName);
		
        rs = SMSUtils.sendMsg(smsConifg.getUrl(), smsConifg.getAppKey(), smsConifg.getSecret(), "交租短信", params, phone, "SMS_25620786");
		
	
		
		 
			
		 if(rs.isSuccess()){
			 AlibabaAliqinFcSmsNumSendResponse rsp  = (AlibabaAliqinFcSmsNumSendResponse) rs.getObj();
			 
			 smslog.setIsSuccess("成功");	
			 smslog.setParams(rsp.getParams().toString());
			 smslog.setRespBody(rsp.getBody());
		 }else{
			 smslog.setIsSuccess("失败");	
			// smslog.setParams(rs.getObj().toString());
			 smslog.setRespBody(rs.getObj().toString());
		 }
		 
		 Long end = System.currentTimeMillis(); 
		 smslog.setTimeConsuming(end - start);
		 smslog.setLoginName(getCurrentUser().getLoginName());
		 smslog.setLoginRole(getCurrentUser().getUserType().toString());
		 smslog.setCreateDate(new Date());
		 int i = smsLogmapper.insert(smslog) ;
		 
		 rs.setObj(null);
		 return rs;
	}
	
	
}
