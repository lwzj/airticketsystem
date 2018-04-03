//var URL = "http://localhost/";
var URL = "http://localhost:8080/";

var UID = 123;
function CheckMail(mail) {
	 var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	 if (filter.test(mail)) return true;
	 else {
	 alert('您的电子邮件格式不正确');
	 return false;}
	}
function deleteCookie(name){ 
	var date=new Date(); 
	date.setTime(date.getTime()-10000); 
	document.cookie=name+"=v; expires="+date.toGMTString(); 
	} 
function init_a(){
	if ($.cookie('username')== null||$.cookie('username')== 'null') {
		$(".bb").show();
		$(".cc").hide();
	}else{
		$(".bb").hide();
		$(".cc").show();
		$("#username").html($.cookie('username'));
	}
}
function courseName(bigType,smallType){
	var bigName,smallName;
	switch(bigType){
		case "b1":
			bigName="高一年级";
			break;
		case "b2":
			bigName="高二年级";
			break;
		case "b3":
			bigName="高三年级";
			break;
		case "b4":
			bigName="高三冲刺";
			break;
		case "b5":
			bigName="一对一辅导";
			break;
	}
	switch(smallType){
		case "s1":
			smallName="数学";
			break;
		case "s2":
			smallName="化学";
			break;
		case "s3":
			smallName="物理";
			break;
		case "s4":
			smallName="英语";
			break;
	}
	return bigName+"   "+smallName;
}
Date.prototype.pattern=function(fmt) {         
    var o = {         
    "M+" : this.getMonth()+1, //月份         
    "d+" : this.getDate(), //日         
    "h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时         
    "H+" : this.getHours(), //小时         
    "m+" : this.getMinutes(), //分         
    "s+" : this.getSeconds(), //秒         
    "q+" : Math.floor((this.getMonth()+3)/3), 
    "S" : this.getMilliseconds() //毫秒         
    };         
    var week = {         
    "0" : "/u65e5",         
    "1" : "/u4e00",         
    "2" : "/u4e8c",         
    "3" : "/u4e09",         
    "4" : "/u56db",         
    "5" : "/u4e94",         
    "6" : "/u516d"        
    };         
    if(/(y+)/.test(fmt)){         
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));         
    }         
    if(/(E+)/.test(fmt)){         
        fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[this.getDay()+""]);         
    }         
    for(var k in o){         
        if(new RegExp("("+ k +")").test(fmt)){         
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));         
        }         
    }         
    return fmt;         
}

function carType(carType){
    var carTypeName;
    switch(carType){
        case "c1":
            carTypeName="普通会员";
            break;
        case "c2":
            carTypeName="黄金会员";
            break;
        case "c3":
            carTypeName="铂金会员";
            break;
        case "c4":
            carTypeName="钻石会员";
            break;
    }
    return carTypeName;
}

function stationType(stationType){
    var stationTypeName;
    switch(stationType){
        case "s1":
            stationTypeName="普通车位";
            break;
        case "s2":
            stationTypeName="中等车位";
            break;
        case "s3":
            stationTypeName="高级车位";
            break;
    }
    return stationTypeName;
}

function subDate(date1){
	var cTime;
	if(date1.time>(new Date().getTime())){
		var date3 = date1.time-(new Date().getTime());
		//计算出相差天数  
	    var days=Math.floor(date3/(24*3600*1000))  ;
	    //计算出小时数  
	    var leave1=date3%(24*3600*1000)   ; //计算天数后剩余的毫秒数  
	    var hours=Math.floor(leave1/(3600*1000))  ;
	    //计算相差分钟数  
	    var leave2=leave1%(3600*1000) ;       //计算小时数后剩余的毫秒数  
	    var minutes=Math.floor(leave2/(60*1000))  ;
	    //计算相差秒数  
	    var leave3=leave2%(60*1000) ;     //计算分钟数后剩余的毫秒数  
	    var seconds=Math.round(leave3/1000);  
	    cTime="距离停售还有"+days+"天 "+hours+"小时 "+minutes+" 分钟"+seconds+" 秒"; 
	}else{
		cTime = "已结束";
	}
	return cTime;
}