function importInformation(){
	$(".importInformation").css("display","block");
	$(".departInformation").css("display","none");
	$(".setClass").css("display","none");
	$(".add").css("display","none");
	$(".score").css("display","none");
	
}
function departInformation(){
	$(".importInformation").css("display","none");
	$(".departInformation").css("display","block");
	$(".setClass").css("display","none");
	$(".add").css("display","none");
	$(".score").css("display","none");
}
function setClass(){
	$(".importInformation").css("display","none");
	$(".departInformation").css("display","none");
	$(".setClass").css("display","block");
	$(".add").css("display","none");
	$(".score").css("display","none");
}
function add(){
	$(".importInformation").css("display","none");
	$(".departInformation").css("display","none");
	$(".setClass").css("display","none");
	$(".add").css("display","block");
	$(".score").css("display","none");
}
function score(){
	$(".importInformation").css("display","none");
	$(".departInformation").css("display","none");
	$(".setClass").css("display","none");
	$(".add").css("display","none");
	$(".score").css("display","block");
}
function departInformationEdit(){
	window.open("departInformation.html","newwindow","height=450,width=750,top=100,left=500,toolbar=yes,resizable=yes");
}
function setClassEdit(){
	window.open("setClass.html","newwindow","height=600,width=900,top=100,left=350,toolbar=yes,resizable=yes");
}
function addEdit(){
	window.open("add.html","newwindow","height=450,width=750,top=100,left=500,toolbar=yes,resizable=yes");
}
