<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp"%>
<script type="text/javascript">


	$(function() {
		$('#projectRegHeadEditForm').form({
			url : '${path}/project/edit',
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
				result = $.parseJSON(result);
				if (result.success) {
					//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
		
	
	var projectFinance = {};
	
	var projectRegCost = {};
	
	var pId = '${projectRegHead.projectId}';
	projectRegCost.projectRegId =  '${projectRegHead.projectId}';
	//var a  = $.serializeObject(projectRegCost);
	
		
		
	 $.post('${path}/projectFinanceItem/getData', {
		 projectId : '${projectRegHead.projectId}'
     }, function(result) {
         if (result) {
            $('#projectFinanceDataGrid').datagrid('loadData',result);
         }
      
     }, 'JSON');	
		
	
	 $.post('${path}/projectRegItem/getData', {
		 projectRegId : '${projectRegHead.projectId}'
     }, function(result) {
         if (result) {
        	 $('#projectRegCostDatagrid').datagrid('loadData',result);
         }
       
     }, 'JSON');	
	 
		
	});
	
	

	
 function projectRegFinaceAddFun(){
	 var idx = 0;	 
	 $(dg).datagrid('insertRow',{
			index:idx,	// index start with 0
			row: {
				projectName:"测试插入"
			}
		}); 
	 
	 $(dg).datagrid('beginEdit',idx)
 }   
    
    
	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false"
		style="overflow: hidden; padding: 3px; height:50%">
		
		<form id="projectRegHeadEditForm" method="post">
			<table class="grid">
			    	<tr>
					<td>项目名称</td>
					<td><input name="projectId" type="hidden"  value="${projectRegHead.projectId}">
					<input name="projectName" type="text" placeholder="请输入项目名称"
						class="easyui-validatebox" value="${projectRegHead.projectName}"></td>
					<td>合同签订方</td>
					<td><input name="contractSigner" type="text" placeholder="请输入项目名称"
						class="easyui-validatebox"  value="${projectRegHead.contractSigner}"></td>
					<td>建设单位</td>
					<td><input id="buildOrg" name="buildOrg" type="text"
						placeholder="请输入字典ID" class="easyui-validatebox" value="${projectRegHead.buildOrg}">
					<td>联系人</td>
					<td><input name="chargeDean" id="chargeDean" type="text"
						placeholder="请输入字典ID" class="easyui-validatebox" value="${projectRegHead.chargeDean}">
				</tr>
				<tr>
					<td>联系地址</td>
					<td><input id="contactsAddress" name="contactsAddress"
						type="text" placeholder="请输入字典ID" class="easyui-validatebox"
						value="${projectRegHead.contactsAddress}">
					<td>背景资料</td>
					<td><input id="backgroundInfo" name="backgroundInfo"
						type="text" placeholder="请输入字典ID" class="easyui-validatebox"
						value="${projectRegHead.backgroundInfo}">
					<td>联系电话</td>
					<td><input name="contactCall" id="contactCall" type="text"
						placeholder="请输入字典ID" class="easyui-validatebox" value="${projectRegHead.contactCall}">
					 <td>手机</td>
					<td><input name="contactTel" id="contactTel" type="text"
						placeholder="请输入电话号码" type="text" class="easyui-validatebox" data-options="required:true" validType="mobile" value="${projectRegHead.contactTel}">
				</tr>
				<tr>
				   
					<td>传真</td>
					<td><input name="contactFax" id="contactFax" type="text"
						placeholder="请输入字典ID" class="easyui-validatebox" value="${projectRegHead.contactFax}">
					<td>工作内容</td>
					<td><input name="workDetail" id="workDetail" type="text"
						placeholder="请输入字典ID" class="easyui-validatebox" value="${projectRegHead.workDetail}">
					<td>项目类型</td>
					<td><input name="projectType" id="projectType" type="text"
						placeholder="请输入字典ID" class="easyui-validatebox" value="${projectRegHead.projectType}">
					 <td>行业类型</td>
					<td><input name="businessType" id="businessType" type="text"
						placeholder="请输入字典ID" class="easyui-validatebox" value="${projectRegHead.businessType}">	
				</tr>
				
				<tr>
				   
					<td>审批部门</td>
					<td><input name="aproveDepartment" id="aproveDepartment"
						type="text" placeholder="请输入字典ID" class="easyui-validatebox"
						value="${projectRegHead.aproveDepartment}">
					<td>有无合同</td>
					<td><input name="isContract" id="isContract" type="text"
						placeholder="请输入字典ID" class="easyui-validatebox" value="${projectRegHead.isContract}">
					<td>开始日期</td>
					<td><input name="startDate" id="startDate" type="text"
						placeholder="请输入字典ID" type="text" class="easyui-datebox" editable="fasle" value="${projectRegHead.startDate}">
				</tr>
				<tr>
					<td>结束日期</td>
					<td><input name="endDate" id="endDate" type="text"
						placeholder="请选择日期" type="text" class="easyui-datebox" editable="fasle" value="${projectRegHead.endDate}">
					<td>扣罚比例</td>
					<td><input name="projectPunishRate" id="projectPunishRate"
						type="text" placeholder="请输入字典ID" class="easyui-validatebox"
						value="${projectRegHead.projectPunishRate}">
					<td>扣罚原因</td>
					<td><input name="punishReason" id="punishReason" type="text"
						placeholder="请输入字典ID" class="easyui-validatebox" value="${projectRegHead.punishReason}">
						<td>业务室</td>
					<td><input name="businessRoom" id="businessRoom" type="text"
						placeholder="请输入字典ID" class="easyui-validatebox" value="${projectRegHead.businessRoom}">
				</tr>
				<tr>
					<td>经理</td>
					<td><input name="manager" id="manager" type="text"
						placeholder="请输入字典ID" class="easyui-validatebox" value="${projectRegHead.manager}">
					<td>档案室</td>
					<td><input name="recordRoom" id="recordRoom" type="text"
						placeholder="请输入字典ID" class="easyui-validatebox" value="${projectRegHead.recordRoom}">
				</tr>
				<tr>
					<td>填表人</td>
					<td><input name="fillPerson" id="fillPerson" type="text"
						placeholder="请输入字典ID" class="easyui-validatebox" value="${projectRegHead.fillPerson}">
					<td>记录室</td>
					<td><input name="projectGroupLeader" id="projectGroupLeader"
						type="text" placeholder="请输入字典ID" class="easyui-validatebox"
						value="${projectRegHead.projectGroupLeader}">
					<td>部门领导</td>
					<td><input name="departmentCharger" id="departmentCharger"
						type="text" placeholder="请输入字典ID" class="easyui-validatebox"
						value="${projectRegHead.departmentCharger}">
				</tr>
			</table>
		</form>
		
		
    <div id="tt" class="easyui-tabs"  style="width: 100%;height:400px">
		<div title="财务安排" style="width: 100%;height:100%">
			<!-- <div data-options="region:'center',border:false"> </div> -->
			<table id="projectFinanceDataGrid" class="easyui-datagrid"
					style="width:100%;height:auto"
				data-options="
                iconCls: 'icon-edit',
                singleSelect: true,
                toolbar: '#projectRegFinaceToolbar',
                url: '',
                method: 'post',
                onClickCell: onClickCell,
                onEndEdit: onEndEdit"
				>
					 <thead>	
						<tr>
						    <th field="financeItemId" width="80" hidden="true">收支项目</th>
							<th field="inComeprojectName" width="80" editor="{type:'text'}">收支项目</th>
			                <th field="contractPlan" width="100" editor="{type:'text'}">合同计划</th>
			                <th field="useOrPredict" width="120" editor="{type:'text'}">计划依据及用途</th>
			                <th field="incomingOutgoings1" width="60"   editor="{type:'numberbox',options:{precision:2,required:true}}">金额1</th> <!-- editor="{type:'numberbox',options:{precision:2,required:true}}" -->
			                <th field="date1" width="100"  editor="{type:'datebox'}" editable="fasle">时间1</th>
			                <th field="incomingOutgoings2" width="60"  editor="{type:'numberbox',options:{precision:2,required:true}}">金额2</th>
			                <th field="date2" width="100" editor="{type:'datebox'}" editable="fasle">时间2</th>
			                <th field="incomingOutgoings3" width="60"  editor="{type:'numberbox',options:{precision:2,required:true}}">金额3</th>
			                <th field="date3" width="100" editor="{type:'datebox'}" editable="fasle">时间3</th>
			                <th field="incomingOutgoings4" width="60"  editor="{type:'numberbox',options:{precision:2,required:true}}">金额4</th>
			                <th field="date4" width="100" editor="{type:'datebox'}" editable="fasle">时间4</th>
                        </tr>
					 </thead>	
			</table>
		</div> 		
			
	   <div title="项目费用" style="width: 100%;height:100%">
			<table id="projectRegCostDatagrid" class="easyui-datagrid"
				style="width:100%;height:90%"
               data-options="
                iconCls: 'icon-edit',
                singleSelect: true,
                toolbar: '#projectRegCostToolbar',
                url: '',
                method: 'post',
                onClickCell: onClickCell,
                onEndEdit: onEndEdit"
					>
				 <thead>	
					<tr>
					    <th field="projectRegId" hidden="true">时间</th>
	                    <th field="deductDate" width="100" editor="{type:'datebox'}">时间</th>
		                <th field="deductPerson" width="80" editor="{type:'text'}">提成</th>
		                <th field="deduct" width="80" editor="{type:'text'}">经手人</th>
		                <th field="costDate" width="80" editor="{type:'datebox',options:{required:true,editable:'fasle'}}">时间</th>
		                <th field="costPerson" width="100" editor="{type:'text'}">费用</th>
		                <th field="cost" width="100" editor="{type:'text'}">经手人</th>
		                <th field="rewardsDate" width="100" editor="{type:'datebox',options:{required:true,editable:'fasle'}}" >时间</th>
		                <th field="rewards" width="100" editor="{type:'text'}">奖励</th>
		                <th field="rewardsPerson" width="100" editor="{type:'text'}">受款人</th>
                     </tr>
				 </thead>	
		    </table>
		
		</div> 
   </div> 
	

<div id="projectRegFinaceToolbar" style="display: none;">
   <%--  <shiro:hasPermission name="/projectRegHead/add"> </shiro:hasPermission> --%>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append('#projectFinanceDataGrid')">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeitFinanceItem('#projectFinanceDataGrid')">删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept('#projectFinanceDataGrid')">确定</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject('#projectFinanceDataGrid')">撤销</a>
      <!--   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="getChanges('#projectFinanceDataGrid')">获取改变d</a> -->
    
</div>

<div id="projectRegCostToolbar" style="display: none;">
   <%--  <shiro:hasPermission name="/projectRegHead/add"> </shiro:hasPermission> --%>
      <!--   <a onclick="projectRegHeadAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus on'">添加</a>
        <a onclick="projectRegHeadAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-minus icon-red'">删除</a> -->
        
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append('#projectRegCostDatagrid')">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeitCostItem('#projectRegCostDatagrid')">删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept('#projectRegCostDatagrid')">确定</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject('#projectRegCostDatagrid')">撤销</a>
      <!--   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="getChanges('#projectRegCostDatagrid')">获取改变d</a> -->
        
</div>

  </div>
</div>



<script type="text/javascript">


$.extend($.fn.datagrid.defaults.editors, {
    datetimebox: {// datetimebox就是你要自定义editor的名称
        init: function (container, options) {
            var input = $('<input class="easyuidatetimebox">').appendTo(container);
            return input.datetimebox({
                formatter: function (date) {
                    return new Date(date).format("yyyy-MM-dd hh:mm:ss");
                }
            });
        },
        getValue: function (target) {
            return $(target).parent().find('input.combo-value').val();
        },
        setValue: function (target, value) {
            $(target).datetimebox("setValue", value);
        },
        resize: function (target, width) {
            var input = $(target);
            if ($.boxModel == true) {
                input.width(width - (input.outerWidth() - input.width()));
            } else {
                input.width(width);
            }
        }
    }
});
// 时间格式化
Date.prototype.format = function (format) {
    /*
    * eg:format="yyyy-MM-dd hh:mm:ss";
    */
    if (!format) {
        format = "yyyy-MM-dd hh:mm:ss";
    }

    var o = {
        "M+": this.getMonth() + 1, // month
        "d+": this.getDate(), // day
        "h+": this.getHours(), // hour
        "m+": this.getMinutes(), // minute
        "s+": this.getSeconds(), // second
        "q+": Math.floor((this.getMonth() + 3)/3), // quarter
        "S": this.getMilliseconds()
        // millisecond
    };

    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }

    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
};

//---------

var editIndex = undefined;

var dg;

$('#tt').tabs({
    border:false,
    onSelect:function(title,index){

    	if(index == 0){
    		
    		if(dg){endEditing(dg);}
    		
    		dg = '#projectFinanceDataGrid';
    		//editIndex = undefined;
    	}
    	
    	if(index == 1 ){
    		
    		if(dg){endEditing(dg);}
    		dg = '#projectRegCostDatagrid';
    		//editIndex = undefined;
    	}
    	
    

    }
});


function endEditing(dg){
	
	//dg = datagrid;
	
    if (editIndex == undefined){return true}
    if ($(dg).datagrid('validateRow', editIndex)){
        $(dg).datagrid('endEdit', editIndex);
        editIndex = undefined;
        return true;
    } else {
        return false;
    }
}
function onClickCell(index, field){
    if (editIndex != index){
    	
        if (endEditing(dg)){
            $(dg).datagrid('selectRow', index)
                    .datagrid('beginEdit', index);
            var ed = $(dg).datagrid('getEditor', {index:index,field:field});
            if (ed){
                ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
            }
            editIndex = index;
        } else {
            setTimeout(function(){
                $(dg).datagrid('selectRow', editIndex);
            },0);
        }
    }
}
function onEndEdit(index, row){
    var ed = $(this).datagrid('getEditor', {
        index: index,
        field: 'projectId'
    });
  //row.productname = $(ed.target).combobox('getText');
}
function append(dg){
    if (endEditing(dg)){
        $(dg).datagrid('appendRow',{});
        editIndex = $(dg).datagrid('getRows').length-1;
        $(dg).datagrid('selectRow', editIndex)
                .datagrid('beginEdit', editIndex);
    }
}

var dg1 ;
var itemId ;
var url;
var isdel = false;
function removeitFinanceItem(dg){
    if (editIndex == undefined){return}
    
    var selected = $(dg).datagrid('getSelected');
    url = '${path}/projectFinanceItem/delete';
    
    dg1 = dg;
    itemId = selected.financeItemId;
    
   
    
    $.messager.confirm('询问', '您是否要删除当前项目？', function(b) {
        if (b) {
        
        	if(!isNaN(itemId)){
             	removeItem(url,itemId,dg1);
        	 }
        	
        	
        }
    });
    
}



function removeitCostItem(dg){
    if (editIndex == undefined){return}
    
    var selected = $(dg).datagrid('getSelected');
    
    var url = '${path}/projectRegItem/delete'
    
    dg1 = dg;
    itemId = selected.projectRegId;
    //parent.
    	$.messager.confirm('询问', '您是否要删除当前项目？', function(b) {
            if (b) {
            	
            	if(!isNaN(itemId)){
                 	removeItem(url,itemId,dg1);
                 	//editIndex = undefined;
            	 }
            }
        });
    	     
  
}

function accept(dg){
    if (endEditing(dg)){
        $(dg).datagrid('acceptChanges');
    }
}
function reject(dg){
    $(dg).datagrid('rejectChanges');
    editIndex = undefined;
}
function getChanges(dg){
    var rows = $(dg).datagrid('getChanges');
    alert(rows.length+' rows are changed!');
}


function removeItem(url,id,dg){
	
    progressLoad();
    $.post(url, {
        id : id
    }, function(result) {
        if (result.success) {
            $.messager.alert('提示', result.msg, 'info');
            $(dg).datagrid('deleteRow', editIndex);
            
            editIndex = undefined;
          //  projectRegHeadDataGrid.datagrid('reload');
        }else{
        	
        	$.messager.alert('提示', '删除失败', 'info');
        }
        progressClose();
    }, 'JSON');
	
}


</script>


