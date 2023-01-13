$( document ).ready(function() {
    var w = window.innerWidth;

    if(w > 767){
        $('#menu-jk').scrollToFixed();
    }else{
        $('#menu-jk').scrollToFixed();
    }



})


$( document ).ready(function() {

    $('.owl-carousel').owlCarousel({
        loop:true,
        margin:0,
        nav:true,
        autoplay: true,
        dots: true,
        autoplayTimeout: 5000,
        navText:['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        responsive:{
            0:{
                items:1
            },
            600:{
                items:1
            },
            1000:{
                items:1
            }
        }
    })


});

function gfn_isNull(str) {
	if(str == null) return true;
	if(str == "NaN") return true;
	if(new String(str).valueOf() == "undefined") return true;
	var chkStr = new String(str);
	if(chkStr.valueOf() == "undefined") return true;
	if(chkStr == null) return true;
	if(chkStr.toString().length == 0) return true;
	return false;
}

/* ComSumit을 공통함수로 만들어 사용 */
function ComSubmit(opt_formId) {
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.url = "";
	
	if(this.formId == "commonForm") {
		$("#commonForm")[0].reset();
		$("#commonForm").empty();
	}
	
	this.setUrl = function setUrl(url) {
		this.url = url;
	};
	
	this.addParam = function addParam(key, value) {
		$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
	};
	/* submit의 겨우 어떻한 요청을 하면 화면이 바뀌기 때문에 그 안의 기능이 많지 않다. */
	this.submit = function submit() {
		var frm = $("#"+this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.submit();
	};
}
