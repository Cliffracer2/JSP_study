let password;

function boardCheck() {
	if (document.frm.name.value.length == 0) {
		alert("작성자를 입력하세요.");
		return false;
	}
	if (document.frm.pass.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if (document.frm.title.value.length == 0) {
		alert("제목을 입력하세요.");
		return false;
	}
	return true;
}
function open_win(url, name) {
	window.open(url, name, "width=500, height=230");
}
function passCheck() {
	
	if (document.frm.pass.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	
	//closeWindow();
	return true;
}

// document가 load된 후 실행하기 위한 이벤트리스너
document.addEventListener("DOMContentLoaded", function() {
    // Get the modal
    var modalOne = document.getElementById("modalModify");
	var modalTwo = document.getElementById("modalDelete");
	
	// Get the button that opens the modal
	var btnModify = document.getElementById("btn-modify");
	var btnDelete = document.getElementById("btn-delete");
	
	// When the user clicks the button, open the modal 
	btnModify.onclick = function() {
	  modalOne.style.display = "block";
	}
	
	// When the user clicks the button, open the modal 
	btnDelete.onclick = function() {
	  modalTwo.style.display = "block";
	}

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
		if (event.target == modalOne) {
			modalOne.style.display = "none";
		}
		if (event.target == modalTwo) {
			modalTwo.style.display = "none";
		}
    }

	const inputPass = document.getElementById("input-password");
	
	inputPass.addEventListener('input', function() {
		console.log(inputPass.value);
		password = inputPass.value;
	});
});

// modal 창 닫기
let closeWindow = function () {
	// Get the modal
    var modalOne = document.getElementById("modalModify");
	var modalTwo = document.getElementById("modalDelete");

	modalOne.style.display = "none";
	modalTwo.style.display = "none";
}