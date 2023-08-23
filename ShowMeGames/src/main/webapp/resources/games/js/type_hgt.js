
// dropdown 기능
let subToggle=true;
$("#system_detail_btn").click(()=>{
  if(subToggle){
    $("#system_dropdown_wrapper").slideDown(200);
    $('#dropdown_icon').css('transform', 'scaleY(-1)');
  }else{
    $("#system_dropdown_wrapper").slideUp(200);
    $('#dropdown_icon').css('transform', '');
  }
  subToggle=!subToggle;
});
