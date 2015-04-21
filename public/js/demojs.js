// JavaScript 
window.onload=function(){
		my("#contain").css("width","488px");		
		setTimeout(function(){curediv(0)},1300);
		Event();	
	};
function Event(){
	var deliver=function(i){
		return function(ev){surefirst(i);}
	};
	var deliversecond=function(i){
		return function(ev){suresecond(i);}
	};
	for(var i=0;i<$$("cure").length;i++){
	$$("cure")[i].addEventListener("click",deliver(i),false);
	};
	for(var i=0;i<$$("Pagecure").length;i++){
	$$("Pagecure")[i].addEventListener("click",deliversecond(i),false);
	};
	page();
};
var left=15;
var top_l=21;
var $$=function(x){
	return document.getElementsByClassName(x);	
};
function curediv(count){
	for(var i=count;i<count+4;i++){
	 $$("cure")[i].style.top=top_l+"%";
	 $$("cure")[i].style.left=left+"%";
	 			left=left+20;
	};
	top_l=top_l+18;
	left=15;
		count=count+4;
	if(count==20){return;}
	curediv(count);
};
function surefirst(i){
	if($$("hiden")[i].checked==true){
		$$("cure")[i].style.backgroundImage="URL(images/curebackgroundAf.jpg)";
									}
	else{
		$$("cure")[i].style.backgroundImage="URL(images/curebackground.gif)"
		}
};
function suresecond(i){
	if($$("hidens")[i].checked==true){
		$$("Pagecure")[i].style.backgroundImage="URL(images/curebackgroundAf.jpg)";
									}
	else{
		$$("Pagecure")[i].style.backgroundImage="URL(images/curebackground.gif)"
		}
};
var $page=0;
function page(){
	my("#nextpage").click(function(){
		$page=$page+488;
		if($page>488*3){$page=488*3;}		
		else{my(".choose").css("right",$page+"px");
		my("#beforepage").css("display","inline-block")};
									});
	my("#beforepage").click(function(){
		$page=$page-488;
		if($page<0){$page=0;my("#beforepage").css("display","none");}		
		else{my(".choose").css("right",$page+"px");my("#beforepage").css("display","inline-block")}
									})		
};
