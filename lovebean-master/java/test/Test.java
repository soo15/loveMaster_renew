package test;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.Socket;
import java.net.URL;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.UUID;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.common.config.PropertyConfig;
import com.common.service.impl.MailServiceImpl;
import com.common.util.RequestProc;
import com.inicis.inipay4.INIpay;
import com.inicis.inipay4.util.INIdata;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class Test {
	
	
	static String fontUrl = "C:/PROJECT/workspace/N_ChestFront/src/main/webapp/common/fonts/NanumSquareB.ttf";
	
	public static void main(String[] args) throws FileNotFoundException, DocumentException {
		Document doc = new Document();
        try {
            PdfWriter.getInstance(doc, new FileOutputStream("c:/HMPG/" + System.currentTimeMillis() + ".pdf"));
            doc.open();

            PdfPTable table = new PdfPTable(3);
            PdfPCell cell1 = new PdfPCell(new Phrase("Cell 1"));
            PdfPCell cell2 = new PdfPCell(new Phrase("Cell 2"));
            PdfPCell cell3 = new PdfPCell(new Phrase("Cell 3"));

            PdfPTable nestedTable = new PdfPTable(2);
            nestedTable.addCell(new PdfPCell(new Phrase("Nested 1")));
            nestedTable.addCell(new PdfPCell(new Phrase("Nested 2")));
            cell3.addElement(nestedTable);

            table.addCell(cell1);
            table.addCell(cell2);
            table.addCell(cell3);
            doc.add(table);
        } catch (DocumentException | FileNotFoundException e) {
            e.printStackTrace();
        } finally {
            doc.close();
        }		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		Map<String, String> mailParam = new HashMap<String , String>();
//		MailServiceImpl.sendMail(mailParam);
		
//		String aa = "tste@gggcom, gggg@aaa.com , aaa@bbb.com";
//		String[] bb = aa.split(",");
//		System.out.println("bb =="+ bb.length);
//		for( String cc : bb ) {
//			System.out.println("c  === " + cc.trim());
//		}
//		
//		try {
//			sendTest();
//		} catch (Exception e1) {
			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		
//		PropertyConfig.DEFAULT_PROPERTIES = "properties/iniPay";
//    	String oid = PropertyConfig.getString( "INIPAY.MID_002" );
//    	System.out.println("OID ==" + oid);
//    		
//		
		
//		Socket socket = null;
//		OutputStream output = null;
//		try {
//			socket = new Socket("https://ksmobile.inicis.com/smart/payReq.ini", 443);
//			output = socket.getOutputStream();
//			
//			String param= "P_TID =" + "INIMX_AUTHINIpayTest20191021175134385262";
//			param += "&P_MID =" + "INIpayTest";
//			
//			byte[] data = param.getBytes();
//			output.write(data);
////			PrintWriter writer = new PrintWriter(output, true);
//			InputStream input = socket.getInputStream();
////			input.read(data);
//			
//			BufferedReader reader = new BufferedReader(new InputStreamReader(input));
//			String inputLine = reader.readLine();
//			
//			StringBuffer response = new StringBuffer();
//
//			while ((inputLine = in.readLine()) != null) {
//				response.append(inputLine);
//			}
//			in.close();
//			
//			
//		} catch (UnknownHostException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		
//		URL obj;
//		try {
//			obj = new URL("https://ksmobile.inicis.com/smart/payReq.ini");
//			
//			HttpsURLConnection con;
//			try {
//				con = (HttpsURLConnection) obj.openConnection();
//				con.setRequestMethod("POST");
//				con.setRequestProperty("Accept-Language", "euc-kr,en;q=0.5");
//				
//				String param= "P_TID="+"INIMX_AUTHINIpayTest20191021175134385262";
//				param += "&P_MID="+"INIpayTest";
//				
//				// Send post request
//				con.setDoOutput(true);
//				DataOutputStream wr = new DataOutputStream(con.getOutputStream());
//				wr.writeBytes(param);
//				wr.flush();
//				wr.close();
//
//				BufferedReader in = new BufferedReader( new InputStreamReader(con.getInputStream(), "EUC-KR"));
//				String inputLine;
//				StringBuffer response = new StringBuffer();
//
//				while ((inputLine = in.readLine()) != null) {
//					response.append(inputLine);
//				}
//				in.close();
//				
//				System.out.println("response ===" + response.toString() );
//				
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//			
//			
//		} catch (MalformedURLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		
		
		
		
//		String a = "2024";
//		System.out.println( a.substring(2));
//			
//		//#############################################################################
//		//# 1. 인스턴스 생성 #
//		//####################
//		INIpay inipay = new INIpay();
//		INIdata data = new INIdata();
//			
//		//#############################################################################
//		//# 3. 정보 설정 #
//		//################
//		data.setData("type", "formauthbill");                             // 결제 type, 고정 
//		data.setData("inipayHome", "C:\\PROJECT\\workspace\\ChestFront\\src\\main\\webapp\\WEB-INF\\views\\common");                           // 이니페이가 설치된 절대경로
//		data.setData("logMode", "DEBUG");                                 // logMode
//		data.setData("keyPW","1111");                                      // 키패스워드
//		data.setData("subPgip","203.238.37.3");                           // Sub PG IP (고정)
//		data.setData("mid", "INIBillTst");											// 상점아이디
//		data.setData("uid", "INIBillTst");											// 절대수정불가
//		data.setData("goodname", "사랑의열매");       // 상품명 (최대 40자)
//		data.setData("currency", "WON");									// 화폐단위
//		data.setData("price", "1000");										// 가격
//		data.setData("buyername", "김민수");									// 구매자 (최대 15자)
//		data.setData("buyertel", "010-2020-4048");								// 구매자이동전화
//		data.setData("buyeremail", "goodday0701@gmail.com");							// 구매자이메일
//		data.setData("paymethod", "Auth");                                // 지불방법, 빌링등록 고정
//		data.setData("url", "http://www.chest.or.kr");					// 홈페이지 주소(URL)
//		data.setData("uip", "127.0.0.1");                     // IP Addr
//		data.setData("crypto", "execure");                                // Extrus 암호화 모듈 적용(고정)
//		
//		data.setData("cardnumber", "4028571244663803");
//		data.setData("cardexpy", "24");			//유효기간 년도
//		data.setData("cardexpm", "03");
//		data.setData("cardquota", "");
//		data.setData("authentification", "00");//(00:인증, 11:비인증)
//		data.setData("authField1", "790701");
//		data.setData("authField2", "");
//		data.setData("authField3", "");
//		data.setData("passwd", "");
		
		
		
		
		//###############################################################################
		//# 4. 지불 요청 #
		//################  
//		data = inipay.payRequest(data);

		//###############################################################################
		//# 5. 요청 결과 #
		//################  
//		String resultCode = data.getData("ResultCode");    // "00"이면 신용카드 등록 및 빌키생성 성공
//		String resultMsg  = data.getData("ResultMsg");     // 결과에 대한 설명
//		String CardCode   = data.getData("CardResultCode");// 카드사 코드
//		String BillKey    = data.getData("BillKey");       // BILL KEY
//		String CardPass   = data.getData("CardPass");      // 카드 비밀번호 앞 두자리
//		String CardKind   = data.getData("CardKind");      // 카드 종류 ( 개인 -0 , 법인 -1)
//		String tid        = data.getData("tid");           // 거래번호
//
//		
//		
//		
//		System.out.println("resultCode ====="+ resultCode);
//		System.out.println("BillKey ====="+ BillKey);
			
			
//		String url = "http://210.181.28.103:8101/ksnet/auth/account";
//
//        try {
//        	JSONObject jsonReq = new JSONObject();
//        	JSONArray jsonArray = new JSONArray();
//        	JSONObject jsonReqData = new JSONObject();
//
//				jsonReq.put("auth_key",     "ZkweNiCtRGMt2jPHJRlC");	 
//				jsonReqData.put("fcs_cd",     "FCS03577");		
//				jsonReqData.put("seq_no",     "000001");
//				jsonReqData.put("bank_cd",     "088");
//				jsonReqData.put("acct_no",     "110225774354");				
//				jsonReqData.put("id_no",     "");
//				jsonReqData.put("amount",     "0");
//			
//				jsonArray.add(jsonReqData);
//				jsonReq.put("reqdata", jsonArray);
//			
//				System.out.println( "REQ DATA:" +  jsonReq.toString() );
//			
//			    JSONObject jsonResp = new RequestProc().sendPacket(url, jsonReq);
//			
//				System.out.println( "RESP DATA:" +  jsonResp.toString() );
//			
//				System.out.println("name:"+(String) jsonResp.get("name"));
//			    System.out.println("reply:"+(String) jsonResp.get("reply"));
//			    System.out.println("reply_msg:"+(String) jsonResp.get("reply_msg"));
//	
//	        }
//	        catch(Exception e) {
//	        	System.out.println("Exception:"+e.toString());
//	        }
		
		
		
		
		
		
		
		
//		StringBuffer sbuf = new StringBuffer();
//        sbuf.append("{") ;
//        sbuf.append("\"gender\" : \"MALE\",") ;
//        sbuf.append("\"verified\" : false,") ;
//        sbuf.append("\"userImage\" : \"Rm9vYmFyIQ==\"") ;
//        sbuf.append("}") ;
//		try {
//			HashMap<String, Object> rs = new ObjectMapper().readValue(sbuf.toString(), HashMap.class) ;
//			
//			
//			String aa = (String) rs.get("gender");
//			System.out.println("aa ==" + aa);
//			
//		} catch (JsonParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (JsonMappingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		
//		Test http = new Test();
//		
//		try {
//			http.sendPost();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		Map<String, String> data = new HashMap<String, String>();
//		
//		data.put("today", "13");
//		data.put("thisyear", "2019");
//		data.put("thismonth", "13");
//		data.put("endday", "13");
//		data.values().removeAll(Collections.singleton("13"));
//		System.out.println("data ===" + data.toString() );
//		

//		Set s = data.keySet();
//		Iterator i = s.iterator();
//
//		   while( i.hasNext()) {
//		      KeyValue kv = (KeyValue) i.next();
//System.out.println("keyValue ==" + kv);
//		      if( kv != "thisyear" ) {
//		         data.remove(kv);
//		         s = data.keySet();
//		         i = s.iterator();
//		      }
//		   }  
try {
//	sendPost();
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	}
	
	private static void sendTest() throws Exception {
		String url = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
		URL obj = new URL(url);
		HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
		//add reuqest header
		con.setRequestMethod("POST");
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
		String param= "authReqNumber=11111";
		param += "&requestTime=20190917151515";
		param += "&serviceType=03";
		param += "&serviceCode=0001";
		param += "&companyCode=43417";
		param += "&phoneNumber=01020204048";
		param += "&authNumber=1";
		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(param);
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();
		
		System.out.println("\nSending 'POST' request to URL : " + url);
		System.out.println("Post parameters : " + param);
		System.out.println("Response Code : " + responseCode);

		BufferedReader in = new BufferedReader( new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		
		response.append("authReqNumber=" + 1111 );
		
//		System.out.println("result =====" + result);
		//print result
		System.out.println(response.toString());
		if( !response.equals("") ) {
			
		}
	}
	
	private static void sendPost() throws Exception {

		String url = "https://auth_test.ring2pay.com:7891/asp/arsauth/sync/r2p_paauth.do";
//		String url = "https://222.110.144.33:7891/asp/arsauth/sync/r2p_paauth.do";
//		String url = "https://authcenter4.ring2pay.com:7891/asp/arsauth/sync/r2p_paauth.do";
		
		
		System.setProperty("https.protocols", "TLSv1,TLSv1.1,TLSv1.2");
//		System.setProperty("https.protocols", "TLSv1.1");
		
		URL obj = new URL(url);
		HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
		//add reuqest header
		con.setRequestMethod("POST");
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
		String param= "authReqNumber=11111";
		param += "&requestTime=20190917151515";
		param += "&serviceType=03";
		param += "&serviceCode=0001";
		param += "&companyCode=43417";
		param += "&phoneNumber=01020204048";
		param += "&authNumber=1";
		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(param);
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();
		
		System.out.println("\nSending 'POST' request to URL : " + url);
		System.out.println("Post parameters : " + param);
		System.out.println("Response Code : " + responseCode);

		BufferedReader in = new BufferedReader( new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		
		response.append("authReqNumber=" + 1111 );
		
//		System.out.println("result =====" + result);
		//print result
		System.out.println(response.toString());
		if( !response.equals("") ) {
			
		}

	}
		
	public static Map<String , String> getDate( String calMonth ) {
		Map<String,String> paramMap = new HashMap<String,String>();
		paramMap.put("", "");
		String yyyyMm = "";
		String test = "201901";
		String paramYear = test.substring(0,4);
		String paramMonth = test.substring(4,6);
		
		System.out.println("paramYear =="+paramYear);
		System.out.println("paramMonth =="+paramMonth);
		
		Map<String,String> result = new HashMap<String,String>();
		Calendar cal = Calendar.getInstance();
		
		cal.set(Calendar.YEAR, Integer.parseInt(paramYear) );
		cal.set(Calendar.MONTH, Integer.parseInt(paramMonth) );
		
		String year =  String.valueOf( cal.get ( cal.YEAR ) ); 
		//String month = String.format("%02d", cal.get(cal.MONTH) + ( Integer.parseInt( calMonth ) )  );
		String month = String.format("%02d", cal.get(cal.MONTH) );
		String today = String.valueOf(cal.get(cal.DAY_OF_MONTH) );
		String endDay = String.valueOf( cal.getActualMaximum(cal.DAY_OF_MONTH) );
		result.put("year", year);
		result.put("month", month);
		result.put("endDay", endDay);
		System.out.println("year = "+ year);
		System.out.println("month = "+  month );
		System.out.println("endDay = "+ endDay);
		System.out.println("today = "+ today);
		return result;
	}

}
