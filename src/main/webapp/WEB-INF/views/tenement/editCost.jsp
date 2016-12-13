<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#roomEditForm').form({
            url:'${path}/tenant/edit',
            onSubmit : function() {
            	
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
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
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
            
           
            
            
        });
        
        
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
    
 
    });
    
   
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="roomEditForm" method="post">
           <table class="grid">
                <tr>
                    <td>年份</td>
                    <td><input name="year" id="year" type="text" placeholder="请输入房间名称" type="text" class="easyui-validatebox easyui-textbox" data-options="required:true" value="" style="width:80px"></td>
                    <td>月份</td>
                    <td><input name="month" id="month" type="text" placeholder="请输入住户姓名" type="text" class="easyui-validatebox easyui-textbox" data-options="required:true" value="" style="width:80px"></td>
                    <td>住户</td>
                    <td><input name="tenantName" id="tenantName" type="text" placeholder="请输入住户姓名" type="text" class="easyui-validatebox easyui-textbox" data-options="required:true" value="" style="width:80px"></td>
                </tr>
                <tr>
                    <td>本月电表数</td>
                    <td><input name="currentElectricNum" id="currentElectricNum" placeholder="点击选择时间" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" style="width:80px"></td>
                    <td>上月电表数</td>
                    <td>
                       <input name="lastElectricNum" id="lastElectricNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" style="width:80px" >
                    </td>
                    <td>用电数</td>
                    <td>
                       <input name="electricNum" id="electricNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  style="width:80px" readonly="true">
                    </td>
                     <td>度 /元</td>
                    <td>
                       <input name="electricUnitPrice" id="electricUnitPrice" placeholder="输入"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" style="width:80px">
                    </td>
                    <td>电费(元)</td>
                    <td>
                       <input name="electricCharge"  id="electricCharge"   type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" readonly="true" style="width:80px">
                    </td>
                </tr>
                 <tr>
                    <td>本月水表数</td>
                    <td><input name="currentWaterNum" id="currentWaterNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-textbox" data-options="required:true,min:0,precision:2" style="width:80px" ></td>
                    <td>上月水表数</td>
                    <td>
                       <input name="lastWaterNum" id="lastWaterNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" style="width:80px">
                    </td>
                     <td>用水数</td>
                    <td>
                       <input name="waterNum" id="waterNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" style="width:80px" readonly="true">
                    </td>
                     <td>顿 /元</td>
                    <td>
                       <input name="waterUnitPrice" id="waterUnitPrice" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" style="width:80px">
                    </td>
                    <td>水费(元)</td>
                    <td>
                       <input name="waterCharge" id="waterCharge" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" style="width:80px" readonly="true">
                    </td>
                </tr>
                 <tr>
                    <td>本月煤气数</td>
                    <td><input name="currentGasNum" id="currentGasNum" placeholder="点击选择时间"   type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" style="width:80px"></td>
                    <td>上月煤气数</td>
                    <td>
                       <input name=lastGasNum id="lastGasNum" placeholder="点击选择时间"   class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" style="width:80px">
                    </td>
                     <td>煤气数</td>
                    <td>
                       <input name="gasNum" id="gasNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" style="width:80px" readonly="true">
                    </td>
                     <td>方 /元</td>
                    <td>
                       <input name="gasUnitPrice" id="gasUnitPrice" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" style="width:80px">
                    </td>
                     <td>燃气费(元)</td>
                    <td>
                       <input name="gasCharge" id="gasCharge" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" style="width:80px" readonly="true">
                    </td>
                </tr>
                 <tr>
                   
                    <td>网络费</td>
                    <td><input name="internetCharge" placeholder="点击选择时间"  class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" style="width:80px"></td>
                    <td>电视费</td>
                    <td><input name="tvCharge" placeholder="点击选择时间"  class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" style="width:80px"></td>
                    <td>分摊费</td>
                    <td><input name="equallyCharge" placeholder="点击选择时间"  class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" style="width:80px"></td>
                     <td>其他费用</td>
                    <td><input name="otherCharge" placeholder="点击选择时间"  class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" style="width:80px"></td>
                    <td>合计(元)</td>
                    <td><input name="total" placeholder="点击选择时间"  class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" style="width:80px"></td>
                    <td><input name="roomId" type="hidden"  value="${roomId}"></td>
                </tr>
                <tr>
                    
                  <td>备注</td>
                  <td colspan="6"><textarea id="remark" name="remark" rows="" cols="" style="margin: 0px; width: 380px; height: 53px;" ></textarea></td>  
                    
                </tr>
            </table>
        </form>
    </div>
</div>