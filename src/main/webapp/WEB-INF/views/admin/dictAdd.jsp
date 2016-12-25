<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">

var dataGrid;


    $(function() {

    	 dataGrid = $('#dataGrid').datagrid({
             url : '',
             fit : true,
             striped : true,
             rownumbers : true,
             pagination : true,
             singleSelect : true,
             idField : 'id',
             sortName : 'createTime',
             sortOrder : 'asc',
             pageSize : 20,
             pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
             columns : [ [ {
                 width : '80',
                 title : '编号',
                 field : 'dicttypeid',
                 sortable : true
             }, {
                 width : '80',
                 title : '名称',
                 field : 'dictname'
                
             },{
                 width : '80',
                 title : '编码',
                 field : 'dictcode',
             },{
                 width : '80',
                 title : '值',
                 field : 'value'
             },{
                 width : '80',
                 title : '序号',
                 field : 'seqno'
                 
             },  
            
             {
                 width : '40',
                 title : '排序',
                 field : 'rank'
                 
             } 
               ] ],
             onLoadSuccess:function(data){
               
             },
             toolbar : '#toolbar'
         });
    
        $('#userAddForm').form({
            url : '',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                
                save();
                
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
        
    });
    
 function newDictEntry(){
	 
	 $('#dataGrid').datagrid('insertRow',{
			index: 1,	// index start with 0
			row: {
				
			}
		}); 
	 
 }  
    
function delDictEntry(){
	 var editIndex = undefined;	
	/*  $('#dataGrid').datagrid('deleteRow',{
			index: 1,	// index start with 0
			row: {
				
			}
		});  */
	
	var selectRow = $('#dataGrid').datagrid("getSelections");
    if (selectRow.length == 0) {
           alert("当前未选中记录");
           return;
    }	
	
   
		
     editIndex =  $('#dataGrid').datagrid("getRowIndex", selectRow[0]);
    
	 if (editIndex == undefined){return}
     $('#dataGrid').datagrid('deleteRow', editIndex);
     editIndex = undefined;
}  
  
function save(){
		
	var submitData = {};
	
    var rows = $('#dataGrid').datagrid('getChanges');
    
    submitData.dicttypeid = $('#dicttypeid').val();
    submitData.dicttypename = $('#dicttypename').val();
    submitData.dicttypecode = $('#dicttypecode').val();
    submitData.seqno = $('#seqno').val();
    submitData.rank = $('#rank').val();
    submitData.dictEntry = rows;
    
	$.ajax({
		   type: "POST",
		   url: "${path }/dictType/add",
		   data:submitData,
		   async: false,
		   success: function(msg){
	

			   if(msg){
				  
				  //var msg = JSON.parse(msg);
				 		
			   }

			   
			   
		   },
		   error:function(){
			  
			  $.messager.progress('close');
			  $.messager.alert('发送失败！', msg.msg, 'error');
		   }
	});
    
} 


</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
         <form id="dictAddForm" method="post">
            <table class="grid" style="width:100%;height:90px">
                <tr>
                    <td>字典ID</td>
                    <td><input name="dicttypeid" id="dicttypeid" type="text" placeholder="请输入字典ID" class="easyui-validatebox" data-options="required:true" value=""></td>
                    <td>字典名称</td>
                    <td><input name="dicttypename" id="dicttypename" type="text" placeholder="请输入字典名称" class="easyui-validatebox" data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>字典编码</td>
                    <td><input name="dicttypecode" id="dicttypecode" type="text" placeholder="请输入字典编码" class="easyui-validatebox" data-options="required:true" value=""></td>
                    <td>序号</td>
                    <td>
                        <input name="seqno" id="seqno" type="text" placeholder="请输入姓名" class="easyui-validatebox" data-options="required:true" value="">
                    </td>
                </tr>
                <tr>
                    <td>等级</td>
                    <td><input type="text" name="rank" id="rank" class="easyui-numberbox" value=""/></td>
                    <td></td>
                    <td>
                    </td>
                </tr>
            </table>
        </form>
       <br> 
     <div style="width:100%;height:400px">  
        <table id="dataGrid" data-options="fit:true,border:false"></table>
     </div>
     
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newDictEntry()">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delDictEntry()">删除</a>
    </div>
      <a href="javascript:void(0)" id="submitButtom" class="easyui-linkbutton" onclick="save()" style="width:80px">保存</a>
    </div>
</div>