<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">
    var myGrid = null;
    var TAB          = !gf_isNull("<c:out value='${paramMap.pTmplatTy}' />") ? "<c:out value='${paramMap.pTmplatTy}' />" : "TDG01";
    var TAB_IDX      = !gf_isNull("<c:out value='${paramMap.tabIdx}' />") ? "<c:out value='${paramMap.tabIdx}' />" : "1_0";
    var CURR_PAGE_NO = "<c:out value='${paramMap.currPageNo}' />";

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        myGrid = gf_initMyGrid();

        tabClickEvent($('<button type="button" data-tmplat_ty="' + TAB + '" data-tab_idx="' + TAB_IDX + '"></button>'), false);
        
        
        $("#btnSearch").off("click").on('click', function(e){
            selectPrvidopressList();
        });
        
//         $("#pBhfCode").off("change").on('change', function(e){
//             selectPrvidopressList();
//         });
        
        $("#pSj").off("keypress").on("keypress", function(e){
            if(e.keyCode == 13){
                selectPrvidopressList();
            }
        });
    });
    
    function initTab(_tabObj){
        var tmplatTy    = _tabObj.data("tmplat_ty");
        var tabIdx      = _tabObj.data("tab_idx");
        var tabOuterIdx = tabIdx.split('_')[0];
        var tabInnerIdx = tabIdx.split('_')[1];
        
        // 하위 탭 그룹 모두 숨긴 후 선택된 상위탭에 해당하는 하위 탭 그룹 보여주기
        $('div.ui-tab-btns.inner').hide();
        $('#tab' + tabOuterIdx + 'InnerTab').show();
        
        if(tabInnerIdx == "0"){ // 상위 탭 눌렀을 경우
            // 모든 상위 탭 selected class 제거 후 선택된 상위 탭 selected class 추가 
            if($('div.ui-tab-btns.outer button').hasClass('selected')){
                $('div.ui-tab-btns.outer button').removeClass('selected');
                
                $('div.ui-tab-btns.outer button[data-tab_idx="' + tabIdx + '"]').addClass('selected');
            }
            
            // 모든 하위 탭 selected class 제거 후 선택된 하위 탭 중 첫번째 탭에 selected class 추가
            if($('#tab' + tabOuterIdx + 'InnerTab div.tab-scroll-wrap button').hasClass('selected')){
                $('#tab' + tabOuterIdx + 'InnerTab div.tab-scroll-wrap button').removeClass('selected');
                
                $('#tab' + tabOuterIdx + 'InnerTab div.tab-scroll-wrap button[data-tab_idx="' + tabOuterIdx + '_1"]').addClass('selected');
            }
        }else{  // 하위 탭 눌렀을 경우
            /* 모든 상위 탭 selected class 제거 후 선택된 상위 탭 selected class 추가. 
            *  단, 하위 탭을 누른 것이므로 상위 탭 seledted class 추가할 탭의 idx 는 눌려진 하위 탭의 앞부분과 '_0' 문자열로 조합하여 생성. 
            */
            if($('div.ui-tab-btns.outer button').hasClass('selected')){
                $('div.ui-tab-btns.outer button').removeClass('selected');
                
                $('div.ui-tab-btns.outer button[data-tab_idx="' + tabOuterIdx + '_0"]').addClass('selected');
            }
            
            // 모든 하위 탭 selected class 제거 후 선택된 하위 탭 중 눌러진 탭에 selected class 추가
            if($('#tab' + tabOuterIdx + 'InnerTab div.tab-scroll-wrap button').hasClass('selected')){
                $('#tab' + tabOuterIdx + 'InnerTab div.tab-scroll-wrap button').removeClass('selected');
                
                $('#tab' + tabOuterIdx + 'InnerTab div.tab-scroll-wrap button[data-tab_idx="' + tabIdx + '"]').addClass('selected');
            }
        }
        
        setClass(tabOuterIdx);
        
        // 뉴스레터 이외 게시판에서는 지회선택 필요없음.
        if(tmplatTy == 'TDG11'){
            $("#pBhfCodeDiv").show();
        }else{
            $("#pBhfCodeDiv").hide();
        }
        
        $("#pTmplatTy").val(tmplatTy);
        $("#tabIdx").val(tabIdx);
    }
    
    function setClass(_tabOuterIdx){
        if($("#dataGridListDiv").hasClass("type-vod")){
            $("#dataGridListDiv").removeClass("type-vod");
        }
        
        if($("#dataGridListDiv").hasClass("type-press")){
            $("#dataGridListDiv").removeClass("type-press");
        }
        
        if(_tabOuterIdx == '1'){
            $("#dataGridListDiv").addClass("type-vod");
        }else{
            $("#dataGridListDiv").addClass("type-press");
        }
    }
    
    /*===========================================================
     * Tab Click 페이지 이동 !!
     *===========================================================*/
    function tabClickEvent(_tabObj, _flag){
        initTab(_tabObj);
        
        if(_flag){
            initParam();
        }
        
        selectPrvidopressList(!gf_isNull(CURR_PAGE_NO) ? Number(CURR_PAGE_NO) : 1);
    }
    
    /*===========================================================
     * parameter init
     *===========================================================*/
     function initParam(){
         CURR_PAGE_NO = 1;
         
         $("#pBhfCode").val("001");
         $plugins.uiSelect();
         
         $("#pSj").val("");
    }
    
    /*************************************************************
     * Ajax Send Event Function !!
     *************************************************************/
    /*===========================================================
     * Prvidopress 목록 조회 !!
     *===========================================================*/
    function selectPrvidopressList(pageNo){
        gf_send("<c:url value='/lf/intrcn/selectPrvidopressList.do' />", gf_searchParam(pageNo));
    }
    
    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * 게시판 리스트 조회 Callback Function !!
     *===========================================================*/
     function selectPrvidopressListAfter(data){
         $("#dataGridList").html('');
         $('#dataGridPageNavi').html('');
         
        var listInfo = data.listInfo;
        var pageInfo = data.pageInfo;
        
        var listHtml = "";
        
        var tabOuterIdx = $("#tabIdx").val().split('_')[0];
        var divClass    = "";
        if(tabOuterIdx == "1"){
            divClass = "gallery-img";
        }else{
            divClass = "press-img";
        }
        
        for(var i=0; i<listInfo.length; i++){
            var listSn      = listInfo[i].listSn;
            var sj          = listInfo[i].sj;
            var serverFileNm= listInfo[i].serverFileNm;
            var fileExtsn   = listInfo[i].fileExtsn;
            var flpth       = listInfo[i].flpth;
            
            listHtml += '<li>';
            listHtml += '    <a href="javascript:;" onClick="javascript:goPrvidopressDetail(this);" data-list_sn="' + listSn + '" class="gallery-link">';
            if(serverFileNm != ''){
                listHtml += '       <div class="' + divClass + '"><img src="${genFilePath}' + serverFileNm + '" alt="' + sj + '"></div>';
            }else{
                listHtml += '       <div class="' + divClass + '"><img src="/common/img/common/no-img.jpg" alt=""></div>';
            }
            listHtml += '       <p class="gallery-tit"><b>' + sj + '</b></p>';
            listHtml += '    </a>'; 
            listHtml += '</li>';
        }
        
        $("#dataGridList").html(listHtml);
        
        if(listInfo.length != 0){
            myGrid.makePageNvai(pageInfo, "selectPrvidopressList");
        }
    }
    
     /*===========================================================
      * Prvidopress 상세페이지로 이동 !!
      *===========================================================*/
     function goPrvidopressDetail(obj){
         var listSn = $(obj).data("list_sn");
         var param = gf_searchParam(GV_CURR_PAGE_NO);

         param += "&listSn=" + listSn;

         gf_submitMovePage("<c:url value='/lf/intrcn/initPrvidopressDetail.do' />", param);
     }
     
</script>

<div class="sub-visual visual02_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">홍보영상&인쇄물</h2>
        <p class="title-sub-txt">당신의 나눔이 모두의 행복입니다. <span class="mobile-block-mini">나눔의 힘을 믿어보세요.</span></p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3><strong>홍보영상&인쇄물</strong><span>사회복지공동모금회 홍보관입니다.</span></h3>
            <div class="contents-menu-nav"></div>
        </div>

        <div class="seo-box">
            <div class="ui-tab ui-tab-type2 contents-tab">
                <div class="ui-tab-btns outer">
                    <button type="button" class="ui-tab-btn selected" data-tmplat_ty="TDG01" data-tab_idx="1_0" onClick="javascript:tabClickEvent($(this), true);"><i>영상</i></button>
                    <button type="button" class="ui-tab-btn" data-tmplat_ty="TDG05" data-tab_idx="2_0" onClick="javascript:tabClickEvent($(this), true);"><i>출판 및 인쇄</i></button>
                </div>
                <div class="ui-tab-pnls">
                    <section>
                        <div class="tab-contents" id="searchArea">
                            <input type="hidden" id="pageCount" name="pageCount" value="8">
                            <input type="hidden" id="tabIdx" name="tabIdx" value="${paramMap.tabIdx}">
                            <input type="hidden" id="pTmplatTy" name="pTmplatTy" value="${paramMap.pTmplatTy }"/>
                            <div class="ui-tab type-sub tab-scroll">
                                <div class="ui-tab-btns inner" id="tab1InnerTab" style="display:none;">
                                    <div class="tab-scroll-wrap">
                                        <button type="button" class="ui-tab-btn selected" data-tmplat_ty="TDG01"data-tab_idx="1_1" onClick="javascript:tabClickEvent($(this), true);"><i>광고영상</i></button>
                                        <button type="button" class="ui-tab-btn" data-tmplat_ty="TDG02"data-tab_idx="1_2" onClick="javascript:tabClickEvent($(this), true);"><i>소개영상</i></button>
                                        <button type="button" class="ui-tab-btn" data-tmplat_ty="TDG03"data-tab_idx="1_3" onClick="javascript:tabClickEvent($(this), true);"><i>TV방송영상</i></button>
                                    </div>
                                </div>
                                <div class="ui-tab-btns inner" id="tab2InnerTab" style="display:none;">
                                    <div class="tab-scroll-wrap">
                                        <button type="button" class="ui-tab-btn selected" data-tmplat_ty="TDG05" data-tab_idx="2_1" onClick="javascript:tabClickEvent($(this), true);"><i>화보</i></button>
                                        <button type="button" class="ui-tab-btn" data-tmplat_ty="TDG06" data-tab_idx="2_2" onClick="javascript:tabClickEvent($(this), true);"><i>인쇄광고</i></button>
                                        <button type="button" class="ui-tab-btn" data-tmplat_ty="TDG07" data-tab_idx="2_3" onClick="javascript:tabClickEvent($(this), true);"><i>미담·지원사례집</i></button>
                                        <button type="button" class="ui-tab-btn" data-tmplat_ty="TDG08" data-tab_idx="2_4" onClick="javascript:tabClickEvent($(this), true);"><i>배분사례집</i></button>
                                        <button type="button" class="ui-tab-btn" data-tmplat_ty="TDG03" data-tab_idx="2_5" onClick="javascript:tabClickEvent($(this), true);"><i>홍보 인쇄물</i></button>
                                        <button type="button" class="ui-tab-btn" data-tmplat_ty="TDG09" data-tab_idx="2_6" onClick="javascript:tabClickEvent($(this), true);"><i>연간보고서</i></button>
                                        <button type="button" class="ui-tab-btn" data-tmplat_ty="TDG10" data-tab_idx="2_7" onClick="javascript:tabClickEvent($(this), true);"><i>기부자 결과보고</i></button>
                                        <button type="button" class="ui-tab-btn" data-tmplat_ty="TDG11" data-tab_idx="2_8" onClick="javascript:tabClickEvent($(this), true);"><i>뉴스레터</i></button>
                                    </div>
                                </div>
                                <div class="ui-tab-pnls">
                                    <section>
                                        <h1 class="hide" id="tabTitle"></h1>
                                        <div class="tab-contents">
                                            <div id="dataGridListDiv" class="gallery-list <c:if test="${fn:split(paramMap.tabIdx,'_')[0] eq '1'}">type-vod</c:if><c:if test="${fn:split(paramMap.tabIdx,'_')[0] eq '2'}">type-press</c:if>
                                            ">
                                                <ul id="dataGridList"></ul>
                                            </div>
                                            <!-- Page Navigation Area Start -->
                                            <div id="dataGridPageNavi" class="paging-area"></div>
                                            <!-- // Page Navigation Area -->
                                            
                                            <div class="bbs-search">
                                                <div class="search-area">
                                                    <div class="search-col select">
                                                        <div class="ui-select" id="pBhfCodeDiv">
                                                            <select id="pBhfCode" name="pBhfCode" title="지회코드">
                                                                <c:out value="${pBhfCode}" escapeXml="false" />
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="search-col int">
                                                        <input type="text" class="inp-base ui-inpcancel" id="pSj" name="pSj" value="${paramMap.pSj }" title="검색어 입력">
                                                    </div>
                                                    <div class="search-col btns"><button type="button" class="btn-base-imp" id="btnSearch">검색</button></div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
</main>
