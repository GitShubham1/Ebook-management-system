const registrationform=document.getElementById("registrationform");
registrationform.addEventListener('submit',formValidation);

function formValidation(event){
	event.preventDafault();
	
	const fname=document.getElementById("fname").value;
	const email=document.getElementById("email").value;
	const phno=document.getElementById("phno").value;
	const password=document.getElementById("password").value;
	
	if(email.length<4){
		document.getElementById("emailError").textContent='email cannot be empty.';
		return;
	}if(fname.length<4){
		document.getElementById("fNameError").textContent='full Name cannot be less than 4 characters ';
		return;
	}if(phno.length<10){
		document.getElementById("phnoError").textContent='phone number cannot be less than 10 digit';
		return;
	}if(password.length<8 || !/[A-Z]/.test(password) || !/\d/.test(password)){
		document.getElementById("passwordError").textContent='password must contains atleast 8 characters,'+'1 uppercase letter[A-Z], 1 lowercase letter[a-z], 1 digit[0-9]';
		return;
	}
	
	registrationform.submit();
}