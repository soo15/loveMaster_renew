<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">
    var orgParam = "<c:out value="${paramMap}" escapeXml="false" />";
    var LIST_SN  = "<c:out value="${paramMap.listSn}" escapeXml="false" />";
    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        $("#bbsNm").text("${bbsInfo.bbsNm}");
        
        $("#btnList").off("click").on('click', function(e){
            goPostList();
        });
        
        selectPostInfo();
    });
    
    /*************************************************************
     * Ajax Send Event Function !!
     *************************************************************/
    /*===========================================================
     * Post 한 건 조회 !!
     *===========================================================*/
    function selectPostInfo(){
        var param  = orgParam.replace(/[\{\}\s]/gi, '').replace(/\,/gi, '&');
        
        gf_send("/bbs/selectPostInfo.do", param);
    }
    
    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * Post 한 건 조회 Callback Function !!
     *===========================================================*/
    function selectPostInfoAfter(data){
        
        if(data.dataInfo != null){
            var postInfo   = data.dataInfo.postInfo;
            
            if(!gf_isNull(postInfo)){
                $("#sj").html(postInfo.sj);
                $("#rgsde").html(postInfo.rgsde);
                $("#rdcnt").html(postInfo.rdcnt);
                $("#cn").html(postInfo.cn);
            }
            
            var fileListInfo = data.dataInfo.fileListInfo;

            if(fileListInfo != null && fileListInfo.length != 0){
                $.each(fileListInfo, function(i, v){
                    var fileHtml    = '';
                    
                    fileHtml    += '<button class="attach-item" type="button">';
                    fileHtml    += '    <i class="ico-file"></i>';
                    fileHtml    += '    <span OnClick="gf_genFileExport(this);">' + v.orginlFileNm + '.' + v.fileExtsn + '</span>';
                    // 실제 경로를 DB 에서 가져왔을 때 주석 풀기. 현재는 properties 에 있는 경로로 테스트.
                    fileHtml    += '    <input id="filePath"   name="filePath"   type="hidden" value="${genFilePath}' + v.flpth + '" />';
                    fileHtml    += '    <input id="filePath"   name="filePath"   type="hidden" value="" />';
                    fileHtml    += '    <input id="phycFileNm" name="phycFileNm" type="hidden" value="' + v.orginlFileNm + '.' + v.fileExtsn + '" />';
                    fileHtml    += '    <input id="logcFileNm" name="logcFileNm" type="hidden" value="' + v.serverFileNm + '.' + v.fileExtsn + '" />';
                    fileHtml    += '</button>';
                    
                    $('#fileList').append(fileHtml);
                });
                
                $("#attachArea").show();
            }else{
                $("#attachArea").hide();
            }
            
            var listInfo    = data.dataInfo.listInfo;
            
            if(listInfo != null && listInfo.length != 0){
                $.each(listInfo, function(i, v){
                    var listSn  = v.listSn;
                    var sj      = v.sj;
                    var rgsde   = v.rgsde;
                    var gubun   = v.gubun;
                    
                    var listHtml    = '';
                    
                    listHtml    += '<dl class="prenet-item">';
                    if(gubun == 'P'){
                        listHtml    += '<dt><i class="sprite-paging-prenet1"></i>이전글</dt>';
                    }else{
                        listHtml    += '<dt><i class="sprite-paging-prenet2"></i>다음글</dt>';
                    }
                    listHtml    += '    <dd>';
                    listHtml    += '        <a href="javascript:;" onClick="javascript:goPostDetail(this);" data-list_sn="' + listSn + '" class="clamp">' + sj + '</a>';
                    listHtml    += '    </dd>';
                    listHtml    += '    <dd class="prenet-day">' + rgsde + '</dd>';
                    listHtml    += '</dl>';
                    
                    $('#preNextArea').append(listHtml);
                });
            }
        }else{
            alert("<spring:message code="com.system.error"></spring:message>");
            return;
        }
    }
    
    function goPostList(){
        var param = orgParam.replace(/[\{\}\s]/gi, '').replace(/\,/gi, '&');
        
        gf_submitMovePage("/bbs/${bbsInfo.bbsSn}/initPostList.do", param);
    }
    
    /*===========================================================
     * Post 상세페이지로 이동 !!
     *===========================================================*/
    function goPostDetail(obj){
        var listSn = $(obj).data("list_sn");
        var param = orgParam.replace(/[\{\}\s]/gi, '').replace(/\,/gi, '&').replace('listSn='+LIST_SN, 'listSn='+listSn);

        gf_submitMovePage("/bbs/${bbsInfo.bbsSn}/initPostDetail.do", param);
    }
    
</script>

<div class="sub-visual visual02_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">지원사업</h2>
        <p class="title-sub-txt">2depth 설명글 수급 중입니다.</p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3>
                <strong id="bbsNm"></strong>
                <span>사랑의열매 지원활동을 안내합니다.</span>
            </h3>
            <div class="contents-menu-nav"></div>
        </div>

        <div class="seo-box">
            <div class="view-box" id="searchArea">
                <input type="hidden" id="pBbsSn" name="pBbsSn" value="${paramMap.bbsSn}">
                <input type="hidden" id="pBhfCode" name="pBhfCode" value="${paramMap.pBhfCode }"/>
                <input type="hidden" id="pSj" name="pSj" value="${paramMap.pSj }"/>
                <div class="view-header">
                    <div class="view-header-top">
                        <p class="view-header-title" id="sj"></p>
                        <span class="view-header-item"><strong>등록일</strong><span id="rgsde"></span></span>
                        <span class="view-header-item"><strong>조회수</strong><span id="rdcnt"></span></span>
                    </div>
                    <div class="view-header-info">
                        <span class="view-header-item"><strong>등록자</strong><span id="registerNm">모금회</span></span>
                    </div>
                </div>
                <div class="view-contents">
                    <!-- div 추가 -> 내용과 파일 영역을 나누기 위해 -->
                    <div id="cn"></div>
                    <div class="attach-area" id="attachArea" style="display:none;">
                        <dl class="attach-box">
                            <dt class="attach-box-tit">첨부파일</dt>
                            <dd class="attach-box-content" id="fileList"></dd>
                        </dl>
                    </div>
                </div>
            </div>
            <div class="prenet-area" id="preNextArea"></div>
            <div class="btn-area">
                <a href="javascript:;" id="btnList" class="btn-base-imp">목록</a>
            </div>
        </div>
    </div>
</main>
