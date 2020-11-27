<!--
 ************************************************************************************************ 
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [하단메뉴] 기부참여안내 > 나의 기부 설계 
 * Author      : 
 * Description : 
 *************************************************************************************************
-->

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">


var objConf = {"conf":[
                   // 1[사회공헌 성금기부] : 법인 , 정기,현금, 3333만원 이하  
                      {  "key" :"dl" 
                        ,"giver":"01"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"01"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"01"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "X"    // 직업구분  : 회사원(01), 자영업(02) , 기타(03)  
                        ,"amount":"HP0040-01" // 기부예정금액    
                   // 2[나눔명문기업] : 법인 , 정기,현금, 3333만원 초과    
                    },{  "key" :"d2" 
                        ,"giver":"01"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"01"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"01"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "X"    // 직업구분 : 회사원(01), 자영업(02) , 기타(03)  
                        ,"amount":"HP0040-02" // 기부예정금액
                   // 3[사회공헌 현물기부] : 법인 ,정기,현물  
                    },{  "key" :"d3" 
                        ,"giver":"01"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"01"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"02"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "X"    // 직업구분 : 회사원(01), 자영업(02) , 기타(03)  
                        ,"amount":"X"  // 기부예정금액
                   // 4[사회공헌 성금기부] : 법인 ,일시,현금, 1억미만 
                    },{  "key" :"dl" 
                        ,"giver":"01"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"02"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"01"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "X"    // 직업구분 : 회사원(01), 자영업(02) , 기타(03)  
                        ,"amount":"HP0041-01"  // 기부예정금액
                    // 5[나눔명문기업] : 법인 ,일시,현금, 1억이상 
                    },{  "key" :"d2" 
                        ,"giver":"01"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"02"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"01"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "X"    // 직업구분 : 회사원(01), 자영업(02) , 기타(03)  
                        ,"amount":"HP0041-02"  // 기부예정금액
                    // 6[사회공헌 현물기부] : 법인 ,일시,현물 
                    },{  "key" :"d3" 
                        ,"giver":"01"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"02"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"02"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "X"    // 직업구분 : 회사원(01), 자영업(02) , 기타(03)  
                        ,"amount":"X"  // 기부예정금액
                    // 7[일시기부/크라우드펀딩] : 개인 ,일시,현금, 100만원 미만 
                    },{  "key" :"d4" 
                        ,"giver":"02"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"02"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"01"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "X"    // 직업구분 : 회사원(01), 자영업(02) , 기타(03)  
                        ,"amount":"HP0042-01"  // 기부예정금액
                    // 8[나눔리더] : 개인 ,일시,현금, 100만원 이상~1억 미만 
                    },{  "key" :"d5" 
                        ,"giver":"02"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"02"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"01"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "X"    // 직업구분 : 회사원(01), 자영업(02) , 기타(03)  
                        ,"amount":"HP0042-02"  // 기부예정금액
                    // 9[아너 소사이어티] : 개인 ,일시,현금, 1억 이상 
                    },{  "key" :"d6" 
                        ,"giver":"02"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"02"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"01"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "X"    // 직업구분 : 회사원(01), 자영업(02) , 기타(03)  
                        ,"amount":"HP0042-03"  // 기부예정금액
                    // 10[현물기부] : 개인 ,일시,현물 
                    },{  "key" :"d7" 
                        ,"giver":"02"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"02"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"02"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "X"    // 직업구분 : 회사원(01), 자영업(02) , 기타(03)  
                        ,"amount":"X"  // 기부예정금액
                    // 11[착한일터] : 개인 ,정기,현금, 2만원 미만, 회사원 
                    },{  "key" :"d8" 
                        ,"giver":"02"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"01"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"01"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "01"    // 직업구분 : 회사원(01), 자영업(02) , 기타(03)  
                        ,"amount":"HP0043-01"  // 기부예정금액
                    // 12[정기기부] : 개인 ,정기,현금, 2만원 미만 , 회사원 외
                    },{  "key" :"d9" 
                        ,"giver":"02"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"01"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"01"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "X1"    // 직업구분 : 회사원(01), 자영업(02) , 기타(03) , 회사원외(X1),자영업외(X2)
                        ,"amount":"HP0043-02"  // 기부예정금액
                    // 13[착한가정] : 개인 ,정기,현금, 2만원 이상~3만원 미만 
                    },{  "key" :"d10" 
                        ,"giver":"02"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"01"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"01"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "X"    // 직업구분 : 회사원(01), 자영업(02) , 기타(03)  
                        ,"amount":"HP0043-03"  // 기부예정금액
                    // 14[착한가게] : 개인 ,정기,현금, 3만원 이상~10만원 미만, 자영업  
                    },{  "key" :"d11" 
                        ,"giver":"02"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"01"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"01"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "02"    // 직업구분 : 회사원(01), 자영업(02) , 기타(03)  
                        ,"amount":"HP0043-04"  // 기부예정금액
                    // 15[착한가정] : 개인 ,정기,현금, 3만원 이상~10만원 미만, 자영업 외 
                    },{  "key" :"d10" 
                        ,"giver":"02"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"01"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"01"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "X2"    // 직업구분 : 회사원(01), 자영업(02) , 기타(03), 자영업 외 (X2)  
                        ,"amount":"HP0043-05"  // 기부예정금액
                    // 16[나눔리더] : 개인 ,정기,현금, 10만원 이상~166만원이하 
                    },{  "key" :"d5" 
                        ,"giver":"02"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"01"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"01"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "X"    // 직업구분 : 회사원(01), 자영업(02) , 기타(03)  
                        ,"amount":"HP0043-06"  // 기부예정금액
                    // 17[아너 소사이어티] : 개인 ,정기,현금, 166만원 초과 
                    },{  "key" :"d6" 
                        ,"giver":"02"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"01"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"01"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "X"    // 직업구분 : 회사원(01), 자영업(02) , 기타(03)  
                        ,"amount":"HP0043-07"  // 기부예정금액
                    // 18[현물기부] : 개인 ,정기,현물 
                    },{  "key" :"d7" 
                        ,"giver":"02"  // 기부자구분 : 법인(01), 개인(02)
                        ,"give":"01"   // 기부구분    :정기(01), 일시(02)     
                        ,"kind":"02"   // 기부종류   :현금(01), 현물(02)
                        ,"job": "X"    // 직업구분 : 회사원(01), 자영업(02) , 기타(03)  
                        ,"amount":"X"  }]}; // 기부예정금액

var objWork = {"work":[{"key":"dl","name":"사회공헌 성금기부"} 
                        ,{"key":"d2","name":"나눔명문기업"}
                        ,{"key":"d3","name":"사회공헌 헌물기부"}
                        ,{"key":"d4","name":"일시기부/크라우드펀딩"}
                        ,{"key":"d5","name":"나눔리더"}
                        ,{"key":"d6","name":"아너 소사이어티"}
                        ,{"key":"d7","name":"현물기부"}
                        ,{"key":"d8","name":"착한일터"}
                        ,{"key":"d9","name":"정기기부"}
                        ,{"key":"d10","name":"착한가정"}
                        ,{"key":"d11","name":"착한가게"}]};
                        
    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        keyEvent(); //숫자만 입력가능
        init();
        
    });
    function init() {
        $(".box-mydonation").hide();
    }
    function keyEvent() {
        //숫자만 입력가능
        
        $("#giveMoney").on( "keyup keydown", function() {
            inputNumberFormat(this);
        });
    }
    /*===========================================================
     * 기부예정금액
     *===========================================================*/
    $(document).on("click", "[data-action]", function(e){
        e.preventDefault();
        var action = $(this).data("action");
        var price = $(this).attr("price");
        if( action == "direct" ) {
            $("#giveMoney").attr("readonly" , false);
            $("#giveMoney").val("");
        } else {
            $("#giveMoney").attr("readonly" , true);
            $("#giveMoney").val(price);
        }
    });
    
    /*===========================================================
     * 결과보기 버튼을 클릭 FUCNTION 
     *===========================================================*/
    $(document).on("click", "#btnResultShow", function(e){
        if( !validator() ) return;
        // 값에 따른 값 설정 
        if(makeFormData($("#giverFlagM").val()
                       ,$("#giveFlagM").val()
                       ,$("#giveKindFlagM").val()
                       ,$("#giveMoney").val() 
                       ,$("#jobFlagM").val())){
            
             $(".box-mydonation").show();   
            
//             $(".box-mydonation-result ul li").show();
            
        };
    });
    
    /*===========================================================
     *  결과보기  전  값 Function
     *===========================================================*/    
    function makeFormData(giver,give,kind,money,job){
        
        var conf = objConf.conf;
        var work = objWork.work;
        var key = "dl";
        var money = uncomma(money);
        
        
        if (kind == "02" ) job="X";
        // 기부예정금액  Set
        var amount = "X";
        
        // [법인 , 정기, 현금]  직업은 필요 없음
        if ( giver  == "01" && give  == "01" && kind  == "01"){
            job = "X";
            if( money <= 33330000 )     amount = "HP0040-01";
            else if( money > 33330000 ) amount = "HP0040-02";
            else amount = "X";
        }
        
        // [법인, 일시 , 현금 ] 
        if ( giver  == "01" && give  == "02" && kind  == "01"){
            job = "X";
            if( money < 100000000 )     amount = "HP0041-01";
            else if( money >= 100000000 ) amount = "HP0041-02";
            else amonut = "X";
        }
        
        // [개인, 일시 , 현금 ]
        if ( giver  == "02" && give  == "02" && kind  == "01"){
            job = "X";
            if( money < 1000000 )     amount = "HP0042-01";
            else if( money >= 1000000 && money < 100000000  ) amount = "HP0042-02";
            else if( money >= 100000000  ) amount = "HP0042-03";
            else amonut = "X";
        } 
        
        // [개인 ,정기, 현금]
        if ( giver  == "02" && give  == "01" && kind  == "01"){
                 if( money < 20000 && job == "01" )                     { amount = "HP0043-01"; }
            else if( money < 20000 && job != "01" )                     { amount = "HP0043-02"; job ="X1";}
            else if( money >= 20000 && money < 30000 )                  { amount = "HP0043-03"; job= "X"; }
            else if(( money >= 30000 &&  money < 100000 ) && job=="02" ){ amount = "HP0043-04"; }
            else if(( money >= 30000 &&  money < 100000 ) && job!="02" ){ amount = "HP0043-05"; job ="X2";}
            else if( money >= 100000 &&  money <= 1660000  )            { amount = "HP0043-06"; job ="X"; }
            else if( money > 1660000  )                                 { amount = "HP0043-07"; job ="X"; }
            else    amonut = "X";
        }        
                
        
        for( var i = 0; i < conf.length ; i ++ ){ 
            //console.log(conf[i])
            if ( conf[i].giver  == giver 
              && conf[i].give  == give
              && conf[i].kind  == kind
              && conf[i].amount   == amount
              && conf[i].job  == job){
                key = conf[i].key ;    
            }
        };
        
        for( var i = 0; i < work.length ; i ++ ){
            if ( work[i].key  == key) {
                // alert ( work[i].key  + " >>> "  + work[i].name );
                $("#hidNm").html( work[i].name);
                $("#hidImg").attr('class',work[i].key);
            }    
        };
        return true;
    }

    /*===========================================================
     *  결과보기  전  값 Function
     *===========================================================*/    
    function validator() {
        
        // 기부자 구분
        if( $.trim( $("#giverFlagM").val() ).length == 0 ) {
            alert("기부자 구분을 선택해 주세요");
            $("#giverFlagM").focus();
            return false;
        }
        // 기부 구분
        if( $.trim( $("#giveFlagM").val() ).length == 0 ) {
            alert("기부 구분을 선택해 주세요");
            $("#giveFlagM").focus();
            return false;
        }
        // 기부종류
        if( $.trim( $("#giveKindFlagM").val() ).length == 0 ) {
            alert("기부종류 을 선택해 주세요");
            $("#giveKindFlagM").focus();
            return false;
        }
        // 직업구분
        if( $.trim( $("#jobFlagM").val() ).length == 0 ) {
            alert("직업구분을 선택해 주세요");
            $("#jobFlagM").focus();
            return false;
        }
        // 금액
        if( $.trim( $("#giveMoney").val() ).length == 0 ) {
            alert("금액을 선택해주세요");
            $("#giveMoney").focus();
            return false;
        }
        return true;
    }
    
    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/

</script>

<div class="sub-visual visual06_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">나의 기부 설계</h2>
        <p class="title-sub-txt">내게 맞는 기부 유형을 찾아보세요.</p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>
    
<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3><strong>나의 기부 설계</strong><span>내게 맞는 기부 유형을 찾아줍니다.</span></h3>
            <div class="contents-menu-nav">
            </div>
        </div>

        <div class="seo-box">
            <div class="tb-type_a mb-type">
                <table summary="나의 기부 설계">
                    <caption>나의 기부 설계 정보입니다.</caption>
                    <colgroup>
                        <col class="col-xs">
                        <col class="col-auto">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row">기부자 구분<span class="required" aria-label="필수">*</span></th>
                        <td>
                            <div class="ui-select form-w02">
                                <select class="sel_type" id="giverFlagM" title="기부자 구분 선택">
                                    <c:out value="${giverFlagM}" escapeXml="false" />
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">기부 구분<span class="required" aria-label="필수">*</span></th>
                        <td>
                            <div class="ui-select form-w02">
                                <select class="sel_type" id="giveFlagM" title="기부 구분 선택">
                                    <c:out value="${giveFlagM}" escapeXml="false" />
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">기부예정금액<span class="required" aria-label="필수">*</span></th>
                        <td>
                            <div class="ui-togglebtn type-sum">
                                <button type="button" class="btn-base-imp small" data-action="" price="5,000">5천원</button>
                                <button type="button" class="btn-base small" data-action="" price="10,000">1만원</button>
                                <button type="button" class="btn-base small" data-action="" price="20,000">2만원</button>
                                <button type="button" class="btn-base small" data-action="" price="30,000">3만원</button>
                                <button type="button" class="btn-base small" data-action="" price="50,000">5만원</button>
                                <button type="button" class="btn-base small" data-action="" price="100,000">10만원</button>

                                <span class="ui-inpcancel-group">
                                    <button type="button" class="btn-base small mgl-s" data-action="direct">직접입력</button>
                                    <input type="text" class="inp-base ui-inpcancel" name="giveMoney" id="giveMoney" placeholder="직접입력" readonly numberOnly maxlength="12">
                                    <span class="txt-mark">원</span>
                                </span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">기부 종류<span class="required" aria-label="필수">*</span></th>
                        <td>
                            <div class="ui-select form-w02">
                                <select class="sel_type" id="giveKindFlagM" title="기부 종류 선택">
                                    <c:out value="${giveKindFlagM}" escapeXml="false" />
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">직업 구분<span class="required" aria-label="필수">*</span></th>
                        <td>
                            <div class="ui-select form-w02">
                                <select class="sel_type" id="jobFlagM" title="직업 구분 선택">
                                    <c:out value="${jobFlagM}" escapeXml="false" />
                                </select>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="btn-area">
                <button type="button" class="btn-base-imp" id ="btnResultShow">결과보기</button>
            </div>

            <div class="box-mydonation">
                <ul><li class="list-donation"><i class="dl" id ="hidImg"></i><span></span></li></ul>
                <p class="text-mydonation">
                    <em>기부자</em>님께 맞는 기부 유형은
                    <span class="text-mydonation-info">
                        <strong class="color-type1" id ="hidNm"></strong>입니다.
                    </span>
                </p>
                <div class="btn-area">
                    <button type="button" class="btn-base-imp">사회공헌 성금기부 바로가기</button>
                </div>
            </div>
<!--             <div class="box-mydonation-result"> -->
<!--                 <p class="text-donation-name">각 결과 노출 이미지들</p> -->
<!--                 <ul class="box-mydonation-group"> -->
<!--                     <li class="list-donation"><i class="dl"></i><span>사회공헌 성금기부</span></li> -->
<!--                     <li class="list-donation"><i class="d2"></i><span>나눔명문기업</span></li> -->
<!--                     <li class="list-donation"><i class="d3"></i><span>사회공헌 헌물기부</span></li> -->
<!--                     <li class="list-donation"><i class="d4"></i><span>일시기부/크라우드펀딩</span></li> -->
<!--                     <li class="list-donation"><i class="d5"></i><span>나눔리더</span></li> -->
<!--                     <li class="list-donation"><i class="d6"></i><span>아너 소사이어티</span></li> -->
<!--                     <li class="list-donation"><i class="d7"></i><span>현물기부</span></li> -->
<!--                     <li class="list-donation"><i class="d8"></i><span>착한일터</span></li> -->
<!--                     <li class="list-donation"><i class="d9"></i><span>정기기부</span></li> -->
<!--                     <li class="list-donation"><i class="d10"></i><span>착한가정</span></li> -->
<!--                     <li class="list-donation"><i class="d11"></i><span>착한가게</span></li> -->
<!--                 </ul> -->
<!--             </div> -->
        </div>

    </div>
</main>