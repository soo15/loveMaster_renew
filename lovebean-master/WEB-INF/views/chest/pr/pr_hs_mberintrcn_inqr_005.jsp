<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">
    var myGrid = null;
    var CURR_PAGE_NO = "<c:out value='${paramMap.currPageNo}' />";

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        myGrid = gf_initMyGrid();
        
        setBhfNm();
        
        selectMberintrcnList(!gf_isNull(CURR_PAGE_NO) ? Number(CURR_PAGE_NO) : 1);
        
        $("#pBhfCode").off("change").on("change", function(){
            // 지회 선택할 때는 검색어를 초기화
            $("#pHonorNm").val("");
            setBhfNm();
            selectMberintrcnList();
        });
        
        $("#btnSearch").off("click").on('click', function(e){
            selectMberintrcnList();
        });
        
        $("#pHonorNm").off("keypress").on("keypress", function(e){
            if(e.keyCode == 13){
                selectMberintrcnList();
            }
        });
    });
    
    /*************************************************************
     * Ajax Send Event Function !!
     *************************************************************/
    /*===========================================================
     * Mberintrcn 목록 조회 !!
     *===========================================================*/
    function selectMberintrcnList(pageNo){
        gf_send("<c:url value='/pr/hs/selectMberintrcnList.do' />", gf_searchParam(pageNo));
    }
    
    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * 홍보대사 리스트 조회 Callback Function !!
     *===========================================================*/
     function selectMberintrcnListAfter(data){
        $("#dataGridList").html('');
        $('#dataGridPageNavi').html('');
         
        var listInfo = data.listInfo;
        var pageInfo = data.pageInfo;

        var listHtml = "";
        
        for(var i=0; i<listInfo.length; i++){
            var honorSn     = listInfo[i].honorSn;
            var bhfHonorSn  = listInfo[i].bhfHonorSn;
            var honorNm     = listInfo[i].honorNm;
            var serverFileNm= listInfo[i].serverFileNm;
            var fileExtsn   = listInfo[i].fileExtsn;
            var flpth       = listInfo[i].flpth;
            
            var imgSrc      = "${genFilePath}" + flpth + "/" + serverFileNm + "." + fileExtsn;
            
            listHtml += '<li>';
            listHtml += '    <a href="javascript:;" class="gallery-link">';
            if(serverFileNm != ''){
                listHtml += '       <div class="gallery-img"><img src="' + imgSrc + '" alt="' + honorNm + '"></div>';
            }else{
                listHtml += '       <div class="gallery-img"><img src="/common/img/common/no-img.jpg" alt=""></div>';
            }
            listHtml += '       <p class="gallery-tit"><b>' + honorNm + '</b><span>' + honorSn + '</span></p>';
            listHtml += '    </a>'; 
            listHtml += '</li>';
            
        }
        
        $("#dataGridList").html(listHtml);
        
        if(listInfo.length != 0){
            myGrid.makePageNvai(pageInfo, "selectMberintrcnList");
        }
    }
    
    function setBhfNm(){
        $("#bhfNm").html($("#pBhfCode option:selected").text());
    }
</script>

<div class="sub-visual visual02_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">아너 소사이어티</h2>
        <p class="title-sub-txt">2depth 설명글 수급 중입니다.</p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area" id="searchArea">
        <div class="contents-hd">
            <h3><strong>회원소개</strong><span>나눔문화를 선도하는 고액기부자 클럽입니다.<b>(나눔콜센터 080-890-1212)</b></span></h3>
            <div class="contents-menu-nav"></div>
        </div>

        <div class="seo-box cckgrop04">
            <input type="hidden" id="pageCount" name="pageCount" value="12">
            <div class="gallery-list type-person">
                <div class="gallery-list-tit">
                    <div class="gallery-list-tit-wrap">
                        <strong id="bhfNm"></strong>
                        <p>※ 회원 명단은 수시로 업데이트 되고 있으며, 실명회원에 한하여 소개하고 있습니다.</p>
                    </div>
                    <div class="sort-area">
                        <div class="sort-area-item">
                            <div class="ui-select">
                                <select id="pBhfCode" name="pBhfCode" title="지회코드">
                                    <c:out value="${pBhfCode}" escapeXml="false" />
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <ul id="dataGridList"></ul>
            </div>

            <!-- Page Navigation Area Start -->
            <div id="dataGridPageNavi" class="paging-area"></div>
            <!-- // Page Navigation Area -->

            <div class="bbs-search">
                <div class="search-area">
                    <div class="search-col int">
                        <input type="text" class="inp-base ui-inpcancel" id="pHonorNm" name="pHonorNm" value="${paramMap.pHonorNm }" title="검색어 입력">
                    </div>
                    <div class="search-col btns"><button type="button" class="btn-base-imp" id="btnSearch">검색</button></div>
                </div>
            </div>
            
        </div>
    </div>
</main>
