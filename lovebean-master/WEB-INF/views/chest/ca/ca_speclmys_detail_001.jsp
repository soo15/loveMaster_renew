<!-- 
#############################################
지회별 이벤트 모금 상세
#############################################
 -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../include/ghead.jsp"%>
<!-- 본인인증 -->
<%@ include file="../../common/checkPlus/checkplus_main.jsp"%>
<style type="text/css">
	.noShowArea{max-width:1080px;}
	.noShowArea img{width:100%;}
</style>
<script type="text/javascript">
var orgParam    = "<c:out value="${paramMap}" escapeXml="false" />";
var url = "/ca/speclmys";
var _path = "<%=path%>";
var __branchCd = $.cookie('__branchCd');

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
    	
        $("#btnList").off("click").on('click', function(e){
            goSpeclmysList();
        });
        
        $('[id*=btnCt]').off("click").on('click', function(e){
            goCtForm($(this));
        });
      	
    });
    
    $(document).ready(function(){
    	$('[data-action]').on('click', function(e){
			e.preventDefault();
            var action = $(this).data("action");
            var price = $(this).attr("price");
            if( action == "direct" ) {
            	$("#cntrAmount").attr("readonly" , false);
            	$("#cntrAmount").val("");
            } else {
            	$("#cntrAmount").attr("readonly" , true);
            	$("#cntrAmount").val(price);
            }
        });
    	
		keyEvent();			//숫자만 입력가능
		makeSelectBox();
    	setCounselLayout();	//상담하기 버튼
		selectSpeclmysInfo();
        $("[data-action]").trigger("click");
        
      	//로컬에서만 기본데이터 세팅하게 수정
		if( _path.indexOf("localhost") > -1 ) {
// 			setTestData();
// 			$("#btnCounsel").trigger("click");
		}
        
        
    });
    
    function setCounselLayout() {
		var id = "${paramMap.mysspecleSn}";
		if( _path.indexOf("192.168.24.68") > -1 || _path.indexOf("localhost") > -1 ) {
			if( id == '45' ) {			
				$(".btn-area:eq(0)").hide();
				$(".btn-area:eq(1)").show();
			}
			
			if( id == '43' ) {			
				$(".btn-area:eq(0)").hide();
				$(".btn-area:eq(2)").show();
			}	
			
			if( id == '56' ) {
				$("button[id^='cheerUp']").show();
// 				$("#btnStory").show();
			}
	
		} else {
			//제로페이
			if( id == '18' || id == '42') {			
				$(".btn-area:eq(0)").hide();
				$(".btn-area:eq(1)").show();
			}
			
			//(특별모금)사랑나눔통장
			if( id == '11' ) {
				$(".btn-area:eq(0)").hide();
				$(".btn-area:eq(2)").show();
			}
			
			//경남은행 희망나눔 프로젝트
			if( id == '20' || id == '21' ) {
				$("#btnStory").show();
			}
			
			if( id == '22' ) {
				$("#btnCtLmps").text("기부하기");
			}
            
            if( id == '71' ) {
                $("#btnCtLmps").text("뚝딱 서울학생 기부하기");
                $("#btnCtLmps").attr("class" , "btn-base-imp counsel-open");
            }
			
			if( __branchCd == "001" && id == "39" ) {
				$("button[id^='cheerUp']").show();
			}
            
            //블루SOS
            if( id == '45' ) {
                $("#btnJnSOS").show();
            }
		}
    }
    /*===========================================================
     * 기부상담하기 버튼 클릭시 Function !!
     *===========================================================*/    
    $(document).on("click", "#btnCounsel , #btnCheckPlus , #btnCompanyInsert", function(e){
        e.preventDefault();
        var id = $(this).attr("id");
        if( id == "btnCounsel" ) $("#counselBox").toggle();
        if( id == "btnCheckPlus" ) {
        	window.name='mainPopup';
        	fnPopup();
        }
        if( id == "btnCompanyInsert" ) {
        	if( !companyValidator() ) return;
        	if( confirm("등록 하시겠습니까?") ) {
        		var mbtlnum = $("#companyPhone1").val() + "" +  $("#companyPhone2").val() + "" +  $("#companyPhone3").val();
        		var cntrDe = $("#yy option:checked").val() + "" + $("#mm option:checked").val() + "" + $("#dd option:checked").val(); 
        		var ihidnumBizno = 	$("#jumin1").val() + "" + $("#jumin2").val();
        		$("#hidmysspecleSn").val( "${paramMap.mysspecleSn}" );
        		$("#hidnm").val( $("#companyNm").val() );
        		$("#hidmbtlnum").val( mbtlnum );
        		$("#hidcntrDe").val( cntrDe );
        		$("#hidcntrAmount").val( $("#cntrAmount").val() );
        		$("#hidzeropayDelngNo").val( $("#zeropayDelngNo").val() );
        		$("#hidihidnumBizno").val( ihidnumBizno );
        		gf_sendForm("frm" , url + "/insert.do" );
        	}
        }
    });
    
    function insertAfter(data) {
    	if( data.result == "1" ) {
    		alert("등록 되었습니다");
    		location.reload();
    		return false;
    	} else if( data.result == "111" ) {
    		alert("제로페이 거래번호가 이미 등록 된 번호입니다");
    		return false;
    	} else {
    		alert("등록에 실패하였습니다");
    		return false;
    	}
    }
    	
    /*************************************************************
     * Ajax Send Event Function !!
     *************************************************************/
    /*===========================================================
     * Speclmys 한 건 조회 !!
     *===========================================================*/
    function selectSpeclmysInfo(){
        var param  = orgParam.replace(/[\{\}\s]/gi, '').replace(/\,/gi, '&');
        gf_send("<c:url value='/ca/speclmys/selectSpeclmysInfo.do' />", param);
    }

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * Speclmys 한 건 조회 Callback Function !!
     *===========================================================*/
    function selectSpeclmysInfoAfter(data){

        if(data.dataInfo != null){
            var speclmysInfo   = data.dataInfo.speclmysInfo;
            if(!gf_isNull(speclmysInfo)){
                $("#mysspecleNm").html(speclmysInfo.mysspecleNm);
                $("#rgsde").html(speclmysInfo.rgsde);
                $("#rdcnt").html(speclmysInfo.rdcnt);
                $("#register").html(speclmysInfo.register);

                var flpth           = speclmysInfo.flpth;
                var contentsFileNm  = speclmysInfo.contentsFileNm;
                var imgSrc          = "${genFilePath}" + flpth + contentsFileNm;
                var setleMthd 		= speclmysInfo.setlemthd;
                
                
                
                console.log( data );

                if(!gf_isNull(contentsFileNm)){
                    $("#contentsFileNm").prop('src', imgSrc);
                    $("#contentsFileNm").show();
                }else{
                    $("#contentsFileNm").hide();
                }

                $("#cn").html(speclmysInfo.cn);

                if(!gf_isNull(speclmysInfo.eventCodeFdrm)){
                    $("#btnCtFdrm").data({"event_code" : speclmysInfo.eventCodeFdrm ,"ct_form_url" : speclmysInfo.ctFormUrlFdrm, "ct_menu_id" : speclmysInfo.ctMenuIdFdrm , "setleMthd":setleMthd});
                    $("#btnCtFdrm").show();
                }else{
                    $("#btnCtFdrm").hide();
                }

                if(!gf_isNull(speclmysInfo.eventCodeLmps)){
                    $("#btnCtLmps").data({"event_code" : speclmysInfo.eventCodeLmps ,"ct_form_url" : speclmysInfo.ctFormUrlLmps, "ct_menu_id" : speclmysInfo.ctMenuIdLmps , "setleMthd":setleMthd });
                    $("#btnCtLmps").show();
                }else{
                    $("#btnCtLmps").hide();
                }
            }

            
            //기간내에만 노출
            var showYn   = speclmysInfo.showYn;

            if( showYn == "N" ) {       
                $("#noShowArea").show();
                $("#contentsArea").hide();
            } else {      
                $("#noShowArea").hide();
                $("#contentsArea").show();
            }
        }else{
            alert("<spring:message code="com.system.error"></spring:message>");
            return;
        }
    }

    function goSpeclmysList(){
        var param = orgParam.replace(/[\{\}\s]/gi, '').replace(/\,/gi, '&');

        gf_submitMovePage("<c:url value='/ca/speclmys/initSpeclmys.do' />", param);
    }

    function goCtForm(obj){
    	console.log( obj );
        var url         = obj.data("ct_form_url");
        var menuId      = obj.data("ct_menu_id");
        var eventCode   = obj.data("event_code");
        var setleMthd	= obj.data("setleMthd");

        // Cookie Value Initialize !!
        $.cookie("__menuId",   menuId);
        $.cookie("__menuType", "header");

        var param = "pLinkSepCd=menuLink";
        param     += "&eventCode=" + eventCode;
        param     += "&speclMysAt=Y";
        param	  += "&setleMthd=" + setleMthd;
        gf_submitMovePage(url, param);
    }

</script>

<form name="form_chk" method="post">
	<input type="hidden" name="m" value="checkplusSerivce">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	<input type="hidden" name="EncodeData" value="<%= sEncData %>">				<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="companyResult" id="companyResult" value="N" />
</form>

<form name="frm" id="frm">
	<input type="hidden" name="mysspecleSn" id="hidmysspecleSn" />
	<input type="hidden" name="nm" id="hidnm" />
	<input type="hidden" name="mbtlnum" id="hidmbtlnum" />
	<input type="hidden" name="cntrDe" id="hidcntrDe" />
	<input type="hidden" name="cntrAmount" id="hidcntrAmount" />
	<input type="hidden" name="zeropayDelngNo" id="hidzeropayDelngNo" />
	<input type="hidden" name="ihidnumBizno" id="hidihidnumBizno" />
	
</form>

<div class="sub-visual visual00_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">특별모금</h2>
        <p class="title-sub-txt">사랑의 열매는 연중 다양한 주제로 모금을 진행하고 있습니다.</p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div id="noShowArea" class="noShowArea" style="display:none;">
       <img src="/common/img/common/end_period.png"/>
    </div>
    <div id="contentsArea" class="contents-area">
        <div class="seo-box" id="searchArea">
            <input type="hidden" id="tab" name="tab" value="${paramMap.tab}">
            <input type="hidden" id="pMysspecleNm" name="pMysspecleNm" value="${paramMap.pMysspecleNm }"/>
            <div class="campaign-contents">
                <div class="view-box">
                    <div class="view-header">
                        <div class="view-header-top">
                            <p class="view-header-title" id="mysspecleNm"></p>
                            <span class="view-header-item"><strong>등록일</strong><span id="rgsde"></span></span>
                            <span class="view-header-item"><strong>조회수</strong><span id="rdcnt"></span></span>
                        </div>
                        <div class="view-header-info">
                            <span class="view-header-item"><strong>등록자</strong><span id="register"></span></span>
                        </div>
                    </div>
                    <div class="view-contents">
                        <img src="" id="contentsFileNm" style="display:none;margin-bottom: 20px;"/>
                        <!-- div 추가 -> 내용과 기부하기 버튼 영역을 나누기 위해 -->
                        <div id="cn"></div>
                        <div class="btn-area">
                            <button type="button" class="btn-base" id="btnCtFdrm" style="display:none;">정기기부하기</button>
                            <button type="button" class="btn-base" id="btnCtLmps" style="display:none;">일시기부하기</button>
                            <a href="https://inanum.knbank.co.kr/ib20/mnu/FSTBLD020600000" id="btnStory" style="display:none;" target="_blank">
                            	<button type="button" class="btn-base-imp counsel-open">사연보기</button>
							</a> 
                            <a href="https://mrmweb.hsit.co.kr/v2/default.aspx?Server=p1sI9yjs7eXe0DMIKf7SCA==&action=once2" id="btnJnSOS" style="display:none;" target="_blank">
                                <button type="button" class="btn-base-imp counsel-open">참여하기</button>
                            </a>                                                           	
                        </div>
                        
                        <!-- 추가 기부하기버튼(191213)-->
                        <div class="btn-area" style="display:none;">
                        	<button type="button" class="btn-base-imp counsel-open" id="btnCounsel">제로페이 등록하기</button>
                        </div>
                        <!--// 추가 기부하기버튼(191213)-->
                        
                        <div class="btn-area" style="display:none;">
							<a href="/bbs/1004/initPostDetail.do?listSn=11020"><button type="button" class="btn-base-imp counsel-open" id="">지원결과보기</button></a>
                        </div>
                        
                        <!-- 힘내라! 나눔캠페인 S -->
                        <div class="btn-area">        
                            <button type="button" class="btn-base" id="cheerUp1" style="display:none;" 
                            onclick="location.href='https://seoul.chest.or.kr/bridgelink.do?pBranchCd=002&bhfCode=002&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj0yOA=='">서울</button>
                            
                            <button type="button" class="btn-base" id="cheerUp2" style="display:none;"
                            onclick="location.href='https://busan.chest.or.kr/bridgelink.do?pBranchCd=003&bhfCode=003&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj0yOQ=='">부산</button>
                            
                            <button type="button" class="btn-base" id="cheerUp3" style="display:none;"
                            onclick="location.href='https://daegu.chest.or.kr/bridgelink.do?pBranchCd=004&bhfCode=004&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj0yMw=='">대구</button>
                            
                            <button type="button" class="btn-base" id="cheerUp4" style="display:none;"
                            onclick="location.href='https://incheon.chest.or.kr/bridgelink.do?pBranchCd=005&bhfCode=005&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj0yNA=='">인천</button>
                            
                            <button type="button" class="btn-base" id="cheerUp5" style="display:none;"
                            onclick="location.href='https://gwangju.chest.or.kr/bridgelink.do?pBranchCd=006&bhfCode=006&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj0zMA=='">광주</button>
                            
                            <button type="button" class="btn-base" id="cheerUp6" style="display:none;"
                            onclick="location.href='https://daejeon.chest.or.kr/bridgelink.do?pBranchCd=007&bhfCode=007&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj0yNQ=='">대전</button>
                            
                            <button type="button" class="btn-base" id="cheerUp7" style="display:none;"
                            onclick="location.href='https://ulsan.chest.or.kr/bridgelink.do?pBranchCd=008&bhfCode=008&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj0yNg=='">울산</button>
                            
                            <br/><br/>
                            
                            <button type="button" class="btn-base" id="cheerUp8" style="display:none;"
                            onclick="location.href='https://gyeonggi.chest.or.kr/bridgelink.do?pBranchCd=009&bhfCode=009&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj0yMg=='">경기</button>
                            
                            <button type="button" class="btn-base" id="cheerUp9" style="display:none;"
                            onclick="location.href='https://gangwon.chest.or.kr/bridgelink.do?pBranchCd=010&bhfCode=010&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj0zMQ=='">강원</button>
                            
                            <button type="button" class="btn-base" id="cheerUp10" style="display:none;"
                            onclick="location.href='https://cb.chest.or.kr/bridgelink.do?pBranchCd=011&bhfCode=011&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj0zMg=='">충북</button>
                            
                            <button type="button" class="btn-base" id="cheerUp11" style="display:none;"
                            onclick="location.href='https://cn.chest.or.kr/bridgelink.do?pBranchCd=012&bhfCode=012&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj0zMw=='">충남</button>
                            
                            <button type="button" class="btn-base" id="cheerUp12" style="display:none;"
                            onclick="location.href='https://gb.chest.or.kr/bridgelink.do?pBranchCd=015&bhfCode=015&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj0zNg=='">전북</button>
                            
                            <button type="button" class="btn-base" id="cheerUp13" style="display:none;"
                            onclick="location.href='https://jn.chest.or.kr/bridgelink.do?pBranchCd=014&bhfCode=014&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj0zNQ=='">전남</button>
                            
                            <button type="button" class="btn-base" id="cheerUp14" style="display:none;"
                            onclick="location.href='https://gb.chest.or.kr/bridgelink.do?pBranchCd=015&bhfCode=015&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj0zNg=='">경북</button>
                            
                            <br/><br/>
                            
                            <button type="button" class="btn-base" id="cheerUp15" style="display:none;"
                            onclick="location.href='https://gn.chest.or.kr/bridgelink.do?pBranchCd=016&bhfCode=016&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj0yNw=='">경남</button>
                            
                            <button type="button" class="btn-base" id="cheerUp16" style="display:none;"
                            onclick="location.href='https://jeju.chest.or.kr/bridgelink.do?pBranchCd=017&bhfCode=017&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj0zNw=='">제주</button>
                            
                            <button type="button" class="btn-base" id="cheerUp17" style="display:none;"
                            onclick="location.href='https://sejong.chest.or.kr/bridgelink.do?pBranchCd=018&bhfCode=018&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj0zOA=='">세종</button>
                            
                            <button type="button" class="btn-base" id="cheerUp17" style="display:none;background-color:#FFFFFF;border: none;"></button>
                            <button type="button" class="btn-base" id="cheerUp17" style="display:none;background-color:#FFFFFF;border: none;"></button>
                            <button type="button" class="btn-base" id="cheerUp17" style="display:none;background-color:#FFFFFF;border: none;"></button>
                            <button type="button" class="btn-base" id="cheerUp17" style="display:none;background-color:#FFFFFF;border: none;"></button>
						</div>
                        <!-- 힘내라! 나눔캠페인 E -->
                        
                    </div>
                    <!-- S : 기부상담신청 -->
		            <div id="counselBox" class="sb-box dis-none">
		                <div class="sb-box-inner">
		                    <p class="sb-contents-tit">제로페이 등록하기</p>
		                    <div class="sb-content">
		                        <div class="sb-content-tbl">
		                            <table>
		                                <colgroup>
		                                    <col class="col-l">
		                                    <col class="col-auto">
		                                </colgroup>
		                                <tbody>
		                                <tr>
		                                    <th scope="row">
		                                        <label for="companyNm">성명</label>
		                                    </th>
		                                    <td>
		                                        <input type="text" class="inp-base w-full" id="companyNm" title="성명" readonly="readonly">
		                                    </td>
		                                </tr>
		                                
					                    <tr>
					                        <th scope="row"><label for="companyPhone1">휴대폰 번호</label></th>
					                        <td colspan="3">
					                            <div class="phone-area">
					                                <input type="text" class="inp-base _required" title="휴대폰 앞자리" readonly="readonly" id="companyPhone1">
					                                <span class="txt-mark">-</span>
					                                <input type="text" class="inp-base _required" title="휴대폰 중간자리" readonly="readonly" id="companyPhone2">
					                                <span class="txt-mark">-</span>
					                                <input type="text" class="inp-base _required" title="휴대폰 뒷자리" readonly="readonly" id="companyPhone3">
					                                <button type="button" class="btn-base-imp small" id="btnCheckPlus">본인인증</button>
					                            </div>
					                            <p class="donation-guide-txt">
													- NICE 평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다.<br>
													- 기부자 본인을 확인하기 위해서 기부자님의 본인인증이 반드시 필요합니다.<br>
													- 본인인증시 반복적으로 오류가 발생하면 NICE기술지원(1600-1522)로 전화부탁드립니다.  
												</p>
					                        </td>
					                    </tr>
										<tr>
											<th scope="row">
												<label for="donateD">기부일자<span class="required" aria-label="필수">*</span></label>
											</th>
											<td>
												<div class="day-form">
													<div class="day-form-row">
														<div class="ui-select sel_small">
															<select class="sel_type" id="yy" name="yy" title="년 선택"></select>
														</div>
														<span class="day-txt">년</span>
													</div>
													<div class="day-form-row">
														<div class="ui-select sel_small2">
															<select class="sel_type" id="mm" name="mm" title="월 선택"></select>
														</div>
														<span class="day-txt">월</span>
													</div>
													<div class="day-form-row">
														<div class="ui-select sel_small2">
															<select class="sel_type" id="dd" name="dd" title="일 선택"></select>
														</div>
														<span class="day-txt">일</span>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">금액<span class="required" aria-label="필수">*</span></th>
											<td>
												<div class="ui-togglebtn type-sum">
													<button type="button" class="btn-base small" data-action="" price="10,000">1만원</button>
													<button type="button" class="btn-base small" data-action="" price="20,000">2만원</button>
													<button type="button" class="btn-base small" data-action="" price="30,000">3만원</button>
													<button type="button" class="btn-base small" data-action="" price="50,000">5만원</button>
													<button type="button" class="btn-base small" data-action="" price="100,000">10만원</button>
													<button type="button" class="btn-base small mgt-xxs" data-action="direct">직접입력</button>
													<input type="text" class="inp-base ui-inpcancel mgt-xxs" name="cntrAmount" id="cntrAmount" title="직접입력" placeholder="직접입력" readonly numberOnly maxlength="9">
													<span class="txt-mark">원</span>
												</div>
											</td>
										</tr>
		                                <tr>
		                                    <th scope="row">
		                                        <label for="zeropayNm">제로페이 거래번호</label>
		                                    </th>
		                                    <td>
		                                        <input type="text" class="inp-base w-full" id="zeropayDelngNo" title="제로페이 거래번호">
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <th scope="row">
		                                        <label for="jumin1">주민등록번호<span class="required" aria-label="필수">*</span></label>
		                                    </th>
								            <td>
								                <div class="jumin-area">
								                    <input type="text" class="inp-base" title="주민등록번호 앞자리" name="jumin1" id="jumin1" numberOnly maxlength="6">
								                    <span class="txt-mark">-</span>
								                    <input type="password" class="inp-base" title="주민등록번호 뒷자리" name="jumin2" id="jumin2" numberOnly maxlength="7">
								                </div>
		                                         <p class="donation-guide-txt">- 개인정보보호법 제2조, 사회복지공동모금회법 제18조, 소득세법 제160조의3, 소득세법시행령 제208조의 3</p>
                                               
												<!-- 동의 -->
										            <div class="terms-group">
										                <span class="checkbox mg-xs">
										                    <input type="checkbox" name="agreeInfo" id="agreeInfo">
										                    <label for="agreeInfo"><span>개인정보 수집 및 이용에 동의 합니다.</span></label>
										                </span>
										                <textarea class="inp-base h-small" readonly="readonly" title="개인정보 수집 및 이용에 동의에 관한 정보입니다.">사회복지공동모금회(이하 “모금회”라 함)는 「개인정보 보호법」제15조에 의거하여 개인정보수집 및 이용에 관한 정보주체의 동의절차를 준수하며, 고지 후 수집된 정보는 모금회의 개인정보 수집 및
										이용목적외의 용도로는 절대 이용,제공되지 않습니다. 기부자는 정보주체로서 개인정보의 삭제ㆍ
										처리정지 요구와 개인정보의 수집ㆍ이용 및 제공에 대한 동의 거부를 할 수 있으나, 이 경우 모금회에서 수행하는 아래의 업무와 관련된 서비스제공이 불가합니다.
가. 기부금영수증의 발급,
나. 소득공제를 위한 국세청 연말정산 서비스에 필요한 자료제공,
다. 정기기부금의 CMS(금융결제원)연계 출금처리
라. 기부자 결과보고 제공
										
본인은 모금회가 「개인정보 보호법」제15조제1항 및 제24조제1항제1호에 의거, 다음과 같이 본인의 개인정보 및 고유식별정보(이하 “개인정보”라 함)를 수집ㆍ이용하는 것에 대하여 동의합니다.
가. 개인정보의 수집ㆍ이용자(개인정보처리자) : 모금회
나. 개인정보의 수집ㆍ이용 목적  : 모금회에서 처리하는 기부금관련 업무(발급ㆍ기부내역제공 등)
다. 개인정보의 수집ㆍ이용 항목  : 개인정보 등(성명, 주민등록번호(외국인등록번호), 연락처, 주소, 전자메일주소, 계좌번호 등)
라. 개인정보의 보유 및 이용기간 : 1.주민등록번호 : 기부금 입금일을 기준으로 소득공제가 실시되는 기간동안, 2.기타 : 모금회가 정한 보존기간동안</textarea>
										                <span class="checkbox mg-xs">
										                    <input type="checkbox" name="agreeInfo" id="agreeInfo1">
										                    <label for="agreeInfo1"><span>개인정보 제 3자 제공에 동의 합니다.</span></label>
										                </span>
										                <textarea class="inp-base h-small" readonly="readonly">본인은 모금회가 「개인정보 보호법」제17조제1항제1호에 의거, 다음과 같이 본인의 개인정보를 제3자에게 제공하는 것에 대하여 동의합니다.
가. 개인정보를 제공받는 자 : 기부금의 자동 출금을 위한 금융결제원, 기부내역의 소득공제 확인을 위한 국세청
나. 개인정보를 제공받는 자의 이용 목적 : 정기기부금의 출금 및 기부금 소득공제 근거자료 활용
다. 제공하는 개인정보의 항목 : 위 1호 다목에 해당하는 개인정보
라. 개인정보를 제공받는 자의 보유 및 이용기간 :
주민등록번호 : 기부금 입금일을 기준으로 소득공제가 실시되는 기간동안
기타 : 모금회가 정한 보존기간동안</textarea>
											<div class="btn-area-r">
							                    <button type="button" class="btn-base-bline small" onclick="javascript:goFootPrivacy();">개인정보처리방침</button>
										    </div>
										</div>
												<!-- //동의 -->
		                                    </td>
		                                </tr>
		                                </tbody>
		                            </table>
		                        </div>
		                
		                        <div class="btn-area">
		                           <button type="button" class="btn-base-imp" id="btnCompanyInsert">등록하기</button>
		                        </div>
		                    </div>
		                </div>
		            </div>
            <!-- E : 기부상담신청 -->
	
                </div>
                <div class="btn-area">
                    <a href="javascript:;" id="btnList" class="btn-base-imp">목록</a>
                </div>
            </div>
        </div>
    </div>
</main>

<script>
function makeSelectBox() {
	var year = new Date();
	var el="";
	for( var i=2000; i<= year.getFullYear(); i++ ) {
		el += "<option value='"+i+"'>" + i + "</option>";
	}
	$("#yy").html(el);
	$("select[name='yy'] option[value='" + year.getFullYear() + "']").prop("selected",true);

	el = "";
	for( var i=1; i<=12; i++ ) {
		el += "<option value='"+zeroSum(i)+"'>" + zeroSum(i) + "</option>";
	}
	$("#mm").html(el);

	el = "";
	for( var i=1; i<=31; i++ ) {
		el += "<option value='"+zeroSum(i)+"'>" + zeroSum(i) + "</option>";
	}
	$("#dd").html(el);	
	_common.makeSelectLayout();	//select box
}

function success( obj ) {
	var sname = obj.sName;
	var mobileNo = obj.sMobileNo;
	var result = obj.result;
	var a,b,c,m = mobileNo;

	if( m.length > 0 ) {
    	if( m.length > 10 ) {
    		a=m.substring(0,3);
    		b=m.substring(3,7);
    		c=m.substring(7);
    	} else {
    		a=m.substring(0,3);
    		b=m.substring(3,6);
    		c=m.substring(6);
    	}
	}
	$("#companyNm").val(sname);
	$("#companyPhone1").val(a);
   	$("#companyPhone2").val(b);
   	$("#companyPhone3").val(c);
   	$("#companyResult").val(result);
}

function fail() {
	_compayCheckFlag = false;
	alert("본인인증이 실패하였습니다.");
}

function keyEvent() {
	//숫자만 입력가능
	$("input:text[numberOnly]").on("keyup keydown", function() {
        $(this).val($(this).val().replace(/[^0-9]/g,""));
    });

	$("#cntrAmount").on( "keyup keydown", function() {
		inputNumberFormat(this);
	});
}

function companyValidator() {
		if( $.trim( $("#companyNm").val() ).length == 0 ) {
			alert("성명을 입력해주세요");
    		$("#companyFrm #nm").focus();
    		return false;
		}
		
		if( $.trim( $("#cntrAmount").val() ).length == 0 ) {
    		alert("금액을 선택해주세요");
    		$("#cntrAmount").focus();
    		return false;
    	}
		
		if( $.trim( $("#zeropayDelngNo").val() ).length == 0 ) {
    		alert("제로페이 거래번호를 입력해주세요");
    		$("#zeropayDelngNo").focus();
    		return false;
    	}
		if( $.trim( $("#jumin1").val() ).length == 0) {
			alert("주민번호를 입력해주세요");
			$("#jumin1").focus();
			return false;
		}
		if( $.trim( $("#jumin2").val() ).length == 0) {
			alert("주민번호를 입력해주세요");
			$("#jumin2").focus();
			return false;
		}
		if(!$("#agreeInfo").is(':checked')){
    		alert("개인정보 수집 및 이용에 동의해 주시길 바랍니다.");
    		$("#agreeInfo").focus();
    		return false;
    	}
    	if(!$("#agreeInfo1").is(':checked')){
    		alert("개인정보 제3자 제공에 동의해 주시길 바랍니다.");
    		$("#agreeInfo1").focus();
    		return false;
    	}
		if( $("#companyResult").val()  == "N" ) {
			alert("본인인증을 해주세요");
    		return false;
	}
	return true;
}

function setTestData() {
	$("#companyNm").val("김민수");
	$("#companyPhone1").val("010");
	$("#companyPhone2").val("2020");
	$("#companyPhone3").val("4048");
	$("#cntrAmount").val("1,100");
	$("#zeropayDelngNo").val("111111");
	$("#jumin1").val("111111");
	$("#jumin2").val("1111111");
	$("#companyResult").val("Y");
}
</script>
