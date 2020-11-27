<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>
<style>
textarea.autosize { min-height: 50px; }
</style>
<script type="text/javascript">
    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){

        goTabDisplay((${tabMapYn}?1:0));
        
        $( "#mysBgnde" ).datepicker({
            showOn: "button",
            dateFormat: "yymmdd",
            buttonImage: "/common/img/common/btn_datepicker.png",
            buttonImageOnly: true,
            buttonText: "Select date"
        });
        $( "#mysEndde" ).datepicker({
            showOn: "button",
            dateFormat: "yymmdd",
            buttonImage: "/common/img/common/btn_datepicker.png",
            buttonImageOnly: true,
            buttonText: "Select date"
        });
        $( "#bsnsBgnde" ).datepicker({
            showOn: "button",
            dateFormat: "yymmdd",
            buttonImage: "/common/img/common/btn_datepicker.png",
            buttonImageOnly: true,
            buttonText: "Select date"
        });
        $( "#bsnsEndde" ).datepicker({
            showOn: "button",
            dateFormat: "yymmdd",
            buttonImage: "/common/img/common/btn_datepicker.png",
            buttonImageOnly: true,
            buttonText: "Select date"
        });

        gf_keyNumber('reqstForm');
        
        $("textarea.autosize").on('keydown keyup', function () {
        	$(this).height(1).height( $(this).prop('scrollHeight')+12 );
     	});
    });

    $(document).on('click', '#btnReqstCrwdfund, #btnCancelReqst', function(e){
        e.preventDefault();

        var id = $(this).attr('id');

        // Button Click Event
        if(id == 'btnCancelReqst'){
            refreshReqstCrwdfundForm();
        }else if(id == 'btnReqstCrwdfund'){
            reqstCrwdfund();
        }
    });

    function goTabDisplay(obj){
        // 초기화
        $(".ui-tab-pnl").attr({'aria-hidden':'true'}) ;
        $(".ui-tab-btn").attr('class','ui-tab-btn');

        $("#btn" + obj ).attr('class','ui-tab-btn selected');
        $("#pnl"+ obj +".ui-tab-pnl").attr({'aria-hidden':'false'}) ;
    }

    /*===========================================================
     * 클라우드 펀딩 신청 한 건 저장 !!
     *===========================================================*/
    function reqstCrwdfund(){
        // 저장 공통 체크 !!
        if(!gf_storeDataCheck('reqstForm')){
            return false;
        }

        combineData();

        if(!validationCheck()){
            return false;
        }

        if(!confirm("<spring:message code="check.confirm.request"></spring:message>")){   // 신청하시겠습니까?
            return false;
        }

        gf_sendForm('reqstForm');
    }

    function combineData(){
        var propseChargerPhone  = $('#propseChargerPhone_1').val() + $('#propseChargerPhone_2').val() + $('#propseChargerPhone_3').val();
        $('#propseChargerPhone').val(gf_toTel(propseChargerPhone));

        var propseChargerEmail  = $('#propseChargerEmail_1').val() + '@' + $('#propseChargerEmail_2').val();
        $('#propseChargerEmail').val(propseChargerEmail);

        var propseInsttBizrno   = $('#propseInsttBizrno_1').val() + $('#propseInsttBizrno_2').val() + $('#propseInsttBizrno_3').val();
        $('#propseInsttBizrno').val(gf_toCorp(propseInsttBizrno));
    }

    function validationCheck(){
    	
    	//희망모금기간
		var date1 = new Date($("#mysBgnde").datepicker("getDate"));
    	var date2 = new Date($("#mysEndde").datepicker("getDate"));
		if (date2 - date1 < 0){
    		alert("희망모금기간 종료 일자가 시작 일자보다 이전일 수 없습니다"); 
    	    return false;
		}
		if( $.trim( $("#mysBgnde").val() ).length == 0  ) {
			alert("일자를 선택해 주세요.");
			return false;
		}
		if( $.trim( $("#mysEndde").val() ).length == 0  ) {
			alert("일자를 선택해 주세요.");
			return false;
		}
		
		//사업기간
		var date1 = new Date($("#bsnsBgnde").datepicker("getDate"));
		var date2 = new Date($("#bsnsEndde").datepicker("getDate"));
		if (date2 - date1 < 0){
    		alert("사업기간 종료 일자가 시작 일자보다 이전일 수 없습니다"); 
    	    return false;
		}
		if( $.trim( $("#bsnsBgnde").val() ).length == 0  ) {
			alert("일자를 선택해 주세요.");
			return false;
		}
		if( $.trim( $("#bsnsEndde").val() ).length == 0  ) {
			alert("일자를 선택해 주세요.");
			return false;
		}
		
        if(!gf_isTel($('#propseChargerPhone').val())){
            alert('전화번호 형식이 잘 못 되었습니다.');
            return false;
        }
        if(!gf_isEmail($('#propseChargerEmail').val())){
            alert('이메일 형식이 잘 못 되었습니다.');
            return false;
        }
        if(!gf_isCorp($('#propseInsttBizrno').val())){
            alert('사업자번호 형식이 잘 못 되었습니다.');
            return false;
        }
        return true;
    }

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * 클라우드 펀딩 신청 한 건 저장 Callback Function !!
     *===========================================================*/
    function reqstCrwdfundAfter(data){
        if(data.result == "2"){
            alert("<spring:message code="result.request.success"></spring:message>");  // 신청되었습니다.

            refreshReqstCrwdfundForm();
        } else {
            alert("<spring:message code="result.request.fail"></spring:message>");     // 신청에 실패하였습니다.
        }
    }

    /*===========================================================
     * 클라우드 펀딩 신청 폼 새로고침 !!
     *===========================================================*/
    function refreshReqstCrwdfundForm(){
        gf_submitMovePage("<c:url value='/ca/crwdfund/initReqstfund.do' />", "pLinkSepCd=menuLink");
    }
</script>

<div class="sub-visual visual00_03">
    <div class="sub-title-area">
        <h2 class="heading-title-a">크라우드펀딩</h2>
        <p class="title-sub-txt">당신이 함께하는 응원! 크라우드 펀딩입니다. </p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3><strong>펀딩 신청하기</strong><span>당신이 함께하는 응원! 크라우드 펀딩입니다.</span></h3>
            <div class="contents-menu-nav"></div>
        </div>
        <div class="seo-box">
				 <div class="ui-tab ui-tab-type2 col-2 contents-tab" id="uiTabAPPL03_1">
				     <div class="ui-tab-btns" btn-id="uiTabAPPL03_1">
				         <button type="button" class="ui-tab-btn" id ="btn0" onclick="javascript:goTabDisplay(0);"><i>펀딩 참여 신청 안내</i></button>
				         <button type="button" class="ui-tab-btn" id ="btn1" onclick="javascript:goTabDisplay(1);"><i>펀딩 신청하기</i></button>
				     </div>
				     <div class="ui-tab-pnls" pnl-id="uiTabAPPL03_1">
				
				         <!-- 펀딩신청방법 -->
				         <section class="ui-tab-pnl" id ="pnl0" >
				             <h1 class="hide">크라우드 펀딩 참여 신청 안내</h1>
				             <div class="tab-contents">
				                 <div class="funding__top">
				                     <h1>크라우드 펀딩 참여 신청 안내</h1>
				                     <h2>사랑의열매는 새로운 사회문제에 신속하게 대응하기 위해
				                         크라우드펀딩 사업을 시작합니다.
				                         우리 사회에 긍정적인 변화를 만들어갈 새로운 도전에 함께 하겠습니다. 여러분의 빛나는 아이디어가 우리사회에 뿌리내려 값진
				                         열매를 맺을 수 있도록 관심과 참여를 부탁드립니다.</h2>
				                     <ul class="funding__top--steps">
				                         <li>1. 신청자격 : 비영리단체 및 사회복지단체</li>
				                         <li>2. 사업내용 : 비영리 공익사업(건당 예산 500만원 이하)</li>
				                         <li>3. 신청절차 : 홈페이지 펀딩 신청하기 메뉴를 통해 접수</li>
				                         <li>4. 진행일정 : 매월 4째 주까지 접수 마감, 익월 초 펀딩 시작(매월 2건 선정)</li>
				                         <li>5. 세부내용</li>
				                     </ul>
				                 </div>
				                 <div class="funding__steps">
				                     <div class="funding--titles">
				                         <span>진행절차</span>
				                     </div>
				                     <div class="funding--Simg"><img
				                             src="/common/img/contents/funding_H_step.png" 
				                             alt="진행절차안내 - 1.사업진행 :홈페이지 상단메뉴 캠페인 - 크라우드펀딩 - 펀딩신청하기
				                             2.사업선정 - 매월 4째 주까지 접수된  사업을 익월 초 선정(매월 2건)
				                             3.선정안내 - 이메일을 통한 개별안내
				                             4.펀딩 콘텐츠 제작 - 크라우드펀딩 콘텐츠 제작을 위한 방문 및 취재 진행
				                             5.펀딩시작 - 진행기간:1개월에서 2개월사이 sns등 활용한 홍보 진행
				                             6.펀딩완료 -펀딩 마감일 기준 2주 내외
				                             7.사업비 지급 - 펀딩 마감일 기준 2주 내외
				                             8.사업진행
				                             9.결과 제출 - 성과, 사진자료 포함 , 사업종료일 기준 20일 이내
				                             10.사업평가 및 후기 취재 - 후기 콘텐츠 홈페이지 게시"></div>
				                 </div>
				                 <div class="funding__steps">
				                     <div class="funding--titles">
				                         <span>선정기준</span>
				                     </div>
				                     <ul class="funding--steps">
				                         <li>⑴ 기존 사회문제와 차별화된 내용을 다루는가 </li>
				                         <li>⑵ 현실성 있는 사업목표를 설정하였는가 </li>
				                         <li>⑶ 사회문제 해결에 얼마나 도움이 되는가 </li>
				                         <li>⑷ 홍보 및 취재에 적극적 협조가 가능한가 </li>
				                         <li>⑸ 타 크라우드 펀딩과 중복 문제는 없는가? </li>
				                         <li>※ 동일 사업으로 타 플랫폼에서 중복 펀딩하는 경우 선정 취소함. 단 펀딩 및 사업 기간이 모두 상이한 경우는 신청 가능
				                         </li>
				                         <li>※※ 당월 미선정 된 차순위 사업은 익월 심사에 포함될 수 있음.</li>
				                     </ul>
				                 </div>
				                 <div class="funding__steps">
				                     <div class="funding--titles">
				                         <span>주체별 역할</span>
				                     </div>
				                     <ul class="funding--steps">
				                         <li>⑴ 선정단체 : 사업기획, 펀딩활동, 사업홍보, 사업진행, 결과제출 </li>
				                         <li> ⑵ 사랑의열매 : 펀딩 플랫폼 제공, 사업 및 단체 홍보, 펀딩 콘텐츠 제작, 사업관리, 기부자피드백 제공</li>
				                     </ul>
				                 </div>
				                 <div class="funding__steps">
				                     <div class="funding--titles">
				                         <span>펀딩금액 지원 방식</span>
				                     </div>
				                     <ul class="funding--steps">
				                         <li>⑴ 펀딩목표액 100% 미달성 시
				                             <p>: 펀딩된 금액에 맞춰 사업계획서 수정하여 진행. 또는 펀딩된 금액에 선정단체의 자체 예산을 추가하여 사업 진행
				                             </p>
				                             <p>: 사업 포기 시 펀딩된 금액은 지급하지 아니함 </p>
				                         </li>
				                         <li>⑵ 펀딩목표액 100% 초과 달성 시
				                             <p>: 펀딩된 금액에 맞춰 사업계획서 수정하여 진행 </p>
				                         </li>
				                     </ul>
				                 </div>
				                 <div class="funding__steps">
				                     <div class="funding--titles">
				                         <span>문의</span>
				                     </div>
				                     <ul class="funding--steps">
				                         <li>마케팅본부 온라인팀 sja0727@chest.or.kr / 02-6262-3038 </li>
				                     </ul>
				                 </div>
				             </div>
				         </section>
				         <!-- //펀딩신청방법 -->
				        
				         <!-- 펀딩신청 -->
				        <section class="ui-tab-pnl" id ="pnl1">
				            <h1 class="hide">펀딩 신청하기</h1>
				            <div class="tab-contents">
				            <div class="tb-type_a mb-type">
				                <form id="reqstForm" name="reqstForm"  method="post" action="<c:url value='/ca/crwdfund/reqstCrwdfund.do'/>">
				                <table summary="펀딩 신청하기">
				                    <caption>펀딩신청하기입니다.</caption>
				                    <colgroup>
				                        <col class="col-xs">
				                        <col class="col-auto">
				                    </colgroup>
				                    <tbody>
				                    <tr>
				                        <th scope="row"><label for="propseChargerNm">신청자 성명<span class="required" aria-label="필수">*</span></label></th>
				                        <td><input type="text" class="form-w05 _required" id="propseChargerNm" name="propseChargerNm" title="신청자 성명"></td>
				                    </tr>
				                    <tr>
				                        <th scope="row"><label for="propseChargerPhone">연락처<span class="required" aria-label="필수">*</span></label></th>
				                        <td>
				                            <div class="phone-area">
				                                <input type="text" class="inp-base _required _number" maxlength="3" title="연락처 앞자리" id="propseChargerPhone_1">
				                                <span class="txt-mark">-</span>
				                                <input type="text" class="inp-base _required _number" maxlength="4" title="연락처 중간자리" id="propseChargerPhone_2">
				                                <span class="txt-mark">-</span>
				                                <input type="text" class="inp-base _required _number" maxlength="4" title="연락처 뒷자리" id="propseChargerPhone_3">
				                                <input type="hidden" id="propseChargerPhone" name="propseChargerPhone" />
				                            </div>
				                        </td>
				                    </tr>
				                    <tr>
				                        <th scope="row"><label for="propseChargerEmail">이메일<span class="required" aria-label="필수">*</span></label></th>
				                        <td>
				                            <div class="email-area">
				                                <input type="text" class="in-w03 _required" title="이메일 아이디" id="propseChargerEmail_1">
				                                <span class="txt-mark">@</span>
				                                <input type="text" class="in-w03 _required" title="이메일 도메인주소" id="propseChargerEmail_2">
				                                <input type="hidden" id="propseChargerEmail" name="propseChargerEmail" />
				                            </div>
				                        </td>
				                    </tr>
				                    <tr>
				                        <th scope="row"><label for="propseInsttNm">기관명<span class="required" aria-label="필수">*</span></label></th>
				                        <td><input type="text" class="form-w06 _required" id="propseInsttNm" name="propseInsttNm" title="기관명" placeholder="30자 이내로 입력해주세요." title="30자 이내로 입력해주세요."></td>
				                    </tr>
				                    
				                    <tr>
				                        <th scope="row"><label for="propseInsttBizrno">고유번호<span class="required" aria-label="필수">*</span><span class="row-desc">(사업자등록번호)</span></label></th>
				                        <td>
				                            <div class="phone-area">
				                                <input type="text" class="inp-base _required _number" maxlength="3" title="고유번호 앞자리" id="propseInsttBizrno_1">
				                                <span class="txt-mark">-</span>
				                                <input type="text" class="inp-base _required _number" maxlength="2" title="고유번호 중간자리" id="propseInsttBizrno_2">
				                                <span class="txt-mark">-</span>
				                                <input type="text" class="inp-base _required _number" maxlength="5" title="고유번호 뒷자리" id="propseInsttBizrno_3">
				                                <input type="hidden" id="propseInsttBizrno" name="propseInsttBizrno" />
				                            </div>
				                        </td>
				                    </tr>
				                    
				                    <tr>
				                        <th scope="row"><label for="propseBsnsNm">사업명<span class="required" aria-label="필수">*</span></label></th>
				                        <td><input type="text" class="form-w06 _required" id="propseBsnsNm" name="propseBsnsNm" title="사업명" placeholder="30자 이내로 입력해주세요." title="30자 이내로 입력해주세요."></td>
				                    </tr>
				                    <tr>
				                        <th scope="row"><label for="cck_02-i3">사업분야</label></th>
				                        <td>
				                            <div class="ui-select form-w01">
				                                <select id="propseBsnsBsr" name="propseBsnsBsr" title="사업분야">
				                                    <c:out value="${comboBsnsBsr}" escapeXml="false" />
				                                </select>
				                            </div>
				                        </td>
				                    </tr>
				                    <tr>
				                        <th scope="row"><label for="bsnsSj">제목(목적)<span class="required" aria-label="필수">*</span></label></th>
				                        <td><input type="text" class="form-w03 _required" id="bsnsSj" name="bsnsSj" title="제목(목적)" placeholder="50자 이내로 입력해주세요." title="50자 이내로 입력해주세요."></td>
				                    </tr>
				                    
				                    <tr>
				                        <th scope="row"><label for="bsnsNcssty">사업 필요성<span class="required" aria-label="필수">*</span><span class="row-desc"></span></label></th>
				                        <td>
				                            <textarea class="inp-base autosize" id="bsnsNcssty" name="bsnsNcssty" title="사업 필요성" placeholder="500자 이내로 입력해주세요." title="500자 이내로 입력해주세요."></textarea>
				                        </td>
				                    </tr>
				                    
				                    <tr>
				                        <th scope="row"><label for="bsnsIntrcn">사업 내용<span class="required" aria-label="필수">*</span><span class="row-desc"></span></label></th>
				                        <td>
				                            <textarea class="inp-base autosize" id="bsnsIntrcn" name="bsnsIntrcn" title="사업 내용" placeholder="500자 이내로 입력해주세요." title="500자 이내로 입력해주세요."></textarea>
				                        </td>
				                    </tr>
				                    
				                    <tr>
				                        <th scope="row"><label for="bsnsSchdul">사업 일정<span class="required" aria-label="필수">*</span><span class="row-desc"></span></label></th>
				                        <td>
				                            <textarea class="inp-base autosize" id="bsnsSchdul" name="bsnsSchdul" title="사업 일정" placeholder="500자 이내로 입력해주세요." title="500자 이내로 입력해주세요."></textarea>
				                        </td>
				                    </tr>
				                    
				                    <tr>
				                        <th scope="row"><label for="mysBgnde">희망모금기간<span class="required" aria-label="필수">*</span></label></th>
				                        <td>
				                            <div class="form-wrap size-d">
				                                <div class="form-col form-data size-b"><input type="text" class="inp-base _required" id="mysBgnde" name="mysBgnde" title="희망모금기간 시작일 예)20201101" placeholder="YYYYMMDD" maxlength="8"></div>
				                                <span class="date-picker-line">~</span>
				                                <div class="form-col form-data size-b"><input type="text" class="inp-base _required" id="mysEndde" name="mysEndde" title="희망모금기간 종료일 예)20201101" placeholder="YYYYMMDD" maxlength="8"></div>
				                            </div>
				                        </td>
				                    </tr>
				                    <tr>
				                        <th scope="row"><label for="bsnsBgnde">사업기간<span class="required" aria-label="필수">*</span></label></th>
				                        <td class="date-picker-box">
				                            <div class="form-wrap size-d">
				                                <div class="form-col form-data size-b"><input type="text" class="inp-base _required" id="bsnsBgnde" name="bsnsBgnde" title="사업기간 시작일 예)20201101" placeholder="YYYYMMDD" maxlength="8"></div>
				                                <span class="date-picker-line">~</span>
				                                <div class="form-col form-data size-b"><input type="text" class="inp-base _required" id="bsnsEndde" name="bsnsEndde" title="사업기간 종료일 예)20201101" placeholder="YYYYMMDD" maxlength="8"></div>
				                            </div>
				                            <span class="text-date-info">* 사업기간은 배분을 위해 상기 모금 종료일로부터 2주 이후 부터 설정가능합니다.</span>
				                        </td>
				                    </tr>
				                    <tr>
				                        <th scope="row"><label for="prtcpntCnt">사업참여인원<span class="required" aria-label="필수">*</span></label></th>
				                        <td>
				                            <div class="form-wrap size-e">
				                                <div class="form-col"><input type="text" class="form-w04 _required _number" id="prtcpntCnt" name="prtcpntCnt" title="사업참여인원"></div>
				                                <div class="form-col form-txt">명</div>
				                            </div>
				                        </td>
				                    </tr>
				                    <tr>
				                        <th scope="row"><label for="svcArea">서비스지역</label></th>
				                        <td>
				                            <div class="ui-select form-w05">
				                                <select id="svcArea" name="svcArea" title="서비스지역">
				                                    <c:out value="${comboSvcArea}" escapeXml="false" />
				                                </select>
				                            </div>
				                        </td>
				                    </tr>
				                    <tr>
				                        <th scope="row"><label for="svcTrget">서비스 대상<span class="required" aria-label="필수">*</span></label></th>
				                        <td><input type="text" class="form-w06 _required" id="svcTrget" name="svcTrget" placeholder="20자 이내로 입력해주세요." title="서비스 대상 20자 이내로 입력해주세요."></td>
				                    </tr>
				
				                    <tr>
				                        <th scope="row"><label for="goalAmount">모금 목표액<span class="required" aria-label="필수">*</span></label></th>
				                        <td>
				                            <div class="form-wrap size-f">
				                                <div class="form-col"><input type="text" class="inp-base _required _number" id="goalAmount" name="goalAmount" title="모금 목표액"></div>
				                                <div class="form-col form-txt">원</div>
				                            </div>
				                        </td>
				                    </tr>
				                    <tr>
				                        <th scope="row"><label for="goalAmountUsePlan">모금액 사용계획<span class="required" aria-label="필수">*</span><span class="row-desc">(소요예산)</span></label></th>
				                        <td>
				                            <textarea class="inp-base type3 _required" id="goalAmountUsePlan" name="goalAmountUsePlan" placeholder="300자이내로 입력하세요." title="모금액 사용계획(소요예산) 300자이내로 입력하세요."></textarea>
				                        </td>
				                    </tr>
				                    <tr>
				                        <th scope="row"><label for="goalAmountLackPlan">목표금액 미달시</label></th>
				                        <td><input type="text" class="form-w03" id="goalAmountLackPlan" name="goalAmountLackPlan" title="목표금액 미달시 50자 이내로 입력해주세요." placeholder="50자 이내로 입력해주세요."></td>
				                    </tr>
				                    </tbody>
				                </table>
				                </form>
				            </div>
				            <div class="btn-area">
				                <button type="button" id="btnReqstCrwdfund" class="btn-base-imp">신청하기</button>
				                <button type="button" id="btnCancelReqst" class="btn-base">취소하기</button>
				            </div>
				 			</div>
				 		</section>
				 		<!-- //펀딩신청 -->
				 	</div>
				 </div>
        </div>
    </div>
</main>
