<%--
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : breadcrumbs.jsp
 * Author      : Chest Front
 * Date        : 2019. 8. 1.
 * Description : [ Layout ] breadcrumbs Page
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

<script type="text/javascript">
    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        
    });
</script>

<div class="base-breadcrumbs" id="baseBreadcrumbs">
    <div class="breadcrumb-wrap" id="uiBreadcrumb">
        <div class="breadcrumb-bar">
            <strong class="hide">current position</strong>
            <a href="javascript:;" OnClick="chestMainClickEvent();" class="breadcrumb-home"><i class="sprite-breadcrumb_home">home</i></a>
            <div class="breadcrumb-depth depth-1" id="breadcrumbDep1"></div>
            <div class="breadcrumb-depth depth-2" id="breadcrumbDep2"></div>
            <div class="breadcrumb-depth depth-3" id="breadcrumbDep3"></div>
        </div>
    </div>
</div>