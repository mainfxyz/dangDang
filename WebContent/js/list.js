f=function(c){
	var v=document.getElementById(c);
	z=v.value;
	z=parseInt(z)-1;
	v.value=z;
}
j=function(c){
		var v=document.getElementById(c);
		z=v.value;
		z=parseInt(z)+1;
		v.value=z;
}
ale=function(id){
    $.post("UpGwc",$(id).serialize(),function(data,status){
    	alert(data);
    });
}

qx=function(id){
    $.post("NoGwc",$(id).serialize(),function(data,status){
    	alert(data);
    });
    location.reload()
}

add=function(url){
    $.get(url,function(data,status){
    	$("#contents").html(data);
    });
}