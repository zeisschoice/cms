<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">

  var array = [];  

  // array = [{key:value},{key:value}]
  function objectFindByKey(array, key, value) {
   	    for (var i = 0; i < array.length; i++) {
   	        if (array[i][key] == value) {
   	            return array[i];
   	        }
   	    }
   	    return null;
   }
   	
  
  

    $(function() {
        
    	var dateObj = new Date();
    	var month = dateObj.getUTCMonth() + 1; //months from 1-12
    	var day = dateObj.getUTCDate();
    	var year = dateObj.getUTCFullYear();
    	var roomId = <%= request.getParameter("id") %>;
        var tenantName = '<%= request.getParameter("tenantName") %>';
        var monRent = '<%= request.getParameter("monRent") %>';
        
        var tenantId = '<%=request.getParameter("tenantId")%>'
        
        
    	$('#year').val(year);
    	$('#month').val(month);
    	$('#tenantName').val(tenantName);
    	$('#monRent').val(monRent);
        $('#tenantId').val(tenantId);
    
    	if(month==0)
        {
            month=12;
            year=year-1;
        }else{
        	
        	month = month -1;
        	
        }
    	var data = {};
    	data.month = month;
    	data.year = year;
    	data.roomId = roomId ;
    	
    	
    	//获取上个月的费用
    	$.ajax({
 		   type: "POST",
 		   url: "${path }/cost/getLastMon",
 		   data:data,
 		   async: true,
 		   success: function(msg){
 		//	 var  result =  JSON.pare(msg);
                console.log(msg); 
 			   if(msg){
 				  
 				  var msg = JSON.parse(msg);
				 
 				 
 				  
				  $('#lastElectricNum').val(msg.currentElectricNum);
				  $('#lastWaterNum').val(msg.currentWaterNum);
				  $('#lastGasNum').val(msg.currentGasNum);
 				  
 				// $('#electricUnitPrice').val(msg.electricUnitPrice);
 				// $('#gasUnitPrice').val(msg.gasUnitPrice);
 				// $('#waterUnitPrice').val(msg.waterUnitPrice);

 			
 			   }

 			   
 			   
 		   },
 		   error:function(){
 			  
 			  $.messager.progress('close');
 			  $.messager.alert('发送失败！', msg.msg, 'error');
 		   }
 	});
    	
  
    	
 //----------------------------------   	
    //获取配置费用数据	
    	$.ajax({
  		   type: "GET",
  		   url: "${path }/dictEntry/data?id=COST",
  		   async: true,
  		   success: function(msg){
  		//	 var  result =  JSON.pare(msg);
  		      
  			   if(msg){
  				 
  				  var msg = JSON.parse(msg);
 				  
  				  array = msg.obj;
  				  
  					
  				//	alert("请先配置费用数据字典 ECOST（电费）、GCOST（煤气费）、WCOST（水费）");
  			     
  		     
  			     $('#electricUnitPrice').numberbox('setValue',objectFindByKey(array,"dictid","ECOST").value);
  			  	 $('#gasUnitPrice').numberbox('setValue',objectFindByKey(array,"dictid","GCOST").value);
  			   	 $('#waterUnitPrice').numberbox('setValue',objectFindByKey(array,"dictid","WCOST").value); 
  				
  		    
  				
  			   }

  			   
  			   
  		   },
  		   error:function(){
  			  
  			  $.messager.progress('close');
  			  $.messager.alert('发送失败！', msg.msg, 'error');
  		   }
  	}); 	
  
   //------------------------------

 
 
  //-----------------------------  	
        $('#costAddForm').form({
            url:'${path}/cost/add',
            onSubmit : function(params) {
            	
            	console.log(params);
            	
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                
                
                if(eq()){
                	
                	progressClose();
                	$.messager.alert('错误', eq(), 'error');
                	
                	return false;
                }
              
                return isValid;
            },
            success : function(result) {
                progressClose();
            
              
            	  
                result = updateStr(result);
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('提示', result.msg, 'warning');
                }
            }
        });
        
        
        function totalCost(){
      	  
    	    var gasCharge = $('#gasCharge').val();
    	    var waterCharge= $('#waterCharge').val();
    	    var electricCharge = $('#electricCharge').val();
    	    var internetCharge = $('#internetCharge').val();
    	    var tvCharge = $('#tvCharge').val();
    	    var equallyCharge = $('#equallyCharge').val();
    	    var otherCharge = $('#otherCharge').val();
    	    var monRent = $('#monRent').val();
    	    var manageCharge = $('#manageCharge').val();
    	    
    	    var total = (parseFloat(manageCharge) +  parseFloat(monRent) + parseFloat(gasCharge) + parseFloat(waterCharge) + parseFloat(electricCharge) + parseFloat(internetCharge) + parseFloat(tvCharge) + parseFloat(equallyCharge) + parseFloat(otherCharge)).toFixed(2);
    	    
    	   
       
    	    $('#total').numberbox('setValue',total);
        }
        
        //当前电数
        $('#currentElectricNum').numberbox({  
        	  onChange: function(value){ 
        	
        		  
        	//  var _trim = $.trim(value);  
        	var a = $('#currentElectricNum').val();
        	var b = $('#lastElectricNum').val();
        	var c = (parseFloat(a) - parseFloat(b)).toFixed(2);
            var d = $('#electricUnitPrice').val();
          
        	$('#electricNum').numberbox('setValue', c);
        	
        	var e =  (c * d).toFixed(2);
        	    
        	$('#electricCharge').numberbox('setValue',e);
        	
        	  }  
        	});  
        
      
        $('#lastElectricNum').numberbox({  
      	  onChange: function(value){ 
      	
      		  
      	//  var _trim = $.trim(value);  
      	var a = $('#currentElectricNum').val();
      	var b = $('#lastElectricNum').val();
      	var c = (parseFloat(a) - parseFloat(b)).toFixed(2);
          var d = $('#electricUnitPrice').val();
        
      	$('#electricNum').numberbox('setValue', c);
      	
      	var e =  (c * d).toFixed(2);
      	    
      	$('#electricCharge').numberbox('setValue',e);
      	
      	  }  
      	});  
        
        
        $('#currentWaterNum').numberbox({  
        	  onChange: function(value){ 
        	
        		  
        	//  var _trim = $.trim(value);  
        	var a = $('#currentWaterNum').val();
        	var b = $('#lastWaterNum').val();
        	var c = (parseFloat(a) - parseFloat(b)).toFixed(2);
            var d = $('#waterUnitPrice').val();
          
        	$('#waterNum').numberbox('setValue', c);
        	
        	var e =  (c * d).toFixed(2);
        	    
        	$('#waterCharge').numberbox('setValue',e);
        	
        	  }  
        	});  
        
        $('#lastWaterNum').numberbox({  
      	  onChange: function(value){ 
      	
      		  
      	//  var _trim = $.trim(value);  
      	var a = $('#currentWaterNum').val();
      	var b = $('#lastWaterNum').val();
      	var c = (parseFloat(a) - parseFloat(b)).toFixed(2);
          var d = $('#waterUnitPrice').val();
        
      	$('#waterNum').numberbox('setValue', c);
      	
      	var e =  (c * d).toFixed(2);
      	    
      	$('#waterCharge').numberbox('setValue',e);
      	
      	  }  
      	});  
        
       //煤气费用计算 
        $('#currentGasNum').numberbox({  
        	  onChange: function(value){ 
        	
        		  
        	//  var _trim = $.trim(value);  
        	var a = $('#currentGasNum').val();
        	var b = $('#lastGasNum').val();
        	var c = (parseFloat(a) - parseFloat(b)).toFixed(2);
            var d = $('#gasUnitPrice').val();
          
        	$('#gasNum').numberbox('setValue', c);
        	
        	var e =  (c * d).toFixed(2);
        	    
        	$('#gasCharge').numberbox('setValue',e);
        	
        	  }  
        	});  
        
        $('#lastGasNum').numberbox({  
      	  onChange: function(value){ 
      	
      		  
	      	//  var _trim = $.trim(value);  
	      	var a = $('#currentGasNum').val();
	      	var b = $('#lastGasNum').val();
	      	var c = (parseFloat(a) - parseFloat(b)).toFixed(2);
	          var d = $('#gasUnitPrice').val();
	        
	      	$('#gasNum').numberbox('setValue', c);
	      	
	      	var e =  (c * d).toFixed(2);
	      	    
	      	$('#gasCharge').numberbox('setValue',e);
      	
      	  }  
      	});  
        
    
        $('#electricCharge').numberbox({  
        	  onChange: function(value){ 
        		  totalCost();  
        	  }
        });   
        
        $('#waterCharge').numberbox({  
      	  onChange: function(value){ 
      		  totalCost();  
      	  }
      }); 
        
        
        $('#gasCharge').numberbox({  
      	  onChange: function(value){ 
      		  totalCost();  
      	  }
      }); 
      
        $('#internetCharge').numberbox({  
        	  onChange: function(value){ 
        		  totalCost();  
        	  }
        }); 
        
        
        $('#tvCharge').numberbox({  
        	  onChange: function(value){ 
        		  totalCost();  
        	  }
        }); 
        
        
        $('#equallyCharge').numberbox({  
        	  onChange: function(value){ 
        		  totalCost();  
        	  }
        }); 
        
        $('#otherCharge').numberbox({  
      	  onChange: function(value){ 
      		  totalCost();  
      	  }
        }); 
        
   
        $('#manageCharge').numberbox({  
        	  onChange: function(value){ 
        		  totalCost();  
        	  }
          }); 
        
        
    });
    
   
 function eq(){
	
	var a1 = Number($('#currentGasNum').val());
   	var b1 = Number($('#lastGasNum').val());  
	
   	
   	if(a1<b1){
   		
   		return "当前燃气数不能比上个月的燃气数小！";
   	}
   	
   	var a2 = Number($('#currentElectricNum').val());
  	var b2 = Number($('#lastElectricNum').val());
   	
    if(a2<b2){
   		
   		return "当前用电数不能比上个月的用电数小！";
   	}
  	
  	var a3 = Number($('#currentWaterNum').val());
  	var b3 = Number($('#lastWaterNum').val());
  	
   if(a3<b3){
   		
   		return "当前用水数不能比上个月的用水数小！";
   	}
  	
    return false;
  	
 }   
    
 
 function myparser(s){  
	    if (!s) return new Date();  
	    var ss = (s.split('-'));  
	    var y = parseInt(ss[0],10);  
	    var m = parseInt(ss[1],10);  
	    var d = parseInt(ss[2],10);  
	    if (!isNaN(y) && !isNaN(m) && !isNaN(d)){  
	        return new Date(y,m-1,d);  
	    } else {  
	        return new Date();  
	    }  
	}  
   
 /* $('#startDate').datebox({  
	 closeText:'关闭',  
	 formatter:function(date){  
	  var y = date.getFullYear();  
	  var m = date.getMonth()+1;  
	  var d = date.getDate();  
	  var h = date.getHours();  
	  var M = date.getMinutes();  
	  var s = date.getSeconds();  
	  function formatNumber(value){  
	   return (value < 10 ? '0' : '') + value;  
	  }  
	  alert(formatNumber(h));  
	  return y+'-'+m+'-'+d+' '+ formatNumber(h)+':'+formatNumber(M)+':'+formatNumber(s);  
	 },  
	 parser:function(s){  
	  var t = Date.parse(s);  
	  if (!isNaN(t)){  
	   return new Date(t);  
	  } else {  
	   return new Date();  
	  }  
	 }  
	});   

 $('#endDate').datebox({  
	 closeText:'关闭',  
	 formatter:function(date){  
	  var y = date.getFullYear();  
	  var m = date.getMonth()+1;  
	  var d = date.getDate();  
	  var h = date.getHours();  
	  var M = date.getMinutes();  
	  var s = date.getSeconds();  
	  function formatNumber(value){  
	   return (value < 10 ? '0' : '') + value;  
	  }  
	  alert(formatNumber(h));  
	  return y+'-'+m+'-'+d+' '+ formatNumber(h)+':'+formatNumber(M)+':'+formatNumber(s);  
	 },  
	 parser:function(s){  
	  var t = Date.parse(s);  
	  if (!isNaN(t)){  
	   return new Date(t);  
	  } else {  
	   return new Date();  
	  }  
	 }  
	}); 
 
 $('#copyDate').datebox({  
	 closeText:'关闭',  
	 formatter:function(date){  
	  var y = date.getFullYear();  
	  var m = date.getMonth()+1;  
	  var d = date.getDate();  
	  var h = date.getHours();  
	  var M = date.getMinutes();  
	  var s = date.getSeconds();  
	  function formatNumber(value){  
	   return (value < 10 ? '0' : '') + value;  
	  }  
	  alert(formatNumber(h));  
	  return y+'-'+m+'-'+d+' '+ formatNumber(h)+':'+formatNumber(M)+':'+formatNumber(s);  
	 },  
	 parser:function(s){  
	  var t = Date.parse(s);  
	  if (!isNaN(t)){  
	   return new Date(t);  
	  } else {  
	   return new Date();  
	  }  
	 }  
	});  */
 
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="costAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>年份</td>
                    <td><input name="year" id="year" type="text" placeholder="请输入房间名称" type="text" class="easyui-validatebox easyui-textbox" data-options="required:true" value="" ></td>
                    <td>月份</td>
                    <td><input name="month" id="month" type="text" placeholder="请输入住户姓名" type="text" class="easyui-validatebox easyui-textbox" data-options="required:true" value="" ></td>
                    <td>住户</td>
                    <td><input name="tenantName" id="tenantName" type="text" placeholder="请输入住户姓名" type="text" class="easyui-validatebox easyui-textbox" data-options="required:true" value="" ></td>
                     <td>月租</td>
                    <td><input name="monRent" id="monRent" type="text" placeholder="管理费" type="text" class="easyui-validatebox easyui-textbox" data-options="required:true" value="0" ></td>
                    <td style="width:80px">分摊费</td>
                    <td><input name="equallyCharge" id="equallyCharge" placeholder="点击选择时间"  class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  value="0"></td>
                </tr>
                <tr>
                  <td style="width:80px">计费(始)</td>
                   <td><input id="startDate" name="startDate" type="text" class="easyui-datebox" parser="myparser"  required="required" ></td>
                  <td style="width:80px">计费(至)</td>
                  <td><input id="endDate" name="endDate" type="text" class="easyui-datebox" parser="myparser" required="required" validType="isAfter['#startDate']"></td>
                   <td style="width:80px">抄表日期</td>
                  <td><input id="copyDate" name="copyDate" type="text" class="easyui-datebox" parser="myparser" required="required" ></td> 
                  <td>管理费</td>
                  <td><input name="manageCharge" id="manageCharge" type="text" placeholder="管理费" type="text" class="easyui-validatebox easyui-textbox" data-options="required:true" value="0" ></td>
                  <td style="width:80px">网络费</td>
                  <td><input name="internetCharge" id="internetCharge" placeholder="点击选择时间"  class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  value="0"></td>
                </tr>
                <tr>
                    <td>本月电表数</td>
                    <td><input name="currentElectricNum" id="currentElectricNum" placeholder="点击选择时间" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" ></td>
                    <td>上月电表数</td>
                    <td>
                       <input name="lastElectricNum" id="lastElectricNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  >
                    </td>
                    <td>用电数</td>
                    <td>
                       <input name="electricNum" id="electricNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  readonly="true">
                    </td>
                     <td>度 /元</td>
                    <td>
                       <input name="electricUnitPrice" id="electricUnitPrice" placeholder="输入"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  value="0">
                    </td>
                    <td>电费(元)</td>
                    <td>
                       <input name="electricCharge"  id="electricCharge"   type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" readonly="true"  value="0">
                    </td>
                </tr>
                 <tr>
                    <td>本月水表数</td>
                    <td><input name="currentWaterNum" id="currentWaterNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-textbox" data-options="required:true,min:0,precision:2"  ></td>
                    <td>上月水表数</td>
                    <td>
                       <input name="lastWaterNum" id="lastWaterNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" >
                    </td>
                     <td>用水数</td>
                    <td>
                       <input name="waterNum" id="waterNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  readonly="true">
                    </td>
                     <td>吨/元</td>
                    <td>
                       <input name="waterUnitPrice" id="waterUnitPrice" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  value="0">
                    </td>
                    <td>水费(元)</td>
                    <td>
                       <input name="waterCharge" id="waterCharge" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  readonly="true" value="0">
                    </td>
                </tr>
                 <tr>
                    <td style="width:80px">本月煤气数</td>
                    <td><input name="currentGasNum" id="currentGasNum" placeholder="点击选择时间"   type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" ></td>
                    <td style="width:80px">上月煤气数</td>
                    <td>
                       <input name=lastGasNum id="lastGasNum" placeholder="点击选择时间"   class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" >
                    </td>
                     <td style="width:80px">煤气数</td>
                    <td>
                       <input name="gasNum" id="gasNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  readonly="true">
                    </td>
                     <td style="width:80px">方 /元</td>
                    <td>
                       <input name="gasUnitPrice" id="gasUnitPrice" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  value="0">
                    </td>
                     <td style="width:80px">燃气费(元)</td>
                    <td>
                       <input name="gasCharge" id="gasCharge" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  readonly="true" value="0">
                    </td>
                </tr>
                 <tr>
                   
                   
                    <td style="width:80px">电视费</td>
                    <td><input name="tvCharge" id="tvCharge" placeholder="点击选择时间"  class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  value="0"></td>
                    
                     <td style="width:80px">其他费用</td>
                    <td><input name="otherCharge" id="otherCharge" placeholder="点击选择时间"  class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  value="0"></td>
                    
                    <td><input name="roomId" type="hidden"  value="${roomId}"></td>
                    <td><input name="tenantId" id="tenantId" type="hidden"  value=""></td>
                    <td><input name="sendCount" type="hidden"  value="0"></td>
                    <td></td>
                    <td style="width:80px">合计(元)</td>
                    <td><input name="total" id="total" placeholder="点击选择时间"  class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  readonly="true"></td>
                </tr>
                <tr>
                    
                  <td style="width:80px">备注</td>
                  <td colspan="6"><textarea id="remark" name="remark" rows="" cols="" style="margin: 0px; width: 380px; height: 53px;" ></textarea></td>  
                    
                </tr>
            </table>
        </form>
    </div>
</div>