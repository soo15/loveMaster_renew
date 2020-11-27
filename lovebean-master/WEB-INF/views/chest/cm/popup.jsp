<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<section class="ui-modal" id=popModal role="dialog" aria-hidden="true">
    <div class="ui-modal-wrap">
        <header class="ui-modal-header">
            <h1 class="ui-modal-tit"><span>신청정보</span></h1>
			<button type="button" class="btn-close ui-modal-close"><span class="hide">닫기</span></button>
        </header>
        <div class="ui-modal-cont">
            <div class="inner-wrap">
            	<div class="tb-type_a mb-type">
					<table>
						<colgroup>
							<col class="col-th">
							<col class="col-auto">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">신청자명</th>
							<td id="popupName"></tr>
						<tr>
							<th scope="row">행사명</th>
							<td id="popupEventNm"></td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="psw-wrap">
					<p>내용 수정시 등록하신 비밀번호를 입력해주시기 바랍니다.</p>
					<input type="password" class="inp-base" id="popupPassword" placeholder="비밀번호" maxlength="6" numberOnly>
				</div>
            </div>
        </div>
        <div class="ui-modal-footer">
            <button type="button" class="btn-base ui-modal-close">닫기</button>
            <button type="button" class="btn-base-imp" onclick="modifyMovePage();">수정</button>
        </div>
    </div>
</section>
