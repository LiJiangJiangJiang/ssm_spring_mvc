<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"  rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/bootstrap-table.css"  rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap-table.js"></script>
</head>
<body>
		<div id="toolbar">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addLayer"> <span class="glyphicon glyphicon-plus"></span>添加记录 </button>
	    </div>
<table  class="table table-hover table table-striped"  id="data-table">
		<thead>
			    <th>id</th>
				<th>username</th>
				<th>password</th>
		</thead>
		<tbody>
			<c:forEach items="${itemList}" var="item">
				 <tr>
				    <td>${item.id}</td>
				    <td>${item.username}</td>
				    <td>${item.password}</td>
				    <td>
				    	<button class="btn btn-success btn-xs"  data-toggle="modal" data-target="#editLayer" onclick="editItems(${item.id})"><span class="glyphicon glyphicon-pencil"></span>修改</button>
				    	<button class="btn btn-danger btn-xs" onclick="deleteItem(${item.id})"><span class="glyphicon glyphicon-remove"></span>删除</button>
				    	
				    </td>

				</tr>
				
			</c:forEach>		                    
             
		</tbody>
	</table>

	<!-- 			记录添加弹出层 -->
			
			<div class="modal fade" id="addLayer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog">
			        <div class="modal-content">
			          <div class="modal-header">
			          
			            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			            <h4 class="modal-title">添加记录</h4>
			            
			          </div>
			            <div class="modal-body">
				            <form id="add_items_form" class="form-horizontal">
				                <input type="hidden" class="form-control" name="id"> <br>
								<input type="text" class="form-control" placeholder="用户名" name="username"> <br>
	                            <input type="password" class="form-control" placeholder="密码" name="password">
	                        </form>
				        </div>
			          
			          
			          <div class="modal-footer">
			            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
			            <button class="btn btn-primary" type="button" onclick="addItem()">确认添加</button>
			          </div>
			          
			        </div>
			      </div>
			</div>
			 <!-- <div style="height:200px"></div> -->
			 
<!-- 			查询记录  -->
<%-- 			 <form id="search_form" action="${pageContext.request.contextPath }/admin/items/allList.do" method="post"> --%>
<!-- 	           <div class="row"> -->
<!-- 	                 <div class="col-md-2"> -->
<!-- 	                       <input type="text" id="search_item_name" class="form-control input-sm" placeholder="输入用户名" name="username" value=""> -->
<!-- 	                 </div>                 -->
<!-- 	                 <div class="col-md-9"> -->
	                    
<!-- 	                    <button id="search_btn" type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span>查询</button>&nbsp;&nbsp; -->
<!-- 	                 </div> -->
<!-- 	            </div>  -->
<!--              </form> -->
             
             
  <!-- 			记录修改弹出层 -->
			<div class="modal fade" id="editLayer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog">
			        <div class="modal-content">
			          <div class="modal-header">
			          
			            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			            <h4 class="modal-title">修改记录</h4>
			            
			          </div>
			            <div class="modal-body">
				            <form id="edit_items_form" class="form-horizontal">
				                <input type="hidden" id="edit_item_id" class="form-control" name="id"> <br>
								<input type="text" id="edit_item_username" class="form-control" placeholder="用户名" name="username"> <br>
	                            <input type="password" id="edit_item_password" class="form-control" placeholder="密码" name="password">
	                        </form>
				        </div>
			          
			          
			          <div class="modal-footer">
			            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
			            <button class="btn btn-primary" type="button" onclick="updateItem()">确认修改</button>
			          </div>
			          
			        </div>
			      </div>
			</div>
			 <!-- <div style="height:200px"></div> -->   
</body>
<script type="text/javascript">
  $(function(){
	  init();
  })
  function init(){
// 	  alert("初始化界面...");
  }
  
//   删除
  function deleteItem(id){
	 if(confirm("确定要删除该记录吗？")){
		 $.post(
					"${pageContext.request.contextPath }/admin/items/delete.do",
					{"id":id},
					function(){
						alert("删除成功！");
						window.location.reload();
					}
				);
	 }
  }
  
	//添加记录
	function addItem(){
		$.ajax({
			type:"POST",
			data:new FormData($("#add_items_form")[0]),
			url:"${pageContext.request.contextPath }/admin/items/save.do",
			
			cache:false,
			contentType:false,
			processData:false,
			success:function(){
				alert("记录添加成功!");
				window.location.reload();
			}
		});
	}
	
// 	“确认修改”按钮的点击事件
	function updateItem(){
		$.ajax({
			type:"POST",
			data:new FormData($("#edit_items_form")[0]),
			url:"${pageContext.request.contextPath }/admin/items/update.do",
			
			cache:false,
			contentType:false,
			processData:false,
			success:function(){
				alert("修改成功!");
				window.location.reload();
			}
		});
	}
	
	//点击“修改”按钮，打开编辑窗口，回显数据
	function editItems(id){
		$("#edit_items_form")[0].reset();
		$.ajax({
			type:"POST",
			data:{"id":id},
			url:"${pageContext.request.contextPath }/admin/items/edit.do",
			
			dataType:"json",
			success:function(data){
				$("#edit_item_id").val(data.id);
				$("#edit_item_username").val(data.username);
				$("#edit_item_password").val(data.password);

			}
		});
	}
	
	
// 	分页插件bootstrap-table
	var $table = $('#data-table');
	//查询参数
	var queryParams = {id: 1};

//	 	$table.bootstrapTable('destroy');    //先销毁表格
	 	//初始化表格
	$table.bootstrapTable({
		//表格参数
        url: '${pageContext.request.contextPath }/admin/items/user/allList.do', //请求地址
        method: "post",  //请求方式
        contentType: "application/x-www-form-urlencoded",   //请求内容类型
        dataType: "json",  //数据类型
//        height: '582',  //table高度：如果没有设置，表格自动根据记录条数觉得表格高度
        striped: true,  //是否显示行间隔色
        sortable: true,  //是否启用排序
        sortOrder: "asc",  //排序方式
        cache: false,  //是否使用缓存
        toolbar: "#toolbar",  //指定工具栏
        uniqueId: "id",   //每行的唯一标识
        showRefresh: true,  //显示刷新按钮
        showToggle: true,   //切换显示样式
        cardView: false,  //默认显示详细视图
        search: true,  //是否显示搜索
        pagination: true,  //是否显示分页
        clickToSelect: false,   //是否启用点击选中行
        minimumCountColumns: 2,   //最少要显示的列数
        showColumns: true,   //显示隐藏列
        undefinedText: '-',    //cell没有值时显示
        //分页方式：client客户端分页，server服务端分页
/*	              指定。注意，这两种后台传过来的json数据格式也不一样 
		client : 正常的json array格式 [{},{},{}] 
		server： {“total”:0,”rows”:[]} 其中total表示查询的所有数据条数，后面的rows是指当前页面展示的数据量。*/
        sidePagination: "client",
        pageSize: 10,  //每页的记录行数
        pageNumber: 1,   //初始化加载第1页，默认第1页
        pageList: "[5,10, 20, 50, 80, 100]",    //可供选择的每页的行数
        paginationFirstText: "首页",
        paginationPreText: "上一页",
        paginationNextText: "下一页",
        paginationLastText: "末页",
        buttonsClass: 'btn',   //按钮样式
        iconSize: 'pager',   //分页器class
        queryParams: queryParams,    //查询条件
        //列参数
        //表头
	    columns: [
	  
        {
	        field: 'id',
	        title: 'id',
	        align: 'center' // 居中显示
	    }, {
	        field: 'username',
	        title: '用户名',
	        align: 'center' // 居中显示
	    }, {
	        field: 'password',
	        title: '密码',
	        align: 'center' // 居中显示
	    } ,
	    {
	     	title: '操作',
	    	checkbox: false,
	    	align: 'center' // 居中显示
	    } ],
	    
	    onLoadSuccess: function (res) {//可不写
        //加载成功时
        	console.log(res);
        }, 
        
        onLoadError: function (statusCode) {
            return "加载失败了"
        }, 
        
        formatLoadingMessage: function () {
            //正在加载
            return "拼命加载中...";
        }, 
        
        formatNoMatches: function () {
            //没有匹配的结果
            return '无符合条件的记录';
        }

		});
		
		// 获取表格所有已经勾选的行数据，为一个对象数组
		var selects = $table.bootstrapTable('getSelections');
	
		//刷新
		$("#btnRefresh").on('click', function(){
			$table.bootstrapTable('refresh');
		});
	
	

</script>
</html>
