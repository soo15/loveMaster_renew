<!-- 
	########################### 대관신청 ###########################
 -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../include/ghead.jsp"%>
<script type="text/javascript">
 var url = "/cm/rentreqst";
var CURR_PAGE_NO = "<c:out value='${paramMap.currPageNo}' />";
var auditorium = {"4":600000 , "5":750000 , "9":1350000};	//대강당
var auditoriumBim = 100000;									//대강당빔
var lectureRoom = 100000;									//세미나I , 강의실 A , 강의실 B
var lectureRoomC = 60000;									//강의실C 
var lectureRoomD = 40000;									//강의실D
var lectureBim = 10000;										//세미나 , 강의실 A , 강의실 B , 강의실C 
var totalPrice;
var emplYn = false;
var _tabIdx = 0;
var _reqstSn , _erntSn;
var _ignoreArr= [];
var _thisweek = "${week}";
var _tabId = "";
var myGrid = null;
var CURR_PAGE_NO = "<c:out value='${paramMap.currPageNo}' />";

	
	/***
	*##############################
	*상세 예약현황 기간 버튼
	*############################## 
	***/
	$(document).on("click", "[data-action]", function(e){
		e.preventDefault();    	
		if( $(this).data("action") !="clear" ) {
	    	$("[data-action]").removeClass("select");
	    	$(this).addClass("select");	    	
	    	var value = $(this).attr("value");
	    	var param = {"getDate":value};
	    	gf_send("<c:url value='" + url + "/selectPeriodDate.do' />", param );	    	
		} else {    		
			$("[data-action]").removeClass("select");
			$("#endDate").val("");	
	    	$("#startDate").val("");
		}
		selectReseverList();
	});
	
	function selectPeriodDateAfter(json) {
    	var item = json.detail;
    	$("#endDate").datepicker('setDate' , item.endDate);		//제한기간 시작일
    	$("#startDate").datepicker('setDate' , item.today);		//제한기간 시작일
    }
	
	/**********
	*##############################
	*상세 예약현황 기간 버튼
	*##############################
	**********/
	$(document).on("click", "#btnSearch", function(e){
    	var date1 = new Date($("#endDate").datepicker("getDate"));
		var date2 = new Date($("#startDate").datepicker("getDate"));
		if (date2 - date1 < 0){
    		alert("종료 일자가 시작 일자보다 이전일 수 없습니다"); 
    	    return false;
		}
		if( $.trim( $("#startDate").val() ).length == 0  ) {
			alert("일자를 선택해 주세요.");
			return false;
		}
		if( $.trim( $("#endDate").val() ).length == 0  ) {
			alert("일자를 선택해 주세요.");
			return false;
		}
		selectReseverList();
    });
	
	function selectReseverList(pageNo){
        gf_send("<c:url value='" + url + "/selectReserveDetailList.do' />", gf_searchParam(pageNo) );
    }
	
	function selectReserveDetailListAfter(data) {
		console.log( data );
		var el="";
		if( data.listInfo.length <= 0 ) el = "<tr><td colspan='7'>데이터가 없습니다.</td></tr>";
		$(data.listInfo).each( function(x,item) {
			var name = item.elstNm;
			var eventNm = item.eventNm;
			var reqstsn = item.reqstSn;
			var erntsn = item.erntSn;
			var progrsStep = item.progrsStep;
			el += '<tr>';
			el += '<td>' + item.rgsde 					+ '</td>';
			if( progrsStep == "01" ) {
				el += '<td><a href="#" onclick="javascript:openPopup(this);" data-name="'+name+'" data-eventnm="'+eventNm+'" data-reqstsn="'+reqstsn+'" data-erntsn="'+erntsn+'">';
				el += '<font color=blue>' + item.reqstInsttNm + '</font>';
				el += '</a></td>';
			} else {
				el += '<td>' + item.reqstInsttNm	+ '</td>'; 
			}
			el += '<td>' + item.elstNm 					+ '</td>';
			el += '<td>' + item.elstUseBgnde 				+ '</td>';
			el += '<td>' + item.elstUseEndde 				+ '</td>';
			el += '<td align="left">' + item.eventNm 		+ '</td>';
			el += '<td>' + item.progrsStepNm 				+ '</td>';
			el += '</tr>'; 
		});
		$("#dataGridList tbody").html(el);
		$("#dataGridPageNavi").html("");
		
		if( data.listInfo.length > 0 ) {
			myGrid.makePageNvai(data.pageInfo, "selectReseverList");
		}
		
    }
	
	$(document).on("click", "#btnPre , #btnNext , #btnPreBottom , #btnNextBottom", function(e){
        e.preventDefault();
        var id = $(this).attr("id");
        if(id == "btnPre") {
        	selectList( -1 , 1 );
        	_tabId = "btnPre";
        }
        if(id == "btnNext") {
        	selectList( 1 , 1 );
        	_tabId = "btnNext";
        }
        if(id == "btnPreBottom") {
        	selectDetailList( -1 );
        }
        if(id == "btnNextBottom") {
        	selectDetailList( 1 );
        }
    });
	
	$(document).on("click", "#btnInsert , #btnEmplChk , #btnDetail", function(e){
		e.preventDefault();
	    var id = $(this).attr("id");
	    if( id == "btnEmplChk" ) {
	    	if( $.trim( $("#emplId").val() ).length == 0 ) { 
	    		alert("아이디를 입력해주세요");
	    		$("#emplId").focus();
	    		return false;
	    	}
	    	if( $.trim( $("#emplPass").val() ).length == 0 ) { 
	    		alert("패스워드를 입력해주세요");
	    		$("#emplPass").focus();
	    		return false;
	    	}
	    	var parameter = {"emplId":$("#emplId").val() ,"emplPass": $("#emplPass").val() };
			gf_send( url + "/emplChk.do", parameter );
	    }
		if( id == "btnInsert") {
    		if( !validator() ) return;
    		if( confirm("신청 하시겠습니까?") ) {
    			makeFormData();   
	        	gf_sendFileForm("frm");
        	}
        }
		if( id == "btnDetail") {
			myGrid = gf_initMyGrid();
			$("#reseverLayout0").hide();
			$("#reseverLayout1").show();
		}
	});
	
	$(document).on("change", "#elstUseBgntm , #elstUseEndtm", function(e){
		e.preventDefault();
	    var id = $(this).attr("id");
		var sval = $("#elstUseBgntm option:checked").val();
		var eval = $("#elstUseEndtm option:checked").val();
		
		if( id == "elstUseBgntm") {
			if ( $("#elstUseBgnde").val() == "" ) {
				alert("대여 시작일을 선택해주세요");
				$("#" + id +" option:eq(0)").prop("selected","selected");
				_common.makeSelectLayout();	//select box 
				return false;
			}		
		}
		
		if( sval != "" && eval != "" ) {
			if( parseInt(eval) <= parseInt(sval) ) {
				alert("대여시간을 확인해주세요");
				$("#" + id +" option:eq(0)").prop("selected","selected");
				_common.makeSelectLayout();	//select box 
				return false;
			}
			totalMoney();
		}
		
	});
	
	$(document).on("change", "#elstCode2", function(e){
		var tabNum;
		$("#tabDiv").find("button").each( function() {
			var cls = $(this).attr("class");
			if( cls == "button_sort active" ) {
				tabNum = $(this).attr("id");
				return false;
			}
		})
		selectList( 0 , tabNum);
	});
	
	$(document).on("change", "#elstCode", function(e){
		$("#hrhtTxt").text("");
		var val = $("#elstCode option:checked").attr("elstSe");
		var txt = $("#elstCode option:checked").text();
		
		//지하1층 강당은 빔프로젝트 무조건 선택
		if( txt == "지하1층 강당" ) {
			$("input:radio[name='bimUseAt']:radio[value='Y']").prop("checked",true);
		} 
		
		//강의실은 빔프로젝트가 없으니 선택버튼 필요없다
		if( txt == "강의실D" ) {
			$("input:radio[name='bimUseAt']:radio[value='N']").prop("checked",true);
		} 
		
		var el='<option value="">선택하세요</option>';
		if ( val == '01' ) {
			el += '<option value="8" >오전</option>';
			el += '<option value="13" >오후</option>';
			$("#elstUseBgntm").html(el);
			
			el='<option value="">선택하세요</option>';
			el += '<option value="12">오전</option>';
			el += '<option value="18">오후</option>';
			$("#elstUseEndtm").html(el);
		} else {
			el='<option value="">선택하세요</option>';
			for( var i=8; i<=17; i++) {
				el += '<option value="' + i + '" >' + zeroSum(i) + '시</option>';
			}
			$("#elstUseBgntm").html(el);
			
			el='<option value="">선택하세요</option>';
			for( var i=9; i<=18; i++) {
				el += '<option value="' + i + '">' + zeroSum(i) + '시</option>';
			}
			$("#elstUseEndtm").html(el);
		}
		_common.makeSelectLayout();	//select box
		$("#elstUseBgnde").val("");
		$("#reservStatusTable").html("");
// 		makeReserTable();
		selectIgnoreCalendar();
	});
	
	function makeReserTable() {
		if( $("#elstUseBgnde").val() != "" ) {
			var param = {
					"firstDate": $("#elstUseBgnde").val()
					,"elstCode":$("#elstCode option:checked").val()
					,"elstNm": $("#elstCode option:checked").text()
			}
			gf_send( url + "/SelectReserveStatus.do", param );
		}
	}
	
	function SelectReserveStatusAfter(data) {
		var elstCodeNm = $("#elstCode option:checked").text();
		var len = data.list.length;
		var el = '';
		if( elstCodeNm == "지하1층 강당" ) {
			el += '<table>';
			el += '<tr>';
			el += '<th width="160" scope="rowgroup"><font size=2>대여희망시설' + '<br/>' + elstCodeNm + '</font></th>';
			el += '<th colspan="2" style="text-align:center" scope="rowgroup"><font size=2>시간</font></th>';
			el += '</tr>';
			el += '<tr>';
			el += '<th width="" scope="rowgroup"><font size=2>대여희망일자' + '<br/>' + $("#elstUseBgnde").val() + '</font></th>';
			el += '<td style="text-align:center" value="8">오전</td>';
			el += '<td style="text-align:center" value="13">오후</td>';
			el += '<tr id="hourTxt">';
			el += '<th width="" scope="rowgroup"><font size=2>가능여부</font></th>';
			el += '<td style="text-align:center" value="8"><font color=red size=2>불가</font></td>';
			el += '<td style="text-align:center" value="13"><font color=red size=2>불가</font></td>';	
			el += '</tr>';
			el += '</table>';
		} else {
			el += '<table>';
			el += '<tr>';
			el += '<th width="160" scope="rowgroup"><font size=2>대여희망시설' + '<br/>' + elstCodeNm + '</font></th>';
			el += '<th colspan="11" style="text-align:center" scope="rowgroup"><font size=2>시간</font></th>';
			el += '</tr>';
			el += '<tr>';
			el += '<th width="" scope="rowgroup"><font size=2>대여희망일자 ' + '<br/> ' + $("#elstUseBgnde").val() + '</font></th>';
			for( var i=8; i<=18; i++ ) {
				el += '	<td style="text-align:center"><font size=2>' + zeroSum(i) + '시</font></td>';
			}
			el += '</tr>';
			el += '<tr id="hourTxt">';
			el += '<th width="" scope="rowgroup"><font size=2>가능여부</font></th>';
			for( var i=8; i<=18; i++ ) {
				el += '	<td style="text-align:center" value="'+i+'"><font color=red size=2>불가</font></td>';
			}
			el += '</tr>';
			el += '</table>';
		}
		$("#reservStatusTable").html(el);
		
		$(data.list).each( function( i,item ) {
			$("#hourTxt").find('td').each( function(x) {
				var hour = item.elstUseBgntm;
				var value = $(this).attr("value");
				if( value == hour ) {
					$(this).html("<font size=2>가능</font>");
				}
			})
		});			
	}
	
	function insertAfter(data) {
		if( data.result == '111' ) {
			alert("중복된 예약시간이 있습니다.\n다른 일자 혹은 다른 시간대를 선택하세요.");
    		return false;
		}
		else if( data.result == 1 ) {
    		alert("<spring:message code="result.save.success"></spring:message>");	// 저장되었습니다.
    		location.href = url + "/init.do";
	    	return false;
    	} else {
    		alert("<spring:message code="result.save.fail"></spring:message>");     // 저장에 실패하였습니다.
    		return false;
    	}
    }
	
	function emplChkAfter(data) {
		if( data.result[0].emplYn == "Y" ) {
			emplYn = true ;
			alert("확인 되었습니다");
			return false;
		}
		else {
			emplYn = false;
			alert("임직원이 아닙니다.\n다시 확인해주세요.");
			return false;
		}
	}
	
	function totalMoney() {
		var sHour = $("#elstUseBgntm option:checked").val();
		var eHour = $("#elstUseEndtm option:checked").val();
		var sDate = $("#elstUseBgnde").val();
		
		if( sHour != "" && eHour != "" && sDate != "" ) {
			diffCnt();
		}
	}
	
	/***
	* ##############################
	* 감면대상 
	* ##############################
	***/
	function salePrice( rdcxptSeResn , totalPrice ) {
		var result = totalPrice;
		if( rdcxptSeResn == "01" ) {
			//사회복지기관이면 80프로 할인
			result = parseFloat( totalPrice * 0.2 );
		} else if( rdcxptSeResn == "02" ) {
			//입주사일경우 50프로 할인
			result = parseFloat( totalPrice * 0.5 ); 
		} else if( rdcxptSeResn == "03" ) {
			//모금회 임직원은 0원
			result = totalPrice * 0;
		}
		return result;
	}
	
	
	/***
	* ##############################
	* 대여일에 주말이 포함된다면 제외해줌
	* ##############################
	***/
	function diffCnt() {
		var parameter = {"sDate":$("#elstUseBgnde").val() ,"eDate": $("#elstUseBgnde").val() };
		gf_send( url + "/diffList.do", parameter );
	}
	
	function diffListAfter( data ) {
		var price = parseInt( getTotalTimeAndMoney( data ) );
		if( !isNaN(price) ) {
			$("#hrhtTxt").text( comma( price ) + "원" );
		}
	}
	
	/***
	* ##############################
	* 시간으로 강당 대여금액 계산
	* ##############################
	***/
	function getTotalTimeAndMoney( jsonData ) {
		var diff = parseInt ( jsonData.result.length - 1 );
		var tot,sum,totalTime;
		var elstNm = $("#elstCode option:checked").text();
	 	var sHour = $("#elstUseBgntm option:checked").val();
		var eHour = $("#elstUseEndtm option:checked").val();
		
		var rdcxptSeResn = $(':radio[name="rdcxptSeResn"]:checked').val();	//감면대상여부
		
		//대여기간 시작일과 종료일이 같을 경우 처리	
		var tot = parseInt ( eHour - sHour );
		//대강당 일 경우 처리 
		if( elstNm == "지하1층 강당" ) {
			tot = timeMinus( tot );
			totalPrice = auditorium[tot];
			totalPrice = salePrice(rdcxptSeResn , totalPrice );
			if( rdcxptSeResn != "03" ) {
				totalPrice = sumBimPrice( totalPrice , auditoriumBim , tot , elstNm);
			}
		} else if( elstNm == "지하2층 세미나실 I" || elstNm == "강의실A" || elstNm == "강의실B" ) {
			totalPrice = lectureRoom * tot;
			totalPrice = salePrice(rdcxptSeResn , totalPrice );
			if( rdcxptSeResn != "03" ) {
				totalPrice = sumBimPrice( totalPrice , lectureBim , tot , elstNm);
			}
		} else if( elstNm == "강의실C" ) {
			totalPrice = lectureRoomC * tot;
			totalPrice = salePrice(rdcxptSeResn , totalPrice );
			if( rdcxptSeResn != "03" ) {
				totalPrice = sumBimPrice( totalPrice , lectureBim , tot , elstNm);
			}
		} else if ( elstNm == "강의실D" ) {
			//빔 사용 안됨
			totalPrice = lectureRoomD * tot;
			totalPrice = salePrice(rdcxptSeResn , totalPrice );
		}
		totalTime = tot;
		$("#frm > input[name=elstTotUsetm]").val( totalTime );
		$("#frm > input[name=bimTotUsetm]").val( totalTime );
		$("#bimTotUsetm").val( "" );
		if( $(':radio[name="bimUseAt"]:checked').val() == "Y" ) {
			$("#bimTotUsetm").val( totalTime );
		}
		
		//부가세 계산 
		totalPrice = ( totalPrice * 1.1 );
		return totalPrice;
	}
	
	/***
	*##############################
	*빔 사용시 빔사용료 계산
	*##############################
	***/
	function sumBimPrice( totalPrice , bimPrice , tot , elstNm ) {
		if( $(':radio[name="bimUseAt"]:checked').val() == "Y" ) {
			if( elstNm == "지하1층 강당" ) {
				totalPrice = totalPrice + bimPrice; 
			} else {
				totalPrice = totalPrice + ( bimPrice * tot );
			}
		}
		return totalPrice;
	}
	
	function timeMinus( str ) {
		var result = str;
		if( str == 10 ) result = 9;
		return result;
	}
	
	function makeFormData() {
		
		var phone = $("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val();
	    var telNo = $("#tel1").val() + "-" + $("#tel2").val() + "-" + $("#tel3").val();
	    var fax = $("#fax1").val() + "-" + $("#fax2").val() + "-" + $("#fax3").val();
		var email = $("#email1").val() + "@" + $("#email2").val();				
		var elstCode = $("#elstCode option:checked").attr("elstSe");
	    var sHour = $("#elstUseBgntm option:checked").val();
		var eHour = $("#elstUseEndtm option:checked").val();
		
		$("#frm > input[name=reqstInsttMbtlnum]").val( phone );
		$("#frm > input[name=reqstInsttTelno]").val( telNo );
		$("#frm > input[name=reqstInsttFax]").val( fax );
		$("#frm > input[name=reqstInsttEmail]").val( email );
		    
		$("#frm > input[name=elstUseBgnde]").val( $("#elstUseBgnde").val() );
		$("#frm > input[name=elstUseEndde]").val( $("#elstUseBgnde").val() );
		$("#frm > input[name=elstUseBgntm]").val( sHour );
		$("#frm > input[name=elstUseEndtm]").val( eHour );
		
	    if( $(':radio[name="bimUseAt"]:checked').val() == "Y" ) {
	    	$("#bimTotUsetm").val( $("#frm > input[name=elstTotUsetm]").val() );
	    	$("#frm > input[name=bimUseBgnde]").val( $("#elstUseBgnde").val() );
		    $("#frm > input[name=bimUseEndde]").val( $("#elstUseBgnde").val() );
		    $("#frm > input[name=bimUseBgntm]").val( sHour);
		    $("#frm > input[name=bimUseEndtm]").val( eHour);
	    }
    	$("#frm > input[name=bimUseAt]").val( $(':radio[name="bimUseAt"]:checked').val() );
	    $("#frm > input[name=estmtAmount]").val( parseInt( totalPrice )  );
	    $("#frm > input[name=dcsnAmount]").val( parseInt( totalPrice ) );
	    $("#frm > input[name=elstNm]").val( $("#elstCode option:checked").text() );
	}	
	
	function radioEvent(str){
		if( str == 'bimUseAt' ) {
			var value = $(':radio[name="bimUseAt"]:checked').val();
			var elstNm = $("#elstCode option:checked").text();
			if( elstNm == "지하1층 강당" ) {
				$("input:radio[name='bimUseAt']:radio[value='Y']").prop("checked",true);
				return false;
			}
			if( elstNm == "강의실D" ) {
				alert("빔을 사용할 수 없습니다.");
				$("input:radio[name='bimUseAt']:radio[value='N']").prop("checked",true);
				return false;
			}
			
			if( value == "N" ) {
				$("#bimTotUsetm").val("");
			}
			//빔 신청시 
			if( value == "Y" ) {
				$("#bimTotUsetm").val( $("#frm > input[name=elstTotUsetm]").val() );
			}
			totalMoney();
			
		} else {
			var value = $(':radio[name="rdcxptSeResn"]:checked').val();
			if( value == "00" ) {
				$("#infoDiv").hide();
				$("#bizDiv").show();	
			}
			else if( value == "01" || value == "02" ) {
				$("#bizDiv").show();	
				$("#infoDiv").hide();
			}
			else if( value == "03" ) {
				$("#bizDiv").hide();	
				$("#infoDiv").show();
			}
			totalMoney();
			$(".list-fileupload > li").remove();	//첨부파일 삭제
			$("#txt").val("");
		}
	}
	
	function keyEvent() {
		//숫자만 입력가능
		$("input:text[numberOnly]").on("keyup keydown", function() {
            $(this).val($(this).val().replace(/[^0-9]/g,""));
        });		
	}
	
	function makeSelectBox() {
		var parameter = {};
		gf_send( url + "/selectElstList.do", parameter );
	}
	
	function selectElstListAfter(data) {
		var el = '';
		$(data.elstList).each( function( i,item ) {
			el += "<option value='"+item.elstCode+"' elstSe='"+item.elstSe+"'>" + item.elstNm + "</option>";
		});
		$("#elstCode , #elstCode2 , #elstCode3").html(el);
		_common.makeSelectLayout();	//select box 
	}
	
	function validator() {
		if( $.trim( $("#reqstInsttNm").val() ).length == 0 ) {
    		alert("신청기관명을 입력해주세요");
    		$("#reqstInsttNm").focus();
    		return false;
    	}
		if( $.trim( $("#tel1").val() ).length == 0 ) {
    		alert("연락처를 입력해주세요");
    		$("#tel1").focus();
    		return false;
    	}
		if( $.trim( $("#tel2").val() ).length == 0 ) {
    		alert("연락처를 입력해주세요");
    		$("#tel2").focus();
    		return false;
    	}
		if( $.trim( $("#tel3").val() ).length == 0 ) {
    		alert("연락처를 입력해주세요");
    		$("#tel3").focus();
    		return false;
    	}
		if( $.trim( $("#phone1").val() ).length == 0 ) {
    		alert("휴대폰번호를 입력해주세요");
    		$("#phone1").focus();
    		return false;
    	}
		if( $.trim( $("#phone2").val() ).length == 0 ) {
			alert("휴대폰번호를 입력해주세요");
    		$("#phone2").focus();
    		return false;
    	}
		if( $.trim( $("#phone3").val() ).length == 0 ) {
			alert("휴대폰번호를 입력해주세요");
    		$("#phone3").focus();
    		return false;
    	}
		
		if( $.trim( $("#email1").val() ).length == 0 ) {
			alert("이메일을 입력해주세요");
    		$("#email1").focus();
    		return false;
    	}
		if( $.trim( $("#email2").val() ).length == 0 ) {
			alert("이메일을 입력해주세요");
    		$("#email2").focus();
    		return false;
    	}
		if( $.trim( $("#eventNm").val() ).length == 0 ) {
			alert("행사명을 입력해주세요");
    		$("#eventNm").focus();
    		return false;
    	}
		if( $.trim( $("#eventCn").val() ).length == 0 ) {
			alert("행사내용을 입력해주세요");
    		$("#eventCn").focus();
    		return false;
    	}
		
		var date1 = new Date($("#elstUseBgnde").datepicker("getDate"));
		
		if( $.trim( $("#elstUseBgnde").val() ).length == 0 ) {
			alert("대여시작일을 선택해주세요");
			$("#hrhtTxt").text("");
    		$("#elstUseBgnde").focus();
    		return false;
    	}
		if( $("#elstUseBgntm option:checked").val() == "" ) {
			alert("대여시작 시간을 선택해주세요");
			$("#hrhtTxt").text("");
    		$("#elstUseBgntm").focus();
    		return false;
		}
		if( $("#elstUseEndtm option:checked").val() == "" ) {
			alert("대여종료 시간을 선택해주세요");
			$("#hrhtTxt").text("");
    		$("#elstUseEndtm").focus();
    		return false;
		}
		
		if( parseInt( $("#elstUseBgntm option:checked").val() ) >  parseInt( $("#elstUseEndtm option:checked").val() ) ) {
			alert("대여시간을 확인해주세요");
			$("#hrhtTxt").text("");
			$("#elstUseBgntm").focus();
			return false;
		}
		
		var rdcxptSeResn = $(':radio[name="rdcxptSeResn"]:checked').val();	//감면대상여부
		
		if( rdcxptSeResn == "01" || rdcxptSeResn == "02" ) {
			if( $.trim( $("#txt").val() ).length == 0) {
				alert("사업자등록증을 업로드 해주세요");
				$("#txt").focus();
				return false;
			}
		} else if( rdcxptSeResn == "03" ) {
			if( !emplYn ) {
				alert("임직원 확인해주세요.");
				$("#emplId").focus();
				return false;
			}
		}
		
		if(!$("#agree1").is(':checked')){
    		alert("시설대여 지침 지침 확인해주세요");
    		$("#agree1").focus();
    		return false;
    	} 
		if( $.trim( $("#userPassword").val() ).length == 0 ) {
    		alert("비밀번호를 입력해주세요");
    		$("#userPassword").focus();
    		return false;
    	} 
		return true;
	}
</script>



<div class="sub-visual visual_f03">
	<div class="sub-title-area">
		<h2 class="heading-title-a">대관신청</h2>
		<p class="title-sub-txt">사랑의열매는 나눔문화 발전을 위해 항상 열려있습니다.</p>
	</div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<form name="frm" id="frm" method="post" enctype="multipart/form-data" action="<c:url value='/cm/rentreqst/insert.do' />">
<input type=hidden name="reqstInsttMbtlnum" />		<!-- 휴대폰번호 -->
<input type=hidden name="reqstInsttTelno" />		<!-- 전화번호 -->
<input type=hidden name="reqstInsttFax" />			<!-- 팩스번호 -->
<input type=hidden name="reqstInsttEmail" />		<!-- 이메일 -->
<input type=hidden name="elstUseBgntm" />			<!-- 시작시간 -->
<input type=hidden name="elstUseEndtm" />			<!-- 종료시간 -->
<input type=hidden name="elstUseBgnde" />			<!-- 시작일 -->
<input type=hidden name="elstUseEndde" />			<!-- 종료일 -->
<input type=hidden name="elstTotUsetm" />			<!-- 총사용시간 -->
<input type=hidden name="bimUseBgnde" />			<!-- 빔사용 시작일 -->
<input type=hidden name="bimUseEndde" />			<!-- 빔사용 종료일 -->
<input type=hidden name="bimUseBgntm" />			<!-- 빔사용 시작시간 -->
<input type=hidden name="bimUseEndtm" />			<!-- 빔사용 종료시간 -->
<input type=hidden name="bimTotUsetm" />			<!-- 빔 총사용시간 -->
<input type=hidden name="estmtAmount" />			<!-- 견적금액 -->
<input type=hidden name="dcsnAmount" />				<!-- 확정금액 -->
<input type=hidden name="progrsStep" value="01" />	<!-- 진행상태 -->
<input type=hidden name="elstNm" value="" />	
<input type=hidden name="erntSn" value="" />	
		    
<main class="base-main" id="baseMain">
	<div class="contents-area">
		<div class="contents-hd">
			<h3><strong>대관신청</strong><span>나눔문화발전을 위한 '행복한 터전'이 되고자 합니다.</b></span></h3>
			<div class="contents-menu-nav">
				<button type="button" class="prev-menu">기관방문 신청</button>
				<button type="button" class="next-menu">티켓 신청</button>
			</div>
		</div>

		<div class="seo-box">

			<div class="ui-tab ui-tab-type2 col-3 contents-tab" id="uiTabAPPL08_1">
				<div class="ui-tab-btns" btn-id="uiTabAPPL08_1">
					<button type="button" class="ui-tab-btn"><i>신청안내</i></button>
					<button type="button" class="ui-tab-btn"><i>예약현황</i></button>
					<button type="button" class="ui-tab-btn"><i>예약신청</i></button>
				</div>
				<div class="ui-tab-pnls" pnl-id="uiTabAPPL08_1">
					<section class="ui-tab-pnl">
						<h1 class="hide">신청안내</h1>
						<div class="tab-contents">
										<div class="coronation-info">
											<div class="img-with-txt">
												<div class="img-area"><img src="/common/img/contents/coronation_01.jpg" alt=""></div>
												<div class="text-area">
													<h4 class="title-heading_c">강당 (Lecture Room)</h4>
													<p class="coronation-txt">100평 규모의 강당은 각종 학술 심포지움과 국제회의, 세미나를 비롯하여 교육, 음악행사 등 다양한 이벤트를 연출</p>
													<dl class="coronation-dl">
														<dt class="coronation-title">위치</dt>
														<dd class="coronation-content">사랑의 열매회관 지하 1층</dd>
													</dl>
													<dl class="coronation-dl">
														<dt class="coronation-title">설비</dt>
														<dd class="coronation-content">첨단 Audio Control Mixer와 Speaker 및 Projector 등이 설치되어 양질의 A/V System 을 구현하여, 최신 사무용 기자재의 사용으로 쾌적하고 편안한 분위기를 연출합니다.</dd>
													</dl>
													<dl class="coronation-dl">
														<dt class="coronation-title">좌석</dt>
														<dd class="coronation-content">총 110석</dd>
													</dl>
												</div>
											</div>
											<div class="img-with-txt">
												<div class="img-area"><img src="/common/img/contents/coronation_02.jpg" alt=""></div>
												<div class="text-area">
													<h4 class="title-heading_c">세미나실 I (Seminar Room I)</h4>
													<p class="coronation-txt">25평 규모의 세미나실I 은 아늑한 인테리어 분위기에 워크샵, 세미나, 강좌 등 각종 회의, 강연을 위한 최적의 공간입니다.</p>
													<dl class="coronation-dl">
														<dt class="coronation-title">위치</dt>
														<dd class="coronation-content">사랑의 열매회관 지하 2층</dd>
													</dl>
													<dl class="coronation-dl">
														<dt class="coronation-title">설비</dt>
														<dd class="coronation-content">첨단 Audio Control Mixer와 Speaker 및 Projector 등이 설치되어 양질의 A/V System이 설치되어 있습니다.</dd>
													</dl>
													<dl class="coronation-dl">
														<dt class="coronation-title">좌석</dt>
														<dd class="coronation-content">총 44석</dd>
													</dl>
												</div>
											</div>
											<div class="img-with-txt">
												<div class="img-area"><img src="/common/img/contents/coronation_03.jpg" alt=""></div>
												<div class="text-area">
													<h4 class="title-heading_c">강의실 A (Class Room A)</h4>
													<dl class="coronation-dl">
														<dt class="coronation-title">위치</dt>
														<dd class="coronation-content">나눔문화센터 B1층</dd>
													</dl>
													<dl class="coronation-dl">
														<dt class="coronation-title">설비</dt>
														<dd class="coronation-content">빔프로젝터, 음향장비(마이크)</dd>
													</dl>
													<dl class="coronation-dl">
														<dt class="coronation-title">좌석</dt>
														<dd class="coronation-content">총 40석</dd>
													</dl>
												</div>
											</div>
											<div class="img-with-txt">
												<div class="img-area"><img src="/common/img/contents/coronation_04.jpg" alt=""></div>
												<div class="text-area">
													<h4 class="title-heading_c">강의실 B (Class Room B)</h4>
													<dl class="coronation-dl">
														<dt class="coronation-title">위치</dt>
														<dd class="coronation-content">나눔문화센터 B1층</dd>
													</dl>
													<dl class="coronation-dl">
														<dt class="coronation-title">설비</dt>
														<dd class="coronation-content">빔프로젝터, 음향장비(마이크)</dd>
													</dl>
													<dl class="coronation-dl">
														<dt class="coronation-title">좌석</dt>
														<dd class="coronation-content">총 40석</dd>
													</dl>
												</div>
											</div>
											<div class="img-with-txt">
												<div class="img-area"><img src="/common/img/contents/coronation_05.jpg" alt=""></div>
												<div class="text-area">
													<h4 class="title-heading_c">강의실 C (Class Room C)</h4>
													<dl class="coronation-dl">
														<dt class="coronation-title">위치</dt>
														<dd class="coronation-content">나눔문화센터 B1층</dd>
													</dl>
													<dl class="coronation-dl">
														<dt class="coronation-title">설비</dt>
														<dd class="coronation-content">빔프로젝터</dd>
													</dl>
													<dl class="coronation-dl">
														<dt class="coronation-title">좌석</dt>
														<dd class="coronation-content">총 18석</dd>
													</dl>
												</div>
											</div>
											<div class="img-with-txt">
												<div class="img-area"><img src="/common/img/contents/coronation_06.jpg" alt=""></div>
												<div class="text-area">
													<h4 class="title-heading_c">강의실 D (Class Room D)</h4>
													<dl class="coronation-dl">
														<dt class="coronation-title">위치</dt>
														<dd class="coronation-content">나눔문화센터 B1층</dd>
													</dl>
													<dl class="coronation-dl">
														<dt class="coronation-title">설비</dt>
														<dd class="coronation-content"> 모니터TV</dd>
													</dl>
													<dl class="coronation-dl">
														<dt class="coronation-title">좌석</dt>
														<dd class="coronation-content">총 10석</dd>
													</dl>
												</div>
											</div>
										</div>
									</div>
									<div class="text-with-btn">
										<p class="text-with-col text-col">사회복지공동모금회회관 시설대여지침 2019년 5월 24일부터 개정되었습니다. <br>새로운 '시설대여지침'을 자세히 읽어보신 후 신청하여 주시기 바랍니다.</p>
										<div class="text-with-col btn-col">
											<a href="#" class="btn-base-bline small" onclick="gf_genFileExport(this);">사회복지공동모금회회관 시설대여지침	</a>
											<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}' escapeXml='false' />" />
											<input id="phycFileNm" name="phycFileNm" type="hidden" value="회관시설대여지침개정전문_190524.hwp" />
	         								<input id="logcFileNm" name="logcFileNm" type="hidden" value="회관시설대여지침개정전문_190524.hwp" />
										</div>
									</div>
									<div class="btn-area">
										<a href="javascript:openRent();" class="btn-base-imp">대관예약 신청하기 </a>
									</div>
									<h4 class="table-tit">대관예약 신청 방법</h4>
									<div class="donation-article">
										<dl class="dl-list">
											<dt>01. 예약방법 </dt>
											<dd>온라인 신청 : 온라인 신청은 회원가입 후 신청가능하며, 법인회원인 경우 사회복지공동모금회의 승인 후 이 점 양지하시기 바랍니다. </dd>

											<dt>02. 대관신청서</dt>
											<dd>온라인 신청 : 온라인 신청 절차의 시설사용신청서를 입력하시면 됩니다.</dd>

											<dt>03. 대관승인</dt>
											<dd>모금회는 시설사용신청서를 접수한 후 이를 심사하여 접수한 날로부터 3일 이내에 그 승인 여부를 신청인에게 통지합니다. <br>단, 특별한 경우 사용자의 동의를 얻어 사용기간 및 시간 또는 부속설비의 범위를 조정할 수 있습니다.</dd>

											<dt>04. 대관료 안내 </dt>
											<dd>모금회로부터 시설사용 승인을 받은 사용자는 시설사용 승인일로부터 7일 이내에 사용요금을 납부하여야 합니다.<br>
												다만, 시설사용 승인일로부터 사용예정일(1일 이상 사용하는 경우에는 사용기간 개시일을 말한다.)까지의 기간이 7일 이내인 경우에는 모금회가 지정한 기일까지 사용요금을 납부하여야 합니다.</dd>
										</dl>
									</div>
									<div class="coronation-box mg-t-ml">
                                        <div class="coronation-box_tb">
                                            <div class="coronation-box-col">입금계좌 : 신한은행 / 140-007-815803 / 사회복지법인 사회복지공동모금회</div>
                                            <div class="coronation-box-col">대관관련 문의처 : <span class="ico-tel"> 02-6262-3011</span><span class="ico-email">hekim@chest.or.kr</span></div>
                                        </div>
                                        <p class="coronation-box-tit">※ 사용요금 면제 또는 감면</p>
                                        <ul class="coronation-list">
                                            <li class="coronation-list-item">1. 모금회가 후원하거나 공동으로 주관,주최하는 행사에 대하여는 사용요금을 면제 또는 감면할 수 있음</li>
                                            <li class="coronation-list-item">2. 사용자가 사회복지관련 기관,단체 또는 시설이거나 시설사용의 목적이 사회복지사업 기타 사회복지활동을 위한 것인 경우에는 사용요금(부속설비 사용요금 제외.이하 제 3항에서도 같다)의 100분의 80 감면할 수 있음</li>
                                            <li class="coronation-list-item">3. 사용자가 임대차계약에 의한 모금회 회관 임차인인 경우에는 사용요금의 100분의 50 감면할 수 있음</li>
                                        </ul>
									</div>
									<div class="title_wrap mg-t-m">
										<h4 class="title-heading_b">기본시설 (부가가치세 별도)</h4>
									</div>
									<div class="tb-type_d">
										<div class="wide-scroll">
											<table>
												<caption>기본시설 정보</caption>
												<colgroup>
													<col style="width:160px">
													<col style="width:150px">
													<col style="width:150px">
													<col>
												</colgroup>
												<thead>
												<tr>
													<th scope="col">시설명 / 구분</th>
													<th scope="col" colspan="2">기본금액</th>
													<th scope="col">비고</th>
												</tr>
												</thead>
												<tbody>
												<tr>
													<th scope="row" rowspan="2" class="sub_th">대강당<br>(110석)</th>
													<td colspan="2" class="use-time">오전 (08:00~12:00)<br><span class="point-color1">600,000 원</span></td>
													<td rowspan="2" class="use-info">
														<dl class="use-info-dl">
															<dt>1. 초과사용시간에 대한 사용요금 가산기준</dt>
															<dd>- 30분 이내 : 무료</dd>
															<dd>- 30분 초과 1시간 이내 : 기본금액의 100분의 20</dd>
															<dd>- 1시간 초과 3시간 이내 : 기본금액의 100분의 50</dd>
															<dd>- 3시간 초과 : 기본금액 전액 ※ 초과사용시간에는 준비 및 리허설 시간을 포함한다.</dd>
															<dd class="gray">※ 가산된 사용요금은 사용종료 후 지체없이 납부하여야한다.</dd>
															<dt>2. 현수막 설치규격</dt>
															<dd>- 중앙 : 가로 600㎝ x 세로 70㎝</dd>
															<dd>- 좌우 : 가로 88㎝ x 세로 218㎝</dd>
														</dl>
													</td>
												</tr>
												<tr>
													<td colspan="2" class="use-time no-line">오후 (13:00~18:00)<br><span class="point-color1">750,000 원</span></td>
												</tr>
												<tr>
													<th scope="row" class="sub_th">세미나실 </th>
													<td class="use-time">I (44석)</td>
													<td class="use-time no-line-l"><span class="point-color1">100,000 원</span></td>
													<td rowspan="5" class="use-info no-line-b">
														<dl class="use-info-dl">
															<dt>1. 사용요금 적용기준</dt>
															<dd>기본금액은 1시간당 단가이며, 1시간 미만의 초과사용분에 대하여도 1시간당 단가를 가산한다.</dd>
															<dd class="gray">※ 준비 및 리허설에 소요되는 30분 이하는 무료로 한다.</dd>
															<dd class="gray">※ 가산된 사용요금은 사용종료 후 지체없이 납부하여야 한다.</dd>
															<dt>2. 현수막 설치규격</dt>
															<dd>- 중앙 : 가로 400㎝ x 세로 70㎝</dd>
															<dd>- 좌우 : 가로 450㎝ x 세로 70㎝</dd>
														</dl>
													</td>
												</tr>
												<tr>
													<th scope="row" rowspan="4" class="sub_th no-line-b">강의실</th>
													<td class="use-time">A (40석)</td>
													<td class="use-time no-line no-line-l"><span class="point-color1">100,000 원</span></td>
												</tr>
												<tr>
													<td class="use-time">B (40석)</td>
													<td class="use-time no-line no-line-l"><span class="point-color1">100,000 원</span></td>
												</tr>
												<tr>
													<td class="use-time">C (18석)</td>
													<td class="use-time no-line no-line-l"><span class="point-color1">60,000원</span></td>
												</tr>
												<tr>
													<td class="use-time">D (10석)</td>
													<td class="use-time no-line no-line-l"><span class="point-color1">40,000원</span></td>
												</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="title_wrap mg-t-m">
										<h4 class="title-heading_b">부속시설 (부가가치세 별도)</h4>
									</div>
									<div class="tb-type_d">
										<div class="wide-scroll">
											<table>
												<caption>기본시설 정보</caption>
												<colgroup>
													<col style="width:160px">
													<col style="width:150px">
													<col style="width:150px">
													<col style="width:150px">
													<col>
												</colgroup>
												<thead>
												<tr>
													<th scope="col">설비명 / 구분</th>
													<th scope="col">시설</th>
													<th scope="col">수량</th>
													<th scope="col">금액</th>
													<th scope="col">비고</th>
												</tr>
												</thead>
												<tbody>
												<tr>
													<th scope="row" rowspan="3" class="sub_th">빔프로젝터</th>
													<td class="use-time">대강당</td>
													<td class="use-time">1회</td>
													<td class="use-time"><span class="point-color1">100,000 원</span></td>
													<td class="use-info">사용일정에 상관없이 1회 단가 적용 </td>
												</tr>
												<tr>
													<td class="use-time">세미나실Ⅰ</td>
													<td rowspan="2" class="use-time">1시간</td>
													<td rowspan="2" class="use-time"><span class="point-color1">10,000 원</span></td>
													<td class="use-info">1시간 미만 사용 시에도 1시간 단가 적용  </td>
												</tr>
												<tr>
													<td class="use-time">강의실 A ~ C</td>
													<td class="use-info">1시간 미만 사용 시에도 1시간 단가 적용</td>
												</tr>
												</tbody>
											</table>
										</div>
									</div>
					</section>

					<!-- SB_CCK_APPL_09 : 예약현황 -->
					<section class="ui-tab-pnl">
						<h1 class="hide">예약현황</h1>
						<div class="tab-contents">

							<!-- 예약현황 -->
							<div id="reseverLayout0">
								<h2 class="table-tit">예약현황</h2>
								<div class="month-select">
									<button type="button" class="prev-base" id="btnPre"><span class="hide">이전</span></button>
									<strong id="yyyyMm"></strong>
									<button type="button" class="next-base" id="btnNext"><span class="hide">다음</span></button>
								</div>

								<div class="tb-type_a mb-type">
									<table>
										<colgroup>
											<col class="col-xs">
											<col class="col-auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">
													<label for="#">대여희망시설</label>
												</th>
												<td>
													<div class="ui-select form-w02">
														<select class="sel_type" id="elstCode2" title="대여희망시설"></select>
													</div>
												</td>
												<td>
													<b class="reserve-on"><span class="hide">취소</span></b> 대여가능
													&nbsp;&nbsp;&nbsp;&nbsp;
													<b class="reserve-off"><span class="hide">취소</span></b> 대여불가능
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								
								<!-- 탭 -->
								<div class="sort-tab mgt-xs mgb-xs" id="tabDiv"></div>
								<!-- 탭 -->
								
								<div class="tb-type_b type-appl08-t2">
												<div class="wide-scroll">
													<table>
														<caption>예약 정보</caption>
														<col class="col-xxs">
														<col class="col-auto">
														<thead>
															<tr>
																<th scope="col">요일</th>
																<th scope="col">08시</th>
																<th scope="col">09시</th>
																<th scope="col">10시</th>
																<th scope="col">11시</th>
																<th scope="col">12시</th>
																<th scope="col">13시</th>
																<th scope="col">14시</th>
																<th scope="col">15시</th>
																<th scope="col">16시</th>
																<th scope="col">17시</th>
																<th scope="col">18시</th>
															</tr>
														</thead>
														<tbody id="reservationStatusTable"></tbody>
													</table>
												</div>
											</div>
								
								<h2 class="table-tit">예약상세</h2>
								<div class="month-select">
									<button type="button" class="prev-base" id="btnPreBottom"><span class="hide">이전</span></button>
									<strong id="yyyyMmBottom"></strong>
									<button type="button" class="next-base" id="btnNextBottom"><span class="hide">다음</span></button>
								</div>
								<div class="tb-type_b type-appl08-t2-2">
									<div class="wide-scroll">
										<table>
											<caption>신청내역 조회 정보</caption>
											<col class="n1">
											<col class="n2">
											<col class="n3">
											<col class="n4">
											<col class="n5">
											<col class="n6">
											<col class="n7">
											<thead>
												<tr>
													<th scope="col">신청등록일자</th>
													<th scope="col">예약자명</th>
													<th scope="col">대상</th>
													<th scope="col">시작일</th>
													<th scope="col">종료일</th>
													<th scope="col">행사명</th>
													<th scope="col">상태</th>
												</tr>
											</thead>
											<tbody id="bottomDataList"></tbody>
										</table>
									</div>
								</div>

								<div class="btn-area">
									<button type="button" class="btn-base-imp" id="btnDetail">상세검색</button>
								</div>
							</div>
							<!-- //예약현황 -->
							
							<!-- 예약현황 검색 -->
							<div id="reseverLayout1" style="display:none;">
								<h2 class="table-tit">예약현황</h2>
								<div class="tb-type_a mb-type">
									<table id="searchArea">
										<colgroup>
											<col class="col-xs">
											<col class="col-auto">
										</colgroup>
										<tbody>
										<tr>
											<tr>
												<th scope="row">
													<label for="#">대여희망시설</label>
												</th>
												<td>
													<div class="ui-select form-w02">
														<select class="sel_type" id="elstCode3" title="대여희망시설"></select>
													</div>
												</td>
											</tr>
											<th>예약일자</th>
											<td>
												<div class="datepicker-wrap"> 
													<input type="text" class="inp-base" id="endDate" name="endDate" title="예약일자 시작일" placeholder="날짜선택">
													<span class="txt-mark">~</span>
													<input type="text" class="inp-base" id="startDate" name="startDate" title="예약일자 종료일" placeholder="날짜선택">
												</div>
												<div class="ui-togglebtn type-sum mgt-s">
													<button type="button" class="btn-base small" data-action="button" value=0>오늘</button>
													<button type="button" class="btn-base small" data-action="button" value=-1>어제</button>
													<button type="button" class="btn-base small" data-action="button" value=-3>3일간</button>
													<button type="button" class="btn-base small" data-action="button" value=-7>7일간</button>
													<button type="button" class="btn-base small" data-action="button" value=-10>10일간</button>
													<button type="button" class="btn-base small" data-action="button" value=-20>20일간</button>
													<button type="button" class="btn-base small" data-action="button" value=-30>30일간</button>
													<button type="button" class="btn-base small" data-action="clear">초기화</button>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">
												<label for="reqstInsttNm1">신청기관명</label>
											</th>
											<td>
												<input type="text" class="form-w01" id="reqstInsttNm1" name="reqstInsttNm1" title="신청기관명">
											</td>
										</tr>
										
										</tbody>
									</table>
								</div>
								<div class="btn-area">
									<button type="button" class="btn-base-imp" id="btnSearch">검색</button>
								</div>

								<h2 class="table-tit">예약상세현황</h2>
								<div class="tb-type_b type-appl08-t2-2">
									<div class="wide-scroll">
										<table id="dataGridList">
											<caption>예약상세현황 정보</caption>
											<col class="n1">
											<col class="n2">
											<col class="n3">
											<col class="n4">
											<col class="n5">
											<col class="n6">
											<col class="n7">
											<thead>
												<tr>
													<th scope="col">신청등록일자</th>
													<th scope="col">예약자명</th>
													<th scope="col">대상</th>
													<th scope="col">시작일</th>
													<th scope="col">종료일</th>
													<th scope="col">행사명</th>
													<th scope="col">상태</th>
												</tr>
											</thead>
											<tbody></tbody>
										</table>
									</div>
									<div id="dataGridPageNavi" class="paging-area"></div>
								</div>
							</div>
							<!-- //예약현황 검색 -->

						</div>
					</section>
					<!-- //SB_CCK_APPL_09 : 예약현황 -->

					<!-- SB_CCK_APPL_10 : 예약신청 -->
					<section class="ui-tab-pnl">
						<h1 class="hide">예약신청</h1>
						<div class="tab-contents">
							<!-- 191003 -->
							<h2 class="table-tit">신청정보</h2>
							<div class="tb-type_a mb-type">
								<table summary="신청정보">
									<caption>신청정보 설정입니다.</caption>
									<colgroup>
										<col class="col-xs">
										<col class="col-auto">
									</colgroup>
							
									<tbody>
									<tr>
										<th scope="row">
											<label for="reqstInsttNm">신청기관명</label>
										</th>
										<td><input type="text" class="form-w01" id="reqstInsttNm" name="reqstInsttNm" title="신청기관명"></td>
									</tr>
									<tr>
										<th scope="row">
											<label for="phone1">연락처</label>
										</th>
										<td>
											<div class="phone-area">
												<input type="text" class="inp-base" title="휴대폰 앞자리" id="tel1" numberOnly maxlength="3">
												<span class="txt-mark">-</span>
												<input type="text" class="inp-base" title="휴대폰 중간자리" id="tel2" numberOnly maxlength="4">
												<span class="txt-mark">-</span>
												<input type="text" class="inp-base" title="휴대폰 뒷자리" id="tel3" numberOnly maxlength="4">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<label for="tel1">휴대폰</label>
										</th>
										<td>
											<div class="phone-area">
												<input type="text" class="inp-base" title="연락처 앞자리" id="phone1" numberOnly maxlength="3">
												<span class="txt-mark">-</span>
												<input type="text" class="inp-base" title="연락처 중간자리" id="phone2" numberOnly  maxlength="4">
												<span class="txt-mark">-</span>
												<input type="text" class="inp-base" title="연락처 뒷자리" id="phone3" numberOnly  maxlength="4">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<label for="email1">팩스</label>
										</th>
										<td>
											<div class="phone-area">
												<input type="text" class="inp-base" title="팩스 앞자리" id="fax1" numberOnly maxlength="3">
												<span class="txt-mark">-</span>
												<input type="text" class="inp-base" title="팩스 중간자리" id="fax2" numberOnly maxlength="4">
												<span class="txt-mark">-</span>
												<input type="text" class="inp-base" title="팩스 뒷자리" id="fax3" numberOnly maxlength="4">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<label for="email1">기관이메일</label>
										</th>
										<td>
											<div class="email-area">
												<input type="text" class="inp-base" title="이메일 아이디"  id="email1">
												<span class="email-ico">@</span>
												<input type="text" class="inp-base" title="이메일 주소" id="email2">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<label for="eventNm">행사명</label>
										</th>
										<td><input type="text" class="form-w01" id="eventNm" name="eventNm" title="행사명"></td>
									</tr>
									<tr>
										<th scope="row">
											<label for="eventCn">행사내용</label>
										</th>
										<td><input type="text" class="form-w03" id="eventCn" name="eventCn" title="행사내용"></td>
									</tr>
									<tr>
										<th scope="row">
											<label for="elstCode">대여희망시설</label>
										</th>
										<td>
											<div class="ui-select form-w02">
												<select class="sel_type" id="elstCode" name="elstCode" title="대여희망시설 선택"></select>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<label for="elstUseBgnde">대여기간</label>
										</th>
										<td>
											<div class="date2-area">
												<div class="datepicker-wrap"> 
													<input type="text" class="inp-base" id="elstUseBgnde" title="대여기간 시작일" placeholder="날짜선택" readonly="readonly">
												</div>
												<div class="ui-select form-w04">
													<select class="sel_type" id="elstUseBgntm" name="elstUseBgntm" title="대여시작시간 선택"></select>
												</div>
												<span class="txt-mark">부터</span>
												<div class="ui-select form-w04">
													<select class="sel_type" id="elstUseEndtm" name="elstUseEndtm" title="대여종료시간 선택"></select>
												</div>
												<span class="txt-mark">까지</span>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<label for="reservStatusTable">예약현황</label>
										</th>
										<td id="reservStatusTable"></td>
									</tr>
									
									<tr>
										<th scope="row">빔프로젝트신청</th>
										<td>
											<div class="rentaltime-area">
												<div class="radio-group mgr-s">
													<span class="radio">
														<input type="radio" name="bimUseAt" id="bimUseAt1" onclick="radioEvent('bimUseAt');" value="Y" >
														<label for="bimUseAt1"><span>Y</span></label>
													</span>
													<span class="radio">
														<input type="radio" name="bimUseAt" id="bimUseAt2" onclick="radioEvent('bimUseAt');" value="N" checked="checked" >
														<label for="bimUseAt2"><span>N</span></label>
													</span>
												</div>
												<span class="txt-mark">대여기간 중 총 사용 시간 :</span>
												<input type="text" class="inp-base" title="시간" id="bimTotUsetm" name="bimTotUsetm" readonly="readonly">
												<span class="txt-mark">시간</span>
											</div>
											
										</td>
									</tr>
									<tr>
										<th scope="row">감면대상여부</th>
										<td>
											<div class="radio-group mgr-s">
												<span class="radio">
													<input type="radio" name="rdcxptSeResn" id="rdcxptSeResn1" value="00" onclick="radioEvent();"  checked="checked">
													<label for="rdcxptSeResn1"><span>해당없음</span></label>
												</span>
												<span class="radio">
													<input type="radio" name="rdcxptSeResn" id="rdcxptSeResn2" value="01" onclick="radioEvent();">
													<label for="rdcxptSeResn2"><span>감면대상(사회복지기관)</span></label>
												</span>
												<span class="radio">
													<input type="radio" name="rdcxptSeResn" id="rdcxptSeResn3" value="02" onclick="radioEvent();">
													<label for="rdcxptSeResn3"><span>감면대상(입주사)</span></label>
												</span>
												<span class="radio">
													<input type="radio" name="rdcxptSeResn" id="rdcxptSeResn4" value="03" onclick="radioEvent();">
													<label for="rdcxptSeResn4"><span>감면대상(모금회임직원)</span></label>
												</span>	
											</div>
											<div class="mgt-xs type-inpbtn" id="bizDiv">
												<label for="txt" class="txt-mark">사업자등록증</label>
												<input type="text" class="inp-base" title="사업자등록증 파일찾기" id="txt" readonly="readonly">
												<input type="file" size="30" id="file" name="attachFile1" style="display:none;" onchange="fileOnchangeEvent(this);" />
												<button type="button" class="btn-base small mgl-xxs" onclick="$('#file').click();">찾아보기</button>
											</div>
											<div class="mgt-xs type-inpbtn" id="infoDiv">
												<label for="appl08_i12" class="txt-mark">아이디</label>
												<input type="text" class="inp-base" title="아이디" id="emplId" >
												<label for="appl08_i13" class="txt-mark">비밀번호</label>
												<input type="password" class="inp-base" title="비밀번호" id="emplPass">
												<button type="button" class="btn-base-imp small mgl-xxs" id="btnEmplChk">임직원확인</button>
											</div>
											<ul class="list-fileupload"></ul>			
											
										</td>
									</tr>
									<tr>
										<th scope="row">사용금액</th>
										<td id="hrhtTxt"></td>
									</tr>
									<tr>
										<th scope="row">시설대여지침 확인</th>
										<td>
											<div class="btncheck-area">
												<a href="#" class="btn-base-bline small form-w02" onclick="gf_genFileExport(this);">
												사회복지공동모금회 시설대여 지침
												</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="회관시설대여지침개정전문_190524.hwp" />
         										<input id="logcFileNm" name="logcFileNm" type="hidden" value="회관시설대여지침개정전문_190524.hwp" />
												<span class="checkbox mgl-xxs">
													<input type="checkbox" id="agree1">
													<label for="agree1"><span>지침확인</span></label>
												</span>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<label for="userPassword">비밀번호</label>
										</th>
										<td>
											<input type="password" class="form-w02" id="userPassword" name="userPassword" title="비밀번호" maxlength="6" numberOnly>
											<span class="txt-mark">* 신청확인 및 수정시사용될 비밀번호</span>
										
										</td>
									</tr>
									</tbody>
								</table>
							</div>

							<div class="btn-area">
								<button type="button" class="btn-base-imp" id="btnInsert">사용신청</button>
<!-- 								<button type="button" class="btn-base">사용취소신청</button> -->
							</div>
						</div>
					</section>
					<!-- //SB_CCK_APPL_10 : 예약신청 -->
				</div>
			</div>
		</div>

	</div>
</main>
</form> 

<!-- /.modal -->
<%@ include file="popup.jsp"%>
<!-- .modal //-->

<script>

function modifyMovePage() {
	var param = {
		"erntSn":_erntSn
		,"password": $("#popupPassword").val()
	};
    gf_send("<c:url value='" + url + "/passwordCheck.do' />", param );
	
}

function passwordCheckAfter(data) {
	var result = data.detail;
	if( result == "success" ) {
		removePopup();
		//페이지이동
		$plugins.uiTab({
			id:'uiTabAPPL08_1',
			current:2
		});
		var param = {
				"erntSn":_erntSn
			};
		gf_send("<c:url value='" + url + "/selectDetailModify.do' />", param );
		
	} else {
		alert("비밀번호를 정확히 입력해주세요");
		return false;
	}
}

function selectDetailModifyAfter(data) {
	console.log( data );
	keyEvent();	//숫자만 입력가능
	makeSelectBox();
	$("#btnInsert").text("수정");
	var item = data.detail;
	$("#frm #reqstInsttNm").val( item.reqstInsttNm );		//신청기관명
	var reqstInsttTelno = item.reqstInsttTelno;
	reqstInsttTelno = reqstInsttTelno.split("-");		//연락처
	$("#frm #tel1").val( reqstInsttTelno[0] );
	$("#frm #tel2").val( reqstInsttTelno[1] );
	$("#frm #tel3").val( reqstInsttTelno[2] );
	
	var reqstInsttMbtlnum = item.reqstInsttMbtlnum;		//휴대폰
	reqstInsttMbtlnum = reqstInsttMbtlnum.split("-");
	$("#frm #phone1").val( reqstInsttMbtlnum[0] );
	$("#frm #phone2").val( reqstInsttMbtlnum[1] );
	$("#frm #phone3").val( reqstInsttMbtlnum[2] );
	
	var reqstInsttFax = item.reqstInsttFax;				//팩스
	reqstInsttFax = reqstInsttFax.split("-");
	$("#frm #fax1").val( reqstInsttFax[0] );
	$("#frm #fax2").val( reqstInsttFax[1] );
	$("#frm #fax3").val( reqstInsttFax[2] );
	
	var reqstInsttEmail = item.reqstInsttEmail;			//이메일
	reqstInsttEmail = reqstInsttEmail.split("@");
	$("#frm #email1").val( reqstInsttEmail[0]);
	$("#frm #email2").val( reqstInsttEmail[1]);
	
	$("#frm #eventNm").val( item.eventNm );					//행사명
	$("#frm #eventCn").val( item.eventCn );					//행사내용
	
	$("select[name='elstCode'] option[value='"+ $.trim( item.elstCode ) +"']").prop("selected",true);	//대여희망시설
	$("#elstCode").trigger("change");
	
	$("#frm #elstUseBgnde").val(item.elstUseBgnde);
	$("select[name='elstUseBgntm'] option[value='"+ item.elstUseBgntm +"']").prop("selected",true); 		//종료시간
	$("select[name='elstUseEndtm'] option[value='"+ item.elstUseEndtm +"']").prop("selected",true); 		//종료시간
	
	$("input:radio[name='bimUseAt']:radio[value='"+item.bimUseAt+"']").prop("checked",true);	//빔프로젝트
	if( item.bimUseAt == "Y" ) {
		$("#frm #bimTotUsetm").val( elstTotUsetm );	
	}
	radioEvent();
	
	$("input:radio[name='rdcxptSeResn']:radio[value='"+item.rdcxptSeResn+"']").prop("checked",true);	//감면대상여부
	if( item.rdcxptSeResn == "01" || item.rdcxptSeResn == "02" ) {
		$("#frm #txt").val(item.serverFileNm);
	}
	$("#frm #hrhtTxt").text( comma( item.estmtAmount ) + "원" );	
	$("#frm input[name=erntSn]").val( _erntSn );
	makeReserTable();
}


function fileOnchangeEvent( obj ) {
	var id = $(obj)[0].getAttribute("id");
	var file = $("#"+id).val();
	var f = file.lastIndexOf("\\");
	var e = file.lastIndexOf("\.");
	var fileName = file.substring(f+1,e);
	
	if(!file.match(/\.(jpg)$/i)){
		alert("사업자등록증은 jpg만 가능합니다.");
		$("#"+id).focus();
		return false;
	}
	$("#txt").val( fileName );
	el = '<li><span>' + fileName + '</span><button type="button" class="btn-del">삭제</button></li>';
	$(".list-fileupload").html(el);
	
	$(".btn-del").click( function() {
		$(".list-fileupload > li").remove();       
		$("#file , #txt").val("");
	});
}

function selectList(calMonth , week ){
	var param = {"yyyyMm": $.trim($("#yyyyMm").text())
			, "calMonth": ( calMonth == 0 ? "" : calMonth )
			, "weekNum" : week
			, "elstCode": $("#elstCode2 option:checked").val() 
			, "elstNm":$("#elstCode2 option:checked").text()
		};
    gf_send("<c:url value='" + url + "/selectList.do' />", param );
}

function selectListAfter(data){
	//1주차가 주말일경우 week 에 데이터가 안 담겨있다면 2주차로 조회
	if( data.week.length == 0 ) {
		if( _tabId == "btnPre" ) {
			selectList( -1 , 2 ); 
		}
	    if(	_tabId == "btnNext" ) {
	    	selectList( 1 , 2 );
	    }
		return false;
	}
	var el='';
	var date = data.getDate;
	var yyMm = date.thisyear + "" + date.thismonth;
	var today = date.todate;	//오늘 일자 
	var week = date.week;		//오늘 주차
	var monthEndDay = date.thisyear + "" + date.thismonth + "" + date.endday;
	$("#yyyyMm").text( date.thisyear + "." + date.thismonth);
	$("#enddaySpan").attr("span" , data.endday );
	
	//1.탭생성
	var tabN = data.weekList[ ( data.weekList.length ) -1 ].weekList
	var idx = data.weekList[0].weekList;
	el='';
	for( var i=idx; i<=tabN; i++ ) {
		el += '<button class="button_sort" id="' + i + '" onclick="javascript:tabEvent(\''+i+'\');" type="button"><i>' + i + '주차</i></button>';
	}
	$("#tabDiv").html( el );
	
	$("#tabDiv button").each( function() {
		var id = $(this).attr("id");
		if( data.week[0].weekList == id ) {
			$(this).addClass("active");
		}
	});
	
	//2.주차에 해당되는 요일 표 생성
	el ='';
	for( var i=0; i<data.week.length; i++ ) {
		var y = data.week[i].dateList.substring(0,4);
		var m = data.week[i].dateList.substring(4,6);
		var d = data.week[i].dateList.substring(6,8);
		var ymd = m+"."+d;
		el += '<tr>';
		el += '<th scope="rowgroup">' + data.week[i].dayWeek;
		el += "<br/>(";
		el += ( today == data.week[i].dateList ? "<font color=red>" + ymd + "</font>" : ymd );
		el += ")";
		el += '</th>';	
		for( var x=8; x<19; x++) {
			var v=data.week[i].dateList;
			el += '<td thisdate="'+v+'" thistime="'+x+'"><b class="reserve-off"><span class="hide">취소</span></b></td>';
		}
		el += '</tr>';
	}
	$("#reservationStatusTable").html(el);
	 	
	$("#reservationStatusTable tr td").each( function(x) {
		var tabledate = $(this).attr("thisdate") + "_" + $(this).attr("thistime");
		var t = $(this);		
		$(data.listReserve).each( function(i,item) {
			var reservdate = item.elstUseBgnde + "_" + item.elstUseBgntm;
			if( reservdate == tabledate ) {
				t.html( '<b class="reserve-on"><span class="hide">예약</span></b>' );
				return false;
			} 
		});
	});
	
	//1일부터 오늘까지 예약 불가능
	$("#reservationStatusTable tr td").each( function() {
		var thisdate = $(this).attr("thisdate");
		if( thisdate <= today ) {
			$(this).html( '<b class="reserve-off"><span class="hide">취소</span></b>' );
		}
	});
	
	//THP_ElstLmttSetup 에 설정된 일자 가져와서 예약 불가능 만듬
	$(data.listIgnore).each( function(x,item) {
		var v = item.lv;
		$("#reservationStatusTable tr td").each( function(x) {
			var td = $(this).attr("thisdate");
			if( v == td ) {
				$(this).html('<b class="reserve-off"><span class="hide">취소</span></b>');
			}
		});
	});
	
	//달력 클릭 이벤트
	$("#reservationStatusTable tr td").each( function() {
		$(this).click( function() {
			var param = {
				"yyyyMmDd": $(this).attr("thisdate")
				, "elstCode":$("#elstCode2 option:checked").val()
				, "hour": $(this).attr("thistime")
			};
		    gf_send("<c:url value='" + url + "/selectDetail.do' />", param  );
		});
	});
	
}

function tabEvent( week ) {
	selectList(0 , week );
}
	
function selectDetailList(calMonth){
	var param = {"yyyyMm": $.trim($("#yyyyMmBottom").text())
			, "calMonth": ( calMonth == undefined ? "" : calMonth )
			, "elstCode": $("#elstCode2 option:checked").val()
		};
    gf_send("<c:url value='" + url + "/selectDetailList.do' />", param  );
}

function selectDetailListAfter(data){
	var el='';
	var date = data.getDate;
	var yyMm = date.thisyear + "" + date.thismonth;
	var today = date.todate;	//오늘 일자 
	var monthEndDay = date.thisyear + "" + date.thismonth + "" + date.endday;
	$("#yyyyMmBottom").text( date.thisyear + "." + date.thismonth);
	makeDetailData(data);

}

function selectIgnoreCalendar() {
	var param = {
			"elstCode":$("#elstCode option:checked").val()
	};
	gf_send("<c:url value='" + url + "/selectIgnoreCalendar.do' />", param  );
}

function selectIgnoreCalendarAfter(data) {
	_ignoreArr = new Array();
	$(data.list).each( function(x,item) {
		_ignoreArr.push( item.ignore );
	});
}

function selectDetailAfter(data){
	if( data.listDetail.length != 0 ) {
		$("#yyyyMmBottom").text(  data.listDetail[0].txtdate );
	}
	makeDetailData(data);
}

function makeDetailData( data ) {
	var el = '';
	if( data.listDetail.length == 0 ) {
		el = '<tr><td colspan=7>데이터가 없습니다</td></tr>';
	}
	for( var x=0; x<data.listDetail.length; x++) {
		var name = data.listDetail[x].elstNm;
		var eventNm = data.listDetail[x].eventNm;
		var reqstsn = data.listDetail[x].reqstSn;
		var erntsn = data.listDetail[x].erntSn;
		var progrsStep = data.listDetail[x].progrsStep;
		el += '<tr>';
		el += '<td>' + data.listDetail[x].rgsde 					+ '</td>';
		if( progrsStep == "01" ) {
			el += '<td><a href="#" onclick="javascript:openPopup(this);" data-name="'+name+'" data-eventnm="'+eventNm+'" data-reqstsn="'+reqstsn+'" data-erntsn="'+erntsn+'">';
			el += '<font color=blue>' + data.listDetail[x].reqstInsttNm + '</font>';
			el += '</a></td>';
		} else {
			el += '<td>' + data.listDetail[x].reqstInsttNm	+ '</td>'; 
		}
		el += '<td>' + data.listDetail[x].elstNm 					+ '</td>';
		el += '<td>' + data.listDetail[x].elstUseBgnde 				+ '</td>';
		el += '<td>' + data.listDetail[x].elstUseEndde 				+ '</td>';
		el += '<td align="left">' + data.listDetail[x].eventNm 		+ '</td>';
		el += '<td>' + data.listDetail[x].progrsStepNm 				+ '</td>';
		el += '</tr>'; 
	}
	$("#bottomDataList").html( el );
}

function removePopup() {
	$("#popModal").attr("aria-hidden", true);
	$("#popModal").attr("style", "");
	$("#popModal").attr("opened", false);
}

function openPopup( obj ) {
	var v = $(obj);
	var name = v.data("name");
	var eventnm = v.data("eventnm");
	var reqstsn = v.data("reqstsn");
	var erntsn = v.data("erntsn");
	$plugins.uiModal({
		id : "popModal"
		, openback: function() {
			$("#popupName").text( name );
			$("#popupEventNm").text( eventnm );
			$("#popupPassword").val("");
			_reqstSn = reqstsn;
			_erntSn = erntsn;
		}
		, closeback: function(v) {
			removePopup();
		}
	}); 
	$(".modal-backdrop").removeClass();
}


function setTestData() {
	$("#reqstInsttNm").val("test");
	$("#tel1").val("02");
	$("#tel2").val("0000");
	$("#tel3").val("0000");
	$("#phone1").val("010");
	$("#phone2").val("2020");
	$("#phone3").val("4048");
	$("#email1").val("goodday0701");
	$("#email2").val("gmail.com");
	$("#eventNm").val("test");
	$("#eventCn").val("test test test ");
	$("#userPassword").val("111111");
	$("input:checkbox[id='agree1']").prop("checked", true);
	$("input:checkbox[id='agree2']").prop("checked", true);
	
	var queryDate = '2019-11-15';
    dateParts = queryDate.match(/(\d+)/g)
    realDate = new Date(dateParts[0], dateParts[1] - 1, dateParts[2]);
    $('#elstUseBgnde').datepicker({ dateFormat: 'yy-mm-dd' });
	$("#elstUseBgnde").datepicker("setDate", realDate);
    
}

function openRent() {
	$plugins.uiTab({
		id:'uiTabAPPL08_1',
		current:2
	});
	keyEvent();	//숫자만 입력가능
	makeSelectBox();
	$("#elstCode").trigger("change");
	radioEvent();
	selectIgnoreCalendar();
}

(function($, win, doc, undefined) {
	$(doc).ready(function(){
		$plugins.uiTab({
			id:'uiTabAPPL08_1',
			current:1 ,
// 			current:2 ,
			callback: function(v){
				_tabIdx = v.current;	
				switch(v.current) {
				case 0 :
					break;
				case 1 :
					makeSelectBox();
					setTimeout( function() {
						selectList(0, _thisweek );
						} , 500 );
					selectDetailList();
					removePopup();
					$("#reseverLayout0").show();
					$("#reseverLayout1").hide();
					break;
				case 2 :
					keyEvent();	//숫자만 입력가능
					makeSelectBox();
					$("#elstCode").trigger("change");
					radioEvent();
					selectIgnoreCalendar();
// 		 			setTestData();
					break;
				}
			}
		});
		
		$( "#elstUseBgnde" ).datepicker({
			showOn: "button",
			dateFormat: "yy-mm-dd",
			buttonImage: "/common/img/common/btn_datepicker.png",
			buttonImageOnly: true,
			minDate: 1 ,
			buttonText: "Select date",
			beforeShowDay: function(date){
				var year  = date.getFullYear();
				var month = zeroSum( date.getMonth()+1 );
				var dates = zeroSum( date.getDate() );
				var day   = date.getDay();
				var yyMMdd = year+""+month+""+dates;
				for( var i=0; i<=_ignoreArr.length; i++ ) {
					if( _ignoreArr[i] == yyMMdd ) {
						return [false];
					}	
				}
				//주말 , 여기서 세팅테이블 값 불러와서 빼주자
				return [(day != 0 && day != 6)];
			} ,	
			onClose: function(date, datepicker) {
				makeReserTable();
				totalMoney();
			}
		});
		
		
		$( "#startDate , #endDate" ).datepicker({
			showOn: "button",
			dateFormat: "yy-mm-dd",
			buttonImage: "/common/img/common/btn_datepicker.png",
			buttonImageOnly: true,
			buttonText: "Select date"
		});
		
	});
})(jQuery, window, document);

</script>