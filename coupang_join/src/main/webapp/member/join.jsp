<%-- TODO: 비밀번호 로직 처리 추가하기 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="css/join.css">
    <script src="https://kit.fontawesome.com/012812d51d.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="script/memberJoin.js"></script>
</head>
<body>
	<form method="post" action="joinResult" style="max-width:500px; margin:auto">
<!-- 쿠팡 로고 ---------------------------------------------------------------------------->
		<!-- <a href="https://www.coupang.com/"> -->
		<!-- 테스트를 위해 로고 클릭 시 디버깅용 메인 jsp 페이지로 이동 -->
		<a href="index.jsp">
			<img src="images/logo-coupang.png" alt="logo">
		</a>
<!-- 쿠팡 로고 -->
<!-- 회원정보 입력 창 ---------------------------------------------------------------------------->
        <div class="member-info">
            <h3>회원정보를 입력해주세요</h3>
			<!-- id 입력 -->
            <div id="email" class="input-container">
                <i class="fa fa-envelope icon"></i>
                <input id="email-input" class="input-field" type="text" placeholder="아이디(이메일)" name="email">
				<button id="email-ok" class="btn-check" type="button" onclick="getFocus(email-input)"><i class="fas fa-check"></i></button>
			</div>
            
            <div id="email-error" class="error">
            	<p>이메일을 입력하세요.</p>
            </div>
            
            <div id="emailrule" class="error">
            	<p>이메일을 올바르게 입력해주세요.</p>
            </div>
            
			<!-- 비밀번호 입력 -->
            <div id="password" class="input-container">
                <i class="fas fa-lock icon"></i>
                <input id="psw-input" class="input-field" type="password" placeholder="비밀번호" name="password">
				<button id="psw-ok" class="btn-check" type="button" onclick="getFocus(psw-input)"><i class="fas fa-check"></i></button>
			</div>
            
			<!-- 비밀번호 입력 메시지 -->
            <div id="psw-check" class="psw-intro">
            	<div id="pw-conbine" class="not-ok">
            		<i class="fas fa-times"></i> 영문/숫자/특수문자 2가지 이상 조합 (8~20자)
            	</div>
				<div id="pw-conbine-ok" class="ok not-success">
            		<i class="fas fa-check"></i> 영문/숫자/특수문자 2가지 이상 조합 (8~20자)
            	</div>
            	<div id="pw-sequence" class="not-ok">
            		<i class="fas fa-times"></i> 3개 이상 연속되거나 동일한 문자/숫자 제외
            	</div>
				<div id="pw-sequence-ok" class="ok not-success">
            		<i class="fas fa-check"></i> 3개 이상 연속되거나 동일한 문자/숫자 제외
            	</div>		
				<div id="ispw-id" class="not-ok">
					<i class="fas fa-times"></i> 아이디(이메일) 제외
				</div>
				<div id="ispw-id-ok" class="ok not-success">
					<i class="fas fa-check"></i> 아이디(이메일) 제외
				</div>
            </div>
			<!-- 비밀번호 정상입력 후 메시지 -->
			<div id="pw-all-checked" class="psw-intro ok not-success">
				<i class="fas fa-check"></i> <span>사용 가능한 비밀번호입니다.</span>
			</div>
			<!-- 비밀번호 확인 -->
            <div id="confirmPsw" class="input-container">
                <i class="fas fa-unlock icon"></i>
                <input id="confirmPsw-input" class="input-field" type="password" placeholder="비밀번호 확인" name="confirmPsw">
				<button id="confirmPsw-ok" class="btn-check" type="button" onclick="getFocus(confirmPsw-input)"><i class="fas fa-check"></i></button>
			</div>
            <!-- 비밀번호 확인 메시지 -->
            <div id="confirm-check" class="psw-intro">
            	<div id="psw-not-match" class="not-ok">
            		<i class="fas fa-times"></i> <span>확인을 위해 새 비밀번호를 다시 입력해주세요.</span>
            	</div>
				<div id="psw-match" class="ok not-success">
					<i class="fas fa-check"></i> <span>비밀번호 일치.</span>
				</div>
            </div>            
            <!-- 이름 입력 -->
            <div id="name" class="input-container">
                <i class="fa fa-user icon"></i>
                <input id="name-input" class="input-field" type="text" placeholder="이름" name="name">
				<button id="name-ok" class="btn-check" type="button" onclick="getFocus(name-input)"><i class="fas fa-check"></i></button>
			</div>
            
            <div id="name-error" class="error">
            	<p>이름을 정확히 입력하세요.</p>
            </div>           
            <!-- 휴대전화 번호 입력 -->
            <div id="phone" class="input-container">
                <i class="fas fa-mobile-alt icon"></i>
                <input id="phone-input" class="input-field" type="text" placeholder="휴대폰 번호" name="phone">
				<button id="phone-ok" class="btn-check" type="button" onclick="getFocus(phone-input)"><i class="fas fa-check"></i></button>
			</div>
            
            <div id="phone-error" class="error">
            	<p>휴대폰 번호를 정확하게 입력하세요.</p>
            </div>
            
            <div id="phonenumber-rule" class="error">
            	<p>휴대폰 번호를 올바르게 입력해주세요.</p>
            </div>
        </div>
<!-- 회원정보 입력 창 -->
<!-- 약관 동의 ---------------------------------------------------------------------------->
<!-- <i class="fas fa-check-square"></i> 배경색이 있는 체크박스-->
<!-- <i class="far fa-check-square"></i> 체크표시에 색이 있는 체크박스-->
<!-- <i class="fas fa-chevron-right"></i> 오른쪽 화살표 -->
		<div style="margin-top: 35px;">
			<hr style="height: 1px; border-width: 0; color: #ddd !important; background-color: #eee !important;">
		</div>
		<div class="checkBox">
			<h3 style="margin-top: 35px;">쿠팡 서비스약관에 동의해주세요</h3>
			<div class="checkall">
				<label class="container">
					<span class="checkboxall-text">모두 동의합니다.</span>
					<input type="checkbox" name="all-agree" id="agree-all">
					<span class="checkmark"></span>
				</label>
			</div>
			<div class="checklist">
				<div>
					<label class="container">
						<span class="checkbox-text">[필수] 만 14세 이상입니다</span>
						<input type="checkbox" name="agree" id="agree-age">
						<span class="checkmark"></span>
					</label>					
				</div>
				
				<div class="sub-check">
					<label class="container">
						<span class="checkbox-text">[필수] 쿠팡 이용약관 동의</span>
						<input type="checkbox" name="agree" id="agree-one">
						<span class="checkmark"></span>
					</label>					
				</div>
				<!-- Trigger/Open The Modal -->
				<div class="check-arrow">
					<a id="agreeOne" class="arrow-icon" href="#"><i class="fas fa-chevron-right"></i></a>
				</div>
				
				<div class="sub-check">
					<label class="container">
						<span class="checkbox-text">[필수] 전자금융거래 이용약관 동의</span>
						<input type="checkbox" name="agree" id="agree-two">
						<span class="checkmark"></span>
					</label>					
				</div>

				<div class="check-arrow">
					<a id="agreeTwo" class="arrow-icon" href="#"><i class="fas fa-chevron-right"></i></a>
				</div>
				
				<div class="sub-check">
					<label class="container">
						<span class="checkbox-text">[필수] 개인정보 수집 및 이용 동의</span>
						<input type="checkbox" name="agree" id="agree-three">
						<span class="checkmark"></span>
					</label>					
				</div>

				<div class="check-arrow">
					<a id="agreeThree" class="arrow-icon" href="#"><i class="fas fa-chevron-right"></i></a>
				</div>

				<div class="sub-check">
					<label class="container">
						<span class="checkbox-text">[필수] 개인정보 제공 동의</span>
						<input type="checkbox" name="agree" id="agree-four">
						<span class="checkmark"></span>
					</label>
				</div>
				
				<div class="check-arrow">
					<a id="agreeFour" class="arrow-icon" href="#"><i class="fas fa-chevron-right"></i></a>
				</div>
			</div>
		</div>
		
        <button type="submit" class="btn" onclick="location.href='joinResult.do'">동의하고 가입하기</button>
	</form>

	<!-- Modal One ---------------------------------------------------------------------------->
	<div id="modalAgreeOne" class="modal">

	<!-- Modal content -->
	<div class="modal-content">
		<div class="modal-header">
			<button class="btn-close" onclick="closeWindow()"><img src="images/icon-button-close-black.png" alt="close"></button>
			<h2>쿠팡 이용약관 동의</h2>
		</div>
		<div class="modal-body">
			<iframe 
				title="agreeOne" width="100%" height="600" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=yes vspace=0 src="agreeOne.html">
			</iframe>
		</div>
		<div class="modal-footer">
			<button class="btn-footer" onclick="closeWindow()">확인</button>
		</div>
	</div>

	</div>
	<!-- Modal One -->

	<!-- Modal Two ---------------------------------------------------------------------------->
	<div id="modalAgreeTwo" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<button class="btn-close" onclick="closeWindow()"><img src="images/icon-button-close-black.png" alt="close"></button>
				<h2>전자금융거래 이용약관 동의</h2>
			</div>
			<div class="modal-body">
				<iframe 
					title="agreeTwo" width="100%" height="600" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=yes vspace=0 src="agreeTwo.html">
				</iframe>
			</div>
			<div class="modal-footer">
				<button class="btn-footer" onclick="closeWindow()">확인</button>
			</div>
		</div>

	</div>
	<!-- Modal Two -->

	<!-- Modal Three ---------------------------------------------------------------------------->
	<div id="modalAgreeThree" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<button class="btn-close" onclick="closeWindow()"><img src="images/icon-button-close-black.png" alt="close"></button>
				<h2>개인정보 수집 및 이용 동의</h2>
			</div>
			<div class="modal-body">
				<iframe 
					title="agreeThree" width="100%" height="600" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=yes vspace=0 src="agreeThree.html">
				</iframe>
			</div>
			<div class="modal-footer">
				<button class="btn-footer" onclick="closeWindow()">확인</button>
			</div>
		</div>

	</div>
	<!-- Modal Three -->

	<!-- Modal Four ---------------------------------------------------------------------------->
	<div id="modalAgreeFour" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<button class="btn-close" onclick="closeWindow()"><img src="images/icon-button-close-black.png" alt="close"></button>
				<h2>개인정보 제공 동의</h2>
			</div>
			<div class="modal-body">
				<iframe 
					title="agreeFour" width="100%" height="600" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=yes vspace=0 src="agreeFour.html">
				</iframe>
			</div>
			<div class="modal-footer">
				<button class="btn-footer" onclick="closeWindow()">확인</button>
			</div>
		</div>

	</div>
	<!-- Modal Four -->	

<!-- 약관 동의 -->
<!-- Footer ---------------------------------------------------------------------------->
	<footer class="member-footer">
		<div>
		    ©Coupang Corp. All rights reserved.
		</div>
	</footer>
<!-- Footer -->
</body>
</html>