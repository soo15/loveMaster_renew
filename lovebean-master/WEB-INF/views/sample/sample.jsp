<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../include/ghead.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>User Management</title>
        
        <%@ include file="../include/jhead.jsp"%>
        
        <script type="text/javascript">
            /*===========================================================
             * Page Loading !!
             *===========================================================*/
            $(document).ready(function(){
                
            });
            
            /*************************************************************
             * Button Click Event Function !!
             *************************************************************/
            /*===========================================================
             * Button Click Event
             *===========================================================*/
            $(document).on("click", "#btnSearch", function(e){
                e.preventDefault();
                
                var id = $(this).attr("id");
                
                // Button Click Event
                if(id == "btnSearch"){                  // [ Button ] 검색 !!
                    searchUserMgmtList();
                } else if(id == "btnInitPass"){         // [ Button ] 비밀번호 초기화 !!
                    storeUserMgmtInitPass();
                } else if(id == "btnUserSync"){         // [ Button ] 사용자 동기화 !!
                    // Sync
                }
            });
            
            /*************************************************************
             * Ajax Send Event Function !!
             *************************************************************/
            /*===========================================================
             * 사용자 리스트 조회 !!
             *===========================================================*/
            function searchUserMgmtList(pageNo){
                // gf_initializeList("roleMenuList"); // 사용자별 메뉴 권한 리스트 초기화 !!
                
                // gf_send("<c:url value='/system/searchUserMgmtList.do' />", gf_searchParam(pageNo));
            }
            
            
            /*************************************************************
             * Ajax Send Callback Function !!
             *************************************************************/
            /*===========================================================
             * 사용자 리스트 조회 Callback Function !!
             *===========================================================*/
             function searchUserMgmtListAfter(data){
                 var listObj = data.listInfo;
                 var bodyHtml = "";
                 
                 for(var i=0; i<listObj.length; i++){
                     var no         = listObj[i].NO;
                     var cdCompany  = listObj[i].CD_COMPANY;
                     var nmCompany  = listObj[i].NM_COMPANY;
                     var pathNm     = listObj[i].PATH_NM;
                     var noEmp      = listObj[i].NO_EMP;
                     var idUser     = listObj[i].ID_USER;
                     var nmUser     = listObj[i].NM_USER;
                     
                     bodyHtml += '<tr>';
                     bodyHtml += '    <td class="tc"><input id="listChk" name="listChk" type="radio" class="cursorP"  OnClick="gf_selectGridRow($(this).parent().parent());" /></td>';
                     bodyHtml += '    <td title="' + no        + '" class="tc list ellipsis">' + no        + '</td>';
                     bodyHtml += '    <td title="' + cdCompany + '" class="tc list ellipsis">' + cdCompany + '</td>';
                     bodyHtml += '    <td title="' + nmCompany + '" class="tl list ellipsis">' + nmCompany + '</td>';
                     bodyHtml += '    <td title="' + pathNm    + '" class="tl list ellipsis">' + pathNm    + '</td>';
                     bodyHtml += '    <td title="' + idUser    + '" class="tc list ellipsis">' + idUser    + '</td>';
                     bodyHtml += '    <td title="' + nmUser    + '" class="tc list ellipsis">' + nmUser    + '</td>';
                     bodyHtml += '</tr>';
                 }
                 
                 var args = new Object();
                 
                 args.bodyHtml     = bodyHtml;              // 결과 HTML
                 args.pageInfo     = data.pageInfo;         // Page Information
                 args.pageFunction = "searchUserMgmtList";  // Page Link Function : Search Function !!
                 
                 gf_makeListHtml(args);
            }
            
            /*===========================================================
             * 검색 조건 Enter Key Event !!
             *===========================================================*/
            $(document).on("keypress", "#pUserNm", function(e){
                if(e.keyCode == 13){
                    searchUserMgmtList();      // Default : Search UserMgmt List !!
                }
            });
        </script>
    </head>
    
    <body>
        <div id="content" class="main f_left">
            <div class="container">
                <!-- top navigation and button start -->
                <div class="sub_location">
                    <div class="loc"><c:out value="${__pageNavi}" escapeXml="false" /></div>
                </div>
                
                <div class="cont">
                    <div class="row search_tab">
                        <div class="head_title">
                            <h5><c:out value="${__pageTitle}" escapeXml="false" /></h5>
                            
                            <div class="fr">
                                <span class="btn01_ico"><a id="btnSearch"><img src="/common/images/ico/ico_search.png" /> 검색</a></span>
                                <span class="btn01_ico"><a id="btnInitPass"><img src="/common/images/ico/ico_accept.png" /> 비밀번호 초기화</a></span>
                                <!--
                                <span class="btn01_ico"><a id="btnUserSync"><img src="/common/images/ico/ico_sync.png" /> 사용자 동기화</a></span>
                                <span class="btn01_ico"><a id="btnInitPassAll"><img src="/common/images/ico/ico_white.png" /> 비밀번호 전체 초기화</a></span>
                                -->
                            </div>
                        </div>
                    </div>
                    <!-- // top navigation and button end -->
                    
                    
                    
                    <!-- search area start -->
                    <div id="searchArea" class="row table_form03 marginB20">
                        <table>
                            <colgroup>
                                <col style="width:12%;" /><!-- Title -->
                                <col style="width:22%;" /><!-- Value -->
                                <col style="width:12%;" /><!-- Title -->
                                <col style="width:54%;" /><!-- Value -->
                               
                            </colgroup>
                            <thead></thead>
                            <tbody>
                                <tr>
                                    <th class="tr paddingR10 ellipsis" title="회사">회사</th>
                                    <td colspan="1">
                                       <select id="pCompanyCd" name="pCompanyCd" >
                                           <c:out value="${companyCdCombo}" escapeXml="false" />
                                       </select>
                                    </td>
                                    <th class="tr paddingR10 ellipsis" title="사용자명">사용자명</th>
                                    <td colspan="1">
                                        <input id="pUserNm" name="pUserNm" type="text" placeholder="사용자명을 입력하세요." style="width:40%;" maxlength="30" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- // search area end -->
                    
                    
                    
                    <!-- User List table start-->
                    <div class="row table_form02 fl">
                        <div id="dataGridList">
                            <table class="th_01">
                                <colgroup>
                                    <col style="width:5%;"  /><!-- Radio -->
                                    <col style="width:5%;"  /><!-- No -->
                                    <col style="width:10%;" /><!-- 회사코드 -->
                                    <col style="width:25%;" /><!-- 회사명 -->
                                    <col style="width:30%;" /><!-- 부서 -->
                                    <col style="width:10%;" /><!-- 사용자ID -->
                                    <col style="width:15%;" /><!-- 사용자명 -->
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>선택</th>
                                        <th>NO</th>
                                        <th>회사코드</th>
                                        <th>회사명</th>
                                        <th>부서</th>
                                        <th>사용자ID</th>
                                        <th>사용자명</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                                <tfoot></tfoot>
                            </table>
                        </div>
                        
                        <!-- paging start -->
                        <div id="gridPageInfo" class="paging"></div>
                        <!-- paging end -->
                    </div>
                    <!-- // User List table end -->
                </div><!-- // cont end -->
            </div><!-- // .content_inner end -->
        </div><!-- // contents end -->
    </body>
</html>