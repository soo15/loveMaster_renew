/* ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : chest_menu.js
 * Author      : Chest Front
 * Date        : 2019. 9. 16.
 * Description : [ Common JS ] Common JS
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 16.    Chest Front      Initial Release
 * CH_01
 **************************************************************************************************/
var GV_ARR_MENU_H = {"menu":[
//    { "code":"00_00_00", "name":"캠페인", "link":"/ca/speclmys/initSpeclmys.do",
//        "dep2": [ { "code":"00_00_00", "name":"특별모금", "link":"/ca/speclmys/initSpeclmys.do",
//            "dep3": [ { "code":"00_00_00", "name":"지회별 이벤트 모금", "link":"/ca/speclmys/initSpeclmys.do" }
//                    ] },
//                  { "code":"00_01_00", "name":"크라우드 펀딩", "link":"/ca/crwdfund/P/initCrwdfund.do",
//            "dep3": [ /*{ "code":"00_01_00", "name":"펀딩 신청하기", "link":"/ca/crwdfund/initReqstfund.do" },*/
//                      { "code":"00_01_01", "name":"진행중인 펀딩", "link":"/ca/crwdfund/P/initCrwdfund.do" },
//                      { "code":"00_01_02", "name":"종료된 펀딩", "link":"/ca/crwdfund/E/initCrwdfund.do" }
//                    ] },
//                  { "code":"00_02_00", "name":"나눔캠페인", "link":"/bbs/1020/initPostList.do",
//            "dep3": [ { "code":"00_02_00", "name":"희망나눔캠페인(연말)", "link":"/bbs/1020/initPostList.do" },
//                      { "code":"00_02_01", "name":"소다수캠페인(연중)", "link":"/ca/sc/initSodasucmpgn.do" }
//                    ] }
//    ]},

	{ "code":"00_00_00", "name":"캠페인", "link":"/bbs/1020/initPostList.do",
	    "dep2": [{ "code":"00_02_00", "name":"나눔캠페인", "link":"/bbs/1020/initPostList.do",
		  "dep3": [ { "code":"00_02_00", "name":"희망나눔캠페인", "link":"/bbs/1020/initPostList.do" },
		            { "code":"00_02_01", "name":"소다수캠페인", "link":"/ca/sc/initSodasucmpgn.do" },
                    { "code":"00_02_02", "name":"나눔문화캠페인", "link":"/ca/sc/initNanumcmpgn.do" } ] },
		         { "code":"00_00_00", "name":"특별모금", "link":"/ca/speclmys/initSpeclmys.do",
		  "dep3": [ { "code":"00_00_00", "name":"지회별 이벤트 모금", "link":"/ca/speclmys/initSpeclmys.do" }
		  ,
		            { "code":"00_00_01", "name":"코로나19 특별모금", "link":"/ca/speclmys/initCovid.do" }
		  ] },
		         { "code":"00_01_00", "name":"크라우드 펀딩", "link":"/ca/crwdfund/P/initCrwdfund.do",
		  "dep3": [ { "code":"00_01_00", "name":"펀딩 신청하기", "link":"/ca/crwdfund/initReqstfund.do" } ,
			  		{ "code":"00_01_01", "name":"진행중인 펀딩", "link":"/ca/crwdfund/P/initCrwdfund.do" },
                    { "code":"00_01_02", "name":"종료된 펀딩", "link":"/ca/crwdfund/E/initCrwdfund.do" }
                  ] }

	]},


    { "code":"01_00_00", "name":"기부", "link":"/ct/fdrmcntr/initEvemthcntr.do",
        "dep2": [ { "code":"01_00_00", "name":"정기기부", "link":"/ct/fdrmcntr/initEvemthcntr.do",
            "dep3": [ { "code":"01_00_00", "name":"착한나눔", "link":"/ct/fdrmcntr/initEvemthcntr.do" },
                      { "code":"01_00_01", "name":"착한가정", "link":"/ct/fdrmcntr/initNicehome.do" },
                      { "code":"01_00_02", "name":"착한가게", "link":"/ct/fdrmcntr/initNicestore.do" },
                      { "code":"01_00_03", "name":"착한일터", "link":"/ct/fdrmcntr/initNicespt.do" } ] },
                  { "code":"01_01_00", "name":"일시기부", "link":"/ct/lmpscntr/initIndvdl.do",
            "dep3": [ { "code":"01_01_00", "name":"카드/계좌이체/포인트", "link":"/ct/lmpscntr/initIndvdl.do" },
                      { "code":"01_01_01", "name":"ARS/문자/무통장입금", "link":"/ct/lmpscntr/initIndvdlArs.do" } ] },
                  { "code":"01_02_00", "name":"기부참여방법", "link":"/ct/cntrpt/initNicehome.do",
            "dep3": [ { "code":"01_02_00", "name":"착한가정", "link":"/ct/cntrpt/initNicehome.do" },
                      { "code":"01_02_01", "name":"착한가게", "link":"/ct/cntrpt/initNicestore.do" },
                      { "code":"01_02_02", "name":"착한일터", "link":"/ct/cntrpt/initNicespt.do" },
                      { "code":"01_02_03", "name":"나눔리더", "link":"/ct/cntrpt/initShareleadr.do" },
                      { "code":"01_02_04", "name":"나눔리더스 클럽", "link":"/ct/cntrpt/initShareleadrclub.do" },
                      { "code":"01_02_05", "name":"아너 소사이어티", "link":"/ct/cntrpt/initHonorsociety.do" },
                      { "code":"01_02_06", "name":"기부자 맞춤기금", "link":"/ct/cntrpt/initCntrendw.do" },
                      { "code":"01_02_07", "name":"유산기부", "link":"/ct/cntrpt/initHrtgcntr.do" },
                      { "code":"01_02_08", "name":"희망자산나눔", "link":"/ct/cntrpt/initHopeassetsshare.do" },
                      { "code":"01_02_09", "name":"현물기부", "link":"/ct/cntrpt/initActhngcntr.do" } ] },
                  { "code":"01_03_00", "name":"기업사회공헌", "link":"/ct/entcntrb/initSoctycntrbdntncntr.do",
            "dep3": [ { "code":"01_03_00", "name":"사회공헌 성금기부", "link":"/ct/entcntrb/initSoctycntrbdntncntr.do" },
                      { "code":"01_03_01", "name":"사회공헌 현물기부", "link":"/ct/entcntrb/initSoctycntracthngcntr.do" },
                      { "code":"01_03_02", "name":"착한소비("+"<font size=1>공익연계마케팅</font>"+")",  "link":"/ct/entcntrb/initPblbnfcntcmarkt.do" },
                      { "code":"01_03_03", "name":"나눔명문기업", "link":"/ct/entcntrb/initSharexlcmpstnentrprs.do" }
                     ] }
    ]},
    { "code":"02_00_00", "name":"사업", "link":"/bn/sportbsns/initRelmsport.do",
        "dep2": [ { "code":"02_00_00", "name":"지원사업", "link":"/bn/sportbsns/initRelmsport.do",
            "dep3": [ { "code":"02_00_00", "name":"영역별 지원", "link":"/bn/sportbsns/initRelmsport.do" },
                      { "code":"02_00_01", "name":"나눔과 변화 스토리", "link":"/bbs/1009/initPostList.do" },
                      { "code":"02_00_02", "name":"지원안내", "link":"/bbs/1004/initPostList.do" },
                      { "code":"02_00_03", "name":"서식자료실", "link":"/bbs/1023/initPostList.do" },
                      { "code":"02_00_04", "name":"온라인 배분신청", "link":"http://proposal.chest.or.kr", "target":"_blank" }
                    ] },
                  { "code":"02_01_00", "name":"나눔문화 활성화", "link":"/bn/sca/initMlrdncorpr.do",
            "dep3": [ { "code":"02_01_00", "name":"소통과협력", "link":"/bn/sca/initMlrdncorpr.do" },
                      { "code":"02_01_01", "name":"나눔문화연구소", "link":"/bbs/1018/initPostList.do" },
                      { "code":"02_01_02", "name":"국제협력", "link":"/bn/sca/initUwweducnter.do" },
                      { "code":"02_01_03", "name":"어린이 나눔체험관", "link":"/bn/sca/initChildse.do" },
                      { "code":"02_01_04", "name":"나눔교육", "link":"/bn/sca/initShareedc.do" }
                    ] },
                  { "code":"02_02_00", "name":"나눔봉사", "link":"/bn/sharesrvc/initYngbgscamp.do",
            "dep3": [ { "code":"02_02_00", "name":"1318청소년캠프", "link":"/bn/sharesrvc/initYngbgscamp.do" },
                      { "code":"02_02_01", "name":"열매톡톡 서포터즈", "link":"/bn/sharesrvc/initTsupporters.do" },
                      { "code":"02_02_02", "name":"나눔봉사단", "link":"/bn/sharesrvc/initSharesrvc.do" }
                    ] }
    ]},
    { "code":"03_00_00", "name":"사랑의열매", "link":"/lf/intrcn/initIntrcn.do",
        "dep2": [ { "code":"03_00_00", "name":"소개", "link":"/lf/intrcn/initIntrcn.do",
            "dep3": [ { "code":"03_00_00", "name":"사랑의열매는", "link":"/lf/intrcn/initIntrcn.do" },
                      { "code":"03_00_01", "name":"인사말", "link":"/lf/intrcn/initGrt.do" },
                      { "code":"03_00_02", "name":"조직소개", "link":"/lf/intrcn/initBranchintrcn.do" },
                      { "code":"03_00_03", "name":"CI소개", "link":"/lf/intrcn/initCiintrcn.do" },
                      { "code":"03_00_04", "name":"사업성과", "link":"/lf/intrcn/initBsnsrslt.do" },
                      { "code":"03_00_05", "name":"함께하는 사람들", "link":"/lf/intrcn/initWpeople.do" },
                      { "code":"03_00_06", "name":"걸어온 길", "link":"/lf/intrcn/initHist.do" },
                      { "code":"03_00_07", "name":"최근보도", "link":"/bbs/1003/initPostList.do" },
                      { "code":"03_00_08", "name":"홍보대사", "link":"/lf/intrcn/initPrambassador.do" },
                      { "code":"03_00_09", "name":"홍보영상", "link":"/bbs/1006/initPostList.do" },
                      { "code":"03_00_10", "name":"홍보 인쇄물", "link":"/bbs/1010/initPostList.do" }
                    ] },
                  { "code":"03_01_00", "name":"안내", "link":"/bbs/1000/initPostList.do",
            "dep3": [ { "code":"03_01_00", "name":"공지사항", "link":"/bbs/1000/initPostList.do" },
                      { "code":"03_01_01", "name":"FAQ", "link":"/lf/guidance/initFaq.do" } ] },
                  { "code":"03_02_00", "name":"신뢰와 투명성", "link":"/lf/ct/initMngmtpblntf.do",
            "dep3": [ /*{ "code":"03_02_00", "name":"시민투명성위원회", "link":"" },*/
                      { "code":"03_02_01", "name":"경영공시", "link":"/lf/ct/initMngmtpblntf.do" },
                      { "code":"03_02_02", "name":"시민제안", "link":"/lf/ct/initCtznpropse.do" },
                      { "code":"03_02_03", "name":"공익신고", "link":"/lf/ct/initPblbnfsttemnt.do" },
                      { "code":"03_02_04", "name":"시민참여위원회", "link":"/bbs/1024/initPostList.do" },
                      { "code":"03_02_05", "name":"기부자결과보고", "link":"/bbs/1016/initPostList.do" }] }
    ]}
]};

var GV_ARR_MENU_F = {"menu":[
    { "code":"00_00_00", "name":"기부참여 안내", "link":"/#",
        "dep2": [ { "code":"00_00_00", "name":"첫 기부 가이드", "link":"/fr/cntrguidance/init.do" },
                  { "code":"00_01_00", "name":"나의 기부 설계", "link":"/fr/cntrdsgn/init.do" },
                  { "code":"00_02_00", "name":"기부 FAQ", "link":"/fr/cntrfaq/initPartcptnguidance.do" },
                  { "code":"00_03_00", "name":"기부 상담(나눔콜센터)", "link":"/bbs/1000/initPostDetail.do?listSn=10300" },
                  { "code":"00_04_00", "name":"기부내역 조회 및 영수증 신청", "link":"/fr/mycntr/initCntrdtlsinqire.do" }
    ]},
    { "code":"01_00_00", "name":"기부자 그룹", "link":"/#",
        "dep2": [ { "code":"01_00_00", "name":"아너 소사이어티", "link":"/pr/hs/initHonorsocietyinfo.do" },
                  { "code":"01_01_00", "name":"W아너 소사이어티", "link":"/pr/whs/initWhonorsocietyinfo.do" },
                  { "code":"01_02_00", "name":"레거시클럽", "link":"/pr/legacyclub/initLegacyclubinfo.do" },
                  { "code":"01_03_00", "name":"나눔명문기업", "link":"/pr/src/initSharexlcmpstnentrprsinfo.do" }
    ]},
    { "code":"02_00_00", "name":"각종 신청", "link":"/#",
        "dep2": [ { "code":"02_00_00", "name":"온라인 배분신청", "link":"http://proposal.chest.or.kr", "target":"_blank" },
            { "code":"02_01_00", "name":"나눔체험관 견학 신청", "link":"gf_msg();" },
            { "code":"02_02_00", "name":"기관방문 신청", "link":"gf_msg();" },
            { "code":"02_03_00", "name":"대관 신청", "link":"gf_msg();" }
//                  { "code":"02_01_00", "name":"나눔체험관 견학 신청", "link":"/bn/sca/initChildse.do" },
//                  { "code":"02_02_00", "name":"기관방문 신청", "link":"/cm/sereqst/init.do" },
//                  { "code":"02_03_00", "name":"대관 신청", "link":"/cm/rentreqst/init.do" }
               /*   { "code":"02_04_00", "name":"관람 신청", "link":"/#" } */
    ]},
    { "code":"03_00_00", "name":"SNS", "link":"/#",
        "dep2": [ { "code":"03_00_00", "name":"유튜브", "link":"https://www.youtube.com/channel/UCJCLW5U-CQXMvLrXDoiaw0g?view_as=subscriber", "target":"_blank" },
                  { "code":"03_01_00", "name":"블로그", "link":"https://blog.naver.com/nanum_in", "target":"SNS_BG" },
                  { "code":"03_02_00", "name":"페이스북", "link":"https://www.facebook.com/chestkorea/?ref=page_internal", "target":"SNS_PB" },
                  { "code":"03_03_00", "name":"인스타그램", "link":"https://www.instagram.com/fruits_of_love", "target":"SNS_IS" }
    ]}
]};

var GV_ARR_SNS_LINK = {

        "SNS_PB_001" : "https://www.facebook.com/chestkorea/?ref=page_internal",
        "SNS_PB_002" : "https://www.facebook.com/chestofseoul/?ref=page_internal",
        "SNS_PB_003" : "https://www.facebook.com/chestbusan/?ref=page_internal",
        "SNS_PB_004" : "https://www.facebook.com/daeguchest",
        "SNS_PB_005" : "https://www.facebook.com/인천-사랑의열매-383384552482855/?ref=page_internal",
        "SNS_PB_006" : "https://www.facebook.com/GJCHEST/?ref=page_internal",
        "SNS_PB_007" : "https://www.facebook.com/djchest/?ref=page_internal",
        "SNS_PB_008" : "https://www.facebook.com/UlsanChest/?ref=page_internal",
        "SNS_PB_009" : "https://www.facebook.com/ggchest/?ref=page_internal",
        "SNS_PB_010" : "https://www.facebook.com/chestofgw/?ref=page_internal",
        "SNS_PB_011" : "https://www.facebook.com/cbchest043/?ref=page_internal",
        "SNS_PB_012" : "https://www.facebook.com/chest6350340/?ref=page_internal",
        "SNS_PB_013" : "https://www.facebook.com/jbchest/?ref=page_internal",
        "SNS_PB_014" : "https://www.facebook.com/jnchest/?ref=page_internal",
        "SNS_PB_015" : "https://www.facebook.com/ilovegbchest/?ref=page_internal",
        "SNS_PB_016" : "https://www.facebook.com/경남-사랑의열매-556864348179423/?ref=page_internal",
        "SNS_PB_017" : "https://www.facebook.com/jejuchest/?ref=page_internal",
        "SNS_PB_018" : "https://www.facebook.com/chestkorea/?ref=page_internal",

        "SNS_IS_001" : "https://www.instagram.com/fruits_of_love/",
        "SNS_IS_002" : "https://www.instagram.com/fruits_of_love/",
        "SNS_IS_003" : "https://www.instagram.com/fruits_of_love/",
        "SNS_IS_004" : "https://www.instagram.com/fruits_of_love/",
        "SNS_IS_005" : "https://www.instagram.com/icchest_love/",
        "SNS_IS_006" : "https://www.instagram.com/fruits_of_love/",
        "SNS_IS_007" : "https://www.instagram.com/fruits_of_love/",
        "SNS_IS_008" : "https://www.instagram.com/ulsan_chest/?hl=ko",
        "SNS_IS_009" : "https://www.instagram.com/fruits_of_love/",
        "SNS_IS_010" : "https://www.instagram.com/gw_chestchest",
        "SNS_IS_011" : "https://www.instagram.com/cb_chest/",
        "SNS_IS_012" : "https://www.instagram.com/cn_chest/",
        "SNS_IS_013" : "https://www.instagram.com/fruits_of_love/",
        "SNS_IS_014" : "https://www.instagram.com/fruits_of_love/",
        "SNS_IS_015" : "https://www.instagram.com/fruits_of_love/",
        "SNS_IS_016" : "https://www.instagram.com/fruits_of_love_gn/",
        "SNS_IS_017" : "https://www.instagram.com/jeju_chest/?hl=ko",
        "SNS_IS_018" : "https://www.instagram.com/fruits_of_love/",

        "SNS_BG_001" : "https://blog.naver.com/nanum_in",
        "SNS_BG_002" : "https://blog.naver.com/nanum_in",
        "SNS_BG_003" : "https://blog.naver.com/nanum_in",
        "SNS_BG_004" : "https://blog.naver.com/dgchest",
        "SNS_BG_005" : "https://blog.naver.com/nanum_in",
        "SNS_BG_006" : "https://blog.naver.com/nanum_in",
        "SNS_BG_007" : "https://blog.naver.com/nanum_in",
        "SNS_BG_008" : "https://blog.naver.com/nanum_in",
        "SNS_BG_009" : "https://blog.naver.com/nanum_in",
        "SNS_BG_010" : "https://blog.naver.com/nanum_in",
        "SNS_BG_011" : "https://blog.naver.com/nanum_in",
        "SNS_BG_012" : "https://blog.naver.com/nanum_in",
        "SNS_BG_013" : "https://blog.naver.com/nanum_in",
        "SNS_BG_014" : "https://blog.naver.com/nanum_in",
        "SNS_BG_015" : "https://blog.naver.com/nanum_in",
        "SNS_BG_016" : "https://blog.naver.com/nanum_in",
        "SNS_BG_017" : "https://blog.naver.com/nanum_in",
        "SNS_BG_018" : "https://blog.naver.com/nanum_in"
};



