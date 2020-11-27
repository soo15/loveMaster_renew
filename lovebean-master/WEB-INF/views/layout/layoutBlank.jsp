<%--
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : layoutBlank.jsp
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Layout ] layoutBlank Page
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01   
 *************************************************************************************************
--%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../include/ghead.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title><tiles:insertAttribute name="title" ignore="true" /></title>
        
        <%@ include file="../include/jhead.jsp"%>
                
        <script type="text/javascript">
            /*===========================================================
             * Page Loading !!
             *===========================================================*/
            $(document).ready(function(){
                
            });
            
            /*************************************************************
             * Event Function !!
             *************************************************************/
        </script>
    </head>
    
    <body>
        <div class="wrapper">
            <!-- content Start -->
            <div class="content_wrap">
                <tiles:insertAttribute name="body"/>
            </div>
        </div>
    </body>
</html>