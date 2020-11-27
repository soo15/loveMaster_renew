<!--
 ************************************************************************************************ 
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴] 사업 > 지원사업 > 영역별 지원 
 * Author      : 
 * Description : 
 *************************************************************************************************
-->

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">
    
    $(document).ready(function(){
        init();
        
        $('.ui-acco-btn').off('click').on('click', function(e) {
            clickEvent(this);
        });        
    });

    function init() {

        $.each($('.ui-acco-pnl'), function() {
            $('.ui-acco-pnl').css('display', 'none');
        });

        $.each($('.ui-acco-tit'), function() {
            $('.ui-acco-btn').removeClass('selected');
        });

        var firstFaq = $( $.find(' dl.ui-acco-wrap dt.ui-acco-tit button.ui-acco-btn') ).first();
        clickEvent($(firstFaq));
    }

    function clickEvent(obj) {
        // 선택 되어 있다면 hide  
        if ($(obj).hasClass('selected')) {

            // 모두 접기 
             $('.ui-acco-btn').removeClass('selected');
             $('.ui-acco-pnl').css('display', 'none');

            $(obj).removeClass('selected');
            $(obj).parent().next('dd.ui-acco-pnl').hide();


        } else {

            // 모두 접기 
             $('.ui-acco-btn').removeClass('selected');
             $('.ui-acco-pnl').css('display', 'none');

            $(obj).addClass('selected');
            $(obj).parent().next('dd.ui-acco-pnl').show();

        };

    }    

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/

</script>


<div class="sub-visual visual02_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">지원사업</h2>
        <p class="title-sub-txt">소중한 성금이 꼭 필요한 곳에 사용되도록 최선을 다하고 있습니다</p>
    </div>
</div>
    
<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3><strong>영역별 지원안내</strong><span>각 복지사업 영역별 지원사항을 안내드립니다.</span></h3>
            <div class="contents-menu-nav">
            </div>
        </div>

        <div class="seo-box">
            <div class="area-type-c">
                <p class="title-heading_b">C-SDGs 영역별 지원사업 소개<span class="sub-txt">(아래 타이틀 클릭시 각 지원안내 세부내용을 보실 수 있습니다.) </span></p>
                <div class="ui-acco type-business" role="group" id="uiAccoGUID03_1">
                    
                    <dl class="ui-acco-wrap type-a">
                        <dt class="ui-acco-tit">
                            <button type="button" class="ui-acco-btn">
                                <p class="business-wrap">
                                    <span class="business-item n1">1.경제적 빈곤 퇴치</span>
                                    <span class="business-title">현금ㆍ현물 기초생계지원</span>
                                    <span class="ui-acco-arrow"></span>
                                </p>
                            </button>
                        </dt>
                        <dd class="ui-acco-pnl">
                            <p class="business-tit">위기 가정 재기 지원사업</p>
                            <p class="business-text">신한금융그룹의 ‘희망사회프로젝트’ 일환으로 굿네이버스와 함께 진행한 본 사업은 임대료 체납으로 강제퇴거 위기에 처한 가정, <br>갑작스러운 병마로 인해 생계가 곤란한 가정 등 어려움을 겪게 된 이웃에게 주거비, 교육비, 의료비, 재난재해 피해 등을 지원했습니다.
                            <p class="business-text">또한, 우리 사회 곳곳에서 위기에 처한 이웃을 위해 도움의 손길을 전해 온 ‘희망영웅’지원을 통해 나눔을 실천하는 기부자들과 함께 위기 상황을 딛고 <br>꿋꿋하게 일어서도록 도움을 주고자 했습니다.</p>
                            <div class="business-img">
                                <div class="img-item"><img src="/common/img/contents/business-img001.jpg" alt=""></div>
                                <div class="img-item"><img src="/common/img/contents/business-img001-1.jpg" alt=""></div>
                            </div>
                        </dd>
                    </dl>  
                    
                    <dl class="ui-acco-wrap type-a">
                        <dt class="ui-acco-tit">
                            <button type="button" class="ui-acco-btn">
                                <p class="business-wrap">
                                    <span class="business-item n2">2. 영양 및 급식지원 기아종식</span>
                                    <span class="business-title">결식예방을 위한 주ㆍ부식 및 특수식 지원</span>
                                    <span class="ui-acco-arrow"></span>
                                </p>
                            </button>
                        </dt>
                        <dd class="ui-acco-pnl">
                            <p class="business-tit">저소득 결식아동의 건강한 성장을 위한 영양지원사업 ‘따뜻한 채움’</p>
                            <p class="business-text">결식아동은 약 33만 명에 달하고 있으며 그 수가 매해 증가하고 있습니다. 정부의 급식비 지원이 이루어지고 있으나 <br>지자체별 선정기준 상이, 신청제로 인한 낙인감, 서비스 접근성 문제 등으로 많은 결식아동들이 제대로 지원을 받지 못하고 있는 실정입니다.</p>
                            <p class="business-text">사랑의열매는 저소득 소외계층 아동의 결식문제 해결을 위해 한 아동 당 매월 10만원의 영양비를 지원하고 있습니다. <br>아동들의 기호에 맞는 식품 구입과 균형적인 영양 섭취를 통해 건강한 신체발달을 돕고 있습니다. <br>더 나아가 이들이 건강한 사회구성원으로 자라날 수 있도록 지원하고 있습니다. </p>
                            <div class="business-img">
                                <div class="img-item"><img src="/common/img/contents/business-img002.jpg" alt=""></div>
                            </div>
                        </dd>
                    </dl>                    
                    <dl class="ui-acco-wrap type-a">
                        <dt class="ui-acco-tit">
                            <button type="button" class="ui-acco-btn">
                                <p class="business-wrap">
                                    <span class="business-item n3">3. 신체 정서적 건강과 회복</span>
                                    <span class="business-title">의료비 및 의료서비스 지원, 심리정서 지원</span>
                                    <span class="ui-acco-arrow"></span>
                                </p>
                            </button>
                        </dt>
                        <dd class="ui-acco-pnl">
                            <div class="img-with-txt">
                                <div class="img-area type-right"><img src="/common/img/contents/business-img003-1.jpg" alt=""></div>
                                <div class="text-area">
                                    <p class="business-tit">의료사각지대 해소를 통한 건강권 증진사업 ‘보건·의료·복지 301네트워크’</p>
                                    <p class="business-text">의료비에 대한 부담으로 질병을 방치하다 증상이 악화되고, 근로 능력을 상실하여 경제적 어려움이 <br>심화되는 상황이 증가하고 있습니다. 이러한 악순환의 고리를 끊을 수 있도록 사랑의열매는 <br>지역사회의 자원들을 활용하여 의료사각지대에 놓인 환자를 효과적으로 발굴하고, 치료부터 퇴원 이후의 <br>생활까지 통합적으로 지원합니다.</p>
                                    <p class="business-text">전국 15개 병원과 각 지역의 동주민센터, 지역복지기관의 협력을 통해 지원이 필요한 대상자를 발굴하여 <br>입원치료비, 외래비, 검사비, 간병비 등 필요한 의료서비스를 제공하고, 퇴원 이후에도 지속적인 돌봄을 <br>받을 수 있도록 맞춤형 사회복지서비스를 연계함으로써 안정적인 생활을 지원하고 있습니다.</p>
                                    <div class="business-img">
                                        <div class="img-item"><img src="/common/img/contents/business-img003.jpg" alt=""></div>
                                    </div>
                                </div>
                            </div>
                        </dd>
                    </dl>                   
                    <dl class="ui-acco-wrap type-a">
                        <dt class="ui-acco-tit">
                            <button type="button" class="ui-acco-btn">
                                <p class="business-wrap">
                                    <span class="business-item n4">4. 교육 및 자립역량강화</span>
                                    <span class="business-title">학습 지원, 직업 및 창업교육, 평생교육 및 재능교육 지원</span>
                                    <span class="ui-acco-arrow"></span>
                                </p>
                            </button>
                        </dt>
                        <dd class="ui-acco-pnl">
                            <p class="business-tit">지역활동 청년의 정착을 위한 쉐어하우스 제공사업 '터무늬 있는 집’</p>
                            <div class="img-with-txt">
                                <div class="img-area"><img src="/common/img/contents/business-img004.jpg" alt=""></div>
                                <div class="text-area">
                                    <p class="business-text">청년의 주거비 부담이 10년 만에 77% 상승하였고, 20대 1인가구 10명 중 4명이 <br>소득의 30% 이상을 집세로 소비하는 등 청년 주거 문제가 심각하지만, <br>공공임대주택의 20대 입주율은 소득 제한과 높은 임대료 부담으로 단 3%에 불과합니다.</p>
                                    <p class="business-text">이에 사랑의 열매는 복지사각지대 청년에게 주거비 절감 및 사회적 관계 회복을 위한 <br>시민출자 청년주택기금 조성을 지원하고 있습니다. <br>시민들이 2년에서 최대 5년까지 출자하고, 이를 청년주택 전세보증금으로 활용합니다.</p>
                                    <p class="business-text">공동 주거를 희망하거나 지역에서 활동하는 청년 그룹에 주택을 제공하여, 청년들의 <br>여건에 맞게 주거비를 지급하고 함께 생활하며 공동 주택을 운영합니다.</p>
                                    <p class="business-text">현재 시민 출자기금으로 마련 된 ‘터무늬 있는 집’이 운영되고 있으며 이를 통해 <br>주거비 절감 및 청년 자산형성, 지역공동체 확산, 시민 출자자와 청년의 세대 간 교류가 <br>이루어지고 있습니다.</p>
                                </div>
                            </div>
                        </dd>
                    </dl>
                    <dl class="ui-acco-wrap type-a">
                        <dt class="ui-acco-tit">
                            <button type="button" class="ui-acco-btn">
                                <p class="business-wrap">
                                    <span class="business-item n5">5. 성평등</span>
                                    <span class="business-title">여성 관련 지원</span>
                                    <span class="ui-acco-arrow"></span>
                                </p>
                            </button>
                        </dt>
                        <dd class="ui-acco-pnl">
                            <p class="business-tit">발달장애인으로 구성된 햇살인형극단의 성폭력 및 유괴예방 인형극 공연</p>
                            <div class="img-with-txt">
                                <div class="img-area"><img src="/common/img/contents/business-img005.jpg" alt=""></div>
                                <div class="text-area">
                                    <p class="business-text">사랑의열매는 발달장애인 7명으로 구성된 햇살인형극단의 성폭력 및 유괴예방 인형극 <br>공연을 지원하여, ‘인형극 공연가’라는 새로운 장애인 직업모델을 제시하고 발달장애인이 <br>직업인으로서 수익을 창출할 수 있도록 자립을 지원합니다.</p>
                                    <p class="business-text">인형극 전문 강사의 교육을 받은 발달장애인이 직접 유치원, 어린이집, 특수학급 및 <br>장애인시설 아동들을 대상으로 찾아가는 성폭력 및 유괴예방 인형극 공연을 실시하고 <br>있습니다.</p>
                                    <p class="business-text">아동의 눈높이 맞는 성폭력 및 유괴예방 인형극을 통해 인형극을 관람하는 아이들은 <br>위험한 상황을 인지하고, 대처하는 방법을 배울 수 있습니다. 이는 성폭력 재발방지 <br>교육에도 많은 도움을 주어 안전한 지역사회를 만드는데 공헌하고 있습니다.</p>
                                </div>
                            </div>
                        </dd>
                    </dl>                                                   
                    <dl class="ui-acco-wrap type-a">
                        <dt class="ui-acco-tit">
                            <button type="button" class="ui-acco-btn">
                                <p class="business-wrap">
                                    <span class="business-item n6">6. 깨끗한 물과 위생</span>
                                    <span class="business-title">식수 위생 관련 지원</span>
                                    <span class="ui-acco-arrow"></span>
                                </p>
                            </button>
                        </dt>
                        <dd class="ui-acco-pnl">
                            <p class="business-tit">취약계층 물사용 환경 개선을 위한 K-water 행복가득 水 프로젝트</p>
                            <p class="business-text">취약계층 노후 주택 및 취약사회복지 시설은 배관 및 수전의 노후화로 인해 물사용 환경이 열악한 곳이 많습니다. 특히 오래된 주택일수록 별도의 주방, 욕실이 <br>없거나 아예 물이 나오지 않는 경우도 많습니다.</p>
                            <p class="business-text">사랑의열매는 취약계층과 사회복지시설에 깨끗한 물을 공급하고 주거 및 이용시설 환경개선을 위해 노력하고 있습니다. 매년 전국 60개 이상의 가구와 시설을 <br>선정하여 지원하고 있습니다. 또한 시공 시 자활기업과 연계하여 일자리 창출을 통해 저소득층 자립을 지원하고 있습니다.</p>
                            <div class="business-img">
                                <div class="img-item"><img src="/common/img/contents/business-img006.jpg" alt=""></div>
                                <div class="img-item"><img src="/common/img/contents/business-img006-1.jpg" alt=""></div>
                                <div class="img-item"><img src="/common/img/contents/business-img006-2.jpg" alt=""></div>
                            </div>
                        </dd>
                    </dl>
                    <dl class="ui-acco-wrap type-a">
                        <dt class="ui-acco-tit">
                            <button type="button" class="ui-acco-btn">
                                <p class="business-wrap">
                                    <span class="business-item n7">7. 모두를 위한 깨끗한 에너지</span>
                                    <span class="business-title">재생 및 청정에너지 지원</span>
                                    <span class="ui-acco-arrow"></span>
                                </p>
                            </button>
                        </dt>
                        <dd class="ui-acco-pnl">
                            <p class="business-tit">방범취약지역 주민의 안전보호와 안전의식 확립을 위한 태양광 안심가로등 지원사업</p>
                            <p class="business-text">여성범죄대상 성폭력 등 강력범죄 발생에 따른 안전에 대한 두려움과 불안감이 증가하고 있고, 특히 인적이 드물거나 어두운 골목길은 범죄발생의 위험이 있습니다.</p>
                            <p class="business-text">사랑의열매는 저소득층 방범취약지역 주민의 안전을 위해 2015년부터 안심가로등을 설치하여 밝고 안전한 환경을 만들고 있습니다. <br>특히 태양광, 풍력과 같은 친환경에너지를 이용하여 지속가능한 가로등을 지원하고 있습니다. 안심가로등을 설치한 지역들은 에너지 절감효과와 더불어 <br>해당 지역주민의 범죄 경험률 감소 등의 변화를 나타내고 있습니다.</p>
                            <div class="business-img">
                                <div class="img-item"><img src="/common/img/contents/business-img007.jpg" alt=""></div>
                                <div class="img-item"><img src="/common/img/contents/business-img007-1.jpg" alt=""></div>
                                <div class="img-item"><img src="/common/img/contents/business-img007-2.jpg" alt=""></div>
                            </div>
                        </dd>
                    </dl>
                    <dl class="ui-acco-wrap type-a">
                        <dt class="ui-acco-tit">
                            <button type="button" class="ui-acco-btn">
                                <p class="business-wrap">
                                    <span class="business-item n8">8. 양질의 일자리 만들기</span>
                                    <span class="business-title">고용 및 창업 관련 지원</span>
                                    <span class="ui-acco-arrow"></span>
                                </p>
                            </button>
                        </dt>
                        <dd class="ui-acco-pnl">
                            <p class="business-tit">정신장애인 취업 직종 개발 및 역량 강화를 위한 하우스키핑/공유숙박 코디네이터 양성사업</p>
                            <div class="img-with-txt">
                                <div class="img-area"><img src="/common/img/contents/business-img008.jpg" alt=""></div>
                                <div class="text-area">
                                    <p class="business-text">정신장애인의 고용률은 약 10%로 15개 장애 유형 중에서도 가장 낮고 <br>전체 장애인 평균 고용률인 36%와도 큰 차이를 보입니다.</p>
                                    <p class="business-text">사랑의열매는 정신장애인의 취업 확대를 목적으로 장애인 채용연계가 낮은 호텔 내 직종을 <br>개발하기 위해 ‘하우스키핑 코디네이터 양성 교육’을 실시하고 있습니다.</p>
                                    <p class="business-text">20명의 정신 장애인에게 교육을 제공하여 교육을 수료하고 ‘침대 정리 매니저’ 자격증을 <br>취득할 수 있도록 지원하고 있습니다. 또한, 호텔 및 게스트하우스와 연계한 3주의 <br>‘파일럿 채용’ 과정을 통해 취업으로 이어나갈 수 있도록 하고 있습니다.</p>
                                </div>
                            </div>
                        </dd>
                    </dl>        
                    <dl class="ui-acco-wrap type-a">
                        <dt class="ui-acco-tit">
                            <button type="button" class="ui-acco-btn">
                                <p class="business-wrap">
                                    <span class="business-item n9">9. 적정기술과 정보기술 격차 해소 지원</span>
                                    <span class="business-title">적정기술과 정보기술 격차 지원</span>
                                    <span class="ui-acco-arrow"></span>
                                </p>
                            </button>
                        </dt>
                        <dd class="ui-acco-pnl">
                            <p class="business-tit">시각장애인의 책 가뭄 해결을 위한 e북 크라우드 구축.운영 </p>
                            <div class="img-with-txt">
                                <div class="img-area"><img src="/common/img/contents/business-img009.jpg" alt=""></div>
                                <div class="text-area">
                                    <p class="business-text">시각장애인을 위해 현재 전국의 44개 점자도서관에서 다양한 도서를 제공하고 있으나, <br>일반인들에 비해 제공되는 점자도서가 많지 않아 정보의 부족을 경험하고 있습니다.</p>
                                    <p class="business-text">이에 사랑의열매는 시각장애인의 책 가뭄 해결을 위해 시각장애인용 e북 제작 웹사이트를 <br>개발하여 연간 2,000명의 자원봉사자들이 온라인상에서 크라우드소싱 협업 방식으로 <br>e북을 제작할 수 있도록 지원하고 있습니다.</p>
                                    <p class="business-text">시각장애인 학생과 직장인의 경우, 책을 신청하더라도 120일 이상 소요되어 원하는 시기에 <br>e북을 제공받지 못해 학업과 직무 수행에 어려움을 겪었습니다.</p>
                                    <p class="business-text">하지만, e북 크라우드 구축을 통해 7일안에 e북을 제작할 수 있게 되어 시각장애인의 <br>지식·정보 접근성을 높일 수 있게 되었습니다.</p>
                                </div>
                            </div>
                        </dd>
                    </dl>
                    <dl class="ui-acco-wrap type-a">
                        <dt class="ui-acco-tit">
                            <button type="button" class="ui-acco-btn">
                                <p class="business-wrap">
                                    <span class="business-item n10">10. 사회적 배제 감서와 불평등 완화</span>
                                    <span class="business-title">아동 보호 및 양육, 안전 / 편의증진 / 돌봄 지원, 지역사회 통합 지원, 여가 / 문화 / 예술 경험 및 활동</span>
                                    <span class="ui-acco-arrow"></span>
                                </p>
                            </button>
                        </dt>
                        <dd class="ui-acco-pnl">
                            <p class="business-tit">다문화를 포함한 취약계층 아동 청소년 대상 음악과 함께 건강한 한국인, 퓨전 국악 오케스트라人 양성 프로젝트</p>
                            <div class="img-with-txt">
                                <div class="img-area"><img src="/common/img/contents/business-img010.jpg" alt=""></div>
                                <div class="text-area">
                                    <p class="business-text">다문화 가정 및 취약계층 아동·청소년의 경우 학교 교육과정을 따라가는 것을 어려워하거나 <br>학교에 적응하지 못해 학업을 중도포기 하는 경우가 많습니다. 학업의지가 있더라도 <br>전문적인 교육을 제공받는 것이 어렵기 때문에, 본인의 소질을 개발하는 것도 한계가 있습니다.</p>
                                    <p class="business-text">사랑의열매는 이들의 사회적 배재 감소와 교육 불평등을 해소하기 위해 다문화가정 및 <br>취약계층 아동·청소년 퓨전 국악 오케스트라人 양성 프로젝트 사업을 지원합니다.</p>
                                    <p class="business-text">사회적기업이 서울시 구로구 내 13개 기관과 함께 협력하며 거점별로 가야금, 해금, 바이올린, <br>플롯, 사물놀이 악기교육을 실시하고 있습니다. 현재 퓨전 국악 오케스트라 단원들을 구성하여 <br>‘소나기 오케스트라’를 창단하였으며, 지역사회 문화공연에 참여하고 있습니다.</p>
                                </div>
                            </div>
                        </dd>
                    </dl>
                    <dl class="ui-acco-wrap type-a">
                        <dt class="ui-acco-tit">
                            <button type="button" class="ui-acco-btn">
                                <p class="business-wrap">
                                    <span class="business-item n11">11. 지속가능한 지역사회 인프라 구축</span>
                                    <span class="business-title">지역사회 협력 인프라 구축, 지역사회 및 복지시설 환경개선</span>
                                    <span class="ui-acco-arrow"></span>
                                </p>
                            </button>
                        </dt>
                        <dd class="ui-acco-pnl">
                            <p class="business-tit">낙후된 마을의 저소득층 주민들을 위한 지역재생사업 : 청춘발산마을 조성사업</p>
                            <div class="img-with-txt">
                                <div class="img-area"><img src="/common/img/contents/business-img011.jpg" alt=""></div>
                                <div class="text-area">
                                    <p class="business-text">다문화 가정 및 취약계층 아동·청소년의 경우 학교 교육과정을 따라가는 것을 어려워하거나 학교에 적응하지 못해 <br>학업을 중도포기 하는 경우가 많습니다. 학업의지가 있더라도 전문적인 교육을 제공받는 것이 어렵기 때문에, <br>본인의 소질을 개발하는 것도 한계가 있습니다.</p>
                                    <p class="business-text">사랑의열매는 이들의 사회적 배재 감소와 교육 불평등을 해소하기 위해 다문화가정 및 취약계층 아동·청소년 퓨전 국악 <br>오케스트라人 양성 프로젝트 사업을 지원합니다.</p>
                                    <p class="business-text">사회적기업이 서울시 구로구 내 13개 기관과 함께 협력하며 거점별로 가야금, 해금, 바이올린, 플롯, 사물놀이 악기교육을 <br>실시하고 있습니다. 현재 퓨전 국악 오케스트라 단원들을 구성하여 ‘소나기 오케스트라’를 창단하였으며, <br>지역사회 문화공연에 참여하고 있습니다.</p>
                                </div>
                            </div>
                        </dd>
                    </dl>
                    <dl class="ui-acco-wrap type-a">
                        <dt class="ui-acco-tit">
                            <button type="button" class="ui-acco-btn">
                                <p class="business-wrap">
                                    <span class="business-item n12">12. 지속가능한 생산과 소비</span>
                                    <span class="business-title">자원의 선순환</span>
                                    <span class="ui-acco-arrow"></span>
                                </p>
                            </button>
                        </dt>
                        <dd class="ui-acco-pnl">
                            <p class="business-tit">노숙인 목공사업단의 업사이클링 용기와 목재를 활용한 새활용 가치 확산</p>
                            <p class="business-text">필요없는 재료나 물건을 더 가치있는 쓰임새로 ‘새로운 것’으로 만드는 ‘업사이클링(Upcycling)’이 생활 속 트렌드로 주목받고 있습니다. <br>매립되거나 소각되는 쓰레기를 줄이고 재가공에 소요되는 추가적인 자원낭비를 방지할 수 있으며, 업사이클링 물건을 사용하거나 직접 제작하는 과정을 통해 <br>친환경 의식을 고취할 수 있습니다.</p>
                            <p class="business-text">사랑의열매는 특수코팅 등으로 재사용이 어려운 일회용품 용기에 공기정화식물을 심고, 버려진 목재를 활용하여 화분 거치용 수직 선반을 만들어 <br>미세먼지를 친환경적으로 제거하는 업사이클링 활동을 지원하고 있습니다. 알코올중독이나 정신장애로 어려움을 겪고 있는 노숙인들과 자원봉사자들이 함께 <br>만드는 공기정화 기능성 화분은 지역사회 내 사회복지 기관 및 시설로 배분되어 쾌적한 환경을 조성하는 데 기여하고 있습니다. 버려지는 자원에 디자인을 더하고 <br>활용 방법을 바꿔 사회적 가치를 창출, 실현함과 동시에 노숙인을 지역사회 구성원으로 복귀할 수 있도록 이들의 자활과 자립을 돕고 있습니다.</p>
                        </dd>
                    </dl>  
                     <dl class="ui-acco-wrap type-a"> 
                         <dt class="ui-acco-tit"> 
                             <button type="button" class="ui-acco-btn"> 
                                 <p class="business-wrap"> 
                                     <span class="business-item n13">13. 기후변화와 대응</span> 
                                     <span class="business-title">기후변화 대응</span> 
                                     <span class="ui-acco-arrow"></span>  
                                 </p> 
                             </button> 
                         </dt> 
                         <dd class="ui-acco-pnl"> 
                             <p class="business-tit">베트남 짜빈성 기후변화 대응과 지역주민의 환경의식 및 삶의 질 개선을 위한  환경교육 지원 & 맹그로브 조림사업</p> 
                             <p class="business-text">기후 변화로 인해 지구촌은 다양한 문제에 직면하고 있습니다. 강우량이 줄어 토지의 염도는 올라가고 농업용수와 지하수가 부족해지고 있습니다. <br>해수면의 상승은 연안지역 거주민들의 삶을 위협하고 있습니다.</p> 
                             <p class="business-text">사랑의열매는 범지구적 문제로 모든 국가에 영향을 미치는 기후변화의 위협에 대응하여 베트남 짜빈성 지역에서 ‘지역주민 환경교육 및 맹그로브 숲 조성사업’을 <br>실시하고 있습니다. 이미 파괴된 숲을 다시 조성하여 기후변화에 대한 대응력을 높이고, 해수면 상승과 염수의 침투로 발생하는 2차 피해를 완화시키고자 합니다. <br>지역주민을 대상으로 환경교육을 실시하여 무분별한 맹그로브 숲 벌목을 줄여나가고자 합니다.</p> 
                             <div class="business-img type-b"> 
                                 <div class="img-item"><img src="/common/img/contents/business-img013.jpg" alt=""></div> 
                                 <div class="img-item"><img src="/common/img/contents/business-img013-1.jpg" alt=""></div> 
                             </div>  
                         </dd> 
                     </dl>                              
                           
                     <dl class="ui-acco-wrap type-a"> 
                         <dt class="ui-acco-tit"> 
                             <button type="button" class="ui-acco-btn"> 
                                 <p class="business-wrap"> 
                                     <span class="business-item n14">14. 해양생태계 보존</span> 
                                     <span class="business-title">해양생태계 보호</span> 
                                     <span class="ui-acco-arrow"></span> 
                                 </p> 
                             </button> 
                         </dt> 
                         <dd class="ui-acco-pnl"> 
                             <p class="business-tit">화삼어촌계와 고교환경동아리가 함께하는 견내량 해양쓰레기 정화사업 </p> 
                             <div class="img-with-txt"> 
                                 <div class="img-area"><img src="/common/img/contents/business-img014.jpg" alt=""></div> 
                                 <div class="text-area"> 
                                     <p class="business-text">통영시는 스티로폼 부표를 가장 많이 사용하는 굴·멍게 등의 양식업과 어선어업이 발달하여 <br>어업과정에서 폐스티로폼 부표·폐어구 등의 해양쓰레기가 많이 발생하는 지역입니다. <br>지역 내 해양쓰레기 수거활동은 적은 반면, 쓰레기 투기와 방치가 지속되어 해양생태계가 <br>점차 파괴되고 있습니다.</p> 
                                     <p class="business-text">사랑의열매는 생태환경조사를 기반으로 지역 내 고교환경동아리, 어민이 함께 연안의 쓰레기를 <br>수거하고, 전문 다이버와 크레인 뗏목을 이용하여 해양의 침적쓰레기를 수거할 수 있도록 <br>해양 정화사업을 지원합니다.</p> 
                                     <p class="business-text">이를 통해 연간 200여명 이상 투입되어 20톤의 해양쓰레기를 수거하였고, 어촌계원 30여명에게 <br>일자리도 제공하였습니다. 본 사업은 해양 생태환경 회복은 물론 지속가능한 수산어업의 발굴, <br>나아가 해양쓰레기 사각지대 해소를 위한 정책도 제언할 수 있을 것입니다.</p> 
                                 </div> 
                             </div> 
                         </dd> 
                     </dl>                                 
                     <dl class="ui-acco-wrap type-a"> 
                         <dt class="ui-acco-tit"> 
                             <button type="button" class="ui-acco-btn"> 
                                 <p class="business-wrap"> 
                                     <span class="business-item n15">15. 육상생태계 보존</span> 
                                     <span class="business-title">육상생태계 보호</span> 
                                     <span class="ui-acco-arrow"></span> 
                                 </p> 
                             </button> 
                         </dt> 
                         <dd class="ui-acco-pnl"> 
                             <p class="business-tit">몽골 사막화로 인한 환경난민 전락 방지 사업 ‘KB 국민의 맑은 하늘 숲’ 조성사업</p> 
                             <p class="business-text">일상생활에서 미세먼지의 영향력과 심각성이 증폭되는 가운데, 미세먼지의 주요 발원지인 몽골의 사막화는 그들의 삶에 큰 영향을 미치고 있습니다. <br>몽골은 국토의 90%에 사막화가 진행 중이며, 목초지와 농경지의 식생훼손과 생태계 파괴로 인해 환경난민으로 전락한 유목민들이 고향을 떠나 도시 빈민으로 <br>살아가고 있습니다.</p> 
                             <p class="business-text">사랑의열매는 몽골 투브아이막 바양척드솜 지역에 포플러, 비술나무, 차차르간 등 묘목 20,000그루를 심고, 울타리 및 전기시설, 관수시설 등을 함께 설치하여 <br>숲을 조성하고 지속적으로 관리할 수 있도록 지원하고 있습니다. 아울러 방풍림 및 유실수 재배와 영농활동을 통한 수익 창출로 지역 주민들이 환경난민으로 <br>전락하지 않고 지역 내에서 생계를 유지하며 살아갈 수 있도록 경제적 자립 역량 강화를 위한 다양한 교육활동을 전개하고 있습니다.</p> 
                             <div class="business-img"> 
                                 <div class="img-item"><img src="/common/img/contents/business-img015.jpg" alt=""></div> 
                                 <div class="img-item"><img src="/common/img/contents/business-img015-1.jpg" alt=""></div> 
                                 <div class="img-item"><img src="/common/img/contents/business-img015-2.jpg" alt=""></div> 
                             </div> 
                         </dd> 
                     </dl>                                 
                    
                     <dl class="ui-acco-wrap type-a"> 
                         <dt class="ui-acco-tit"> 
                             <button type="button" class="ui-acco-btn"> 
                                 <p class="business-wrap"> 
                                     <span class="business-item n16">16. 사회적 약자의 권리증진</span> 
                                     <span class="business-title">연대와 협력, 인권옹호 등 지원</span> 
                                     <span class="ui-acco-arrow"></span> 
                                 </p> 
                             </button> 
                         </dt> 
                         <dd class="ui-acco-pnl"> 
                             <p class="business-tit">감정노동자의 노동인권보호와 건강한 노동현장을 위한 사전예방적 지원체계 구축 </p> 
                             <p class="business-text">성별, 감정, 상황 등에 대처하는 방식 및 정서 상태에 따라 과도한 감정노동 발생시 감정노동자는 직무만족도 및 자존감 하락, 우울증, 대인기피증, 적응 장애 등 <br>다양한 질환을 겪게 됩니다.</p> 
                             <p class="business-text">이에 사랑의열매는 감정노동자를 위한 대응매뉴얼 개발, 개별 방문상담을 통한 심리 지원 등을 진행해 감정노동자의 노동인권감수성 향상으로 소진예방과 <br>건강한 노동활동을 지원하고 있습니다.</p> 
                         </dd> 
                     </dl>
                </div>
            </div>
        </div>
    </div>
</main>
