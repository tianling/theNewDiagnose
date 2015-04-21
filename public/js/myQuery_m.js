// JavaScript Document
var my=function(id){
	if(id){return new myQuery(id);}
	else{return new myQuery();}
};
var $={
	browserVersion:function(){
		if(navigator.userAgent.indexOf("MSIE")>0){return 0;}  //"IE"
		if(navigator.userAgent.indexOf("Firefox")>0){return 1;} //"Firefox"
		if(navigator.userAgent.indexOf("Safari")>0){return 2;}  //"Safari Chrome"
							return 3;   // "Opera"
							},
	browserArray:["Ms","Moz","Webkit","O"],
};
function myQuery(id){
  if(id){	
	if(id.match("#")){
		  id=id.substr(1);
		   this.obj=document.getElementById(id);
		  }
	else{
		  id=id.substr(1);
		   this.obj=document.getElementsByClassName(id);
						}
  		}
	else{};				
	};
//选择class的时候可选第三参数，为取得class时的数组下标
myQuery.prototype={
	css:function(cssName,cssDetail,classNumber){
	 if(this.obj[0] && classNumber==undefined){
		 for(var i=0;i<this.obj.length;i++){
		 　　　this.obj[i].style[cssName]=cssDetail;
		 　　　　　　　　　　　　　　　　　　　　　}
		 　　　　　　　　　　　　　　　　　　　　　　　}
	 else if(this.obj[0]){
		 　　　this.obj[classNumber].style[cssName]=cssDetail;
		 　　　　　　　　　　}
	 else{this.obj.style[cssName]=cssDetail;}
	  　　　　　return this;
	},
	css3:function(cssName,cssDetail,classNumber){
	 if(this.obj[0] && classNumber==undefined){
		 for(var i=0;i<this.obj.length;i++){
		 　　　this.obj[i].style[$.browserArray[$.browserVersion()]+cssName]=cssDetail;
		 　　　　　　　　　　　　　　　　　　　　　}
		 　　　　　　　　　　　　　　　　　　　　　　　}
	 else if(this.obj[0]){
		 　　　this.obj[classNumber].style[$.browserArray[$.browserVersion()]+cssName]=cssDetail;
		 　　　　　　　　　　}
	 else{this.obj.style[$.browserArray[$.browserVersion()]+cssName]=cssDetail;}
	  　　　　　return this;
	},	
//选择class的时候可选第二参数，为取得class时的数组下
	click:function(freeFunction,classNumber){
 if(this.obj[0] && classNumber==undefined){
	 for(var i=0;i<this.obj.length;i++){
	 　　　this.obj[i].addEventListener("click",freeFunction,false);
	                                   }
									       }
 else if(this.obj[0]){
	 　　　this.obj[classNumber].addEventListener("click",freeFunction,false);
	 　　　　　　　　　　}
 else{
	 　　　this.obj.addEventListener("click",freeFunction,false);
	 }
  return this;
},
	mousemove:function(freeFunction,classNumber){
 if(this.obj[0] && classNumber==undefined){
	 for(var i=0;i<this.obj.length;i++){
	 　　　this.obj[i].addEventListener("mousemove",freeFunction,false);
	                                   }
									       }
 else if(this.obj[0]){
	 　　　this.obj[classNumber].addEventListener("mousemove",freeFunction,false);
	 　　　　　　　　　　}
 else{
	 　　　this.obj.addEventListener("mousemove",freeFunction,false);
	 }
  return this;
},
	mousedown:function(freeFunction,classNumber){
 if(this.obj[0] && classNumber==undefined){
	 for(var i=0;i<this.obj.length;i++){
	 　　　this.obj[i].addEventListener("mousedown",freeFunction,false);
	                                   }
									       }
 else if(this.obj[0]){
	 　　　this.obj[classNumber].addEventListener("mousedown",freeFunction,false);
	 　　　　　　　　　　}
 else{
	 　　　this.obj.addEventListener("mousedown",freeFunction,false);
	 }
  return this;
},
	mouseover:function(freeFunction,classNumber){
 if(this.obj[0] && classNumber==undefined){
	 for(var i=0;i<this.obj.length;i++){
	 　　　this.obj[i].addEventListener("mouseover",freeFunction,false);
	                                   }
									       }
 else if(this.obj[0]){
	 　　　this.obj[classNumber].addEventListener("mouseover",freeFunction,false);
	 　　　　　　　　　　}
 else{
	 　　　this.obj.addEventListener("mouseover",freeFunction,false);
	 }
  return this;
},
	mouseout:function(freeFunction,classNumber){
 if(this.obj[0] && classNumber==undefined){
	 for(var i=0;i<this.obj.length;i++){
	 　　　this.obj[i].addEventListener("mouseout",freeFunction,false);
	                                   }
									       }
 else if(this.obj[0]){
	 　　　this.obj[classNumber].addEventListener("mouseout",freeFunction,false);
	 　　　　　　　　　　}
 else{
	 　　　this.obj.addEventListener("mouseout",freeFunction,false);
	 }
  return this;
},
//选择class的时候必须要选第二参数，返回具体的class的属性值
	getAttr:function(attrName,classNumber){
		if(this.obj[0]){
                      this.obj[classNumber].getAttribute(attrName);
					  return this.obj[classNumber].getAttribute(attrName);
	 　　　　　　　　　　}
 else{
	   this.obj.getAttribute(attrName);
	   return this.obj.getAttribute(attrName);
	 }
  　},	
  	changeAttr:function(attrName,location,classNumber){
		if(this.obj[0]){
                      this.obj[classNumber].getAttribute(attrName)=location;
					  return this.obj[classNumber].getAttribute(attrName);
	 　　　　　　　　　　}
		else{
	   this.obj.setAttribute(attrName,location);
	   return this.obj.getAttribute(attrName);
	 		}		
											},
	getTest:function(classNumber){
if(this.obj[0] && classNumber==undefined){
	 var classText=new Array();
	 for(var i=0;i<this.obj.length;i++){classText[i]=this.obj[i].innerHTML;}
	   return classText;
	 　　　　　　　　　　　　　　　　　　　　　　　}
 else if(this.obj[0]){
         return this.obj[classNumber].innerHTML;                
	 　　　　　　　　　　}
 else{
	     return this.obj.innerHTML;    
	 }
  　　　　　return this;
},
	getCSS:function(styleName,classNumber){
	  if(this.obj[0]){
		  if(this.obj[0] && classNumber==undefined){
			  			var array=new Array();
			  	if(this.obj.style){
				         for(var i=0;i<this.obj.length;i++){
							 	array[i]=this.obj[i].style[styleName];
							 };
							 return array;
				   }
				   else if(this.obj.currentStle){
				         for(var i=0;i<this.obj.length;i++){
							 	array[i]=this.obj[i].currentStle[styleName];
							 };					   
								return array;
					   }
				   else if(window.getComputedStyle){
					   	 for(var i=0;i<this.obj.length;i++){
							 	array[i]=window.getComputedStyle(this.obj[i],null)[styleName];
							 };	
						 return array;
					   }
			  								}
		  	else{
		  		if(this.obj[classNumber].style[styleName]){
				   return this.obj[classNumber].style[styleName];
				   }
				   else if(this.obj.currentStle){
								return this.obj[classNumber].currentStle[styleName];
					   }
				   else if(window.getComputedStyle){
						 return window.getComputedStyle(this.obj[classNumber],null)[styleName];
					   }
				};
					} 
	 		 	else{ 
			   if(this.obj.style[styleName]){
				   return this.obj.style[styleName];
				   }
				   else if(this.obj.currentStle){
								return this.obj.currentStle[styleName];
					   }
				   else if(window.getComputedStyle){
						 return window.getComputedStyle(this.obj,null)[styleName];
					   }
			};
},	
//ajax json 调用完使用对象jsonarray
	ajax:function(method,url){
	   	var request;
			if (window.XMLHttpRequest)
			  {// code for IE7+, Firefox, Chrome, Opera, Safari
			  request=new XMLHttpRequest();
			  }
			else
			  {// code for IE6, IE5
			  request=new ActiveXObject("Microsoft.XMLHTTP");
			  }
	request.onreadystatechange=function()
	  {
	 		if (request.readyState==4 && request.status==200)
		{    	  		
							var json=request.responseText;
								jsonarray=JSON.parse(json); 	    
					
		}
	  }
	request.open(method,url,false);
	request.send();	             									
			},	

};





//内部判断
/*
if(this.obj[0] && classNumber==undefined){
	 for(var i=0;i<this.obj.length;i++){

	 　　　　　　　　　　　　　　　　　　　　　}
	 　　　　　　　　　　　　　　　　　　　　　　　}
 else if(this.obj[0]){

	 　　　　　　　　　　}
 else{
	 
	 }
  　　　　　return this; */