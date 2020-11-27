<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.inicis.std.util.SignatureUtil"%>
<%@page import="java.util.*"%>
<%

	/*
		//*** 위변조 방지체크를 signature 생성 ***

			oid, price, timestamp 3개의 키와 값을

			key=value 형식으로 하여 '&'로 연결한 하여 SHA-256 Hash로 생성 된값

			ex) oid=INIpayTest_1432813606995&price=819000&timestamp=2012-02-01 09:19:04.004
				

			 * key기준 알파벳 정렬

			 * timestamp는 반드시 signature생성에 사용한 timestamp 값을 timestamp input에 그대로 사용하여야함
	*/

	//############################################
	// 1.전문 필드 값 설정(***가맹점 개발수정***)
	//############################################
	// 여기에 설정된 값은 Form 필드에 동일한 값으로 설정
	String mid					= (String) request.getAttribute("mid");
// 	String mid					= "INIpayTest";		// 가맹점 ID(가맹점 수정후 고정)					
	//인증
	String signKey			    = (String) request.getAttribute("signKey");
// 	String signKey			    = "SU5JTElURV9UUklQTEVERVNfS0VZU1RS";
	
	System.out.println("mid ===" + mid);
	System.out.println("signKey ===" + signKey);
	
	String timestamp			= SignatureUtil.getTimestamp();				// util에 의해서 자동생성
	String oid					= mid+"_"+SignatureUtil.getTimestamp();		// 가맹점 주문번호(가맹점에서 직접 설정)
// 	String price				= (String) request.getAttribute("price");
	String cardNoInterestQuota	= "";		// 카드 무이자 여부 설정(가맹점에서 직접 설정)
	String cardQuotaBase		= "2:3:4:5:6:11:12:24:36";		// 가맹점에서 사용할 할부 개월수 설정

	//###############################################
	// 2. 가맹점 확인을 위한 signKey를 해시값으로 변경 (SHA-256방식 사용)
	//###############################################
	String mKey = SignatureUtil.hash(signKey, "SHA-256");
	
// 	//###############################################
// 	// 2.signature 생성
// 	//###############################################
// 	Map<String, String> signParam = new HashMap<String, String>();

// 	signParam.put("oid", oid); 					// 필수
// 	signParam.put("price", price);				// 필수
// 	signParam.put("timestamp", timestamp);		// 필수

	// signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
// 	String signature = SignatureUtil.makeSignature(signParam);
	
	/* 기타 */
	String siteDomain = path + "/ct/lmpscntr"; //가맹점 도메인 입력
	// 페이지 URL에서 고정된 부분을 적는다. 
	// Ex) returnURL이 http://localhost:8080INIpayStdSample/INIStdPayReturn.jsp 라면
	// http://localhost:8080/INIpayStdSample 까지만 기입한다.
	
%>