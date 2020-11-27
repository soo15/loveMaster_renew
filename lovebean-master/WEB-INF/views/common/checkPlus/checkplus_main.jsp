<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();
    
    String sSiteCode = (String) request.getAttribute("siteCode");							// NICE로부터 부여받은 사이트 코드
    String sSitePassword = (String) request.getAttribute("sitePassword");					// NICE로부터 부여받은 사이트 패스워드
    
    String sRequestNumber = "REQ0000000001";        										// 요청 번호, 이는 성공/실패후에 같은 값으로 되돌려주게 되므로 
                                                    										// 업체에서 적절하게 변경하여 쓰거나, 아래와 같이 생성한다.
    sRequestNumber = niceCheck.getRequestNO(sSiteCode);
  	session.setAttribute("REQ_SEQ" , sRequestNumber);										// 해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.
  	
   	String sAuthType = "";      															// 없으면 기본 선택화면, M: 핸드폰, C: 신용카드, X: 공인인증서
   	String popgubun 	= "N";																//Y : 취소버튼 있음 / N : 취소버튼 없음
	String customize 	= "";																//없으면 기본 웹페이지 / Mobile : 모바일페이지
	String sGender = ""; 																	//없으면 기본 선택 값, 0 : 여자, 1 : 남자 
	
	StringBuffer conPath = request.getRequestURL(); 
	String path = String.valueOf(conPath);
	if( !path.equals("") && path  != null ) {
		path= path.substring( 0 , path.indexOf("/WEB-INF") );
	}
    // CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
	//리턴url은 인증 전 인증페이지를 호출하기 전 url과 동일해야 합니다. ex) 인증 전 url : http://www.~ 리턴 url : http://www.~
    String sReturnUrl = path + "/ct/fdrmcntr/checkPlusSuccess.do";      // 성공시 이동될 URL
    String sErrorUrl = path +  "/ct/fdrmcntr/checkFail.do";          // 실패시 이동될 URL

    // 입력될 plain 데이타를 만든다.
    String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber +
                        "8:SITECODE" + sSiteCode.getBytes().length + ":" + sSiteCode +
                        "9:AUTH_TYPE" + sAuthType.getBytes().length + ":" + sAuthType +
                        "7:RTN_URL" + sReturnUrl.getBytes().length + ":" + sReturnUrl +
                        "7:ERR_URL" + sErrorUrl.getBytes().length + ":" + sErrorUrl +
                        "11:POPUP_GUBUN" + popgubun.getBytes().length + ":" + popgubun +
                        "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize + 
						"6:GENDER" + sGender.getBytes().length + ":" + sGender;
    
    String sMessage = "";
    String sEncData = "";
    
    int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
    if( iReturn == 0 )
    {
        sEncData = niceCheck.getCipherData();
    }
    else if( iReturn == -1)
    {
        sMessage = "암호화 시스템 에러입니다.";
    }    
    else if( iReturn == -2)
    {
        sMessage = "암호화 처리오류입니다.";
    }    
    else if( iReturn == -3)
    {
        sMessage = "암호화 데이터 오류입니다.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "입력 데이터 오류입니다.";
    }    
    else
    {
        sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
    }
%>
