function cancelCart(date,f){
	var url="removeBuy.do";
	var param="date="+date;
	sendRequest(url,param,(response)=>{
		if(xhr.status==200){
			f.remove();
		}
	},"POST");
	
}













