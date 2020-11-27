package test;

import java.io.FileOutputStream;
import java.util.Calendar;

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

public class PdfTest {
	
	static String uploadPath = "C:/HMPG/"; 
	static String fontUrl = "C:/PROJECT/workspace/N_ChestFront/src/main/webapp/common/fonts/NanumSquareB.ttf";
	
	public static void main(String[] asdf)throws Exception{
		
    	String fileName = "1571366920263_sign.png";
    	
        try {
        	
            Document document = new Document(PageSize.A4); // PDF 문서를 처리하는 객체
            PdfWriter pdfFile = PdfWriter.getInstance(document, new FileOutputStream("c:/HMPG/" + System.currentTimeMillis() + ".pdf"));
            
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
            cell = makeCell( cell , font , "테스트" , "main");
            table.addCell(cell); 
            cell = makeCell( cell , font , "은행명" , "main");
            table.addCell(cell); 
            cell = makeCell( cell , font , "열매은행" , "main");
            table.addCell(cell);      
            cell = makeCell( cell , font , "계좌번호" , "main");
            table.addCell(cell);  
            cell = makeCell( cell , font , "1234567890" , "main");
            table.addCell(cell); 
            cell = makeCell( cell , font , "생년월일" , "main");
            table.addCell(cell);     
            cell = makeCell( cell , font , "20200101" , "main");
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
            Image image = Image.getInstance( uploadPath + fileName );
            image.setScaleToFitHeight(false);
            
            str = "기부자(명칭/성명)"+ "   테스트" + "                                              (인)";
            chunk = new Chunk(str, new Font( baseFont , 10 ) );
            paragraph = new Paragraph(chunk);
            paragraph.setAlignment(Element.ALIGN_RIGHT);
            document.add(paragraph);
            
            paragraph = new Paragraph();
            paragraph.add( new Chunk( image , 100 , -100 ) );
            paragraph.setAlignment(Element.ALIGN_RIGHT);
            document.add(paragraph);
            
            document.add(new Paragraph("\r\n"));
            
            str = "사회복지공동모금회 귀하";
            chunk = new Chunk(str, new Font( baseFont , 15 ) ); 	
            paragraph = new Paragraph(chunk);
            paragraph.setAlignment(Element.ALIGN_CENTER);
            document.add(paragraph);
            
            System.out.println( "pdfFile =====" + pdfFile );
            
            document.close(); // 저장이 끝났으면 document객체를 닫는다.
 
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	public static PdfPCell makeCell( PdfPCell cell , Font font , String str , String flag ) {
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

}
