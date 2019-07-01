/*自制对话框begin
sAlert(s1,t1,callback)
sConfirm(s1,t1,callback)
sPrompt(s1,t1,v1,callback)
*/
$(function(){
 //生成元素
 if( !document.getElementById("sMessage") ){
  var tmpCss = '<style type="text/css">';
  tmpCss += '#sMessage{display:none;position:fixed;top:0;left:0;z-index:2147483648;width:100%;height:100%;min-height:'+$(window).height()+'px;background:rgba(0,0,0,0.8);}';
  tmpCss += '#sMessageAlert,#sMessageConfirm,#sMessagePrompt{display:none;margin:2% auto 0 auto;width:30%;height:auto;min-width:300px;overflow:hidden;min-height:60px;border:1px solid #CCC;text-align:center;background:#fff;border-radius:10px;box-shadow:0 0 10px 0 #fff;}';
  tmpCss += '#sMessage .sT{width:100%;height:30px;line-height:30px;border-bottom:1px solid #E8E8E8;background:#F8F8F8;font-weight:bold;font-size:120%;}';
  tmpCss += '#sMessage .sS{margin:20px;background:#FFF;word-break:break-all;line-height:166%;}';
  tmpCss += '#sMessage .sS input.txt{width:100%;}';
  tmpCss += '#sMessage .sC{margin:10px;text-align:center;}';
  tmpCss += '#sMessage .sC span{text-align:center;}';
  tmpCss += '#sMessage .sC span input{}';
  tmpCss += '#sMessage .sC .ok,.no{background-color: #0787d0;border:1px solid #0787d0;border-radius:5px;outline: none;color:white;margin:0 10px;text-align:center;}';
  tmpCss += '</style>';
  var tmpStr = '<div id="sMessage">';
  tmpStr += '<div id="sMessageAlert"><div class="sT"></div><div class="sS"></div><div class="sC"><span><input class="ok" type="button" value="OK!" /></span></div></div>';
  tmpStr += '<div id="sMessageConfirm"><div class="sT"></div><div class="sS"></div><div class="sC"><span><input class="ok" type="button" value="Yes" /><input class="no" type="button" value="Cancel" /></span></div></div>';
  tmpStr += '<div id="sMessagePrompt"><div class="sT"></div><div class="sS"><p></p><input class="txt" type="text" placeholder="请输入..." /></div><div class="sC"><span><input class="ok" type="button" value="提交" /><input class="no" type="button" value="Cancel" /></span></div></div>';
  tmpStr += '</div>';
  $("body").append(tmpCss+tmpStr);
  window.sMessageOpen = function(s){
   if(s){$("#sMessage,#sMessage"+s).fadeIn(233,"swing");
    var w_h = $(window).height();
    if(w_h>$("#sMessage"+s).height()){
     $("#sMessage"+s).css("marginTop",(w_h*0.3)-($("#sMessage"+s).height()*0.3));
    }
   }
  }
  window.sMessageClose = function(s){
   if(s){$("#sMessage,#sMessage"+s).hide();}
  }
 }
});
//提示框
function sAlert(s1,t1,callback){
 sMessageOpen("Alert");
 if(!t1){
  $("#sMessageAlert .sT").html("提示框");
 }else{
  $("#sMessageAlert .sT").html(t1);
 }
 if(!s1){
  $("#sMessageAlert .sS").html("[无提示内容]");
 }else{
  $("#sMessageAlert .sS").html(s1);
 }
 $("#sMessageAlert .sC span").one("click",function(){
  sMessageClose("Alert");
 });
 if( typeof(callback)=="function" ){
   $("#sMessageAlert .sC span input.ok").one("click",callback);
 }
 $("#sMessageAlert .sC span input.ok").trigger("focus");
}
//提示确认框
function sConfirm(s1,t1,callback){
 sMessageOpen("Confirm");
 if(!t1){
  $("#sMessageConfirm .sT").html("提示确认框");
 }else{
  $("#sMessageConfirm .sT").html(t1);
 }
 if(!s1){
  $("#sMessageConfirm .sS").html("[无提示确认内容]");
 }else{
  $("#sMessageConfirm .sS").html(s1);
 }
 $("#sMessageConfirm .sC span").one("click",function(){
  sMessageClose("Confirm");
 });
 if( typeof(callback)=="function" ){
   $("#sMessageConfirm .sC span input.ok").one("click",callback);
   $("#sMessageConfirm .sC span input.no").one("click",function(){
    $("#sMessageConfirm .sC span input.ok").unbind("click");
   });
 }
 $("#sMessageConfirm .sC span input.ok").trigger("focus");
}
//提示输入框
function sPrompt(s1,t1,v1,callback){
 window.sPromptValue = "";
 sMessageOpen("Prompt");
 if(!t1){
  $("#sMessagePrompt .sT").html("提示输入框");
 }else{
  $("#sMessagePrompt .sT").html(t1);
 }
 if(!s1){
  $("#sMessagePrompt .sS p").html("[无提示输入内容]");
 }else{
  $("#sMessagePrompt .sS p").html(s1);
 }
 if(!v1){
  $("#sMessagePrompt .sS input.txt").val("");
 }else{
  $("#sMessagePrompt .sS input.txt").val(v1);
 }
 $("#sMessagePrompt .sC span").one("click",function(){
  //window.sPromptValue = $("#sMessagePrompt .sS input.txt").val();
  sMessageClose("Prompt");
 });
 if( typeof(callback)=="function" ){
  $("#sMessagePrompt .sC span input.ok").one("click",callback);
  $("#sMessagePrompt .sC span input.no").one("click",function(){
   $("#sMessagePrompt .sC span input.ok").unbind("click");
   window.sPromptValue = "";
  });
 }
 $("#sMessagePrompt .sS input.txt").keyup(function(event){
  window.sPromptValue = $(this).val();
  if(event.keyCode==13){
   $("#sMessagePrompt .sC span input.ok").trigger("click");
  }
 });
}
//改写原生js的alert为sAlert
window.alert = function(s){sAlert(s);}
/*自制对话框end*/