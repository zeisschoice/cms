package com.wangzhixuan.commons.utils;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;
import com.wangzhixuan.commons.result.Result;


public class SMSUtils {
	
	
	public Result sendMsg(String url ,String appKey,String secret,String smsSignName,String smsParaString,String recNum,String smstmp){
		
		Result result = new Result();
		
		TaobaoClient client = new DefaultTaobaoClient(url, appKey, secret);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
//		req.setExtend( "" );
//		req.setSmsType( "normal" );
//		req.setSmsFreeSignName( "交租短信" );
//		req.setSmsParamString( "{name:'张三',room:'108',cost:'100'}" );
//		req.setRecNum( "13450761833,15919064667" );
//		req.setSmsTemplateCode( "SMS_25620786" );
		
		req.setExtend( "" );
		req.setSmsType( "normal" );
		req.setSmsFreeSignName( smsSignName );
		req.setSmsParamString( smsParaString );
		req.setRecNum( recNum );
		req.setSmsTemplateCode( smstmp );
		AlibabaAliqinFcSmsNumSendResponse rsp;
		
		try {
			
			
			rsp = client.execute(req);
			
			result.setMsg("发送成功!");
			result.setSuccess(true);
			result.setObj(rsp.getBody());
			
			System.out.println(rsp.getBody());
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result.setMsg("发送失败");
			result.setSuccess(false);		
			
			result.setObj("errMsg:"+e.getErrMsg() +" errCode:"+ e.getErrCode()+" message:"+e.getMessage());
		}
		
		return result;
	}

}
