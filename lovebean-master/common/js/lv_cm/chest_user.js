/* ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : chest_user.js
 * Author      : Chest Front
 * Date        : 2019. 9. 16.
 * Description : [ Common JS ] Common Utility JS : 사용자 정의 Script 작성
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 16.    Chest Front      Initial Release
 * CH_01
 **************************************************************************************************/


var _common = {
		/***
		 * select box 유동적으로 화면에 만들때 해당 함수 호출.
		 * 등록일 20191001
		 * 작성자 김민수
		 */
		makeSelectLayout : function() {
			if (!$plugins.browser.mobile) {
				setTimeout( function() {
					$plugins.uiSelect();
				} , 500);
			}
		}
		, selectTab : function( tabId , tabIdx ) {
			$plugins.uiTab({
				id:tabId
				, current: tabIdx
			});
		}
		, addBlockEvent : function() {
			//마우스 드래그  방지
			_common.addEvent(document, "dragstart", _common.stopEvent);
		    //마우스 선택 방지
			_common.addEvent(document, "selectstart", _common.stopEvent);
		    //마우스 오른쪽 클릭 시 팝업메뉴 막기
			_common.addEvent(document, "contextmenu", _common.stopEvent);
		    //파이어폭스에서 마우스 선택 방지
		    if (document.body && document.body.style.MozUserSelect != undefined) {
		        document.body.style.MozUserSelect = "none";
		    }
		}
		, addEvent :  function(element, eventType, handler) {
			if (window.addEventListener) element.addEventListener(eventType, handler, false);
		    else {
		    	//IE8이하 버전에서
		        if (window.attachEvent) element.attachEvent("on" + eventType, handler);
		    }
		}
		, stopEvent : function(e) {
			//IE
			if (window.event) {
				//전파 방지
		        window.event.cancelBubble = true;
		        //기본 동작 수행방지
		        window.event.returnValue = false;
		    }
		    //DOM 레벨 2
		    if (e && e.stopPropagation && e.preventDefault) {
		    	//이벤트 전파 중지
		        e.stopPropagation();
		        //기본 동작 수행방지
		        e.preventDefault();
		    }
		}

};

/*********************************************************
 * 우편번호 검색
 * 등록일 20190909
 * 작성자 김민수
 * @returns
 */
function openZipCode( zipid , addrId ){
     new daum.Postcode({
        oncomplete: function(data) {

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById(zipid).value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById(addrId).value = fullRoadAddr;
        }
    }).open();
}

/**
 * email 체크
 * 등록일 20190909
 * 작성자 김민수
 * @returns boolean ex) common.isEmail("aaa@aaa.com");
 */
function isEmail(str) {
    var pattern = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;

    return pattern.test(str);
}

/***
 * 입력한 문자열 전달
 * 등록일 20190918
 * 작성자 김민수
 * @param obj
 * @returns
 */
function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

/***
 * //콤마찍기
 * 등록일 20190918
 * 작성자 김민수
 * @param obj
 * @returns
 */
function comma(str) {
    str = String(str);

    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

/***
 * //콤마풀기
 * 등록일 20190918
 * 작성자 김민수
 * @param obj
 * @returns
 */
function uncomma(str) {
    str = String(str);

    return str.replace(/[^\d]+/g, '');
}

/***
 * 10보다 작은 수 앞에 0 추가
 * 등록일 20190918
 * 작성자 김민수
 * @param obj
 * @returns
 */
function zeroSum( str ) {
    var result = str;

    if( result < 10 ) {
        result = "0" + str;
    }

    return result;
}

/***
 * ARS 인증코드
 * 등록일 20190918
 * 작성자 김민수
 * @param obj
 * @returns
 */
function arsResultCode( code ) {
    var arsCode = {
        "00": "인증성공"
        , "01":"인증번호 불일치"
        , "04":"인증 중지 - 고객의 인증 취소"
        , "10":"전화 연결 실패 - 없는 번호"
        , "11":"전화 연결 실패 - 전화 안 받음(수신 거부)"
        , "12":"전화 연결 실패 - 전화 안 받음 (안받음, 전원꺼짐, 통화중)"
        , "13":"전화 연결 실패 - 착신전환 고객"
        , "20":"인증 취소 - 고객의 통화 종료"
        , "23":"인증 취소 - 인증 허용시간 초과"
        , "24":"인증 취소 - 아무 입력이 없었음"
        , "41":"통화중"
        , "42":"전원꺼짐"
        , "81":"요청전문 없음"
        , "82":"인증 처리 중"
        , "99":"기타 오류"
    }
    return arsCode[code];
}

/***
 * url parameter replace
 * 등록일 20191118
 * 작성자 권민
 * @param
 * @returns
 */
function urlParameterReplace() {
    var args = Array.prototype.slice.call (arguments, 1);
    return arguments[0].replace (/\{(\d+)\}/g, function (match, index) {
        return args[index];
    });
}

/***
 * 본인인증 팝업 호출
 * @returns
 */
function fnPopup(){
	console.log( "chest_user fnPopup call" );
	window.open('/common/nicePopup.do', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
} 
