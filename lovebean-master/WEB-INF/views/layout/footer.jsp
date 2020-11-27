<%--
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : footer.jsp
 * Author      : Chest Front
 * Date        : 2019. 8. 1.
 * Description : [ Layout ] footer Page
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01
 *************************************************************************************************
--%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../include/ghead.jsp"%>

<script type="text/javascript">
    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){

    });

    function goFootPrivacy(){
        $plugins.uiModal({
            id:'modalPrivacy',
            link:'/contentHtml/privacy.html',
            remove:true,
            openback: function() { },
            closeback: function(v) { }
        });
    }

    function goFootEmail(){
        $plugins.uiModal({
            id:'modalEmail',
            link:'/contentHtml/email.html',
            remove:true,
            openback: function() {},
            closeback: function(v) {  }
        });
    }
</script>

<c:set var="addrMain"></c:set>
<c:set var="addrSub"></c:set>
<c:set var="bizNo"></c:set>
<c:set var="telNo"></c:set>
<c:set var="faxNo"></c:set>
<c:choose>
    <c:when test="${__branchCd eq '001'}">
        <c:set var="addrMain">(04519) 서울 중구 세종대로21길 39 (정동 1-17)</c:set>
        <c:set var="addrSub">사랑의열매 회관 5, 6층 사회복지공동모금회 (회장 예종석)</c:set>
        <c:set var="bizNo">116-82-14426</c:set>
        <c:set var="telNo">02-6262-3000</c:set>
        <c:set var="faxNo">02-6262-3100</c:set>
        <c:set var="callCenterNo">080-890-1212</c:set>
        <c:set var="email">webmaster@chest.or.kr</c:set>
    </c:when>
    <c:when test="${__branchCd eq '002'}">
        <c:set var="addrMain">(04519) 서울 중구 세종대로21길 39 (정동 1-17)</c:set>
        <c:set var="addrSub">사랑의열매 회관 2층 사회복지공동모금회 (회장 윤영석)</c:set>
        <c:set var="bizNo">101-82-06598</c:set>
        <c:set var="telNo">02-3144-7700</c:set>
        <c:set var="faxNo">02-323-7372</c:set>
    </c:when>
    <c:when test="${__branchCd eq '003'}">
        <c:set var="addrMain">(48789) 부산광역시 동구 중앙대로 365 (수정동, 부산일보사) </c:set>
        <c:set var="addrSub">6층 사회복지공동모금회 (회장 신정택)</c:set>
        <c:set var="bizNo">605-82-06751</c:set>
        <c:set var="telNo">051-790-1400</c:set>
        <c:set var="faxNo">051-790-1499</c:set>
    </c:when>
    <c:when test="${__branchCd eq '004'}">
        <c:set var="addrMain">(41260)  대구광역시 동구 장등로 36</c:set>
        <c:set var="addrSub">4층 사회복지공동모금회 (회장 김수학)</c:set>
        <c:set var="bizNo">502-82-13308</c:set>
        <c:set var="telNo">053-667-1000</c:set>
        <c:set var="faxNo">053-667-1009</c:set>
    </c:when>
    <c:when test="${__branchCd eq '005'}">
        <c:set var="addrMain">(21573) 인천광역시 남동구 예술로 152번길 30(구월동)</c:set>
        <c:set var="addrSub">3층 사회복지공동모금회 (회장 심재선)</c:set>
        <c:set var="bizNo">131-82-07720</c:set>
        <c:set var="telNo">032-456-3333</c:set>
        <c:set var="faxNo">032-456-3330</c:set>
    </c:when>
    <c:when test="${__branchCd eq '006'}">
        <c:set var="addrMain">(61639) 광주광역시 남구 천변좌로 398,</c:set>
        <c:set var="addrSub">전남매일 3층 광주사회복지공동모금회(회장 한상원)</c:set>
        <c:set var="bizNo">408-82-10178</c:set>
        <c:set var="telNo">062-222-3566</c:set>
        <c:set var="faxNo">062-222-5911</c:set>
    </c:when>
    <c:when test="${__branchCd eq '007'}">
        <c:set var="addrMain">(35275) 대전광역시 서구 계룡로 314, (갈마동)</c:set>
        <c:set var="addrSub">대전일보사옥 9층 사회복지공동모금회 (회장 정태희)</c:set>
        <c:set var="bizNo">314-82-05671</c:set>
        <c:set var="telNo">042-347-5171</c:set>
        <c:set var="faxNo">042-471-5174</c:set>
    </c:when>
    <c:when test="${__branchCd eq '008'}">
        <c:set var="addrMain">(44629) 울산광역시 남구 북부순환도로 45 (무거동 220-5)</c:set>
        <c:set var="addrSub">5층 사회복지공동모금회 (회장 한시준)</c:set>
        <c:set var="bizNo">610-82-06767</c:set>
        <c:set var="telNo">052-270-9000</c:set>
        <c:set var="faxNo">052-270-9009</c:set>
    </c:when>
    <c:when test="${__branchCd eq '009'}">
        <c:set var="addrMain">(16460) 경기도 수원시 팔달구 매산로 66 (매산로 3가)</c:set>
        <c:set var="addrSub">마로빌딩 3층 사회복지공동모금회 (회장 이순선)</c:set>
        <c:set var="bizNo">124-82-09394</c:set>
        <c:set var="telNo">031-220-7900</c:set>
        <c:set var="faxNo">031-225-6088</c:set>
    </c:when>
    <c:when test="${__branchCd eq '010'}">
        <c:set var="addrMain">(24239) 강원도 춘천시 수변공원길 11 (삼천동)</c:set>
        <c:set var="addrSub">2동 201호 사회복지공동모금회 (회장 유계식)</c:set>
        <c:set var="bizNo">221-82-07682</c:set>
        <c:set var="telNo">033-244-1662</c:set>
        <c:set var="faxNo">033-244-1688</c:set>
    </c:when>
    <c:when test="${__branchCd eq '011'}">
        <c:set var="addrMain">(28583)  충북 청주시 흥덕구 공단로 87 (복대1동 262번지)</c:set>
        <c:set var="addrSub">충북종합사회복지센터 403호 사회복지공동모금회 (회장 노영수)</c:set>
        <c:set var="bizNo">315-82-04641</c:set>
        <c:set var="telNo">043-238-9100</c:set>
        <c:set var="faxNo">043-238-9300 </c:set>
    </c:when>
    <c:when test="${__branchCd eq '012'}">
        <c:set var="addrMain">(32256) 충청남도 홍성군 홍북읍 청사로 146</c:set>
        <c:set var="addrSub">센텀시티 603호 사회복지공동모금회 (회장 성우종)</c:set>
        <c:set var="bizNo">305-82-09746</c:set>
        <c:set var="telNo">041-635-0340</c:set>
        <c:set var="faxNo">041-635-0342</c:set>
    </c:when>
    <c:when test="${__branchCd eq '013'}">
        <c:set var="addrMain">(55005) 전라북도 전주시 완산구 기린대로 194 (서노송동, SK)</c:set>
        <c:set var="addrSub">9층 사회복지공동모금회 (회장 김동수)</c:set>
        <c:set var="bizNo">402-82-11354</c:set>
        <c:set var="telNo">063-282-0606</c:set>
        <c:set var="faxNo">063-282-0607</c:set>
    </c:when>
    <c:when test="${__branchCd eq '014'}">
        <c:set var="addrMain">(58567) 전라남도 무안군 삼향읍 후광대로 282 (남악리 2113)</c:set>
        <c:set var="addrSub">전문건설회관 5층 사회복지공동모금회 (회장 노동일)</c:set>
        <c:set var="bizNo">409-82-09674</c:set>
        <c:set var="telNo">061-902-6800</c:set>
        <c:set var="faxNo">061-281-6133</c:set>
    </c:when>
    <c:when test="${__branchCd eq '015'}">
        <c:set var="addrMain">(41098) 대구광역시 동구 안심로 106 (율하동)</c:set>
        <c:set var="addrSub">메디원타워 4층 사회복지공동모금회 (회장 신현수)</c:set>
        <c:set var="bizNo">515-82-05309</c:set>
        <c:set var="telNo">053-980-7800</c:set>
        <c:set var="faxNo">053-980-7819</c:set>
    </c:when>
    <c:when test="${__branchCd eq '016'}">
        <c:set var="addrMain">(51410) 경상남도 창원시 의창구 충혼로 91 (두대동)</c:set>
        <c:set var="addrSub">7호관 4층 사회복지공동모금회 (회장 강기철)</c:set>
        <c:set var="bizNo">608-82-07889</c:set>
        <c:set var="telNo">055-270-6700</c:set>
        <c:set var="faxNo">055-264-6702~3</c:set>
    </c:when>
    <c:when test="${__branchCd eq '017'}">
        <c:set var="addrMain">(63197) 제주시 중앙로 165 (이도1동)</c:set>
        <c:set var="addrSub">고용복지플러스센터 4층 사회복지공동모금회 (회장 김남식)</c:set>
        <c:set var="bizNo">616-82-12520</c:set>
        <c:set var="telNo">064-755-9810</c:set>
        <c:set var="faxNo">064-756-9820</c:set>
    </c:when>
    <c:when test="${__branchCd eq '018'}">
        <c:set var="addrMain">(30034) 세종특별자치시 조치원읍 충현로40</c:set>
        <c:set var="addrSub">휘림빌딩 4층 사회복지공동모금회 (회장 홍영섭)</c:set>
        <c:set var="bizNo">307-82-09908</c:set>
        <c:set var="telNo">044-863-5400</c:set>
        <c:set var="faxNo">044-863-5401</c:set>
    </c:when>
</c:choose>
<div class="base-footer-wrap">
    <div class="logo"><span class="hide">사랑의 열매</span></div>

    <div class="footer-link"></div>

    <div class="footer-address">
        <ul class="footer-menu">
            <li class="footer-menu-item" style="font-weight:bold;"><a href="javascript:goFootPrivacy();">개인정보처리방침</a></li>
            <li class="footer-menu-item"><a href="javascript:goFootEmail();">이메일주소무단수집거부</a></li>
            <li class="footer-menu-item"><a href="/lf/intrcn/initBranchintrcn.do?mapYn=Y">찾아오시는 길</a></li>
        </ul>
        <address>
            <p class="address-txt">
                <span class="address-item">${addrMain } <span class="mobile-block">${addrSub }</span></span>
                <span class="address-item only-pc">사업등록번호  ${bizNo }</span>
            </p>
            <p class="address-txt">
                <span class="address-item only-mobile">사업등록번호  ${bizNo }</span>
                <span class="address-item">TEL ${telNo }</span>
                <span class="address-item">FAX ${faxNo }</span>
                <span class="address-item">CCK call center 080-890-1212</span>
                <span class="address-item">E-mail webmaster@chest.or.kr</span>
            </p>
        </address>
    <c:if test="${__branchCd eq '009'}">
        <address>
            <p class="address-txt">
                <span class="address-item">(10447) 경기도 고양시 일산동구 중앙로 1066 <span class="mobile-block">재능교육빌딩 6층 601호 사회복지공동모금회 (회장 이순선)</span></span>
                <span class="address-item only-pc">사업등록번호  124-82-09394</span>
            </p>
            <p class="address-txt">
                <span class="address-item only-mobile">사업등록번호  124-82-09394</span>
                <span class="address-item">TEL 031-906-4024</span>
                <span class="address-item">FAX 031-906-1746</span>
                <span class="address-item">CCK call center 080-890-1212</span>
                <span class="address-item">E-mail webmaster@chest.or.kr</span>
            </p>
        </address>
    </c:if>
        <p class="footer-copyright">© Community Chest Of Korea, 2019</p>
        <a href="http://www.w4c.go.kr/main/mainPage.do" target="_blank" class="partner-logo only-pc"><img src="/common/img/common/footer_partner_logo.png" alt="보건복지부 사회복지시설정보시스템"></a>
    </div>
</div>
