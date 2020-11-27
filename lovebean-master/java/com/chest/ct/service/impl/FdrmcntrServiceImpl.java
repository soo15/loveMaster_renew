package com.chest.ct.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartRequest;

import com.chest.ct.mapper.FdrmcntrMapper;
import com.chest.ct.service.FdrmcntrService;
import com.common.config.PropertyConfig;
import com.common.map.ComCamelMap;
import com.common.util.HttpUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.inicis.std.util.ParseUtil;
import com.inicis.inipay4.INIpay;
import com.inicis.inipay4.util.INIdata;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


@Service
@Transactional(rollbackFor={Exception.class})
public class FdrmcntrServiceImpl implements FdrmcntrService {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Value("#{chest['upload.filePath']}")
    public String genFilePath;
    
    @Value("#{chest['FONT.URL']}")
    public String FONT_URL;
    
    @Value("#{iniPay['INIPAY.BILL_PASS']}")
    public String BILL_PASS;
    
    @Value("#{iniPay['INIPAY.LOGMODE']}")
    public String LOG_MODE;
    
    @Value("#{iniPay['INIPAY.HOME']}")
    public String INIPAY_HOME;
    
    @Value("#{naverPay['NPAY.API_URL']}")
    public String NPAY_API_URL;
    
    @Value("#{naverPay['NPAY.PARTNER_ID']}")
    public String NPAY_PARTNER_ID;
    
    @Value("#{naverPay['NPAY.CLIENT_ID']}")
    public String NPAY_CLIENT_ID;
    
    @Value("#{naverPay['NPAY.CLIENT_SECRET']}")
    public String NPAY_CLIENT_SECRET;
    
    @Value("#{kakaoPay['KPAY.APP_ADMIN_KEY']}")
    public String KPAY_APP_ADMIN_KEY;
    
    @Value("#{kakaoPay['KPAY.API_URL']}")
    public String KPAY_API_URL;
    
    @Autowired
    private FdrmcntrMapper mapper;
    
    public Map<String, Object> selectBankList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();
        List<ComCamelMap> listInfo = mapper.selectBankList(paramMap);
        resMap.put("listInfo", listInfo);
        return resMap;
    }


	@Override
	public Map<String, Object> selectCodeList(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        List<ComCamelMap> listInfo = mapper.selectCodeList(paramMap);
        resMap.put("listInfo", listInfo);
        return resMap;
	}

	@Override
	@Transactional
	public String insert(Map<String, String> paramMap , MultipartRequest multipartRequest , HttpServletRequest request ) throws Exception {
		
		String message = "success";
		
		/**** 빌키 생성요청 카드기부일 경우 빌키 생성  국민은행(국민카드) 정책상 테스트 결제 불가 ***/
		Map<String, String> parameter = new HashMap<String, String>();		
		if( paramMap.get("metpaySe").equals("01") ) {
			parameter = payRequest( paramMap , request);
			
			if( !parameter.get("resultCode").equals("00") ) {
				message = (String) parameter.get("resultMsg");
				return message;
			}
			paramMap.putAll(parameter);
		}		
		
		/**** 기부자정보 */
		mapper.insertTHP_CntrbtrInfo(paramMap);
		
		/**** 기부자 약정신청 */
		mapper.insertTHP_CntrEnggReqst(paramMap);
		
		/**** 기부관심분야 */
		if( !paramMap.get("intrstRealm").equals("") ) {
			mapper.insertTHP_CntrIntrst(paramMap);
		}
		
		/**** 정보제공동의 여부 */
		String[] agreeList = paramMap.get("agree_arr").toString().split("-");
		for( int i=0; i<agreeList.length;i++ ) {
			paramMap.put("iemCode", "0"+ (i+1));
			paramMap.put("agreAt", agreeList[i]);
			if( agreeList[i].equals("Y") ) {
				mapper.insertTHP_CntrInfoAgre(paramMap);
			}
		}
		 
		String metpaySe = paramMap.get("metpaySe").toString();
		
		//온라인 계좌이체 일 경우에만 첨부파일 저장
		if( "03".equals(metpaySe) ) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
			java.util.Calendar cal = java.util.Calendar.getInstance();
			String nowDate = sdf.format(cal.getTime());
			
			String uploadPath = genFilePath + "\\ct\\" + nowDate + "\\"; 
			String dbPath = "ct\\" + nowDate + "\\";

			//사인 이미지로 저장
			String certification = paramMap.get("certification").toString();
			String fileName = null;
			String pdfFileName = null;
			String pdfExtsn = null;
			String extsn = null;
			 
			if( "pad".equals( certification ) ) {
				
				extsn = ".jpg";
				pdfExtsn = ".pdf";
				
				String sign = StringUtils.split( paramMap.get("sign") , ",")[1];
				fileName = System.currentTimeMillis() + "_sign";
				pdfFileName = fileName + "" + pdfExtsn;
				FileUtils.writeByteArrayToFile(new File(uploadPath+ ( fileName+""+extsn ) ), Base64.decodeBase64(sign));
				
				paramMap.put("uploadPath", uploadPath);			//서명 업로드 경로
				paramMap.put("fileName", fileName);				//서명 이미지명 확장자 없는 상태
				makePdfFile( paramMap );						//PDF 파일 생성
				paramMap.put("prufDtaTy", "01");				//HP0024
				paramMap.put("flpth", dbPath);
				paramMap.put("extsn", pdfExtsn);
//				paramMap.put("fileName", fileName);
				paramMap.put("fileName", pdfFileName);
			}
			
			if( "ars".equals( certification ) ) {
				paramMap.put("prufDtaTy", "02");	//HP0024
     			paramMap.put("flpth", "ars\\" + nowDate + "\\" );
     			paramMap.put("extsn",  ".mp3");        // File Type (확장자)
     			paramMap.put("fileName", paramMap.get("authReqNumber") + ".mp3");
			}
			
			if( "agree".equals( certification ) ) {
				Map<String, Object> resMap = com.common.util.FileUtils.fileUploadMap(multipartRequest, paramMap, uploadPath);
				
				String   uploadCnt  = (String)   resMap.get("uploadCnt");   // Upload Count
		        String[] logcFileNm = (String[]) resMap.get("logcFileNm");  // logcFileNm File Name
		        String[] fileSize   = (String[]) resMap.get("fileSize");    // File Size
		        String[] fileType   = (String[]) resMap.get("fileType");    // file Type (확장자)
		        
		        int resUploadCnt = Integer.parseInt(uploadCnt);
		        
		        try {
		            if(fileSize.length > 0){
		                // Upload File Information DataBase Insert !!
		                for(int i=0; i<resUploadCnt; i++){
		                    paramMap.put("prufDtaTy", "04");	//HP0024
		        			paramMap.put("flpth", dbPath);
		        			paramMap.put("extsn",  fileType[i]);        // File Type (확장자)
		        			paramMap.put("fileName", logcFileNm[i]);
		                }
		            }
		            
		        } catch (Exception e) {
		            // Error 시 File Delete !!
		            for(int i=0; i<resUploadCnt; i++){
		            	com.common.util.FileUtils.fileDelete(uploadPath + logcFileNm[i]);
		            }
		            e.printStackTrace();
		        }
			}
			
			/**** 기부신청첨부파일 */
			mapper.insertTHP_CntrReqstFile(paramMap);
		}
		// 네이버 페이
		else if( "04".equals(metpaySe) ) {
			parameter = npayRegistApproval( paramMap , request);
			if( !parameter.get("code").equals("Success") ) {
				message = (String) parameter.get("message");
				logger.error("message npayRegistApproval =" + message);
				throw new Exception(message);
			}
			
			mapper.updateTHP_NaverpayLog(parameter);
		}
		// 카카오 페이
		else if( "05".equals(metpaySe) ) {
			/**** 카카오페이 결제승인 */
			paramMap.put("reqPayType", "approval");
			Map<String, String> resParam = new HashMap<String, String>();
			resParam = kpayRegistApproval( paramMap );	
			if( !resParam.get("code").equals("Success") ) {
				message = (String) parameter.get("message");
				throw new Exception(message);
			}
			
			mapper.updateTHP_KakaopayLog(resParam);
		}
		
		message += "_" + paramMap.get("cntrSn");
		return message;
	}
	
	private void makePdfFile( Map<String, String> paramMap ) throws Exception {
		String fileName = paramMap.get("fileName").toString();
		String fontUrl = FONT_URL + "NanumSquareB.ttf";
		Document document = new Document(PageSize.A4); // PDF 문서를 처리하는 객체
        PdfWriter.getInstance(document, new FileOutputStream(paramMap.get("uploadPath") + paramMap.get("fileName") + ".pdf"));
        document.open(); // 웹페이지에 접근하는 객체를 연다            
        BaseFont baseFont = BaseFont.createFont( fontUrl , BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Chunk title = new Chunk("정기기부(CMS) 약정서", new Font( baseFont , 20 ) ); 	//타이틀  생성
        Paragraph ph = new Paragraph(title);
        ph.setAlignment(Element.ALIGN_CENTER);
        document.add(ph); // 문단을 만들어서 가운데 정렬 (타이틀의 이름을 가운데 정렬한다는 뜻)
        document.add(new Paragraph("\r\n"));
        Font font = new Font(baseFont, 10 , Font.NORMAL);
        
        float[] widths = {100,100,100,100};
        PdfPTable table = new PdfPTable(widths);
        PdfPCell cell = null;
        table.setWidthPercentage(100);
        
        cell = makeCell( cell , font , "예금주명" , "main");
        table.addCell(cell);  
        
        cell = makeCell( cell , font , paramMap.get("dpstr") , "main");
        table.addCell(cell);
        
        cell = makeCell( cell , font , "은행명" , "main");
        table.addCell(cell);
        
        //cell = makeCell( cell , font , paramMap.get("acnutBankName") , "main");
        cell = makeCell( cell , font , mapper.getBankNm( paramMap.get("acnutBank") ) , "main");
        
        table.addCell(cell);
        
        cell = makeCell( cell , font , "계좌번호" , "main");
        table.addCell(cell);
        
        cell = makeCell( cell , font , paramMap.get("acnutno") , "main");
        table.addCell(cell);
        
        cell = makeCell( cell , font , "생년월일" , "main");
        table.addCell(cell);
        
        cell = makeCell( cell , font , paramMap.get("brthdy") , "main");
        table.addCell(cell); 
        
        String str = "【 개인정보 수집·이용 및 제공 동의서 】\n\n";
        cell = new PdfPCell();	//셀의 이름과 폰트를 지정해서 셀을 생성한다.
        PdfPTable nestedTable = new PdfPTable(1);
        nestedTable.setWidthPercentage(100);
        
        PdfPCell subCell = new PdfPCell( new Phrase(str, new Font( baseFont , 15 ) ));
        subCell.setBorder(0);
        subCell.setHorizontalAlignment(Element.ALIGN_CENTER);
        nestedTable.addCell( subCell );
        cell.setColspan(4);
        cell.addElement(nestedTable);
        
        str = "   사회복지공동모금회(이하 “모금회”라 함)는 「개인정보보호법」제15조 및 22조에 의거하여 개인정보수집 및 이용에 관한 정보주체의 동의절차를 준수하며,\n";
        str += "   개인정보 제공자가 동의한 이용목적외의 용도로는 절대 이용ㆍ제공되지 않습니다. 제공된 개인정보는 개인정보 관리책임자를 통해 열람, 정정, 삭제 등을\n";
        str += "   요구할 수 있습니다.\n\n\n";
        str += "1. 개인정보 수집 ‧ 이용에 관한 동의 \n\n";
        nestedTable = new PdfPTable(1);
        nestedTable.setWidthPercentage(100);
        subCell = new PdfPCell( new Phrase(str, new Font( baseFont , 8 ) ));
        subCell.setBorder(0);
        subCell.setHorizontalAlignment(Element.ALIGN_LEFT);
        nestedTable.addCell( subCell );
        cell.setColspan(4);
        cell.addElement(nestedTable);

        //1.개인정보 수집 이용에 관한 동의 table
        nestedTable = new PdfPTable(3);
        nestedTable.setWidthPercentage(95);
        subCell = makeCell( cell , new Font( baseFont , 8 ) , "항목" , "sub");
        nestedTable.addCell(subCell); 
        subCell = makeCell( cell , new Font( baseFont , 8 ) , "수집목적" , "sub");
        nestedTable.addCell(subCell); 
        subCell = makeCell( cell , new Font( baseFont , 8 ) , "보유기간" , "sub");
        nestedTable.addCell(subCell); 
        subCell = makeCell( cell , new Font( baseFont , 8 ) , "은행명, 계좌번호, 예금주, 생년월일" , "sub1");
        nestedTable.addCell(subCell); 
        subCell = makeCell( cell , new Font( baseFont , 8 ) , "자동이체 신청 및 해지 처리, 자동이체 출금동의 확인 고객상담 등" , "sub1");
        nestedTable.addCell(subCell); 
        subCell = makeCell( cell , new Font( baseFont , 8 ) , "폐기요청시까지" , "sub1");
        nestedTable.addCell(subCell); 
        cell.addElement(nestedTable);
        
        nestedTable = new PdfPTable(1);
        nestedTable.setWidthPercentage(95);
        str = "※ 위의 개인정보 수집‧이용에 대한 동의를 거부할 권리가 있습니다. 그러나 동의를 거부할 경우 출금이체 신청업무가 거부될 수 있습니다. ";
        subCell = new PdfPCell( new Phrase(str, new Font( baseFont , 8 ) ));
        subCell.setBorder(0);
        nestedTable.addCell(subCell); 
        cell.addElement(nestedTable);
        
        nestedTable = new PdfPTable(1);
        nestedTable.setWidthPercentage(95);
        str = "■ 동의합니다.   □ 동의하지 않습니다.";
        subCell = new PdfPCell( new Phrase(str, new Font( baseFont , 8 ) ));
        subCell.setBorder(0);
        subCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        nestedTable.addCell(subCell); 
        cell.addElement(nestedTable);
        
        //2. 개인정보 제3자 제공 이용
        nestedTable = new PdfPTable(1);
        nestedTable.setWidthPercentage(100);
        str = "2. 개인정보 제3자 제공 ‧ 이용 \n\n";
        subCell = new PdfPCell( new Phrase(str, new Font( baseFont , 8 ) ));
        subCell.setBorder(0);
        subCell.setHorizontalAlignment(Element.ALIGN_LEFT);
        nestedTable.addCell(subCell); 
        cell.addElement(nestedTable);
        
        nestedTable = new PdfPTable(4);
        nestedTable.setWidthPercentage(95);
        subCell = makeCell( cell , new Font( baseFont , 8 ) , "제공받는 자" , "sub");
        nestedTable.addCell(subCell); 
        subCell = makeCell( cell , new Font( baseFont , 8 ) , "항목" , "sub");
        nestedTable.addCell(subCell); 
        subCell = makeCell( cell , new Font( baseFont , 8 ) , "제공목적" , "sub");
        nestedTable.addCell(subCell); 
        subCell = makeCell( cell , new Font( baseFont , 8 ) , "제공기간" , "sub");
        nestedTable.addCell(subCell); 
        subCell = makeCell( cell , new Font( baseFont , 8 ) , "금융결제원, 시중은행 등 금융회사" , "sub1");
        nestedTable.addCell(subCell); 
        subCell = makeCell( cell , new Font( baseFont , 8 ) , "은행명, 계좌번호, 예금주, 생년월일" , "sub1");
        nestedTable.addCell(subCell); 
        subCell = makeCell( cell , new Font( baseFont , 8 ) , "출금이제 신청" , "sub1");
        nestedTable.addCell(subCell); 
        subCell = makeCell( cell , new Font( baseFont , 8 ) , "폐기요청시까지" , "sub1");
        nestedTable.addCell(subCell);
        cell.addElement(nestedTable);
        
        nestedTable = new PdfPTable(1);
        nestedTable.setWidthPercentage(95);            
        str = "※ 위의 개인정보 수집‧이용에 대한 동의를 거부할 권리가 있습니다. 그러나 동의를 거부할 경우 출금이체 신청업무가 거부될 수 있습니다. ";
        subCell = new PdfPCell( new Phrase(str, new Font( baseFont , 8 ) ));
        subCell.setBorder(0);
        nestedTable.addCell(subCell); 
        cell.addElement(nestedTable);
        
        nestedTable = new PdfPTable(1);
        nestedTable.setWidthPercentage(95);
        str = "■ 동의합니다.   □ 동의하지 않습니다.\n\n";
        subCell = new PdfPCell( new Phrase(str, new Font( baseFont , 8 ) ));
        subCell.setBorder(0);
        subCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        nestedTable.addCell(subCell); 
        cell.addElement(nestedTable);
        
        table.addCell(cell);
        document.add(table);
        
        str = "본인은 위와 같이 정기기부(CMS)를 신청하며, 개인정보 수집・이용 및 제공에 대하여 이해하고 서명합니다. ";
        Chunk chunk = new Chunk(str, new Font( baseFont , 10 ) ); 	
        Paragraph paragraph = new Paragraph(chunk);
        paragraph.setAlignment(Element.ALIGN_CENTER);
        document.add(paragraph);
        
        document.add(new Paragraph("\r\n"));
        
        Calendar now = Calendar.getInstance();
        int year = now.get(Calendar.YEAR);
        int month = now.get(Calendar.MONTH) + 1; // Note: zero based!
        int day = now.get(Calendar.DAY_OF_MONTH);
        str = year + " 년 " + month + "월 " + day + "일";
        chunk = new Chunk(str, new Font( baseFont , 10 ) ); 	
        paragraph = new Paragraph(chunk);
        paragraph.setAlignment(Element.ALIGN_CENTER);
        document.add(paragraph);
        
        document.add(new Paragraph("\r\n"));
        
        //사인 이미지 삽입
        Image image = Image.getInstance( paramMap.get("uploadPath") + fileName + ".jpg");
        image.setScaleToFitHeight(false);
        
        str = "기부자(명칭/성명)"+ "   " + paramMap.get("nm") + "                                              (인)";
        chunk = new Chunk(str, new Font( baseFont , 10 ) );
        paragraph = new Paragraph(chunk);
        paragraph.setAlignment(Element.ALIGN_RIGHT);
        document.add(paragraph);
        
        paragraph = new Paragraph();
        paragraph.add( new Chunk( image , 50 , -100 ) );
        paragraph.setAlignment(Element.ALIGN_RIGHT);
        document.add(paragraph);
        
        document.add(new Paragraph("\r\n"));
        
        str = "사회복지공동모금회 귀하";
        chunk = new Chunk(str, new Font( baseFont , 15 ) ); 	
        paragraph = new Paragraph(chunk);
        paragraph.setAlignment(Element.ALIGN_CENTER);
        document.add(paragraph);
        
        document.close(); // 저장이 끝났으면 document객체를 닫는다.
        
	}
	
	public PdfPCell makeCell( PdfPCell cell , Font font , String str , String flag ) {
		cell = new PdfPCell(new Phrase(str, font));	//셀의 이름과 폰트를 지정해서 셀을 생성한다.
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		if( flag.equals("main") ) {
			cell.setFixedHeight(30);
        } else if( flag.equals("sub") ){
        	cell.setFixedHeight(20);
        	cell.setBackgroundColor(BaseColor.GRAY);
        } else if( flag.equals("sub1")) {
        	cell.setFixedHeight(30);
        }
        return cell;
	}

	@Override
	@Transactional
	public int insertCompany(Map<String, String> paramMap) throws Exception {
		int cnt = 0;
		/**** 기부상담신청 */
		cnt = mapper.insertTHP_CntrCnsltReqst(paramMap);
		/**** 기부상담이력 */
		cnt = mapper.insertTHP_CntrCnsltHist(paramMap);
		/**** 정보제공동의 여부 */
//		paramMap.put("cntrSn", paramMap.get("cnsltSn") );
		//cnt = mapper.insertTHP_CntrInfoAgre(paramMap);
		return cnt;
	}
	
	private Map<String, String> payRequest(Map<String, String> paramMap , HttpServletRequest request) throws Exception {
		
		String jihoe = paramMap.get("jihoe"); 
		String billMid = PropertyConfig.getPropertiesCon("properties/iniPay", "INIPAY.BILL_MID_" + jihoe );
		
		logger.debug("jihoe ===================================" + jihoe);
		logger.debug("billMid ===================================" + billMid);
		
		Map<String, String> resMap = new HashMap<String, String>();
		
		System.out.println("paramMap =====" + paramMap.toString() );
		//#############################################################################
		//# 1. 인스턴스 생성 #
		//####################
		INIpay inipay = new INIpay();
		INIdata data = new INIdata();
		
		//#############################################################################
		//# 2. 파라미터 저장 # 인자값 paramMap 사용
		//################
		
		//#############################################################################
		//# 3. 정보 설정 #
		//################

		data.setData("type", 		"formauthbill");                        // 결제 type, 고정 
		data.setData("inipayHome", 	INIPAY_HOME);                          	// 이니페이가 설치된 절대경로
		data.setData("logMode", 	LOG_MODE);                              // logMode
		data.setData("keyPW",		BILL_PASS);                             // 키패스워드
		
		data.setData("subPgip",		"203.238.37.3");                        // Sub PG IP (고정)
		data.setData("mid", 		billMid );								// 상점아이디
		data.setData("uid", 		billMid );								// 절대수정불가
		data.setData("goodname", 	"사랑의열매");       		// 상품명 (최대 40자)
		data.setData("currency", 	"WON");									// 화폐단위
		data.setData("price", 		paramMap.get("cntrAmount").replaceAll(",", "") );			// 가격
		data.setData("buyername", 	paramMap.get("nm"));					// 구매자 (최대 15자)
		data.setData("buyertel", 	paramMap.get("mbtlnum"));				// 구매자이동전화
		data.setData("buyeremail", 	paramMap.get("email"));					// 구매자이메일
		data.setData("paymethod", 	"Card");                                // 지불방법, 빌링등록 고정
		data.setData("url", 		"http://www.chest.or.kr");				// 홈페이지 주소(URL)
		data.setData("uip", 		request.getRemoteAddr());               // IP Addr
		data.setData("crypto", 		"execure");                             // Extrus 암호화 모듈 적용(고정)

		data.setData("cardnumber", 	paramMap.get("cardNo"));				//카드번호
		data.setData("cardexpy", 	paramMap.get("cardExpdateY").substring(2));			//유효기간 년도
		data.setData("cardexpm", 	paramMap.get("cardExpdateM"));			//유효기간 월
		data.setData("cardquota", 	"");
		data.setData("authentification", "00");//(00:인증, 11:비인증)
		data.setData("authField1", paramMap.get("brthdy").substring(2));
		data.setData("authField2", 	"");
		data.setData("authField3", 	"");
		data.setData("passwd", 		"");
		  
		//###############################################################################
		//# 4. 지불 요청 #
		//################  
		data = inipay.payRequest(data);
		  
		//###############################################################################
		//# 5. 요청 결과 #
		//################  
		String resultCode = data.getData("ResultCode");    // "00"이면 신용카드 등록 및 빌키생성 성공
		String resultMsg  = data.getData("ResultMsg");     // 결과에 대한 설명
		String CardCode   = data.getData("CardResultCode");// 카드사 코드
		String BillKey    = data.getData("BillKey");       // BILL KEY
		String CardPass   = data.getData("CardPass");      // 카드 비밀번호 앞 두자리
		String CardKind   = data.getData("CardKind");      // 카드 종류 ( 개인 -0 , 법인 -1)
		String tid        = data.getData("tid");           // 거래번호
		
		resMap.putAll(paramMap);
		
		resMap.put("resultCode", resultCode);
		resMap.put("resultMsg", resultMsg);
		resMap.put("cardCmpny", CardCode);
		resMap.put("cardBillKey", BillKey);
		resMap.put("CardPass", CardPass);
		resMap.put("CardKind", CardKind);
		resMap.put("tid", tid);
		
		/*** 이니페이 로그 ***/
		resMap.put("mid", billMid);
		resMap.put("agreAt1", "Y");
		resMap.put("agreAt2", "Y");
		resMap.put("cardExpdate", paramMap.get("cardExpdateY") + "/" + paramMap.get("cardExpdateM"));
		mapper.insertTHP_InipayLog(resMap);
		
		System.out.println("BillKey ====="+ BillKey);
		System.out.println("resultCode ====="+ resultCode);
		
		return resMap;
		
	}
	
	private Map<String, String> npayRegistApproval(Map<String, String> paramMap , HttpServletRequest request) throws Exception {
		
		Map<String, String> resMap = new HashMap<String, String>();
		
		String reserveId = paramMap.get("reserveId");			// 등록 예약 번호
		String tempReceiptId = paramMap.get("tempReceiptId");	// 임시 접수 번호
		
		String npayChainid = PropertyConfig.getPropertiesCon("properties/naverPay", "NPAY.CHAINID_" + paramMap.get("jihoe"));
		
		//#####################
		// API 요청 전문 생성
		//#####################
		Map<String, String> authMap = new Hashtable<String, String>();
		authMap.put("reserveId"			    ,reserveId);
		authMap.put("tempReceiptId"			,tempReceiptId);
		
		String authUrl = NPAY_API_URL+"/"+ NPAY_PARTNER_ID + "/naverpay/payments/recurrent/regist/v1/approval";
		
		HttpUtil httpUtil = new HttpUtil(authUrl);
		httpUtil.setRequestHeader("X-Naver-Client-Id", NPAY_CLIENT_ID);
		httpUtil.setRequestHeader("X-Naver-Client-Secret", NPAY_CLIENT_SECRET);
		httpUtil.setRequestHeader("X-NaverPay-Chain-Id", npayChainid);
		
		try{
			//#####################
			// 4.API 통신 시작
			//#####################
			String authResultString = "";
			authResultString = httpUtil.processHTTP(authMap);
			System.out.println("authResultString =>>>"+authResultString);
			//############################################################
			//5.API 통신결과 처리
			//############################################################
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(authResultString);
			
			Map<String, String> mapObj = new ObjectMapper().readValue(jsonObj.toString(), Map.class); 						
			resMap.putAll(mapObj);
			JSONObject jsonBody = (JSONObject) jsonObj.get("body");
			if(jsonBody != null && !jsonBody.isEmpty()) {
				Map<String, String> mapBody = new ObjectMapper().readValue(jsonBody.toString(), Map.class); 						
				resMap.putAll(mapBody);
			}
			JSONObject jsonDetail = (JSONObject) jsonBody.get("detail");					
			if(jsonDetail != null && !jsonDetail.isEmpty()) {
				Map<String, String> mapDetail = new ObjectMapper().readValue(jsonDetail.toString(), Map.class); 						
				resMap.putAll(mapDetail);
			}
			
			//############################################################
			//네이버페이 로그 입력
			//############################################################
			resMap.putAll(paramMap);			
			//mapper.insertTHP_NaverPayLog(resMap);
			//System.out.println(resMap);
			
		} catch (Exception ex) {
			System.out.println(ex);			
		}
		
		return resMap;		
	}

	@Override
	public Map<String, Object> payInfo(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("detail", mapper.payInfo(paramMap));
		return resMap;
	}
	
	@Override	
	public Map<String, String> checkValidator(Map<String, String> paramMap) throws Exception {
		
		Map<String, String> resMap = new HashMap<String, String>();
		
		String metpaySe = paramMap.get("metpaySe");
		String reqPage = com.common.util.StringUtils.getNullToString(paramMap.get("reqPage"));
		int moneyOnlyNumeric = Integer.parseInt((String)paramMap.get("cntrAmount").replaceAll(",", ""));
		int minMoney = 3000;
		
		if(reqPage.indexOf("initNicehome.do") >= 0) {
			minMoney = 20000;	// 착한가정
		} else if(reqPage.indexOf("initNicestore.do") >= 0) {
			minMoney = 30000;	// 착한가게
		}
		String strMinMoney = com.common.util.StringUtils.toNumFormat(minMoney);
		String retMsg1 = "수수료 문제로 인해 "+strMinMoney+"원 이하 기부금은 처리할 수 없습니다.\n\n"+strMinMoney+"원 이상 기부를 부탁드립니다.";
		
		if(metpaySe.equals("01") || metpaySe.equals("04") || metpaySe.equals("05")) {
			if( moneyOnlyNumeric < minMoney ){
				resMap.put("chk_result", "Fail");
				resMap.put("chk_message", retMsg1);
    		} else if( moneyOnlyNumeric > 10000000 ){
    			resMap.put("chk_result", "Fail");
				resMap.put("chk_message", "기부가능액은 최대 1000만원입니다.");
    		} else {
    			resMap.put("chk_result", "Success");
    		}
			
		} else if(metpaySe.equals("03")) {
			if( moneyOnlyNumeric < minMoney ){
				resMap.put("chk_result", "Fail");
				resMap.put("chk_message", retMsg1);
    		} else if(moneyOnlyNumeric > 10000000){
    			resMap.put("chk_result", "Fail");
				resMap.put("chk_message", "계좌이체 기부가능액은 최대 1000만원입니다.");
   			} else {
   				resMap.put("chk_result", "Success");
   			}
			
		} else if(metpaySe.equals("02")) {
			if( moneyOnlyNumeric < minMoney ){
				resMap.put("chk_result", "Fail");
				resMap.put("chk_message", retMsg1);
    		} else if( moneyOnlyNumeric > 1000000 ){
        		resMap.put("chk_result", "Fail");
				resMap.put("chk_message", "휴대폰 기부가능액은 최대 100만원입니다.");
        	} else {
   				resMap.put("chk_result", "Success");
   			}
		} else {
			resMap.put("chk_result", "Success");
		}
		
		return resMap;		
	}
	
	@Override
	public int insertTHP_NaverpayLog(Map<String, String> paramMap) throws Exception {
		int cnt = 0;
		cnt = mapper.insertTHP_NaverPayLog(paramMap);
		return cnt;
	}
	
	@Override
	public Map<String, Object> getNaverpayFrmData(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("detail", mapper.getNaverpayFrmData(paramMap));
		return resMap;
	}
	
	@Override
	public Map<String, String> insertTHP_KakaopayLog(Map<String, String> paramMap) throws Exception {		
		/**** 결제준비 API 요청 */
		paramMap.put("reqPayType", "ready");
		Map<String, String> resMap = kpayRegistApproval( paramMap );
		paramMap.put("tid", resMap.get("tid"));
		/**** 카카오페이로그 등록 */
		int cnt = mapper.insertTHP_KakaopayLog(paramMap);		
		resMap.put("cnt", cnt+"");

		return resMap;
	}
	
	private Map<String, String> kpayRegistApproval(Map<String, String> paramMap) throws Exception {
		
		Map<String, String> resMap = new HashMap<String, String>();
		
		String reqType = paramMap.get("reqPayType");
		
		//#####################
		// API 요청 전문 생성
		//#####################
		Map<String, String> authMap = new Hashtable<String, String>();
		authMap.put("cid", 					paramMap.get("cid"));
		authMap.put("partner_order_id",		paramMap.get("orderNo"));
		authMap.put("partner_user_id",		com.common.util.StringUtils.getEncMD5(paramMap.get("mbtlnum")));
			
		String authUrl = "";
		
		if("ready".equals(reqType)) {		// 결제준비
			authUrl = KPAY_API_URL+"/v1/payment/ready";
			
			authMap.put("item_name",			"사랑의열매");
			authMap.put("item_code",			paramMap.get("eventCode"));
			authMap.put("quantity",				"1");
			authMap.put("total_amount", 		"0");	// 정기기부 SID발급용 금액 0
			authMap.put("tax_free_amount", 		"0");	// 정기기부 SID발급용 금액 0
			authMap.put("approval_url",			paramMap.get("approval_url")+"&orderNo="+paramMap.get("orderNo"));
			authMap.put("cancel_url",			paramMap.get("approval_url")+"&orderNo="+paramMap.get("orderNo"));
			authMap.put("fail_url",				paramMap.get("approval_url")+"&orderNo="+paramMap.get("orderNo"));
		
		} else if("approval".equals(reqType)) {		// 결제승인
			authUrl = KPAY_API_URL+"/v1/payment/approve";
			authMap.put("tid",		paramMap.get("tid"));
			authMap.put("pg_token",	paramMap.get("pg_token"));			
		}
		
		HttpUtil httpUtil = new HttpUtil(authUrl);
		httpUtil.setRequestHeader("Authorization", "KakaoAK "+KPAY_APP_ADMIN_KEY);
		
		try{
			//#####################
			// 4.API 통신 시작
			//#####################
			String authResultString = "";
			authResultString = httpUtil.processHTTP(authMap);
			System.out.println("authResultString =>>>"+authResultString);
			//############################################################
			//5.API 통신결과 처리
			//############################################################
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(authResultString);
			
			Map<String, String> mapObj = new ObjectMapper().readValue(jsonObj.toString(), Map.class); 						
			resMap.putAll(mapObj);
			
			JSONObject jsonAmount = (JSONObject) jsonObj.get("amount");
			if(jsonAmount != null && !jsonAmount.isEmpty()) {
				Map<String, String> mapAmt = new ObjectMapper().readValue(jsonAmount.toString(), Map.class); 						
				resMap.putAll(mapAmt);
			}
			JSONObject jsonCard = (JSONObject) jsonObj.get("card_info");					
			if(jsonCard != null && !jsonCard.isEmpty()) {
				Map<String, String> mapCard = new ObjectMapper().readValue(jsonCard.toString(), Map.class); 						
				resMap.putAll(mapCard);
			}
						
			resMap.putAll(paramMap);
			resMap.put("code","Success");
			
		} catch (Exception ex) {
			resMap.put("code","Fail");
			resMap.put("message", ex.getMessage());				
			ex.printStackTrace();
		}
		
		return resMap;		
	}
	
	@Override
	public int updateTHP_KakaopayLog(Map<String, String> paramMap) throws Exception {
		return mapper.updateTHP_KakaopayLog(paramMap);
	}
	
	@Override
	public Map<String, Object> getKakaopayFrmData(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("detail", mapper.getKakaopayFrmData(paramMap));
		return resMap;
	}
}