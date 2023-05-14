function cancelCart(date,button){
	var url="removeBuy.do";
	var param="date="+date;
	sendRequest(url,param,(response)=>{
		if(xhr.status==200){
			button.closest('.card').remove();
		}
	},"POST");
}







