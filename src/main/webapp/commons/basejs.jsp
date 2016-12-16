<%--标签 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="edge" />
<link rel="shortcut icon" href="${staticPath }/static/style/images/favicon.ico" />
<!-- [my97日期时间控件] -->
<script type="text/javascript" src="${staticPath }/static/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<!-- [jQuery] -->
<script type="text/javascript" src="${staticPath }/static/easyui/jquery.min.js" charset="utf-8"></script>
<!-- [EasyUI] -->
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/bootstrap/easyui.css" />
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" />
<script type="text/javascript" src="${staticPath }/static/easyui/jquery.easyui.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${staticPath }/static/easyui/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
<!-- [扩展JS] -->
<script type="text/javascript" src="${staticPath }/static/extJs.js" charset="utf-8"></script>
<!-- [扩展样式] -->
<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/dreamlu.css" />
<link rel="stylesheet" type="text/css" href="${staticPath }/static/icommon.css" />
<script type="text/javascript">
    var basePath = "${staticPath }";
    
    function updateStr(str){
    
    
        if(str.indexOf("<")==-1){
            	
            	return str;
          }
       
        
        var d = str.substring(0,str.indexOf("<"));
        
        return d;
        
      
    }
   
    function updateStr4roomName(str){
        
        
        if(str.indexOf("(")==-1){
            	
            	return str;
          }
       
        
        var d = str.substring(0,str.indexOf("("));
        
        return d;
        
      
    }
    
  //EASyui扩展
    //EASyui扩展
$.extend($.fn.validatebox.defaults.rules, {
//移动手机号码验证
    mobile: {//value值为文本框中的值
        validator: function (value) {
            var reg = /^1[3|4|5|8|9]\d{9}$/;
            return reg.test(value);
        },
        message: '输入手机号码格式不准确.'
       },
  //验证邮编 
  zipcode: {
        validator: function (value) {
            var reg = /^[1-9]\d{5}$/;
            return reg.test(value);
        },
        message: '邮编必须是非0开始的6位数字.'
    },
idcard : {// 验证身份证
        validator : function(value) {
            return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);
        },
        message : '身份证号码格式不正确'
    },
 
phone : {// 验证电话号码
        validator : function(value) {
            return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
        },
        message : '格式不正确,请使用下面格式:020-88888888'
    },
 
msn:{
        validator : function(value){
        return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value);
    },
    message : '请输入有效的msn账号'
},
 
qq : {// 验证QQ,从10000开始
        validator : function(value) {
            return /^[1-9]\d{4,9}$/i.test(value);
        },
        message : 'QQ号码格式不正确'
    },
 
integer : {// 验证整数
        validator : function(value) {
            return /^[+]?[1-9]+\d*$/i.test(value);
        },
        message : '请输入整数'
    },
 
faxno : {// 验证传真
        validator : function(value) {
            return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
        },
        message : '传真号码不正确'
    },
 
enstr : {// 验证之只能输入英文
        validator : function(value) {
            return /^([u4e00-u9fa5]|[ufe30-uffa0]|[a-za-z0-9_])*$/i.test(value);
        },
        message : '只能输入英文'
    },
 
zhstr : {// 验证之只能输入中文
        validator : function(value) {
            return /^[u4E00-u9FA5]+$/i.test(value);
        },
        message : '只能输入中文'
    },
 
//时间区间验证
 
 isAfter: {
    validator: function(value, param){
        var dateA = $.fn.datebox.defaults.parser(value);
        var dateB = $.fn.datebox.defaults.parser($(param[0]).datebox('getValue'));
        return dateA>new Date() && dateA>dateB;
    },
    message: '结束时间不能小于开始时间'
    } ,
    
 isLaterToday: {
    validator: function(value, param){
        var date = $.fn.datebox.defaults.parser(value);
        return date>new Date();
    },
    message: '开始时间不能小于今天'
  },
 
 
//ajax 验证唯一性
 
 Unique_validation: { 
            validator: function(value, param) {
                var m_reg = new RegExp(param[0]); //传递过来的正则字符串中的"\"必须是"\\" 
                if (!m_reg.test(value)) { 
                    $.fn.validatebox.defaults.rules.Unique_validation.message = param[1]; 
                    return false; 
                }else{ 
                    var postdata = {}; 
                    postdata[param[3]] = value; 
                    var result = $.ajax({ 
                        url: param[2], 
                        data: postdata, 
                        async: false, 
                        type: "post" 
                    }).responseText; 
                    if (result == "false") { 
                        $.fn.validatebox.defaults.rules.Unique_validation.message = param[4]; 
                        return false; 
                    }else{ 
                        return true; 
                    } 
                } 
            }, 
            message: '' 
        }
})

    //等待框
    var MaskUtil = (function(){    
      
    var $mask,$maskMsg;    
        
    var defMsg = '正在处理，请稍待。。。';    
        
    function init(){    
        if(!$mask){    
            $mask = $("<div class=\"datagrid-mask mymask\"></div>").appendTo("body");    
        }    
        if(!$maskMsg){    
            $maskMsg = $("<div class=\"datagrid-mask-msg mymask\">"+defMsg+"</div>")    
                .appendTo("body").css({'font-size':'12px'});  
        }    
            
        $mask.css({width:"100%",height:$(document).height()});    
            
        $maskMsg.css({    
            left:($(document.body).outerWidth(true) - 190) / 2,top:($(window).height() - 45) / 2,  
        });     
                    
    }    
        
    return {    
        mask:function(msg){    
            init();    
            $mask.show();    
            $maskMsg.html(msg||defMsg).show();    
        }    
        ,unmask:function(){    
            $mask.hide();    
            $maskMsg.hide();    
        }    
    }    
        
}());
    
    
</script>