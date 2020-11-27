<!--
 ************************************************************************************************ 
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴] 사업 > 나눔문화 활성화 > 어린이 나눔체험관   
 * Author      : 
 * Description : 
 *************************************************************************************************
-->

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>
<%@ include file="../../common/checkPlus/checkplus_main.jsp"%>

<script type="text/javascript">


var url = "/bn/sca";
var myGrid = null;
var CURR_PAGE_NO = "<c:out value='${paramMap.currPageNo}' />";
var param={};
var _compayCheckFlag = false;

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        myGrid = gf_initMyGrid();
        
        init();
        gf_keyNumber('frm');
        
        //setTestData()
    });
    
    /*===========================================================
     * 초기화 FUNCTION  
     *===========================================================*/ 
    function init(){
        
        goTabDisplay(0);  // 신청 안내 Tab
        keyEvent();    //숫자만 입력가능

        CURR_PAGE_NO = 1;
        selectInsttList(!gf_isNull(CURR_PAGE_NO) ? Number(CURR_PAGE_NO) : 1);
     
        
        _common.makeSelectLayout();    //select box         
        
    }
        
    /*===========================================================
     * 조회 텝으로 이동하기 FUNCTION  
     *===========================================================*/   
    function goTabDisplay(obj){

        $(".ui-tab-pnl").attr({'aria-hidden':'true'}) ;
        $(".ui-tab-btn").attr('class','ui-tab-btn');

        $("#btn" + obj ).attr('class','ui-tab-btn selected');
        $("#pnl"+ obj +".ui-tab-pnl").attr({'aria-hidden':'false'}) ;
            
    }    
    
    /*===========================================================
     * 신청내역조회TAB 의 나눔체험 신청 리스트  조회 !!
     *===========================================================*/
    function selectInsttList(pageNo){
       gf_send(url + "/selectInsttList.do", gf_searchParam(pageNo));
    }
        
    /*===========================================================
     * 숫자만 입력가능 (전화번호 , )
     *===========================================================*/    
    function keyEvent() {
        //숫자만 입력가능
        $("input:text[numberOnly]").on("keyup keydown", function() {
            $(this).val($(this).val().replace(/[^0-9]/g,""));
        });     
        
    }   
    
    /*===========================================================
     * 본인 인증 여부 에 필요한 Function 
     *===========================================================*/    
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
        if( !_compayCheckFlag ) {
            $("#phone1").val(a);
            $("#phone2").val(b);
            $("#phone3").val(c);
            $("#result").val(result);
        } else {
            $("#companyPhone1").val(a);
            $("#companyPhone2").val(b);
            $("#companyPhone3").val(c);
            $("#companyResult").val(result);
        }
        _compayCheckFlag = false;
    }
    
    function fail() {
        _compayCheckFlag = false;
        alert("본인인증이 실패하였습니다.");
    }    
    /*===========================================================
     *  버튼 클릭시 Function
     *===========================================================*/    
    $(document).on("click", "#searchZipCode ,#checkPlus , #btnInsert ,  #btnList ,#companyCheckPlus" ,  function(e){
        e.preventDefault();
        var id = $(this).attr("id");
        
        // 우편번호 검색  
        if( id == "searchZipCode") {
            openZipCode('zip','adres1');
        }
        //[신청하기TAB] 신청정보 -본인인증 
        if( id == "checkPlus") {
        	window.name='mainPopup';
            fnPopup();
        }
        //[신청내역조회TAB]- 본인인증
        if( id == "companyCheckPlus") {
            _compayCheckFlag = true;
            window.name='mainPopup';
            fnPopup();
        }
        //[신청하기TAB] 신청정보 -신청하기 버튼 
        if( id == "btnInsert") {
            
            if( !validator() ) return;
            makeFormData();   
            if ( $("#flag").val() == "I"){
                
                if( confirm("신청 하시겠습니까?") ) {
                    $('#progrsStep').val("01"); // 접수완료 
                    $("#lnbnsSn").val("-1");
                    
                    gf_sendFileForm("frm", url + "/insert.do" );
                }
            }else
            if ( $("#flag").val() == "U"){

                if( confirm("변경 하시겠습니까?") ) {
                    gf_sendFileForm("frm", url + "/insert.do" );
                }
            }else{
                alert("작업 오류");
            }
        }
        //[신청내역조회TAB]-조회 버튼 
        if( id == "btnList" ) {
            
            if( !companyValidator() ) return;
            
            if( confirm("조회 하시겠습니까?") ) {
                
                var telno = $("#companyPhone1").val() + "" +  $("#companyPhone2").val() + "" +  $("#companyPhone3").val();

                $("#applcntNm").val($("#companyNm").val() );
                $("#applcntMbtlnum").val(telno);
                
                gf_send(url +  "/selectInsttList.do", gf_searchParam(1,"frm"));
                
            }
        }
    });    

    $(document).on("change", "#visitHopeT" , function(e){
        e.preventDefault();
        var id = $(this).attr("id");
        var tval = $("#visitHopeT option:checked").val();
        
    });    
    
    
    /*===========================================================
     *  신청정보 의 신청하기 전  값 Function
     *===========================================================*/    
    function validator() {
        
        // 신청자명
        if( $.trim( $("#applcntNm").val() ).length == 0 ) {
            alert("신청자명을 입력해주세요");
            $("#applcntNm").focus();
            return false;
        }
        
        // Email 
        if( $.trim( $("#email1").val() ).length == 0 || $.trim( $("#email2").val() ).length == 0 ) {
            alert("이메일을 입력해주세요");
            $("#email1").focus();
            return false;
        }
        var email = $("#email1").val() + "@" + $("#email2").val();              //이메일
        if( isEmail( email ) == false ) {
            alert("이메일 형식이 아닙니다.");
            return false;
        }
        
        // 신청기관명
        if( $.trim( $("#applcntInsttNm").val() ).length == 0 ) {
            alert("신청기관명 을 입력해주세요");
            $("#applcntInsttNm").focus();
            return false;
        }
        
        // 기관유형 
        if ( $.trim( $("#applcntInsttTy").val() ).length == 0  ){
            alert("기관유형을  선택해 주세요");
            $("#applcntInsttTy").focus();
            return false;
        }  
        
        // 우편번호 , 주소 , 상세 주소
        if( $.trim( $("#zip").val() ).length == 0 ) {
            alert("우편번호를 입력해주세요");
            $("#zip").focus();
            return false;
        }
        if( $.trim( $("#adres1").val() ).length == 0 ) {
            alert("주소를 입력해주세요");
            return false;
        }
        if( $.trim( $("#adres2").val() ).length == 0 ) {
            alert("상세주소를 입력해주세요");
            $("#adres2").focus();
            return false;
        } 
        
        // 희망일자 및 시간 
        if ( $.trim( $("#visitHopeD").val() ).length == 0 ){
            alert("희망 방문일을  선택해주세요");
            $("#visitHopeD").focus();
            return false;
        } 
        
        if ( $.trim( $("#visitHopeTime").val() ).length == 0  ){
            alert("희망 방문 시각을  선택해주세요");
            $("#visitHopeTime").focus();
            return false;
        }  

        // 연령대 
        if ( $.trim( $("#agrde").val() ).length == 0  ){
            alert("연령대를 입력해 주세요");
            $("#agrde").focus();
            return false;
        }  
        
        // 견학대상유형  
        if ( $.trim( $("#lnbnsTrgetTy").val() ).length == 0  ){
            alert("견학대상유형을  선택해 주세요");
            $("#lnbnsTrgetTy").focus();
            return false;
        }  

        if ( $.trim( $("#lnbnsNmpr").val() ).length == 0  ){
            alert("견학인원수을  입력해 주세요");
            $("#lnbnsNmpr").focus();
            return false;
        }  
        
        // 교사명, 교사휴대푠, 교사이메일  
        if( $.trim( $("#chargerNm").val() ).length == 0  ) {
            alert("교사명 을 입력해주세요");
            $("#chargerNm").focus();
            return false;
        }

        if( $.trim( $("#chargerPhone1").val() ).length == 0 || $.trim( $("#chargerPhone2").val() ).length == 0 || $.trim( $("#chargerPhone3").val() ).length == 0 ) {
            alert("교사 휴대폰 을 입력해주세요");
            $("#chargerPhone1").focus();
            return false;
        }
        
        
        // Email 
        if( $.trim( $("#chargerEmail1").val() ).length == 0 || $.trim( $("#chargerEmail2").val() ).length == 0 ) {
            alert("교사 이메일을 입력해주세요");
            $("#chargerEmail1").focus();
            return false;
        }
        var email = $("#chargerEmail1").val() + "@" + $("#chargerEmail2").val();              //이메일
        if( isEmail( email ) == false ) {
            alert("이메일 형식이 아닙니다.");
            return false;
        }

        
        if( $.trim( $("#result").val() ) == "N" ) {
            alert("본인인증을 해주세요");
            $("#checkPlus").focus();
            return false;
        } 
        
        
        // 등의 여부         
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
        
        
        return true;
    }

    /*===========================================================
     *  신청내역조회 의 상담신청 전  값  check Function
     *===========================================================*/    
    function companyValidator() {
        
        // [신청내역조회] - 신청자명      
        if( $.trim( $("#companyNm").val() ).length == 0 ) {
            alert("신청자명을 입력해주세요");
            $("#companyNm").focus();
            return false;
        }
     // [신청내역조회] - 인증      
        if( $("#companyResult").val()  == "N" ) {
            alert("인증을 해주세요");
            return false;
        }            
        return true;
    }    
    
    /*===========================================================
     * 리스트에서 신청기관 틀릭시 신청하기  페이지로 이동
     *===========================================================*/
   function goReqstInfoDetail(sn,flag){
    
       $("#lnbnsSn").val(sn);
       
       flag == 0 ? $('#flag').val("R") : $('#flag').val("U");
       
       gf_sendForm("frm", url + "/detailInfo.do" );
       
   }   
    
   /*===========================================================
    * 리스트에서 신청 취소 
    *===========================================================*/
  function goCancel(obj){
       
       if( confirm("취소 하시겠습니까?") ) {
           var sn = $(obj).data("lnbns_sn");
           $("#lnbnsSn").val(sn);
           
           $("#cancelAt").val("Y");
           gf_sendForm("frm", url + "/cancel.do" );
       }
  }    
    
   /*===========================================================
    * select 나  insert 시 Data setting  
    *===========================================================*/
   function makeFormData() {
       // 신청자 휴대푠 
       var mbtlnum = $("#phone1").val() + "" + $("#phone2").val() + "" + $("#phone3").val();
       $("#applcntMbtlnum").val( mbtlnum );
       
       // 신청자 이메일 
       var email = $("#email1").val() + "@" + $("#email2").val();              //이메일
       $("#applcntEmail").val( email );
       
       // 희망일자 및 시간 
       var dVal = gf_toMask($("#visitHopeD").val(),'-');
       $("#visitHopeDe").val(dVal);
       
       // 교사 연락처
       var num = $("#chargerPhone1").val() + "" + $("#chargerPhone2").val() + "" + $("#chargerPhone3").val();
       $("#chargerMbtlnum").val( num );
        // 이메일
       var email = $("#chargerEmail1").val() + "@" + $("#chargerEmail2").val();              //이메일
       $("#chargerEmail").val( email );
       
       // 동의 여부 
       //개인정보 수집
       var arr=[];
       $('input[name="agreeInfo"]').each(function(i) {
           var chk = $("input:checkbox[name='agreeInfo']").eq(i).is(":checked");
        if( i==0 ) 
            $("#agreAt").val(( chk == true ? "Y" : "N" ));
        else 
            $("#thptyAgreAt").val(( chk == true ? "Y" : "N" ));
       });
        
       
   };
    
   /*************************************************************
    * Ajax Send Callback Function !!
    *************************************************************/    
    /*===========================================================
     * 신청하기 Callback Function
     *===========================================================*/
   function insertAfter(data) {
       if( data.result > 0 ) {
           alert("<spring:message code="result.save.success"></spring:message>");  // 저장되었습니다.
           location.href = url + "/initChildse.do";
           return;
       } else {
           alert("<spring:message code="result.save.fail"></spring:message>");     // 저장에 실패하였습니다.
       }
   }
   /*===========================================================
    * 취소하기  Callback Function
    *===========================================================*/
   function cancelAfter(data){
       
       if( data.result > 0 ) {
           alert("<spring:message code="result.save.success"></spring:message>");  // 저장되었습니다.
           //location.href = url + "/init.do";
           selectInsttList();
           return;
       } else {
           alert("<spring:message code="result.save.fail"></spring:message>");     // 저장에 실패하였습니다.
       }
   }
   /*===========================================================
    * 신청상세 조회 Callback Function
    *===========================================================*/
   function detailInfoAfter(data){
       
       if (data.listDetail.length > 0){
           var item = data.listDetail[0];
           
           goTabDisplay(0);  // 신청하기 화면 go

            // 신청하기 버튼 비활성화 
           // $('#btnInsert').attr('disabled',true);
           if ($("#flag").val() == "U"){
               $("#btnInsert").text("변경하기");  
               $("#btnInsert").show();
               $("#applcntNm").attr('readonly',true);
           }else
           if ($("#flag").val() == "R"){
               $("#btnInsert").hide();
               $("#applcntNm").attr('readonly',true);
           }else{
               $("#btnInsert").show();
               $("#applcntNm").attr('readonly',false);
           }
           // 견학 일련번호 
           $("#lnbnsSn").val(item.lnbnsSn);
           // 처리단계 
           $("#progrsStep").val(item.progrsStep);

        // 신청자명
           $("#applcntNm").val(item.applcntNm); 
           // 신청자휴대푠 
           var telno = item.applcntMbtlnum; 
           $("#phone1").val(telno.substring(0,3));
           $("#phone2").val(telno.substring(3,7));
           $("#phone3").val(telno.substring(7));
           
           //이메일
           var email = item.applcntEmail;
           email = email.split("@");
           $("#email1").val( email[0]);
           $("#email2").val( email[1]);
           
           // 신청기관명
           $("#applcntInsttNm").val(item.applcntInsttNm); 
           
           //기관유형 
           $("select[name='applcntInsttTy'] option[value='"+ item.applcntInsttTy +"']").prop("selected",true);
           $("#applcntInsttTy").trigger("change");
           
           
           // 우편번호, 주소
           $("#zip").val(item.zip);
           $("#adres1").val(item.adres1);
           $("#adres2").val(item.adres2);

           // 희망일자 및 시간 
           var d = gf_formatDate(item.visitHopeDe);
           $("#visitHopeD").datepicker('setDate', d);
           
           $("select[name='visitHopeTime'] option[value='"+ item.visitHopeTime +"']").prop("selected",true); 
           $("#visitHopeTime").trigger("change");
           
           // 연령대
           $("#agrde").val(item.agrde);
           
           // 견학대상 유형, 견학인원수 
           $("select[name='lnbnsTrgetTy'] option[value='"+ item.lnbnsTrgetTy +"']").prop("selected",true);
           $("#lnbnsTrgetTy").trigger("change");
           
           $("#lnbnsNmpr").val(item.lnbnsNmpr);
           
           // 담당교사
           $("#chargerNm").val(item.chargerNm);
           
           var telno = item.chargerMbtlnum;
           $("#chargerPhone1").val(telno.substring(0,3));
           $("#chargerPhone2").val(telno.substring(3,7));
           $("#chargerPhone3").val(telno.substring(7));
           
           var email = item.chargerEmail;
           email = email.split("@");
           $("#chargerEmail1").val( email[0]);
           $("#chargerEmail2").val( email[1]);
           
           // 특이사항 
           $("#partclrMatter").val(item.partclrMatter); 
           
           // 개인정보 수집 동의
           item.agreAt =="Y" ? $("input:checkbox[id='agreeInfo']").prop("checked", true): $("input:checkbox[id='agreeInfo']").prop("checked", false);
           
           // 개인정보 제3자 제공동의 여부 
           item.thptyAgreAt =="Y" ? $("input:checkbox[id='agreeInfo1']").prop("checked", true): $("input:checkbox[id='agreeInfo1']").prop("checked", false);
           
       }
       
   }      
   
   /*===========================================================
    * 신청내역 조회 Callback Function !!
    *===========================================================*/
    function selectInsttListAfter(data){
       
       var listInfo = data.listInfo;
       var listHtml = "";
       var updateFlag = 1;  // 수정 가능 건수 
       
       for(var i=0; i<listInfo.length; i++){
           
           var no               = listInfo[i].no;             /* 번호        */
           var lnbnsSn          = listInfo[i].lnbnsSn;        /* 견학일련번호   */
           var applcntInsttNm   = listInfo[i].applcntInsttNm; /* 신청기관명 */
           var applcntNm        = listInfo[i].applcntNm;      /* 신청자명  */
           var hope             = listInfo[i].visitHope;      /* 신청일시 */
           var visitHopeD       = listInfo[i].visitHopeDe;    /* 신청일 */
           var progrsStep       = listInfo[i].progrsStep;     /* 신청상태 */
           var progrsStepNm     = listInfo[i].progrsStepNm;   /* 신청상태명 */
           var canclAtNm        = listInfo[i].canclAtNm;      /* 신청취소명 */
           var canclAt          = listInfo[i].canclAt;        /* 신청취소 */
           
           

           // 신청 취소 
           // 견학희망일의 1주일 전까지 신청 취소 가능
           // 한번 취소한 데이터는 취소 불가 
           // 승인완료된 경우는 취소 불가
           if (progrsStep=="03" ){
               canclAt ="Y";
           }
           else
           if( canclAt == "Y" ){
               canclAt ="Y";
           }
           else
           if( gf_calDate(gf_todayStr(),"day",7) > visitHopeD ){
               canclAt ="Y";
           }
           
           // 조회 및 수정 여부 
           // 취소 불가 및 승인 완료인 경우는 조회만 , 나머지 경우는 수정 가능
           if ( progrsStep == "03" || canclAt == "Y" ){
               updateFlag = 0;
           }else{
               updateFlag = 1;
           }
            
           listHtml += '<tr>';
           listHtml += '    <td title="' + no         + '" class="th-number">'         + no           + '</td>';
           listHtml += '    <td title="나눔체험 신청" class="th-type">나눔체험 신청</td>';
           listHtml += '    <td title="' + applcntInsttNm         + '" class="th-title">';
           listHtml += '      <a href="javascript:;" onClick="javascript:goReqstInfoDetail(' + lnbnsSn + ',' + updateFlag + '); ">' + applcntInsttNm + '</a>'; 
           listHtml += '    </td>';
                      
           listHtml += '    <td title="' + applcntNm + '" class="th-write">'     + applcntNm   + '</td>';
           listHtml += '    <td title="' + hope + '" class="th-write">'          + hope   + '</td>';
           listHtml += '    <td title="' + progrsStepNm + '" class="th-write">'  + progrsStepNm   + '</td>';
           
           listHtml += '    <td>';
        
        
           if ( canclAt == "Y"){
               listHtml += '<b>취소불가</b>';    
           }else{
               listHtml += '<button type="button" class="btn-base small" onClick="javascript:goCancel(this);" data-lnbns_sn="' + lnbnsSn + '">취소</button>';
           }
           listHtml += '    </td>';
           
           listHtml += '</tr>';
       }
       
       var opt = { listHtml  : listHtml              // (필수) List Html
               ,pageFunc  : "selectInsttList"         // (필수) Page Link Function = Search Function과 동일
               ,pageInfo  : data.pageInfo            // (필수) Page Information Object
              };

       myGrid.makeList(opt);
   }    
   
//     function setTestData() {
//        $("#phone1").val("010");
//        $("#phone2").val("3333");
//        $("#phone3").val("4444");
       
//        $("#result").val("Y");
//        $("#companyResult").val("Y");

//        $("#companyPhone1").val("010");
//        $("#companyPhone2").val("3333");
//        $("#companyPhone3").val("4444");

//    }      
        
</script>


<form name="form_chk" method="post">
    <input type="hidden" name="m" value="checkplusSerivce">                     <!-- 필수 데이타로, 누락하시면 안됩니다. -->
    <input type="hidden" name="EncodeData" value="<%= sEncData %>">             <!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
    <input type="hidden" name="result" id="result" value="N" />
    <input type="hidden" name="companyResult" id="companyResult" value="N" />
    <input type="hidden" name="flag" id="flag" value="I" />   <!--  U : 변경  I : 신청 -->
    
</form>

<!-- 신청내역조회 폼 -->
<form id="companyFrm" name="companyFrm" method="post" >
    <input type="hidden" name="nm" id="hidNm" />
    <input type="hidden" name="telno" id="hidTelno" />
</form>

<div class="sub-visual visual03_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">나눔문화 활성화</h2>
        <p class="title-sub-txt">나눔문화 활성화를 위해 다양한 사업을 진행하고 있습니다</p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3><strong>어린이 나눔체험관</strong><span>나눔의 미래를 위해 아동들을 대상으로 나눔체험관을 운영합니다</span></h3>
            <div class="contents-menu-nav">
            </div>
        </div>

        <div class="seo-box">
        
            <form id="frm" name="frm" method="post" enctype="multipart/form-data" action="<c:url value='/bn/sca/insert.do' />">
            <input type=hidden name="lnbnsSn"               id="lnbnsSn" />                 <!-- 견학일련번호 -->
            <input type=hidden name="applcntMbtlnum"        id="applcntMbtlnum" />          <!-- 연락처전화번호 -->
            <input type=hidden name="applcntEmail"          id="applcntEmail" />            <!-- 신청자이메일 -->
            <input type=hidden name="visitHopeDe"           id="visitHopeDe" />             <!-- 희망일자 -->
            <input type=hidden name="chargerMbtlnum"        id="chargerMbtlnum" />          <!-- 담당교사휴대폰 -->
            <input type=hidden name="chargerEmail"          id="chargerEmail" />            <!-- 담당교사이메일 -->
            <input type=hidden name="agreAt"                id="agreAt" />                  <!-- 개인정보제공동의여부 -->
            <input type=hidden name="thptyAgreAt"           id="thptyAgreAt" />             <!-- 제3자제공이용동의 -->
            <input type=hidden name="progrsStep"            id="progrsStep" />              <!-- 처리단계-->
        
            <div class="article-contents-text">
                <p class="text-desc">사랑의열매 나눔체험관은 체험과 놀이를 통한 나눔이해를 위해 만들어진 곳으로 타인에 대한 배려를 배우고 생활 속 나눔 실천을 다짐하는 참여형 체험공간입니다. 운영시간은 평일 9시-6시며 매주 토요일도 시민들을 위해 개방하고 있습니다. 이용 대상은 유아 및 초중고학생 성인 등 나눔에 관심있는 누구나 자유롭게 이용가능하며, 기관별 단체 견학 희망 시, 최대 30명 이내로 사전신청을 받아 운영하고 있습니다. 또한 초중고학생을 대상으로 하는 머니투데이방송과 연계한 '나눔행복버스'라는 프로그램을 연 20회정도 진행하고 있습니다.</p>
                <p class="text-desc">나눔체험관은 다양한 영상자료와 체험활동을 통해 나눔을 자연스럽게 배울 수 있도록 총 6개의 구역으로 구성되어 있습니다. 1구역은 나눔에 대한 개념이해 공간으로 구성되어 있고, 2구역에서는 일상 속 나눔 실천정도와 나눔방식을 인식하도록 합니다. 3구역은 우리나라의 전통 속 나눔문화를 설명하는 공간이고, 4구역은 나눔의 종류를 알아보는 공간으로 구성되어 있습니다. 5구역은 장애체험을 통해 타인의 어려움을 공감하고 장애를 이해하는 공간, 6구역은 나눔이 어떤 긍정적인 변화를 일으키는지 확인하는 공간으로 꾸며져 있습니다.</p>
                <div class="btn-area-r">
                    <a href="https://chest.or.kr/lf/intrcn/initBranchintrcn.do?mapYn=Y" class="btn-base-line small" >찾아오시는 길</a>
                </div>
            </div>
            
            
            <div class="ui-tab ui-tab-type2 contents-tab" id="uiTabCCKI12_1">
                <div class="ui-tab-btns" btn-id="uiTabCCKI12_1">
                    <button type="button" class="ui-tab-btn" id="btn0" onclick="javascript:goTabDisplay(0);"><i>신청하기</i></button>
                    <button type="button" class="ui-tab-btn" id="btn1" onclick="javascript:goTabDisplay(1);"><i>신청내역조회</i></button>
                </div>
                <div class="ui-tab-pnls" pnl-id="uiTabCCKI12_1">
                    <section class="ui-tab-pnl" id ="pnl0">
                        <h1 class="hide">신청하기</h1>
                        <div class="tab-contents">
                            <div class="tb-type_a mb-type">
                                <table summary="신청정보 설정">
                                    <caption>신청정보 설정입니다.</caption>
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
                                        <th scope="row"><label for="applcntNm">신청자명<span class="required" aria-label="필수">*</span></label></th>
                                        <td colspan="3"><input type="text" class="form-w01" name="applcntNm" id="applcntNm" title="신청자명"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><label for="phone1">신청자 휴대폰<span class="required" aria-label="필수">*</span></label></th>
                                        <td colspan="3">
                                            <div class="phone-area">
                                                <input type="text" class="inp-base" title="휴대폰 앞자리" title="휴대폰 앞자리" name="phone1" id="phone1" readonly value="">
                                                <span class="txt-mark">-</span>
                                                <input type="text" class="inp-base" title="휴대폰 중간자리" title="휴대폰 앞자리" name="phone2" id="phone2" readonly value="">
                                                <span class="txt-mark">-</span>
                                                <input type="text" class="inp-base" title="휴대폰 뒷자리" title="휴대폰 앞자리" name="phone3" id="phone3" readonly value="">
                                                <button type="button" class="btn-base-imp small" id="checkPlus" title="새창열림">본인인증</button>
                                            </div>
                                            <p class="text-guide">- NICE 평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다.</p>
                                            <p class="text-guide">- 기부자 본인을 확인하기 위해서 기부자님의 본인인증이 반드시 필요합니다.</p>
                                            <p class="text-guide">- 본인인증시 반복적으로 오류가 발생하면 NICE기술지원(1600-1522)로 전화부탁드립니다. </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><label for="email1">신청자 이메일<span class="required" aria-label="필수">*</span></label></th>
                                        <td colspan="3">
                                            <div class="form-wrap size-b">
                                                <div class="form-col"><input type="text" class="inp-base" id="email1"  name="email1" title="이메일 아이디"></div>
                                                <div class="form-col form-txt">@</div>
                                                <div class="form-col"><input type="text" class="inp-base" title="이메일 주소" id="email2"  name="email2"></div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><label for="appl03_i5">신청기관명<span class="required" aria-label="필수">*</span></label></th>
                                        <td colspan="3"><input type="text" class="form-w01" id="applcntInsttNm" name="applcntInsttNm" maxlength="50" title="신청기관명"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><label for="applcntInsttTy">기관유형<span class="required" aria-label="필수">*</span></label></th>
                                        <td colspan="3">
                                            <div class="ui-select form-w01">
                                                <select class="sel_type" id="applcntInsttTy" name="applcntInsttTy" title="신청기관명 선택">
                                                    <c:out value="${applcntInsttTyM}" escapeXml="false" />
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><label for="appl03_i7">우편번호<span class="required" aria-label="필수">*</span></label></th>
                                        <td colspan="3">
                                            <div class="form-wrap size-a">
                                                <div class="form-col"><input type="text" class="inp-base" title="우편번호" readonly id="zip" name="zip"></div>
                                                <div class="form-col form-btn"><button type="button" class="btn-base-imp small "  id="searchZipCode" title="새창열림">우편번호 검색</button></div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><label for="appl03_address">주소<span class="required" aria-label="필수">*</span></label></th>
                                        <td colspan="3"><input type="text" class="form-w01" id="adres1" readonly name ="adres1" title="주소"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><label for="appl03_address2">상세주소<span class="required" aria-label="필수">*</span></label></th>
                                        <td colspan="3"><input type="text" class="form-w01" id="adres2" name="adres2"  title="상세주소"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label for="visitHopeD">희망일자 및 시간<span class="required" aria-label="필수">*</span></label>
                                        </th>
                                        <td colspan="3">
                                           <div class="form-wrap size-b">
                                                <div class="form-col form-data">
                                                    <input type="text" class="inp-base _number" id="visitHopeD" name="visitHopeD" title="희망일자" placeholder="날짜 입력" maxlength="8"></div>
                                                <div class="form-col">
                                                    <div class="ui-select sel_small">
                                                        <select class="sel_type" id="visitHopeTime" name="visitHopeTime" title="시간 선택">
                                                            <c:out value="${visitHopeTimeM}" escapeXml="false" />
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <p class="text-guide">- 실제 견학일자는 예약현황에 따라 변경 될 수 있습니다.</p>
                                            <p class="text-guide">- 교육은 약 90분 정도 소요되며, 정확한 견학시각은 예약현황 확인 후 연락 드리겠습니다.</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><label for="agrde">연령대<span class="required" aria-label="필수">*</span></label></th>
                                        <td colspan="3">
                                            <div class="form-wrap size-a">
                                                <div class="form-col"><input type="text" class="inp-base" id="agrde" name="agrde" title="연령대"></div>
                                                <div class="form-col form-txt">(예 : 5세 ~ 10세 )</div>
                                            </div>
                                            <p class="text-guide">- 원활한 교육진행을 위해 인원수는 20명 이내를 권장합니다.</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><label for="lnbnsTrgetTy">견학대상유형<span class="required" aria-label="필수">*</span></label></th>
                                        <td>
                                            <div class="ui-select form-w02">
                                                <select class="sel_type" id="lnbnsTrgetTy" name ="lnbnsTrgetTy" title="신청기관명 선택">
                                                    <c:out value="${lnbnsTrgetTyM}" escapeXml="false" />
                                                </select>
                                            </div>
                                        </td>
                                        <th scope="row"><label for="lnbnsNmpr">견학인원수<span class="required" aria-label="필수">*</span></label></th>
                                        <td>
                                            <div class="form-wrap size-c">
                                                <div class="form-col"><input type="text" class="inp-base" id="lnbnsNmpr" name="lnbnsNmpr" title="견학인원수"></div>
                                                <div class="form-col form-txt">명</div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="row">담당 교사<span class="required" aria-label="필수">*</span></th>
                                        <td colspan="3">
                                            <div class="class-info">
                                                <label for="chargerNm" class="class-info-t">교사명</label>
                                                <input type="text" class="inp-base" id="chargerNm" name="chargerNm" title="교사명">
                                            </div>
                                            <div class="class-info">
                                                <label for="chargerMbtlnum" class="class-info-t">교사 휴대폰</label>
                                                <div class="phone-area">
                                                    <input type="text" class="inp-base" title="휴대폰 앞자리" id="chargerPhone1" numberOnly maxlength ="3">
                                                    <span class="txt-mark">-</span>
                                                    <input type="text" class="inp-base" title="휴대폰 중간자리" id="chargerPhone2" numberOnly maxlength ="4">
                                                    <span class="txt-mark">-</span>
                                                    <input type="text" class="inp-base" title="휴대폰 뒷자리" id="chargerPhone3" numberOnly maxlength ="4">
                                                </div>
                                            </div>
                                            <div class="class-info">
                                                <label for="chargerEmail" class="class-info-t">교사 이메일</label>
                                                <div class="class-contents">
                                                    <div class="form-wrap size-b">
                                                        <div class="form-col"><input type="text" class="inp-base" id="chargerEmail1" name="chargerEmail1" title="이메일 아이디"></div>
                                                        <div class="form-col form-txt">@</div>
                                                        <div class="form-col"><input type="text" class="inp-base" id="chargerEmail2" name="chargerEmail2"  title="이메일 주소"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><label for="partclrMatter">특이사항</label></th>
                                        <td colspan="3">
                                            <textarea class="inp-base" id="partclrMatter" name ="partclrMatter"> </textarea>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- 동의 -->
                                        <div class="terms-group">
                                                <span class="checkbox">
                                                    <input type="checkbox" name="agreeInfo" id="agreeInfo">
                                                    <label for="agreeInfo"><span>개인정보 수집 및 이용에 동의 합니다.</span></label>
                                                </span>
                                            <textarea class="inp-base" readOnly title="개인정보 수집 및 이용에 동의에 관한 정보입니다.">사회복지공동모금회(이하 “모금회”라 함)는 「개인정보 보호법」제15조에 의거하여 개인정보수집 및 이용에 관한 정보주체의 동의절차를 준수하며, 고지 후 수집된 정보는 모금회의 개인정보 수집 및 
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
  라. 개인정보의 보유 및 이용기간 : 1.주민등록번호 : 기부금 입금일을 기준으로 소득공제가 실시되는 기간동안, 2.기타 : 모금회가 정한 보존기간동안 </textarea>
                                            <span class="checkbox">
                                                    <input type="checkbox" name="agreeInfo" id="agreeInfo1">
                                                    <label for="agreeInfo1"><span>개인정보 제 3자 제공에 동의 합니다.</span></label>
                                                </span>
                                            <textarea class="inp-base" readOnly>본인은 모금회가 「개인정보 보호법」제17조제1항제1호에 의거, 다음과 같이 본인의 개인정보를 제3자에게 제공하는 것에 대하여 동의합니다.         
  가. 개인정보를 제공받는 자 : 기부금의 자동 출금을 위한 금융결제원, 기부내역의 소득공제 확인을 위한 국세청
  나. 개인정보를 제공받는 자의 이용 목적 : 정기기부금의 출금 및 기부금 소득공제 근거자료 활용
  다. 제공하는 개인정보의 항목 : 위 1호 다목에 해당하는 개인정보
  라. 개인정보를 제공받는 자의 보유 및 이용기간 : 
       주민등록번호 : 기부금 입금일을 기준으로 소득공제가 실시되는 기간동안       
     기타 : 모금회가 정한 보존기간동안</textarea>
                                            <div class="btn-area-r">
                                                <button type="button" class="btn-base-bline small"><a href="javascript:goFootPrivacy();">개인정보처리방침</a></button>
                                            </div>
                                        </div>
                                        <!-- //동의 -->
                            <!-- 신청하기 -->
                            <div class="btn-area">
                                <button type="button" class="btn-base-imp" id="btnInsert">신청하기</button>
                            </div>
                            <!-- 신청하기 -->
                        </div>
                    </section>

                    <!-- SB_CCK_FUNR_02 -->
                    <section class="ui-tab-pnl" id="pnl1">
                        <h1 class="hide">신청내역조회</h1>
                        <div class="tab-contents">
                            <div class="sb-box mgt-l">
                                <div class="sb-box-inner">
                                    <p class="sb-contents-tit">신청내역조회</p>
                                    <div class="sb-content">
                                        <div class="sb-content-tbl line-top mgt-m">
                                            <table>
                                                <caption>신청내역조회 정보입니다.</caption>
                                                <colgroup>
                                                    <col class="col-l">
                                                    <col class="col-auto">
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <th scope="row">
                                                        <label for="appl03_t3_1">신청자명</label>
                                                    </th>
                                                    <td>
                                                        <input type="text" class="inp-base w-full" id="companyNm" name= "companyNm"  title="신청자명">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">
                                                        <label for="appl03_t3_2">신청자 휴대폰</label>
                                                    </th>
                                                    <td class="phone-area">
                                                        <div class="table-cell ps-box">
                                                            <span><input type="text" class="inp-base" title="휴대폰 앞자리 입력" id="companyPhone1" readonly="readonly" numberOnly value=""></span>
                                                            <span><input type="text" class="inp-base" title="휴대폰 가운데자리 입력" id="companyPhone2" readonly="readonly" numberOnly value="" ></span>
                                                            <span><input type="text" class="inp-base" title="휴대폰 뒷자리 입력" id="companyPhone3" readonly="readonly" numberOnly value=""></span>
                                                            <button type="button" class="btn-base-imp small" id= "companyCheckPlus">인증</button>
                                                        </div>

                                                        <p class="table-cell">
                        	- NICE 평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다.<br>
                        	- 본인인증시 반복적으로 오류가 발생하면 NICE기술지원(1600-1522)로 전화부탁드립니다.
                        </p>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div class="btn-area">
                                            <a href="" class="btn-base-imp" id="btnList">조회하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tb-type_b type-appl03-t3">
                                <div class="wide-scroll">
                                    <table id="dataGridList">
                                        <caption>신청내역 조회 정보</caption>
                                        <colgroup>
                                            <col class="n1">
                                            <col class="n2">
                                            <col class="n3">
                                            <col class="n4">
                                            <col class="n5">
                                            <col class="n6">
                                            <col class="n8">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th scope="col">번호</th>
                                            <th scope="col">구분</th>
                                            <th scope="col">신청기관명</th>
                                            <th scope="col">신청자명</th>
                                            <th scope="col">신청일시</th>
                                            <th scope="col">신청상태</th>
                                            <th scope="col">신청취소</th>
                                        </tr>
                                        </thead>
                                        <tbody>
<!--                                         <tr> -->
<!--                                             <td>37</td> -->
<!--                                             <td>기관방문 신청</td> -->
<!--                                             <td><a href="#">000유치원</a></td> -->
<!--                                             <td>홍길동</td> -->
<!--                                             <td>2018-12-01 13:40</td> -->
<!--                                             <td>접수완료</td> -->
<!--                                             <td> -->
<!--                                                 <button type="button" class="btn-base small">취소</button> -->
<!--                                             </td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td>37</td> -->
<!--                                             <td>기관방문 신청</td> -->
<!--                                             <td><a href="#">000유치원</a></td> -->
<!--                                             <td>홍길동</td> -->
<!--                                             <td>2018-12-01 13:40</td> -->
<!--                                             <td>접수완료</td> -->
<!--                                             <td> -->
<!--                                                 <b>취소불가</b> -->
<!--                                             </td> -->
<!--                                         </tr> -->

                                        </tbody>
                                    </table>
                                </div>
                                <div class="paging-area" id="dataGridPageNavi" ></div>

                                <div class="bbs-search">
                                    <div class="search-area">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </section>
                    <!-- //SB_CCK_FUNR_02 -->
                </div>
            </div>
        </div>
    </form>
    </div>
</main>

<script>
(function($, win, doc, undefined) {
    
    $( "#visitHopeD" ).datepicker({
        showOn: "button",
        dateFormat: "yy-mm-dd",
        buttonImage: "/common/img/common/btn_datepicker.png",
        buttonImageOnly: true,
        buttonText: "Select date"
    });    
    
})(jQuery, window, document);
    
</script>