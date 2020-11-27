<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>
<%@ include file="../../common/checkPlus/checkplus_main.jsp"%>

<script type="text/javascript">
    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
    	
        $('#attachFile').off('change').on('change', function(){
            if($(this).val() != ''){
                setFileNmView($(this));
            }
         });

         $('.btn-del-file').off('click').on('click', function(){
            initFileData($(this));
         });
    });

    $(document).on('click', '#btnStore, #btnCancel, #btnCheckPlus', function(e){
        e.preventDefault();

        var id = $(this).attr('id');

        // Button Click Event
        if(id == 'btnCancel'){
            refreshForm();
        }else if(id == 'btnStore'){
            insertCtznPropse();
        }else if(id == 'btnCheckPlus'){
        	window.name='mainPopup';
            fnPopup();
        }
    });

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
        $("#ctznPropseNm").val(sname);
        $("#ctznPropsePhone_1").val(a);
        $("#ctznPropsePhone_2").val(b);
        $("#ctznPropsePhone_3").val(c);

        $("#form_chk #result").val(result);
    }

    function fail() {
        alert("본인인증이 실패하였습니다.");
    }

    /*===========================================================
     * 첨부파일 뷰 처리 !!
     *===========================================================*/
    function setFileNmView(obj){
        $("#fileUploadList").html("");  // 초기화

        var fileNm      = obj.val().substring(obj.val().lastIndexOf('\\') + 1, obj.val().length);

        var fileHtml    = '<li>';
        fileHtml       += ' <span>' + fileNm + '</span><button type="button" class="btn-del">삭제</button>';
        fileHtml       += '</li>';

        var fileHtmlObj = $(fileHtml);
        fileHtmlObj.find("button.btn-del").off("click").on("click", function(){
            initFileData($(this));
        });

        $("#fileUploadList").append(fileHtmlObj);

        $("#fileUploadForm").hide();
        $("#fileUploadList").show();
    }

    function initFileData(obj){
        $("#fileUploadList").hide();
        $("#fileUploadForm").show();

        obj.remove();

        $('#attachFile').val(null);
        $('#attachFile').val('');
    }

    /*===========================================================
     * 공익신고 한 건 저장 !!
     *===========================================================*/
    function insertCtznPropse(){
        // 저장 공통 체크 !!
        if(!gf_storeDataCheck('propseForm')){
            return false;
        }

        combineData();

        if(!validationCheck()){
            return false;
        }

        if(!confirm("<spring:message code="check.confirm.store"></spring:message>")){   // 저장하시겠습니까?
            return false;
        }

        gf_sendFileForm('propseForm');
    }

    function combineData(){
        var ctznPropsePhone  = $('#ctznPropsePhone_1').val() + $('#ctznPropsePhone_2').val() + $('#ctznPropsePhone_3').val();
        $('#ctznPropsePhone').val(gf_toTel(ctznPropsePhone));

        var ctznPropseEmail  = $('#ctznPropseEmail_1').val() + '@' + $('#ctznPropseEmail_2').val();
        $('#ctznPropseEmail').val(ctznPropseEmail);

        if($("#agreAt1Chk").is(":checked")){
            $("#agreAt1").val("Y");
        }else{
            $("#agreAt1").val("N");
        }

        if($("#agreAt2Chk").is(":checked")){
            $("#agreAt2").val("Y");
        }else{
            $("#agreAt2").val("N");
        }
    }

    function validationCheck(){
        if($('#form_chk #result').val() == "N"){
            alert('본인 인증이 필요합니다.');
            return false;
        }

        if(!gf_isTel($('#ctznPropsePhone').val())){
            alert('전화번호 형식이 잘 못 되었습니다.');
            return false;
        }

        if(!gf_isEmail($('#ctznPropseEmail').val())){
            alert('이메일 형식이 잘 못 되었습니다.');
            return false;
        }

        if($("#agreAt1").val() == "N"){
            alert("개인정보 수집 및 이용에 동의 해주세요.");
            return false;
        }

        if($("#agreAt2").val() == "N"){
            alert("개인정보 제 3자 제공에 동의 해주세요.");
            return false;
        }

        return true;
    }

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * 공익신고 한 건 저장 Callback Function !!
     *===========================================================*/
    function insertCtznPropseAfter(data){
        if(data.result == "2"){
            alert("<spring:message code="result.save.success"></spring:message>");  // 저장되었습니다.

            refreshForm();
        } else if(data.result == "1001") {
        	alert("<spring:message code="result.file.type"></spring:message>");
        } else if(data.result == "1002") {
        	alert("<spring:message code="result.file.name"></spring:message>");
        } else if(data.result == "1003") {
        	alert("<spring:message code="result.file.maxsize"></spring:message>");
        } else if(data.result == "1004") {
        	alert("<spring:message code="result.file.empty"></spring:message>");
        } else {
            alert("<spring:message code="result.save.fail"></spring:message>");     // 저장에 실패하였습니다.
        }
    }

    /*===========================================================
     * 공익신고 폼 새로고침 !!
     *===========================================================*/
    function refreshForm(){
        gf_submitMovePage("<c:url value='/lf/ct/initPblbnfsttemnt.do' />", "pLinkSepCd=menuLink");
    }
</script>

<form name="form_chk" id="form_chk" method="post">
    <input type="hidden" name="m" value="checkplusSerivce">                     <!-- 필수 데이타로, 누락하시면 안됩니다. -->
    <input type="hidden" name="EncodeData" value="<%= sEncData %>">             <!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
    <input type="hidden" name="result" id="result" value="N" />
</form>

<div class="sub-visual visual04_03">
    <div class="sub-title-area">
        <h2 class="heading-title-a">신뢰와 투명성</h2>
        <p class="title-sub-txt">사랑의열매는 소중한 성금을 투명하고 공정하게 집행하고 있습니다.</p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3>
                <strong>공익신고</strong>
                <span>공익신고 코너 입니다.</span>
            </h3>
            <div class="contents-menu-nav"></div>
        </div>

        <div class="seo-box">
            <p class="text-top-info"></p>
            <form id="propseForm" name="propseForm" method="post" enctype="multipart/form-data" action="<c:url value='/lf/ct/insertCtznPropse.do'/>">
            <input type="hidden" name="ctznPropseSe" id="ctznPropseSe" value="02" />
            <div class="tb-type_a mb-type">
                <table summary="공익신고">
                    <caption>공익신고신청정보 설정입니다.</caption>
                    <colgroup>
                        <col class="col-xs">
                        <col class="col-auto">
                    </colgroup>
                    <colgroup>
                        <col class="col-xs">
                        <col class="col-auto">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row"><label for="ctznPropseNm">이름</label></th>
                        <td colspan="3"><input type="text" class="form-w01 _required" name="ctznPropseNm" id="ctznPropseNm" title="이름" readonly="readonly"></td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="ctznPropsePhone_1">휴대폰 번호</label></th>
                        <td colspan="3">
                            <div class="phone-area">
                                <input type="text" class="inp-base _required" title="휴대폰 앞자리" readonly="readonly" id="ctznPropsePhone_1">
                                <span class="txt-mark">-</span>
                                <input type="text" class="inp-base _required" title="휴대폰 중간자리" readonly="readonly" id="ctznPropsePhone_2">
                                <span class="txt-mark">-</span>
                                <input type="text" class="inp-base _required" title="휴대폰 뒷자리" readonly="readonly" id="ctznPropsePhone_3">
                                <button type="button" class="btn-base-imp small" id="btnCheckPlus">본인인증</button>
                            </div>
                            <input type="hidden" class="inp-base" title="휴대폰 전체" name="ctznPropsePhone" id="ctznPropsePhone">
                            <p class="text-guide">
                            - NICE 평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다.<br>
                        	- 본인인증시 반복적으로 오류가 발생하면 NICE기술지원(1600-1522)로 전화부탁드립니다.
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="ctznPropseEmail_1">이메일</label></th>
                        <td colspan="3">
                            <div class="form-wrap size-b">
                                <div class="form-col"><input type="text" class="inp-base _required" id="ctznPropseEmail_1" title="이메일 아이디"></div>
                                <div class="form-col form-txt">@</div>
                                <div class="form-col"><input type="text" class="inp-base _required" id="ctznPropseEmail_2" title="이메일 주소"></div>
                            </div>
                            <input type="hidden" name="ctznPropseEmail" id="ctznPropseEmail" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="appl03_i99">첨부파일</label></th>
                        <td colspan="3">
                            <div id="fileUploadForm">
                                <p class="donation-guide-txt mgb-xs">* 3MB이하, 이미지 파일의 경우 jpg, gif파일만 첨부 가능.</p>
                                <div class="fileupload-area">
                                    <input type="text" class="inp-base" id="attachFileView" readonly="readonly" title="첨부파일">
                                    <!-- S : 2019-10-28 modify -->
                                    <span class="fileupload-btn">
                                        <input type="file" id="attachFile" name="attachFile"   title="파일 찾아보기" class="in-file">
                                        <button type="button" class="btn-base small">찾아보기</button>
                                    </span>
                                    <!-- E : 2019-10-28 modify -->
                                </div>
                            </div>
                            <ul class="list-fileupload" id="fileUploadList" style="margin-top:0px;display:none;"></ul>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="ctznPropseCn">제안 내용</label></th>
                        <td colspan="3">
                            <textarea class="inp-base _required" id="ctznPropseCn" name="ctznPropseCn"></textarea>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!-- 동의 -->
            <div class="terms-group">
                <span class="checkbox">
                    <input type="checkbox" name="agreAt2Chk" id="agreAt1Chk">
                    <label for="agreAt1Chk"><span>개인정보 수집 및 이용에 동의 합니다.</span></label>
                    <input type="hidden" name="agreAt1" id="agreAt1" />
                </span>
                <textarea class="inp-base" readonly="readonly" title="개인정보 수집 및 이용에 동의에 관한 정보입니다.">사회복지공동모금회(이하 “모금회”라 함)는 「개인정보 보호법」제15조에 의거하여 개인정보수집 및 이용에 관한 정보주체의 동의절차를 준수하며, 고지 후 수집된 정보는 모금회의 개인정보 수집 및
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
                <span class="checkbox">
                    <input type="checkbox" name="agreAt2Chk" id="agreAt2Chk">
                    <label for="agreAt2Chk"><span>개인정보 제 3자 제공에 동의 합니다.</span></label>
                    <input type="hidden" name="agreAt2" id="agreAt2" />
                </span>
                <textarea class="inp-base" readonly="readonly" title="개인정보 제 3자 제공에 동의에 관한 정보입니다.">본인은 모금회가 「개인정보 보호법」제17조제1항제1호에 의거, 다음과 같이 본인의 개인정보를 제3자에게 제공하는 것에 대하여 동의합니다.
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
            </form>
            <!-- 신청하기 -->
            <div class="btn-area">
                <button type="button" class="btn-base-imp" id="btnStore">확인</button>
            </div>
            <!-- 신청하기 -->
        </div>
    </div>
</main>
<script>
function setTestData() {
	$("#ctznPropseNm").val("test");
	$("#ctznPropsePhone_1").val("010");
	$("#ctznPropsePhone_2").val("2020");
	$("#ctznPropsePhone_3").val("4048");
	$("#ctznPropseEmail_1").val("goodday0701");
	$("#ctznPropseEmail_2").val("gmail.com");
	$("#ctznPropseCn").val("메일발송 테스트입니다 메일발송 테스트입니다 메일발송 테스트입니다메일발송 테스트입니다 메일발송 테스트입니다메일발송 테스트입니다");
	$("#result").val("Y");
}
</script>