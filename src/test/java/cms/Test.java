package cms;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;
import com.wangzhixuan.commons.utils.Trans2RMBUtils;

public class Test {

	public static void main(String[] args) throws ApiException {
		// TODO Auto-generated method stub

//		String url = "http://gw.api.taobao.com/router/rest";
//		String appkey = "23515612";
//		String secret = "ee9785cee2507d7b836fe5656c5a7716";
//		
//		TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
//		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
//		req.setExtend( "" );
//		req.setSmsType( "normal" );
//		req.setSmsFreeSignName( "交租短信" );
//		req.setSmsParamString( "{name:'张三',room:'108',cost:'100'}" );
//		req.setRecNum( "13450761833,15919064667,13682222283" );
//		req.setSmsTemplateCode( "SMS_25620786" );
//		AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
//		System.out.println(rsp.getBody());
		
		System.out.println(Trans2RMBUtils.trans2RMB("9821931.01"));
		
	}

}
