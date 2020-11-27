package test; 
 
import java.io.IOException; 
 
public class MakeBase64Test { 
 
    public static void main(String[] args) { 
 
        //--/bbs/1005/initPostDetail.do?listSn=1&pBhfCode=001 
 
    	 String param = "/ca/crwdfund/P/initCrwdfundDetail.do?propseSn=28"; //클라우드 펀딩 
    	//String param = "/bbs/1003/initPostDetail.do?listSn=13210&pBhfCode=004"; //게시판 
    	//   String param = "/bbs/1000/initPostDetail.do?listSn=13419&pBhfCode=001"; //게시판 
    	//   String param = "/bbs/1004/initPostDetail.do?listSn=13436&pBhfCode=001"; //게시판 
    	// String param = "/ca/speclmys/initSpeclmysDetail.do?mysspecleSn=28"; //클라우드 펀딩 
         
        //클라우드 펀딩 최종주소 : https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTE=  
        //게시판 최종주소 : https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAwL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTg1NiZwQmhmQ29kZT0wMDE= 
        //특별모금 최종주소 : https://www.chest.or.kr/bridgelink.do?pBranchCd=005&bhfCode=005&_mid=00_00_00&_murl=L2NhL3NwZWNsbXlzL2luaXRTcGVjbG15c0RldGFpbC5kbz9teXNzcGVjbGVTbj05 
 
 
        System.out.println(param); 
        param = (new sun.misc.BASE64Encoder()).encode(param.getBytes()); 
        System.out.println(param); 
        try { 
            System.out.println(new String((new sun.misc.BASE64Decoder()).decodeBuffer(param))); 
        } catch (IOException e) { 
            // TODO Auto-generated catch block 
            e.printStackTrace(); 
        } 
 
 
 
    } 
 
 
} 
