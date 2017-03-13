<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>

<script type="text/javascript">



    $(function() {
    	
    	var costId = '<%=request.getParameter("id")%>';
    	var tenantName = '<%=request.getParameter("tenantName")%>';
    	   	
    	$('#tenantName').val(tenantName);
    	    	
        $('#costEditForm').form({
            url:'${path}/cost/edit',
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
                    parent.$.messager.alert('提示', result.msg, 'info');
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
            
           
            
            
        });
        
       //--------- 

  // array = [{key:value},{key:value}]
   function objectFindByKey(array, key, value) {
    	    for (var i = 0; i < array.length; i++) {
    	        if (array[i][key] == value) {
    	            return array[i];
    	        }
    	    }
    	    return null;
    }
    	
    	
 //----------------------------------   	
    //获取配置费用数据	
    /* 	$.ajax({
  		   type: "GET",
  		   url: "${path }/dictEntry/data?id=COST",
  		   async: false,
  		   success: function(msg){

  			   if(msg){
  				  var msg = JSON.parse(msg);
 				  
  				  msg = msg.obj;
  				  
 				
  				 $('#electricUnitPrice').val(objectFindByKey(msg,"dictid","ECOST").value);
  				 $('#gasUnitPrice').val(objectFindByKey(msg,"dictid","GCOST").value);
  				 $('#waterUnitPrice').val(objectFindByKey(msg,"dictid","WCOST").value);

  			
  			   }

  			   
  			   
  		   },
  		   error:function(){
  			  
  			  $.messager.progress('close');
  			  $.messager.alert('发送失败！', msg.msg, 'error');
  		   }
  	});        */
       
 //--------------
 
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
	    
	    var total = (parseFloat(manageCharge) + parseFloat(monRent) + parseFloat(gasCharge) + parseFloat(waterCharge) + parseFloat(electricCharge) + parseFloat(internetCharge) + parseFloat(tvCharge) + parseFloat(equallyCharge) + parseFloat(otherCharge)).toFixed(2);
	    
	   
   
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
    
    
    
    var a = $('#currentElectricNum').val();
	var b = $('#lastElectricNum').val();
	var c = (parseFloat(a) - parseFloat(b)).toFixed(2);
    
	$('#electricNum').val(c);
        
	var a1 = $('#currentWaterNum').val();
	var b1 = $('#lastWaterNum').val();
	var c1 = (parseFloat(a1) - parseFloat(b1)).toFixed(2);
  
  
	$('#waterNum').val(c1);   
    
 
	var a2 = $('#currentGasNum').val();
	var b2 = $('#lastGasNum').val();
	var c2 = (parseFloat(a2) - parseFloat(b2)).toFixed(2);
  
  
	$('#gasNum').val(c2); 
	
	
	$('#monRent').numberbox({  
	      	  onChange: function(value){ 
	      		  totalCost();  
	      	  }
	}); 
	
	
	
  
    
    
    //设置单元价格
    $('#electricUnitPrice').numberbox({  
  	  onChange: function(value){ 
  		  changeEle();
  		  totalCost();  
  	  }
    }); 
   
    $('#gasUnitPrice').numberbox({  
    	  onChange: function(value){ 
    		  changeGas();
    		  totalCost();  
    	  }
      }); 
    
    $('#waterUnitPrice').numberbox({  
  	  onChange: function(value){ 
  		  changeWater();
  		  totalCost();  
  	  }
    }); 
   
  
    });
    
   
    function changeEle(){
  	  
       	var a = $('#currentElectricNum').val();
      	var b = $('#lastElectricNum').val();
      	var c = (parseFloat(a) - parseFloat(b)).toFixed(2);
          var d = $('#electricUnitPrice').val();
        
      	$('#electricNum').numberbox('setValue', c);
      	
      	var e =  (c * d).toFixed(2);
      	    
      	$('#electricCharge').numberbox('setValue',e);
    	  
      } 
      
     
      function changeWater(){
    	  
    	  var a = $('#currentWaterNum').val();
        	var b = $('#lastWaterNum').val();
        	var c = (parseFloat(a) - parseFloat(b)).toFixed(2);
            var d = $('#waterUnitPrice').val();
          
        	$('#waterNum').numberbox('setValue', c);
        	
        	var e =  (c * d).toFixed(2);
        	    
        	$('#waterCharge').numberbox('setValue',e);
    	  
      }
      
      
      function changeGas(){
    	  
    		var a = $('#currentGasNum').val();
          	var b = $('#lastGasNum').val();
          	var c = (parseFloat(a) - parseFloat(b)).toFixed(2);
            var d = $('#gasUnitPrice').val();
            
          	$('#gasNum').numberbox('setValue', c);
          	
          	var e =  (c * d).toFixed(2);
          	    
          	$('#gasCharge').numberbox('setValue',e);
    	  
      }
    
      
   
    
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
          <form id="costEditForm" method="post">
             <table class="grid">
                <tr>
                    <td align="right">年份</td>
                    <td><input name="year" id="year" type="text" placeholder="请输入房间名称" type="text" class="easyui-validatebox easyui-textbox" data-options="required:true"   value="${cost.year}"></td>
                    <td align="right">月份</td>
                    <td><input name="month" id="month" type="text" placeholder="请输入住户姓名" type="text" class="easyui-validatebox easyui-textbox" data-options="required:true"   value="${cost.month}"></td>
                    <td align="right">住户</td>
                    <td><input name="tenantName" id="tenantName" type="text" placeholder="请输入住户姓名" type="text" class="easyui-validatebox easyui-textbox" data-options="required:true" value=""  value="${tenantName }"></td>
                 </tr>
                 <tr>
                  <td align="right">计费(始)</td>
                   <td><input id="startDate" name="startDate" type="text" class="easyui-datebox" parser="myparser" editable="fasle"  required="required" value="${cost.startDate}"></td>
                  <td align="right">计费(至)</td>
                  <td><input id="endDate" name="endDate" type="text" class="easyui-datebox" parser="myparser" editable="fasle" required="required"  value="${cost.endDate}" validType="greaterThan['#startDate']"></td>  <!-- validType="isAfter['#startDate']" -->
                   <td align="right">抄表日期</td>
                  <td><input id="copyDate" name="copyDate" type="text" class="easyui-datebox" parser="myparser" editable="fasle" required="required" value="${cost.copyDate}"></td> 
                 </tr>
                 
                 <tr> 
                    <td align="right">月租</td>
                    <td><input name="monRent" id="monRent" type="text" placeholder="管理费" type="text" class="easyui-validatebox easyui-textbox" data-options="required:true"   value="${cost.monRent}"></td>
                    <td align="right">分摊费</td>
                    <td><input name="equallyCharge" id="equallyCharge" placeholder="点击选择时间"  class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"   value="${cost.equallyCharge}"></td>
                    <td align="right">电视费</td>
                    <td><input name="tvCharge" id="tvCharge" placeholder="点击选择时间"  class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  value="${cost.tvCharge}"></td>
                </tr>
                <tr>
                   <td align="right">管理费</td>
                   <td><input name="manageCharge" id="manageCharge" type="text" placeholder="管理费" type="text" class="easyui-validatebox easyui-textbox" data-options="required:true"   value="${cost.manageCharge}"></td>
                   <td align="right">网络费</td>
                   <td><input name="internetCharge" id="internetCharge" placeholder="点击选择时间"  class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  value="${cost.internetCharge}"></td>
                   <td align="right">其他费用</td>
                   <td><input name="otherCharge" id="otherCharge" placeholder="点击选择时间"  class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"   value="${cost.otherCharge}"></td>
                </tr>
                <tr>
                    <td align="right">本月电表数</td>
                    <td><input name="currentElectricNum" id="currentElectricNum" placeholder="点击选择时间" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  value="${cost.currentElectricNum}"></td>
                    <td align="right">本月水表数</td>
                    <td><input name="currentWaterNum" id="currentWaterNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-textbox" data-options="required:true,min:0,precision:2"  value="${cost.currentWaterNum}"></td>
                    <td align="right">本月煤气数</td>
                    <td><input name="currentGasNum" id="currentGasNum" placeholder="点击选择时间"   type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  value="${cost.currentGasNum}"></td>
                </tr>
                <tr>  
                    <td align="right">上月电表数</td>
                    <td>
                       <input name="lastElectricNum" id="lastElectricNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  value="${cost.lastElectricNum}">
                    </td>
                    <td align="right">上月水表数</td>
                    <td>
                       <input name="lastWaterNum" id="lastWaterNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  value="${cost.lastWaterNum}">
                    </td>
                   <td align="right">上月煤气数</td>
                    <td>
                       <input name=lastGasNum id="lastGasNum" placeholder="点击选择时间"   class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  value="${cost.lastGasNum}">
                    </td>
                </tr>
                <tr>  
                    <td align="right">用电数</td>
                    <td>
                       <input name="electricNum" id="electricNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"   readonly="true" value="0">
                    </td>
                    <td align="right">用水数</td>
                    <td>
                       <input name="waterNum" id="waterNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  readonly="true" value="">
                    </td>
                    <td align="right">煤气数</td>
                    <td>
                       <input name="gasNum" id="gasNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  readonly="true" value="">
                    </td>
                 </tr>
                 
                 <tr>   
                    <td align="right">度 /元</td>
                    <td>
                       <input name="electricUnitPrice" id="electricUnitPrice" placeholder="输入"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  value="${cost.electricUnitPrice}">
                    </td>
                    <td align="right">吨 /元</td>
                    <td>
                       <input name="waterUnitPrice" id="waterUnitPrice" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  value="${cost.waterUnitPrice}">
                    </td>
                    <td align="right">方 /元</td>
                    <td>
                       <input name="gasUnitPrice" id="gasUnitPrice" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  value="${cost.gasUnitPrice}">
                    </td>
                 </tr>
                 <tr>    
                    <td align="right">电费合计(元)</td>
                    <td>
                       <input name="electricCharge"  id="electricCharge"   type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2" readonly="true"  value="${cost.electricCharge}">
                    </td>
                    <td align="right">水费合计(元)</td>
                    <td>
                       <input name="waterCharge" id="waterCharge" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  readonly="true" value="${cost.waterCharge}">
                    </td>
                    <td align="right">燃气费合计(元)</td>
                    <td>
                       <input name="gasCharge" id="gasCharge" placeholder="点击选择时间"  type="text" class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  readonly="true"value="${cost.gasCharge}">
                    </td>
                </tr>
                 <tr>
                    <td><input name="roomId" type="hidden"  value="${cost.roomId}"></td>
                    <td><input name="sendCount" type="hidden"  value="${cost.sendCount}"></td>
                    <td><input name="id" type="hidden"  value="${cost.id}"></td> 
                    <td></td>
                    <td align="right">费用总计(元)</td>
                    <td><input name="total" id="total" placeholder="点击选择时间"  class="easyui-validatebox easyui-numberbox" data-options="required:true,min:0,precision:2"  readonly="true" value="${cost.total}"></td>
                    
                </tr>
                <tr>
                    
                  <td>备注</td>
                  <td colspan="6"><textarea id="remark" name="remark" rows="" cols="" style="margin: 0px; width: 380px; height: 53px;" >${cost.remark}</textarea></td>  
                  
                </tr>
            </table>
        </form>
    </div>
</div>