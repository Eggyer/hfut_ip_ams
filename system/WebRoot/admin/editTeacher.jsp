<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminIndex.jsp' starting page</title>
    <base href="<%=basePath%>">
    <meta lang="zh-CN">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
	<!--CSS-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/starter-template.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
	<!--JavaScript-->
	<script src="${pageContext.request.contextPath}/jquery/jquery-2.2.2.js"  type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js" type="text/javascript"></script>
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick-zh-CN.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/ajaxutils.js'/>"></script>
<script type="text/javascript">
	function add() {
		$(".error").text("");
		var bool = true;
		if(!$(":text[name=tcName]").val()) {
			$("#tcNameError").text("教师名字不能为空");
			bool = false;
		}
		if(!$(":text[name=tcCollege]").val()) {
			$("#tcCollegeError").text("教师学院不能为空");
			bool = false;
		}
		if(bool) {
			$("form").submit();
		}
	}
	$(document).ready(function(e) {
        $("#myModal").modal("show");
		$(".btn-primary").mouseover(
			function(e)
			{
				$(".btn-primary").css({'background-color':'#090'});
			}
		);
		$(".btn-primary").mouseout(
			function(e)
			{
				$(".btn-primary").css({'background-color':'#000'});
			}
		);
    });	
</script>


<style type="text/css">
	.error {color:red;}
</style>
  </head>
  
  <body>
     <nav class="navbar navbar-default navbar-fixed-top"  id="nav_bg_cl">
        <div class="container" id="contain" role="navigation" >
            <div class="navbar-header" class="navbar-brand ">
           		
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#ul1" aria-expanded="false" aria-controls="navbar" >
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"  ></span>
                    <span class="icon-bar"  ></span>
                    <span class="icon-bar" ></span>
                </button>
                <div class="navbar-brand" >
                	<img src="${pageContext.request.contextPath}/images/logo.png" style=";margin:0px; padding:0px ; position:fixed;top:0.3%"/>
                </div>
            </div>
            <div class="collapse navbar-collapse" id="ul1" style="background-color:#000; margin-left:3.5%;padding-top:0%;" >
                <ul class="nav navbar-nav navbar-left">
               		<li><a href="#" id="fond_black1">考勤管理系统</a></li>
					<li><a href="<c:url value='/admin/addCourse.jsp'/>" id="fond_black">添加课程</a></li>
    				<li><a href="<c:url value='/AdminServlet?method=preAddStudent'/>" id="fond_black">添加学生</a></li>
    				<li><a href="<c:url value='/admin/addTeacher.jsp'/>" id="fond_black">添加老师</a></li>
    				<li><a href="<c:url value='/AdminServlet?method=preAddAssistant'/>" id="fond_black">添加导员</a></li>
    				<li><a href="<c:url value='/admin/addAcLinker.jsp'/>" id="fond_black">添加班级</a></li>
    				<li><a href="<c:url value='/admin/queryCourse.jsp'/>" id="fond_black">查询课程</a></li>
    				<li><a href="<c:url value='/admin/queryStudent.jsp'/>" id="fond_black">查询学生</a></li>
    				<li><a href="<c:url value='/admin/queryTeacher.jsp'/>" id="fond_black">查询老师</a></li>
    				<li><a href="<c:url value='/admin/queryAssistant.jsp'/>" id="fond_black">查询导员</a></li>
    				<li><a href="<c:url value='/admin/queryAcLinker.jsp'/>" id="fond_black">查询班级</a></li>
                </ul>
            </div>
        </div>       
    </nav>
    <img border='0' src="${pageContext.request.contextPath}/images/bg.jpg" width='100%' height='100%' style='position:fixed;left:0px;top:0px;z-index: -3'>
    <div style="width:100% ;height:100%; opacity:0.4;position:fixed;left:0px;top:0px;z-index:-1; background-color:#000">
    </div>
    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="	opacity:0.6;;position: fixed;top:30%;left:30%;height: 10%;width: 40%">
      show
    </button>  
    <div class="modal fade col-sm-12" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header" align="center" style="border: 0px;">

            <h4 class="modal-title"  style=" color:#000;">编辑教师信息</h4>
          </div>
          <div class="modal-body">
				<form action="<c:url value='/AdminServlet'/>" method="post" style="text-align:center">
						<input type="hidden" name="method" value="editTeacher"/>
						 	<div class="form-group">
                                 <label for="tcID">教师工号</label>
                                 <lable id="tcID">${tc.tcID}</lable>
								 <input type="hidden" name="tcID" value="${tc.tcID }"/>
                            </div>
							<div class="form-group">
                                 <label for="tcNameid">教师姓名</label>
                                 <input type="text" name="tcName" id="tcNameid"  value="${tc.tcName }">
             					 <label id="tcNameError" class="error"></label>
                            </div>	
                            <div class="form-group">
                                 <label for="tcCollegeid">教师学院</label>
          						 <input type="text" name="tcCollege" id="tcCollegeid" value="${tc.tcCollege}">
             					 <label id="tcCollegeError" class="error"></label>
                            </div>		
							<button type="submit" class="btn btn-default btn-sm" >编辑</button>
							<button type="reset" class="btn btn-default btn-sm">重置</button>
				</form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>

  </body>
</html>
