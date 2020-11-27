<!--
 ************************************************************************************************ 
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [하단메뉴] 각종신청 > 기관방문 신청 
 * Author      : 
 * Description : 
 *************************************************************************************************
-->

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>
<%@ include file="../../common/checkPlus/checkplus_main.jsp"%>

<script type="text/javascript">

//empl_yn
var url = "/cm/sereqst";
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
	    //setTestData();
	});
	
    /*===========================================================
     * 초기화 FUNCTION  
     *===========================================================*/ 
	function init(){
        
	    goTabDisplay(0);  // 신청 안내 Tab
        keyEvent();    //숫자만 입력가능

	    CURR_PAGE_NO = 1;
        
        selectInsttList(!gf_isNull(CURR_PAGE_NO) ? Number(CURR_PAGE_NO) : 1);
        
	    // makeSeletctBox 
        var el='<option hidden value="">시간</option>';
        for( var i=10; i<=18; i++ ) {
            el += "<option value='"+zeroSum(i)+"'>" + zeroSum(i) + "</option>";         
        }
        $("#prmHopeT").html(el);  //시간
        $("#scdHopeT").html(el);  //시간
        
        var el='<option hidden value="">분</option>';
        for( var i=00; i<=50; i+=10 ) {
            el += "<option value='"+zeroSum(i)+"'>" + zeroSum(i) + "</option>";
        }
        $("#prmHopeM").html(el);  //분
        $("#scdHopeM").html(el);  //분
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
     * 신청내역조회TAB 의 기관방문신청 리스트  조회 !!
     *===========================================================*/
   function selectInsttList(pageNo){
       gf_send("/cm/sereqst/selectInsttList.do", gf_searchParam(pageNo));
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
    $(document).on("click", "#checkPlus , #btnInsert ,  #btnList ,#companyCheckPlus, #btnRegist" ,  function(e){
        e.preventDefault();
        var id = $(this).attr("id");

        //[신청하기TAB] 신청정보 -본인인증 
        if( id == "checkPlus") {
        	window.name='mainPopup';
            fnPopup();
        }
        //[신청내역조회TAB]- 본인인증
        if( id == "companyCheckPlus") {
        	window.name='mainPopup';
            _compayCheckFlag = true;
            fnPopup();
        }
        //[신청안내TAB]  기관방문 신청하기 버튼 
        if( id == "btnRegist" ) {
            
            goTabDisplay(1); 
             
            clearValue();
            
            $("#flag").val("I");
            $("#btnInsert").text("신청하기");
            $("#btnInsert").show();
            $("#applcntNm").attr('readonly',false);
            
        }        
        //[신청하기TAB] 신청정보 -신청하기 버튼 
        if( id == "btnInsert") {
            
            if( !validator() ) return;
            makeFormData();   
            
            if ( $("#flag").val() == "I"){
                if( confirm("신청 하시겠습니까?") ) {
                    
                    $('#progrsStep').val("01"); // 접수완료 
                    $("#visitSn").val("-1");
                    
                    //gf_sendFileForm("frm");
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
        //[신청내역조회TAB]-상담신청 버튼 
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
    
    /*===========================================================
     *  신청정보 의 신청하기 전 값 clear Function
     *===========================================================*/    
    function clearValue(){

        
        $("#visitSn").val("-1");
        $("#applcntNm").val("");  // 신청자명  
        
        $("#phone1").val("");$("#phone2").val("");$("#phone3").val(""); // 신청자휴대폰
        
        $("#result").val("N");
        $("#companyResult").val("N");
        
        $("#applcntInsttNm").val("");  // 기관(학교)명
        $("#psitn").val("");           // 소속(학과)
        
        $("#psitnPhone1").val("");        $("#psitnPhone2").val("");        $("#psitnPhone3").val("");  // 연락처
        
        $("#email1").val("");  $("#email2").val("");  // 이메일
        
        $("#atnlcSbject").val(""); $("#profsr").val(""); $("#whlrs").val("");  // 수강과목, 교수명, 총인원 
        $("input:radio[name='visitYn']").prop("checked",false);                // 방문여부 

        // 파일 공문 
        $(".list-fileupload > li").remove();
        $("#file , #txt").val("");

        // 희망 방문일시 
        $("#prmHopeDe").val("");
        $("#scdHopeDe").val("");
        
        $('#prmHopeT').val(""); $("#prmHopeT").trigger("change");
        $('#prmHopeM').val(""); $("#prmHopeM").trigger("change");
        $('#scdHopeT').val(""); $("#scdHopeT").trigger("change");
        $('#scdHopeM').val(""); $("#scdHopeM").trigger("change");
        
        // 방문목적
        $("#visitPurps").val("");
        
        // 질문내용  
        $("#qestn").val("");
        $("input:radio[name='photoAt']").prop("checked",false);

        // 개인정보 
        $("input:checkbox[name='agreeInfo']").prop("checked",false);
    }
    
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

        

        // 기관(학교)명
        if( $.trim( $("#applcntInsttNm").val() ).length == 0 ) {
            alert("기관(학교)명 을 입력해주세요");
            $("#applcntInsttNm").focus();
            return false;
        }
        // 소속(학과)
        if( $.trim( $("#psitn").val() ).length == 0 ) {
            alert("소속(학과) 을 입력해주세요");
            $("#psitn").focus();
            return false;
        }
        // 연락처
        if( $.trim( $("#psitnPhone1").val() ).length == 0 || $.trim( $("#psitnPhone2").val() ).length == 0 || $.trim( $("#psitnPhone3").val() ).length == 0 ) {
            alert("연락처 을 입력해주세요");
            $("#psitnPhone1").focus();
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
        
        if ( $.trim( $("#prmHopeDe").val() ).length == 0 ){
            alert("1차 희망 방문일을  입력해주세요");
            $("#prmHopeDe").focus();
            return false;
        }else{
            var val = $.trim( $("#prmHopeDe").val());
            var pattern = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
            
            if (!pattern.test(val)){
                alert("방문일을  입력 형식이 아닙니다. 확인하세요 ");
                return false;
            }
            
            
            if (!gf_isValidDate(val)){
                alert("방문일을 잘못입력하셨습니다. 확인하세요 ");
                return false;
            };
        } 
        
        if ( $.trim( $("#prmHopeT").val() ).length == 0 || $.trim( $("#prmHopeM").val() ).length == 0 ){
            alert("1차 희망 방문 시간을  선택해주세요");
            $("#prmHopeT").focus();
            return false;
        }  

        if ( $.trim( $("#scdHopeDe").val() ).length == 0 ){
            alert("2차 희망 방문일을  입력해주세요");
            $("#scdHopeDe").focus();
            return false;
        }else{
            var val = $.trim( $("#scdHopeDe").val());
            var pattern = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
            
            if (!pattern.test(val)){
                alert("방문일을  입력 형식이 아닙니다. 확인하세요 ");
                return false;
            }
            
            if (!gf_isValidDate(val)){
                alert("방문일을 잘못입력하셨습니다. 확인하세요 ");
                return false;
            };
        } 
        
        if ( $.trim( $("#scdHopeT").val() ).length == 0 || $.trim( $("#scdHopeM").val() ).length == 0 ){
            alert("2차 희망 방문 시간을  선택해주세요");
            $("#scdHopeT").focus();
            return false;
        }  
        
        // 방문목적
        if( $.trim( $("#visitPurps").val() ).length == 0 ) {
            alert("방문목적을 입력해주세요");
            $("#visitPurps").focus();
            return false;
        }
        
        // 사진 촬영 여부
//         var chk = $(':radio[name="photoAt"]:checked').val();
//         if ( gf_isNull(chk) ){
//             alert("사진 촬영 여부 을 선택하세요");
//             $("#photoAt").focus();
//             return false;
//         }
        
        if( $.trim( $("#result").val() ) == "N" ) {
            alert("본인인증을 해주세요");
            $("#checkPlus").focus();
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
      * 리스트에서 신청기관 틀릭시 신청내용상세보기 페이지로 이동
      *===========================================================*/
    function goReqstInfoDetail(sn,flag){
                
        $("#visitSn").val(sn);

        flag == 0 ? $('#flag').val("R") : $('#flag').val("U");
        
        gf_sendForm("frm", url + "/detailInfo.do" );
        
    }    
    /*===========================================================
     * 리스트에서 신청 취소 
     *===========================================================*/
   function goCancel(obj){
        
        
        var sn = $(obj).data("visit_sn");
        $("#visitSn").val(sn);
        
        $("#cancelAt").val("Y");
        gf_sendForm("frm", url + "/cancel.do" );
       
   }    
     
    /*===========================================================
     * select 나  insert 시 Data setting  
     *===========================================================*/
    function makeFormData() {
        
        // 신청자 휴대푠 
        var mbtlnum = $("#phone1").val() + "" + $("#phone2").val() + "" + $("#phone3").val();
        $("#applcntMbtlnum").val( mbtlnum );
        
        // 연락처
        var num = $("#psitnPhone1").val() + "" + $("#psitnPhone2").val() + "" + $("#psitnPhone3").val();
        $("#psitnPhone").val( num );
        // 이메일
        var email = $("#email1").val() + "@" + $("#email2").val();              //이메일
        $("#psitnEmail").val( email );
        
        var rVal = $(':radio[name="visitYn"]:checked').val(); 
        $("#visitYn").val( rVal);
        // 질문 
        var rVal = $(':radio[name="photoAt"]:checked').val(); 
        $("#photoAt").val( rVal);
        
        // 회망방문일시 
        var dVal = gf_toMask($("#prmHopeDe").val(),'-');
        $("#prmHopeDe").val(dVal);
        
        $("#prmHopeTm").val(  $("#prmHopeT").val() +  $("#prmHopeM").val()  );
        
        var dVal = gf_toMask($("#scdHopeDe").val(),'-');
        $("#scdHopeDe").val(dVal);

        $("#scdHopeTm").val( $("#scdHopeT").val() +  $("#scdHopeM").val() );
        
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
            location.href = url + "/init.do";
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
            
            goTabDisplay(1);  // 신청하기 화면 go
            
            
            // 신청하기 버튼 
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
            // 방문 일련번호 
            $("#visitSn").val(item.visitSn);
            // 처리단계 
            $("#progrsStep").val(item.progrsStep);
            
            // 신청자명
            $("#applcntNm").val(item.applcntNm);            
            // 신청자휴대푠 
            var telno = item.applcntMbtlnum; 
            $("#phone1").val(telno.substring(0,3));
            $("#phone2").val(telno.substring(3,7));
            $("#phone3").val(telno.substring(7));
            
            // 신청기관명, 소속(학과)
            $("#applcntInsttNm").val(item.applcntInsttNm);  
            $("#psitn").val(item.psitn);                   
            
            // 연락처
            var telno = item.psitnPhone;
            $("#psitnPhone1").val(telno.substring(0,3));
            $("#psitnPhone2").val(telno.substring(3,7));
            $("#psitnPhone3").val(telno.substring(7));
            //이메일
            var email = item.psitnEmail;
            email = email.split("@");
            $("#email1").val( email[0]);
            $("#email2").val( email[1]);
            
            $("#atnlcSbject").val(item.atnlcSbject);            // 수강과목
            $("#profsr").val(item.profsr);                      // 교수명
            $("#whlrs").val(item.whlrs);                        // 총인원
            
            
            $("input:radio[name='visitYn']:radio[value='"+item.visitYn+"']").prop("checked",true);    //인솔자방문여부
            $("input:radio[name='photoAt']:radio[value='"+item.photoAt+"']").prop("checked",true);    //사진촬영 여부
            
            // 기관방문 공문
            //$('#txt').val(item.orginlFileNm);
            var fileName  = item.orginlFileNm;
            
            if ( !gf_isNull(fileName )){
                
                el = '<li><span>' + fileName + '</span><button type="button" class="btn-del">삭제</button></li>';
                $(".list-fileupload").html(el);
                
                $(".btn-del").click( function() {
                    $(".list-fileupload > li").remove();
                    $("#file , #txt").val("");
                });                
            }
            // 희망 방문일시 
            var De = item.prmHopeDe;
            $("#prmHopeDe").val(De.substring(0,4)+"-"+De.substring(4,6)+"-"+De.substring(6));
            
            var De = item.scdHopeDe;
            $("#scdHopeDe").val(De.substring(0,4)+"-"+De.substring(4,6)+"-"+De.substring(6));
            
            // 시간            
            $("select[name='prmHopeT'] option[value='"+ item.prmHopeTm.substring(0,2) +"']").prop("selected",true);      //종료시간            
            $("select[name='prmHopeM'] option[value='"+ item.prmHopeTm.substring(2,4) +"']").prop("selected",true);      //종료시간            
            $("select[name='scdHopeT'] option[value='"+ item.scdHopeTm.substring(0,2) +"']").prop("selected",true);      //종료시간            
            $("select[name='scdHopeM'] option[value='"+ item.scdHopeTm.substring(2,4) +"']").prop("selected",true);      //종료시간            
            
            $("#prmHopeT").trigger("change");
            $("#prmHopeM").trigger("change");
            $("#scdHopeT").trigger("change");
            $("#scdHopeM").trigger("change");
            // 방문목적
            $("#visitPurps").val(item.visitPurps);            

            // 질문내용 
            $("#qestn").val(item.qestn);
            
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
            var visitSn          = listInfo[i].visitSn;        /* 신청일련번호   */
            var applcntInsttNm   = listInfo[i].applcntInsttNm; /* 신청기관명 */
            var applcntNm        = listInfo[i].applcntNm;      /* 신청자명  */
            var prmHope          = listInfo[i].prmHope;        /* 1방문희망일자 */
            var scdHope          = listInfo[i].scdHope;        /* 2방문희망일자 */
            var progrsStep       = listInfo[i].progrsStep;     /* 신청상태 */
            var progrsStepNm     = listInfo[i].progrsStepNm;   /* 신청상태명 */
            var canclAtNm        = listInfo[i].canclAtNm;      /* 신청취소 */
            var canclAt          = listInfo[i].canclAt;        /* 신청취소 */
            var prmHopeDe        = listInfo[i].prmHopeDe;      /* 1방문희망일자 */
            var scdHopeDe        = listInfo[i].scdHopeDe;      /* 2방문희망일자 */
            
            

            // 신청 취소 여부
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
            if( gf_calDate(gf_todayStr(),"day",7) > prmHopeDe || gf_calDate(gf_todayStr(),"day",7) > scdHopeDe ){
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
            listHtml += '    <td title="기관방문 신청" class="th-type">기관방문 신청</td>';
            listHtml += '    <td title="' + applcntInsttNm         + '" class="th-title">';
            listHtml += '      <a href="javascript:;" onClick="javascript:goReqstInfoDetail(' + visitSn + ',' + updateFlag + '); ">' + applcntInsttNm + '</a>'; 
            listHtml += '    </td>';
            listHtml += '    <td title="' + applcntNm + '" class="th-write">'          + applcntNm   + '</td>';
            listHtml += '    <td title="' + prmHope + '" class="th-write">'          + prmHope   + '</td>';
            listHtml += '    <td title="' + scdHope + '" class="th-write">'          + scdHope   + '</td>';
            listHtml += '    <td title="' + progrsStepNm + '" class="th-write">'          + progrsStepNm   + '</td>';
            
            listHtml += '    <td>';
         
         
            if ( canclAt == "Y"){
                listHtml += '<b>취소불가</b>';    
            }else{
                listHtml += '<button type="button" class="btn-base small" onClick="javascript:goCancel(this);" data-visit_sn="' + visitSn + '">취소</button>';
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
    

     function fileOnchangeEvent( obj ) {
     //  alert($('input[type=file]')[0].files[0].name);
         var id = $(obj)[0].getAttribute("id");
         var file = $("#"+id).val();
         var f = file.lastIndexOf("\\");
         var e = file.lastIndexOf("\.");
         var fileName = file.substring(f+1,e);
         
//          if(!file.match(/\.(jpg)$/i)){
//              alert("출금동의증빙자료는 jpg만 가능합니다.");
//              $("#"+id).focus();
//              return false;
//          }
         
         $("#txt").val( fileName );
         
         el = '<li><span>' + fileName + '</span><button type="button" class="btn-del">삭제</button></li>';
         $(".list-fileupload").html(el);
         
         $(".btn-del").click( function() {
             $(".list-fileupload > li").remove();
             $("#file , #txt").val("");
         });
     }
    
    function setTestData() {
        
        $("#phone1").val("010");
        $("#phone2").val("5410");
        $("#phone3").val("6023");
        
        $("#result").val("Y");
        $("#companyResult").val("Y");

        $("#companyPhone1").val("010");
        $("#companyPhone2").val("5410");
        $("#companyPhone3").val("6023");

        $("#applcntNm").val("김개똥");
        
        
        $("#applcntInsttNm").val("개똥이네");
        $("#psitn").val("11");
        
        $("#psitnPhone1").val("010");        $("#psitnPhone2").val("2222");        $("#psitnPhone3").val("3333");
        
        $("#email1").val("123");  $("#email2").val("123.com");
        $("#atnlcSbject").val("");
        
        $("#profsr").val("나라");
        $("#whlrs").val("1");
        
        $("input:checkbox[name='agreeInfo']").prop("checked",true);
        // 희망 방문일시 
        $("#prmHopeDe").val("2019-12-01");
        $("#scdHopeDe").val("2019-12-15");
        
        $('#prmHopeT').val("");
        $('#prmHopeM').val("");
        $('#scdHopeT').val("");
        $('#scdHopeM').val("");
        
        $("#prmHopeT").trigger("change");
        $("#prmHopeM").trigger("change");
        $("#scdHopeT").trigger("change");
        $("#scdHopeM").trigger("change");        
        
        $("#visitPurps").val("없음");
            
        $("#qestn").val("없음");        
        
    }    
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

<div class="sub-visual visual_f03">
    <div class="sub-title-area">
        <h2 class="heading-title-a">기관방문 신청</h2>
        <p class="title-sub-txt">보다 친근한 사랑의열매가 되기 위해 노력하겠습니다.</p>
    </div>
</div>
    
<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3><strong>기관방문 신청</strong><span>기관방문 신청절차를 안내 드립니다.</b></span></h3>
            <div class="contents-menu-nav">
            </div>
        </div>

        <div class="seo-box">
                    <form id="frm" name="frm" method="post" enctype="multipart/form-data" action="<c:url value='/cm/sereqst/insert.do' />">
                    <input type=hidden name="visitSn"              id="visitSn" />                       <!-- 일련번호 -->
                    <input type=hidden name="applcntMbtlnum"       id="applcntMbtlnum" />                <!-- 신청자휴대번호 -->
                    <input type=hidden name="psitnPhone"           id="psitnPhone" />                    <!-- 소속처연락처 -->
                    <input type=hidden name="psitnEmail"           id="psitnEmail" />                    <!-- 소속처이메일 -->
                    <input type=hidden name="visitYn"              id="visitYn" />                       <!-- 인솔자방문여부 -->
                    <input type=hidden name="flpth"                id="flpth" />                         <!-- 파일저장경로 -->
                    <input type=hidden name="serverFileNm"         id="serverFileNm" />                  <!-- 서버파일명 -->
                    <input type=hidden name="orginlFileNm"         id="orginlFileNm" />                  <!-- 원파일명 -->
                    <input type=hidden name="fileExtsn"            id="fileExtsn" />                     <!-- 파일확장자 -->
                    <input type=hidden name="fileMg"               id="fileMg" />                        <!-- 파일크기 -->
                    <input type=hidden name="prmHopeTm"            id="prmHopeTm" />                     <!-- 1차희망방문일시 -->
                    <input type=hidden name="scdHopeTm"            id="scdHopeTm" />                     <!-- 2차희망방문일시 -->
                    <input type=hidden name="photoAt"              id="photoAt" />                       <!-- 사진촬영여부 -->
                    <input type=hidden name="agreAt"               id="agreAt" />                        <!-- 개인정보제공동의여부 -->
                    <input type=hidden name="thptyAgreAt"          id="thptyAgreAt" />                   <!-- 제3자제공이용동의 -->
                    <input type=hidden name="progrsStep"           id="progrsStep" />                    <!-- 처리단계-->
                    
            <div class="ui-tab ui-tab-type2 col-3 contents-tab" id="uiTabAPPL03_1">
                <div class="ui-tab-btns" btn-id="uiTabAPPL03_1">
                    <button type="button" class="ui-tab-btn" id="btn0" onclick="javascript:goTabDisplay(0);"><i>신청안내</i></button>
                    <button type="button" class="ui-tab-btn" id="btn1" onclick="javascript:goTabDisplay(1);"><i>신청하기</i></button>
                    <button type="button" class="ui-tab-btn" id="btn2" onclick="javascript:goTabDisplay(2);"><i>신청내역조회</i></button>
                </div>
                <div class="ui-tab-pnls" pnl-id="uiTabAPPL03_1">
                    <section class="ui-tab-pnl" id ="pnl0">
                        <h1 class="hide">신청안내</h1>
                        <div class="tab-contents">
                            <!-- S : 2019-10-14 modify -->
                            <div class="area-type-a type6">
                            <!-- E : 2019-10-14 modify -->
                                <img src="/common/img/contents/appl03_img.png" alt="">
                                <p><strong>사회복지공동모금회 기관방문 신청 안내</strong></p>
                                <p>사회복지공동모금회에 많은 관심을 가져 주셔서 감사드립니다.</p>
                                <p>기관방문은 보다 친근한 사랑의열매가 되기 위해 사랑의열매가 진행하는 서비스 프로그램입니다.<br> 특정 기간 동안 방문요청이 집중되는 관계로 일정한 규칙을 정해 운영하고 있습니다.</p>
                                <p>안내 사항을 꼼꼼히 확인하신 후 신청해주세요.</p>
                            </div>

                            <h4 class="table-tit">운영안내</h4>
                            <div class="tb-type_a">
                                <table>
                                    <caption>운영안내 정보</caption>
                                    <col class="col-w01">
                                    <col class="col-auto">
                                    <tbody>
                                        <tr>
                                            <th scope="row">운영내용</th>
                                            <td>모금회 소개(시청각 자료 외), 기타 질의응답, 나눔문화센터 견학</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">운영시간</th><!-- 191003 -->
                                            <td>소요시간 50분 내외</td><!-- 191003 -->
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                            <div class="table-tit">
                                <h4>신청안내</h4>
                                <span>* 기관방문 관련 공문필수(기관방문 신청 시 업로드)</span>
                            </div>
                            <div class="tb-type_a">
                                <table>
                                    <caption>신청안내 정보</caption>
                                    <col class="col-w01">
                                    <col class="col-auto">
                                    <tbody>
                                        <tr>
                                            <th scope="row">신청기간</th>
                                            <td>방문일 2주 전 신청 (신청 가능 요일 및 시간 : 화~금요일 / 오전 10~11시, 오후 2~4시)</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">신청방법</th>
                                            <td>사회복지공동모금회 사이트 접속 후 공지 → 기관방문 → 기관방문 신청 메뉴 누른 후 신청</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">기준인원</th>
                                            <td>10명 이상</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <h4 class="table-tit">기타</h4>
                            <div class="donation-article type2">
                                <ul class="donation-desc type2">
                                    <li>1. 기관 방문 의뢰 전, 공동모금회 홈페이지를 참조해 관련 내용을 미리 확인해 주세요.</li>
                                    <li>2. 효과적인 기관방문 운영을 위해 궁금하신 내용을 미리 작성해주세요</li>
                                    <li>3. 신청하신 기관방문 날짜가 겹칠 경우 타 기관과 함께 진행될 수 있으며, 기준인원(20명)이 초과될 경우 접수일 기준으로 신청기관을 제한해 운영합니다. <br>이에 방문일이 조정될 수 있습니다.</li><!-- 191003 -->
                                    <li>4. 접수가 완료되면 전화나 메일을 통해 기관방문을 확정하며, 최종 확인 문자를 보내드립니다.</li>
                                    <li>5. 확정된 날짜와 시간을 변경(취소)할 경우는 반드시 7일전에 연락해 주세요.</li>
                                </ul>
                            </div>

                            <div class="attach-area mgt-l">
                                <div class="contact-wrap">
                                    <span>문의 : 마케팅본부 서정애</span><!-- 191003 -->
                                    <span class="ico-tel">02-6262-3038</span><!-- 191003 -->
                                    <span class="ico-email">sia0727@chest.or.kr</span><!-- 191003 -->
                                </div>
                            </div>

                            <div class="btn-area">
                                <button type="button" class="btn-base-imp" id="btnRegist">기관방문 신청하기</button>
                            </div>

                        </div>
                    </section>

                    <!-- SB_CCK_APPL_04 : 신청하기 -->
                    <section class="ui-tab-pnl" id ="pnl1">
                        <h1 class="hide">신청하기</h1>
                        <div class="tab-contents">
                            <h2 class="table-tit">신청정보</h2><!-- 191003 -->
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
                                        <th scope="row">
                                            <label for="applcntNm" >신청자명<span class="required" aria-label="필수">*</span></label></label>
                                        </th>
                                        <td colspan="3"><input type="text" class="form-w01" name="applcntNm" id="applcntNm" title="신청자명"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label for="phone1">신청자 휴대폰<span class="required" aria-label="필수">*</span></label></label>
                                        </th>
                                        <td colspan="3">
                                            <div class="phone-area">
                                                <input type="text" class="inp-base" title="휴대폰 앞자리" name="phone1" id="phone1" readonly value="">
                                                <span class="txt-mark">-</span>
                                                <input type="text" class="inp-base" title="휴대폰 중간자리" name="phone2" id="phone2" readonly value="">
                                                <span class="txt-mark">-</span>
                                                <input type="text" class="inp-base" title="휴대폰 뒷자리" name="phone3" id="phone3" readonly value="">
                                                <button type="button" class="btn-base-imp small"  id="checkPlus">본인인증</button>
                                            </div>
                                            <p class="donation-guide-txt">
                                            	- NICE 평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다.<br>
                        						- 본인인증시 반복적으로 오류가 발생하면 NICE기술지원(1600-1522)로 전화부탁드립니다.
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label for="applcntInsttNm">기관(학교)명<span class="required" aria-label="필수">*</span></label></label>
                                        </th>
                                        <td><input type="text" class="form-w01" id="applcntInsttNm" name="applcntInsttNm"  maxlength="20"  title="기관(학교)명"></td>
                                        <th scope="row">
                                            <label for="psitn">소속(학과)<span class="required" aria-label="필수">*</span></label>
                                        </th>
                                        <td><input type="text" class="form-w01" id="psitn" name="psitn" title="소속(학과)"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label for="psitnPhone">연락처<span class="required" aria-label="필수">*</span></label>
                                        </th>
                                        <td colspan="3">
                                            <div class="phone-area">
                                                <input type="text" class="inp-base" title="연락처 앞자리" id="psitnPhone1" numberOnly maxlength ="3">
                                                <span class="txt-mark">-</span>
                                                <input type="text" class="inp-base" title="연락처 중간자리" id="psitnPhone2" numberOnly maxlength ="4">
                                                <span class="txt-mark">-</span>
                                                <input type="text" class="inp-base" title="연락처 뒷자리" id="psitnPhone3" numberOnly maxlength ="4">
                                            </div>
                                            <p class="donation-guide-txt ">* 소속(학과)의 전화번호를 입력해 주세요.</p>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="row">
                                            <label for="email1">이메일<span class="required" aria-label="필수">*</span></label>
                                        </th>
                                        <td colspan="3">
                                            <div class="email-area">
                                                <input type="text" class="inp-base" id="email1"  name="email1"  title="이메일 아이디" style="ime-mode:disable;" >
                                                <span class="email-ico">@</span>
                                                <input type="text" class="inp-base" title="이메일 주소" name="email2" id="email2" style="ime-mode:disable;">
                                            </div>
                                            <p class="donation-guide-txt mgt-xxs">* 소속(학과)의 이메일을 입력해 주세요.</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="bg-p">수업의 경우</th>
                                        <td colspan="3">
                                            <div class="class-info">
                                                <label for="atnlcSbject" class="class-info-t">수강과목</label>
                                                <input type="text" class="inp-base" id="atnlcSbject" name="atnlcSbject" title="수강과목">
                                            </div>
                                            <div class="class-info">
                                                <label for="profsr" class="class-info-t">교수명</label>
                                                <input type="text" class="inp-base" id="profsr" name="profsr" title="교수명">
                                            </div>
                                            <div class="class-info">
                                                <label for="whlrs" class="class-info-t">총 인원</label>
                                                <div class="class-contents">
                                                    <div class="form-wrap size-c">
                                                        <div class="form-col"><input type="text" class="inp-base" id="whlrs" name="whlrs" title="총 인원" numberOnly ></div>
                                                        <div class="form-col form-txt">명</div>
                                                    </div>
                                                </div>
                                                
                                                <dl class="class-info-inline">
                                                    <dt>* 교수님 및 인솔자(신청인) 방문여부 :</dt>
                                                    <dd class="radio-group">
                                                        <span class="radio">
                                                            <input type="radio" name="visitYn" id="visitYn1" value="Y" ">
                                                            <label for="visitYn1"><span>Y</span></label>
                                                        </span>
                                                        <span class="radio">
                                                            <input type="radio" name="visitYn" id="visitYn2" value="N" ">
                                                            <label for="visitYn2"><span>N</span></label>
                                                        </span>
                                                    </dd>
                                                </dl>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">기관방문 공문</th>
                                                <td colspan="3">
                                                    <p class="donation-guide-txt mgb-xs">* 기관방문 관련 공문을 업로드 해주세요. (파일용량 제한 : 5MB)</p>
                                                        
                                                    <div class="fileupload-area">
                                                        <input type="text" class="inp-base" title="출금의로동의서 업로드" id="txt" readonly="readonly">
                                                        <input type="file" size="30" id="file" name="attachFile1" title="파일 찾아보기"  style="display:none;" onchange="fileOnchangeEvent(this);" />
                                                        <button type="button" class="btn-base small" onclick="$('#file').click();">찾아보기</button>
                                                    </div>
                                                    <ul class="list-fileupload">
<!--                                                             <li><i class="ico-file"></i>191003 -->
<!--                                                                 <span>출금동의서.hwp</span><button type="button" class="btn-del">삭제</button> -->
<!--                                                             </li> -->
                                                    </ul>
                                                </td>
                                    </tr>

                                    <tr>
                                        <th scope="row">
                                            <label for="prmHopeDe">희망 방문일시<span class="required" aria-label="필수">*</span></label>
                                        </th>
                                        <td colspan="3">
                                            <div class="class-info type-b"><!-- 191003 -->
                                                <label for="prmHopeDe" class="class-info-t">1차</label>
                                                <input type="text" class="inp-base" id="prmHopeDe" name="prmHopeDe" title="1차 희망방문일시">

                                                <span class="txt-mark mgl-s">입력 예) 2018-01-01</span>
                                                <div class="ui-select sel_small">
                                                    <select class="sel_type" id="prmHopeT" name="prmHopeT" title="시간 선택">
                                                    </select>
                                                </div>
                                                <span class="txt-mark">:</span>
                                                <div class="ui-select sel_small">
                                                    <select class="sel_type" id="prmHopeM" name="prmHopeM"  title="분 선택">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="class-info type-b"><!-- 191003 -->
                                                <label for="scdHopeDe" class="class-info-t">2차</label>
                                                <input type="text" class="inp-base" id="scdHopeDe" name="scdHopeDe"  title="2차 희망방문일시">

                                                <span class="txt-mark mgl-s">입력 예) 2018-01-01</span>
                                                <div class="ui-select sel_small">
                                                    <select class="sel_type" id="scdHopeT" name="scdHopeT" title="시간 선택">
                                                    </select>
                                                </div>
                                                <span class="txt-mark">:</span>
                                                <div class="ui-select sel_small">
                                                    <select class="sel_type"  id="scdHopeM" name="scdHopeM" title="분" 선택">
                                                    </select>
                                                </div>

                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><label for="visitPurps">방문목적<span class="required" aria-label="필수">*</span></label></th>
                                        <td colspan="3">
                                            <textarea class="inp-base" id="visitPurps" name="visitPurps"> </textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">질문내용</th>
                                        <td colspan="3">
                                            <dl class="class-info-inline">
                                                <dt>사진(영상)촬영 :</dt>
                                                <dd class="radio-group">
                                                    <span class="radio">
                                                        <input type="radio" name="photoAt" id="photoAt1" value="Y" ">
                                                        <label for="photoAt1"><span>Y</span></label>
                                                    </span>
                                                    <span class="radio">
                                                        <input type="radio" name="photoAt" id="photoAt2" value="N" ">
                                                        <label for="photoAt2"><span>N</span></label>
                                                    </span>
                                                </dd>
                                            </dl>
                                            <textarea class="inp-base mgt-s" titile="질문내용" id="qestn" name="qestn"> </textarea>
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
                                        <textarea class="inp-base" readOnly  title="개인정보 수집 및 이용에 동의에 관한 정보입니다.">사회복지공동모금회(이하 “모금회”라 함)는 「개인정보 보호법」제15조에 의거하여 개인정보수집 및 이용에 관한 정보주체의 동의절차를 준수하며, 고지 후 수집된 정보는 모금회의 개인정보 수집 및 
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
  라. 개인정보의 보유 및 이용기간 : 1.주민등록번호 : 기부금 입금일을 기준으로 소득공제가 실시되는 기간동안, 2.기타 : 모금회가 정한 보존기간동안
                                        </textarea>
                                       <span class="checkbox">
                                            <input type="checkbox" name="agreeInfo" id="agreeInfo1">
                                            <label for="agreeInfo1"><span>개인정보 제 3자 제공에 동의 합니다.</span></label>
                                        </span>
                                        <textarea class="inp-base" readOnly  title="개인정보 제 3자 제공에 동의에 관한 정보입니다.">본인은 모금회가 「개인정보 보호법」제17조제1항제1호에 의거, 다음과 같이 본인의 개인정보를 제3자에게 제공하는 것에 대하여 동의합니다.         
  가. 개인정보를 제공받는 자 : 기부금의 자동 출금을 위한 금융결제원, 기부내역의 소득공제 확인을 위한 국세청
  나. 개인정보를 제공받는 자의 이용 목적 : 정기기부금의 출금 및 기부금 소득공제 근거자료 활용
  다. 제공하는 개인정보의 항목 : 위 1호 다목에 해당하는 개인정보
  라. 개인정보를 제공받는 자의 보유 및 이용기간 : 
       주민등록번호 : 기부금 입금일을 기준으로 소득공제가 실시되는 기간동안       
     기타 : 모금회가 정한 보존기간동안</textarea>
                                    <div class="btn-area-r">
                                        <button type="button" class="btn-base-bline small" ><a href="javascript:goFootPrivacy();">개인정보처리방침</a></button>
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
                    <!-- //SB_CCK_APPL_04 : 신청하기 -->

                    <section class="ui-tab-pnl" id="pnl2">
                        <h1 class="hide">신청내역조회</h1>
                        <div class="tab-contents">
                            <!-- SB_CCK_APPL_05 : 신청내역 인증 -->
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
                                                        <input type="text" class="inp-base w-full" id="companyNm" name= "companyNm" title="신청자명">
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

<!--                                                         <div class="table-cell ps-verify"> -->
<!--                                                             <div class="verify-area"> -->
<!--                                                                 <input type="text" class="inp-base" title="인증번호" placeholder="인증번호를 입력하세요."> -->
<!--                                                                 <span class="code-txt">02:59</span> -->
<!--                                                                 <button type="button" class="btn-base btn-type2 small">확인</button> -->
<!--                                                             </div> -->
<!--                                                         </div> -->

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
                                            <a href="" class="btn-base-imp" id="btnList">조회</a><!-- 191003 -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- //SB_CCK_APPL_05 : 신청내역 입력 -->

                            <!-- SB_CCK_APPL_06 : 신청내역 조회 목록 -->
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
                                            <col class="n7">
                                            <col class="n8">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">번호</th>
                                                <th scope="col">구분</th>
                                                <th scope="col">신청기관명</th>
                                                <th scope="col">신청자명</th>
                                                <th scope="col">희망 방문일시(1차)</th>
                                                <th scope="col">희망 방문일시(2차)</th>
                                                <th scope="col">신청상태</th>
                                                <th scope="col">신청취소</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="paging-area" id="dataGridPageNavi" ></div>

                                <div class="bbs-search">
                                    <div class="search-area">
                                    </div>
                                </div>

                            </div>
                            <!-- //SB_CCK_APPL_06 : 신청내역 조회 목록-->

                            <!-- SB_CCK_APPL_07 : 신청내역 조회 상세 -->
                            <!--<h2 class="table-tit">신청정보</h2>
                            <div class="tb-type_a mb-type mgb-m view-data">
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
                                        <th scope="row">신청자명</th>
                                        <td colspan="3">홍길동</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">신청자 휴대폰</th>
                                        <td colspan="3">
                                            010-0000-0000
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">기관(학교)명</th>
                                        <td>00학교</td>
                                        <th scope="row">소속(학과)</th>
                                        <td>00학과</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">연락처</th>
                                        <td colspan="3">010-0000-0000</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">이메일</th>
                                        <td colspan="3">adfasdf@afff.com</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">수업의 경우</th>
                                        <td colspan="3">
                                            <div class="class-info">
                                                <span class="class-info-t">수강과목</span> <span>0000</span>
                                            </div>
                                            <div class="class-info">
                                                <span class="class-info-t">교수명</span> <span>유재석</span>
                                            </div>
                                            <div class="class-info">
                                                <span class="class-info-t">총 인원</span> <span>11</span> <span class="txt-mark">명</span>

                                                <dl class="class-info-inline">
                                                    <dt>* 교수님 및 인솔자(신청인) 방문여부 :</dt>
                                                    <dd>yes</dd>
                                                </dl>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">기관방문 공문</th>
                                        <td colspan="3"><a href="#"><i class="ico-file"></i>출금동의서.hwp</a></td>
                                    </tr>

                                    <tr>
                                        <th scope="row">희망 방문일시</th>
                                        <td colspan="3">
                                            <div class="class-info">
                                                <span class="class-info-t">1차</span>
                                                <span>2109-07-10 15:30</span>
                                            </div>
                                            <div class="class-info">
                                                <span class="class-info-t">2차</span>
                                                <span>2109-07-10 15:30</span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">방문목적</th>
                                        <td colspan="3">
                                            <p>견학 방문입니다.견학 방문입니 다.견학 방문 입니다.견학 방문입니다.견 학 방문입니다.견학 방문입 니다.견 학 방문입니다.견학 방문입니다.견학 방문입니다.  견학 방문입니다견학 방문입니다.견학 방문입니다.  견학 방문입니다.견학 방문입 니다.견학 방문입니다견학 방문입니다.견학 방문입니다.견 학 방문입니다.견학 방문입 니다.견학 방문 입니다견학 방문입니   다.견학 방문입니다.견학 방문입니다.견학 방문입니다.견학 방문입니다견학 방문입니다.견학 방문입 니다.견학 방문입니다.견학  방문입니다.견학 방문입니다</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">질문내용</th>
                                        <td colspan="3">
                                            <dl class="class-info-inline mgl-n mgb-s">
                                                <dt>사진(영상)촬영 :</dt>
                                                <dd class="radio-group">Y</dd>
                                            </dl>
                                            <p>견학 방문입니다.견학 방문입니 다.견학 방문 입니다.견학 방문입니다.견 학 방문입니다.견학 방문입 니다.견 학 방문입니다.견학 방문입니다.견학 방문입니다.  견학 방문입니다견학 방문입니다.견학 방문입니다.  견학 방문입니다.견학 방문입 니다.견학 방문입니다견학 방문입니다.견학 방문입니다.견 학 방문입니다.견학 방문입 니다.견학 방문 입니다견학 방문입니   다.견학 방문입니다.견학 방문입니다.견학 방문입니다.견학 방문입니다견학 방문입니다.견학 방문입 니다.견학 방문입니다.견학  방문입니다.견학 방문입니다</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">개인정보수집동의</th>
                                        <td colspan="3">
                                            <div class="fl-item-wrap txt-s">
                                                <div class="fl-item-l">
                                                    개인정보 수집 및 이용동의  2019-06-15 13:25<br>
                                                    개인정보 제 3자 제공에 동의 2019-06-15 13:26
                                                </div>
                                                <div class="btn-area-r">
                                                    <button type="button" class="btn-base-bline small">개인정보처리방침</button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="btn-area">
                                <button type="button" class="btn-base-bline fl-item-l counsel-open">프린트</button>
                                <button type="button" class="btn-base-imp">목록</button>
                                <button type="button" class="btn-base fl-item-r">신청취소</button>
                            </div>
                            <p class="txt-s txt-right hue-p mgt-m mgb-m">* 신청취소는 견학희망일 1주일전까지만 가능합니다.</p>-->
                            <!-- //SB_CCK_APPL_07 : 신청내역 조회 상세 -->
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </form>
    </div>
</main>
