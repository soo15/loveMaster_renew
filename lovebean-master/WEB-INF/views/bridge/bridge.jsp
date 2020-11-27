<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/ghead.jsp"%>
<%@ include file="../include/jhead.jsp"%>

        
    <script>
        $(function(){
    
            $.cookie("__menuId",   "${bridgeMenuId}");
            $.cookie("__menuType", "header");
    
            gf_submitMovePage("${bridgeMenuUrl}", "pLinkSepCd=menuLink&${bridgeParam}");
    
        });
    </script>

<body>
</body>
