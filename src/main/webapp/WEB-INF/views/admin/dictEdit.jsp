<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
 <%@ include file="/commons/basejs.jsp" %>
<!DOCTYPE html>
<html>

<body>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
         <form id="dictAddForm" method="post">
            <table class="grid" style="width:100%;height:90px">
                <tr>
                    <td>字典ID</td>
                    <td><input name="dicttypeid" id="dicttypeid" type="text" placeholder="请输入字典ID" class="easyui-validatebox" data-options="required:true,disabled:true" value="${dict.dicttypeid}"></td>
                    <td>字典名称</td>
                    <td><input name="dicttypename" id="dicttypename" type="text" placeholder="请输入字典名称" class="easyui-validatebox" data-options="required:true" value="${dict.dicttypename}"></td>
                </tr>
                <tr>
                    <td>字典编码</td>
                    <td><input name="dicttypecode" id="dicttypecode" type="text" placeholder="请输入字典编码" class="easyui-validatebox" data-options="required:true" value="${dict.dicttypecode}"></td>
                    <td>序号</td>
                    <td>
                        <input name="seqno" id="seqno" type="text" placeholder="请输入姓名" class="easyui-validatebox" data-options="required:true" value="${dict.seqno}">
                    </td>
                </tr>
                <tr>
                    <td>等级</td>
                    <td><input type="text" name="rank" id="rank" class="easyui-numberbox" value="${dict.rank}"/></td>
                   <td>类别</td>
                    <td><input type="text" name="dictcat" id="dictcat" class="easyui-validatebox" value="${dict.dictcat}"/>
                    </td>
                </tr>
            </table>
        </form>
       <br> 
     
       <!--  <table id="dataGrid" data-options="fit:true,border:false"></table> -->
        <table id="dataGrid" class="easyui-datagrid" title="" style="width:100%;height:auto"  
        data-options="
                clickToEdit:true,
                singleSelect: true,
                toolbar: '#toolbar',
                onClickCell: onClickCell
              
                "
                >
        <thead>
            <tr>
                <th data-options="field:'dicttypeid',width:80">字典ID</th>
                <th data-options="field:'dictid',width:80,editor:'text',readonly:true">项目编号</th>
                <th data-options="field:'dictname',width:80,editor:'text'">名称</th>
                <th data-options="field:'dictcode',width:80,editor:'text'">编码</th>
                <th data-options="field:'value',width:80,align:'right',editor:'numberbox'">值</th>
                <th data-options="field:'dictlevel',width:80,editor:'text'">计费单位</th>
                <th data-options="field:'status',width:80,editor:'numberbox'">状态</th>
                <th data-options="field:'sortno',width:80,editor:'text'">序号</th>
                <th data-options="field:'rank',width:80,editor:'text'">排序</th> 
          
            </tr>
           
        </thead>
    </table>
     
     
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="append()">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delDictEntry()">删除</a>
    </div>
      <a href="javascript:void(0)" id="submitButtom" class="easyui-linkbutton" onclick="save()" style="display:none">保存</a>
    </div>
</div>


<script type="text/javascript">

var dicttypeId = '<%= request.getParameter("dicttypeId")%>';


    $(function() {

    
    	var dictentry = $.parseJSON('${dictEntry}');
    	
    	var data = [];
    	
    	for(var i=0;i<dictentry.length;i++){
    		
    		data.push(dictentry[i]);
    		
    	}
    	
    	
    	$('#dataGrid').datagrid({ 
    		url:null   
    	  });
    	//获取数据
    	$('#dataGrid').datagrid('loadData',dictentry);
    	
    	
    	
    	var curr = null;
    	$(document).bind('mousedown',function(e){
    		var v = $(e.target).closest('div.datagrid-view');
    		if (v.length){
    			var dg = v.children('table');
    			if (!curr){
    				curr = dg;
    			} else if (dg[0] != curr[0]){
    				endEditingDg(curr);
    				curr = dg;
    			}
    		} else {
    			endEditingDg(curr);
    			curr = null;
    		}
    	});
    	
    	function endEditingDg(dg){
    		if (!$(dg).length){return}
    		var opts = dg.datagrid('options');
    		opts.finder.getTr(dg[0], null, 'editing').each(function(){
    			var index = parseInt($(this).attr('datagrid-row-index'));
    			dg.datagrid('endEdit', index);
    		});
    	}
    		
    	
        $('#userAddForm').form({
            url : '',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                
                
                
                return isValid;
            },
            success : function(result) {
               /*  progressClose();
                result = updateStr(result);
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('提示', result.msg, 'warning');
                } */
            }
        });
        
    });

    var editIndex = undefined;
    function endEditing(){
        if (editIndex == undefined){return true}
        if ($('#dataGrid').datagrid('validateRow', editIndex)){
            $('#dataGrid').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }   
    
    
    function append(){
        if (endEditing()){
        	
            $('#dataGrid').datagrid('appendRow',{});
            editIndex = $('#dataGrid').datagrid('getRows').length-1;
            $('#dataGrid').datagrid('selectRow', editIndex)
                    .datagrid('beginEdit', editIndex);
        }
    }   
    
    
 function newDictEntry(){
	 	
	 var row = $('#dataGrid').datagrid('getSelected');
		if (row){
			var index = $('#dataGrid').datagrid('getRowIndex', row);
		} else {
			index = 0;
		}
		$('#dataGrid').datagrid('insertRow', {
			index: index,
			row:{
				dicttypeid:$('#dicttypeid').val()
			}
		});
		
	    $('#dataGrid').datagrid('selectRow',index);
		$('#dataGrid').datagrid('beginEdit',index);
		
	
 }  
    
function delDictEntry(){
	
    var editIndex = undefined;	
	
	var selectRow = $('#dataGrid').datagrid("getSelections");
    if (selectRow.length == 0) {
           alert("当前未选中记录");
           return;
    }	
	
   
		
     editIndex =  $('#dataGrid').datagrid("getRowIndex", selectRow[0]);
    
	 if (editIndex == undefined){return}
     $('#dataGrid').datagrid('deleteRow', editIndex);
     editIndex = undefined;
     
 	$.ajax({
		
		   type: "GET",
		   url: "${path }/dictEntry/delete?id="+selectRow[0].dictid,
		   async: false,
		   success: function(result){
	
			   
			   if(result){
				  
				    progressClose();
	                result = updateStr(result);
	                result = $.parseJSON(result);
	                if (result.success) {
	                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');
	                    parent.$.messager.alert('提示', result.msg, 'success');
	                   // parent.$.modalDialog.handler.dialog('close');
	                } else {
	                    parent.$.messager.alert('提示', result.msg, 'warning');
	                }
				 		
			   } 

			   
			   
		   },
		   error:function(){
			  progressClose();
			  $.messager.progress('close');
			  $.messager.alert('删除失败！', result.msg, 'error');
		   }
	});
     
}  






function save(){
	
	
	 var isValid = $('#userAddForm').form('validate');
     if (!isValid) {
    	 alert("请输入必填项！");
         return;
     }
	
	
	var submitData = {};
	
    var data = $('#dataGrid').datagrid('getData');
    
    submitData.dicttypeid = $('#dicttypeid').val();
    submitData.dicttypename = $('#dicttypename').val();
    submitData.dicttypecode = $('#dicttypecode').val();
    submitData.seqno = $('#seqno').val();
    submitData.rank = $('#rank').val();
    submitData.dictcat = $('#dictcat').val();
    var ids = [];
    
    if(data.rows){
    	
     for(var i=0; i<data.rows.length; i++){
   	     ids.push(data.rows[i]);
   	 }
     
     submitData.dictEntry = ids;
     
    }
    	
     
    progressLoad();
    
	$.ajax({
		
		   type: "POST",
		   contentType: "application/json",
	       dataType: "json",
		   url: "${path }/dictType/edit",
		   data:JSON.stringify(submitData),
		   async: false,
		   success: function(result){
	
			   
			   if(result){
				  
				    progressClose();
	             //   result = updateStr(result);
	             //   result = $.parseJSON(result);
	                if (result.success) {
	                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
	                    parent.$.modalDialog.handler.dialog('close');
	                } else {
	                    parent.$.messager.alert('提示', result.msg, 'warning');
	                }
				 		
			   } 

			   
			   
		   },
		   error:function(){
			  progressClose();
			  $.messager.progress('close');
			  $.messager.alert('发送失败！', result.msg, 'error');
		   }
	});
    
} 

function onClickCell(index, field){
	
    if (editIndex != index){
        if (endEditing()){
            $('#dataGrid').datagrid('selectRow', index)
                    .datagrid('beginEdit', index);
            var ed = $('#dataGrid').datagrid('getEditor', {index:index,field:field});
            if (ed){
                ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
            }
            editIndex = index;
        } else {
            setTimeout(function(){
                $('#dataGrid').datagrid('selectRow', editIndex);
            },0);
        }
    }
    
    
}


</script>

</body>
</html>
