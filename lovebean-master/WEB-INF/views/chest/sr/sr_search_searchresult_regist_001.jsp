<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../include/ghead.jsp"%>
<script type="text/javascript">
    var myGrid = null;
    var CURR_PAGE_NO = "<c:out value='${paramMap.currPageNo}' />";
    var CUR_KEYWORD = "<c:out value='${paramMap.keyword}' />";


    String.prototype.toByte=function() {
        var str = this;
        var len = 0;
        for(var i = 0; i < str.length; i++) {
            if(escape(str.charAt(i)).length >= 4)
                len += 2;
            else if(escape(str.charAt(i)) == "%A7")
                len += 2;
            else
                if(escape(str.charAt(i)) != "%0D")
                    len++;
        }
        return len;
    };

    String.prototype.cutByte=function(len, disp) {
        var str = this;
        var count = 0;
        for(var i = 0; i < str.length; i++) {
            if(escape(str.charAt(i)).length >= 4)
                count += 2;
            else
                if(escape(str.charAt(i)) != "%0D")
                    count++;
            if(count >  len) {
                if(escape(str.charAt(i)) == "%0A")
                    i--;
                break;
            }
        }
        var dispStr = str.substring(0, i);

        if(this.toByte() > len) {
            dispStr = dispStr + disp;
        }

        return dispStr;
    };


    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        myGrid = gf_initMyGrid();

        if (CUR_KEYWORD != "") {
            selectSearchList(!gf_isNull(CURR_PAGE_NO) ? Number(CURR_PAGE_NO) : 1, CUR_KEYWORD);
        }

        /*===========================================================
         * Button Click Event
         *===========================================================*/
        $(document).on("click", "#btnFind", function(e){
            e.preventDefault();
            var id = $(this).attr("id");

            var _val = $("#findKeyword").val().replace(/(^\s*)|(\s*$)/g, "");

            if( id == "btnFind") {
                if (gf_isNull(_val)) {
                    alert("검색 키워드를 입력 해주세요.");
                    return false;
                }

                var _valArr = _val.split(' ');
                for(var i=0; i< _valArr.length; i++) {
                    if (_valArr[i].length < 2) {
                        alert("각단어의 검색 키워드를 두글자 이상 해주세요.");
                        return false;
                    }
                }
                CUR_KEYWORD = _val;
                selectSearchList(!gf_isNull(CURR_PAGE_NO) ? Number(CURR_PAGE_NO) : 1);
            }
        });

        $("#findKeyword").keyup(function(e) {
            if (e.which == 13) {
                $("#btnFind").trigger("click");
                $(this).blur();
                return false;
            }
        });


    });

    function eSearchLinkPage(url, mId, bCd) {

        var branchUrl = $("#linkBranchUrl", $("input[name='linkBranchCd'][value='"+bCd+"']").parent()).val()

        var _url = url;
        var _header = "header";
        var _param = "";
        if(url.indexOf('?') > -1) {
            _url = url.substring(0, url.indexOf('?'));
            _param = url.substring(url.indexOf('?')+1);
        }
        var _menu = $plugins.common.findMenuId(_url);

        if(_menu[0] != undefined && _menu[0]  != "") {
            mId = _menu[0];
            _header = _menu[1];
        }

        branchUrl += _url.substring(1);

        $.cookie("__menuId",   mId);
        $.cookie("__menuType", "header");
        $.cookie("__branchCd",   bCd);

        var param = "pLinkSepCd=menuLink";
        param += "&pBranchCd=" + bCd;
        param += "&bhfCode=" + bCd;
        param += "&pMenuId=" + mId;
        param += "&pMenuType="+_header;

        if(_param != "") param += "&"+_param;

        <%--외부창.--%>
        window.open("about:blank", "CHEST_SEARCH");
        gf_submitMovePage(branchUrl, param, "CHEST_SEARCH");
        <%-- self
        gf_submitMovePage(branchUrl, param);
        --%>

    }

    /*************************************************************
     * Ajax Send Event Function !!
     *************************************************************/
    /*===========================================================
     * Post 목록 조회 !!
     *===========================================================*/
     function selectSearchList(pageNo){

        $("#resultList").html("&nbsp;");

        var param = gf_searchParam(pageNo);
        param += "&keyword=" + CUR_KEYWORD;
        gf_send("/sr/search/selectSearchList.do", param, selectSearchListAfter);
     }

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * Post 리스트 조회 Callback Function !!
     *===========================================================*/
     function selectSearchListAfter(data){

         $("#dataGridList").html('');
         $('#dataGridPageNavi').html('');

        var listInfo = data.listInfo;
        var pageInfo = data.pageInfo;

        var total = listInfo.total.value; // 검색결과
        var hits = listInfo.hits;

        var resultList = "";

        if (total != 0) {
            // 검색결과 있을 경우
            resultList += '<div class="list-search">';
            resultList += '    <p class="list-search-h">( <b>' + CUR_KEYWORD + '</b> )에 대한 검색 약 <b>' + total + '</b> 개의 결과가 있습니다.</p>';
            resultList += '    <ul id="resultList">';

            for (var i=0; i<listInfo.hits.length; i++) {
                var resultContent = hits[i]._source;
                var _title = resultContent.title;
                if(resultContent.register == "CWSYSTEM") {
                    _title = _title.replace(/<(\/h3|h3)([^>]*)>/gi,"");
                    _title = _title.replace(/<(\/span|span)([^>]*)>/gi,"");
                    _title = _title.replace(/<(strong)([^>]*)>/gi,"");
                    _title = _title.replace(/<(\/strong)([^>]*)>/gi,"&nbsp;&nbsp;-&nbsp;&nbsp;");
                }
                var _content = resultContent.content;
                var _contentTemp= "";
                var keywordArr = CUR_KEYWORD.split(' ');

                var isSerach = false;
                for(var j=0; j< keywordArr.length; j++) {
                    var _keyword = keywordArr[j];
                    _keyword = _keyword.replace(/\*/gi,'');
                    if(_content.indexOf(_keyword) > -1 && !isSerach) {
                        _contentTemp = _content.substring(_content.indexOf(_keyword)-200);
                        _contentTemp = (_contentTemp+"").cutByte(400,"...");
                        isSerach = true;
                    }
                    var regx = new RegExp(_keyword,"gi");
                    _contentTemp = _contentTemp.replace(regx,"<span style='background-color:yellow;font-weight:bold;color:red;'>&nbsp;"+_keyword+"&nbsp;</span>");
                }

                //if(_contentTemp == "") _contentTemp ="내용 없음."

                var _url = resultContent.url;
                var _temp = "";
                var _menu = [];

                if(resultContent.register == "CWSYSTEM") {
                    _temp = _url.substring(_url.indexOf("'")+1,_url.indexOf(",")-1);
                    _menu = $plugins.common.findMenuId(_temp);
                } else {
                    _temp = _url.substr(_url.indexOf("','")+3,8);
                    _menu.push(_temp);
                    _menu.push("header");
                }

                var menuHtml = "<span>Home</span>";

                if(_temp != "99_99_99") {
                    var depth1MId = _menu[0].substring(0,3) +"00_00";
                    var depth2MId = _menu[0].substring(0,6) +"00";
                    var depth3MId = _menu[0];
                    var arr = [];

                    if(_menu[1] == "header") {
                        arr = GV_ARR_MENU_H.menu
                    } else {
                        arr = GV_ARR_MENU_F.menu
                    }
                    for(var j=0; j< arr.length;j++) {
                        var _info = arr[j];
                        if(_info.code == depth1MId) {
                            menuHtml += "<span>"+_info.name + "</span>";
                            break;
                        }
                    }
                    isSerach = false;
                    for(var j=0; j< arr.length;j++) {
                        var _info = arr[j];
                        if(_info.dep2 && _info.dep2.length > 0) {
                            for(var k=0; k< _info.dep2.length;k++) {
                                var _info2 = _info.dep2[k];
                                if(_info2.code == depth2MId && !isSerach) {
                                    menuHtml += "<span>"+_info2.name + "</span>";
                                    isSerach = true;
                                }
                                if(_info2.dep3 && _info2.dep3.length > 0) {
                                    for(var m=0; m< _info2.dep3.length;m++) {
                                        if(_info2.dep3[m].code == depth3MId) {
                                            menuHtml += "<span>"+_info2.dep3[m].name + "</span>";
                                            break;
                                        }
                                    }
                                }
                                if(isSerach) break;
                            }
                        }
                    }
                } else {
                    menuHtml += "<span>메뉴 정보 없음.</span>";
                }

                resultList += '    <li>';
                resultList += '        <a href="' + resultContent.url + '">';
                resultList += '            <div class="breadcrumbs-txt">';
                resultList += menuHtml;
                resultList += '            </div>';
                resultList += '            <strong class="list-search-t">' + _title + '</strong>';
                resultList += '            <p>' + _contentTemp + '</p>';
                resultList += '        </a>';
                resultList += '    </li>';
            }

            resultList += '    </ul>';
            resultList += '</div>';
        } else {
            // 검색결과 없을 경우
            resultList += '<div class="list-search-none">';
            resultList += '    <strong><b>' + CUR_KEYWORD + '</b>에 대한 검색 결과가 없습니다.</strong>';
            resultList += '    <div class="list-none-guide">';
            resultList += '        <ul class="bul-dot">';
            resultList += '            <li>검색할 단어 수를 줄여서 검색해 보세요.</li>';
            resultList += '            <li>단어의 철자나 띄어쓰기가 정확한지 확인해주세요.</li>';
            resultList += '            <li>일반적인 문구로 다시 검색해 보세요.</li>';
            resultList += '        </ul>';
            resultList += '    </div>';
            resultList += '</div>';
        }

        $("#resultList").html(resultList);

        if(total != 0){
            myGrid.makePageNvai(pageInfo, "selectSearchList");
        }

        if($(".base-wrap").length > 0) {
            $(".base-wrap").scrollTop(300);
        } else {
            $("body,html").scrollTop(0);
        }


     }
</script>

<div class="sub-visual visual_search">
    <div class="sub-title-area">
        <h2 class="heading-title-a">통합검색</h2>
        <p class="title-sub-txt">사랑의 열매와 함께 나눔의 행복을 찾아보세요.</p>
    </div>
</div>
<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="seo-box">
            <div class="type-search box-base">
                <input type="text" class="inp-base" id="findKeyword" title="통합검색" placeholder="검색어를 입력해주세요." value="${empty paramMap.keyword ? '' : paramMap.keyword}">
                <button type="button" class="btn-base-main" id="btnFind">검색하기</button>
            </div>
            <div id="resultList"></div>
            <div class="gallery-list">
                <ul id="dataGridList"></ul>
            </div>

            <!-- Page Navigation Area Start -->
            <div id="dataGridPageNavi" class="paging-area"></div>
            <!-- // Page Navigation Area -->
        </div>
    </div>
</main>
