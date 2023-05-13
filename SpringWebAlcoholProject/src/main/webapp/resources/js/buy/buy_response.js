function cancelCart(date,button){
	var url="removeBuy.do";
	var param="date="+date;
	sendRequest(url,param,(response)=>{
		if(xhr.status==200){
			button.closet('.card').remove();
		}
	},"POST");
}
function pay(CartVO,f){
	f.cart.value=JSON.Stringify(CartVO);
	f.cost.value=JSON.parse(CartVO).cost;
	f.submit();
}












