/**
 * 
 */
(function(){function n(a){if(!a||typeof a!="object")return a;var g=new a.constructor,c;for(c in a)a.hasOwnProperty(c)&&(g[c]=n(a[c]));return g}function i(a,g){if(a){var c,e=0,b=a.length;if(b===void 0)for(c in a){if(g.call(a[c],c,a[c])===!1)break}else for(c=a[0];e<b&&g.call(c,e,c)!==!1;c=a[++e]);return a}}function k(a,g,c){if(typeof g!="object")return a;a&&g&&i(g,function(e,g){if(!c||typeof g!="function")a[e]=g});return a}function f(a){var g=a.indexOf(".");if(g!=-1){var c=a.slice(0,g)||"*",e=a.slice(g+
1,a.length),b=[];i(document.getElementsByTagName(c),function(){this.className&&this.className.indexOf(e)!=-1&&b.push(this)});return b}}function q(a){a=a||window.event;a.preventDefault?(a.stopPropagation(),a.preventDefault()):(a.returnValue=!1,a.cancelBubble=!0);return!1}function m(a,g,c){a[g]=a[g]||[];a[g].push(c)}function r(){return"_"+(""+Math.random()).slice(2,10)}function h(a,g,c){var e=this,l=null,f=!1,h,s,o=[],u={},w={},v,x,t,z,A,p;k(e,{id:function(){return v},isLoaded:function(){return l!==
null&&l.fp_play!==void 0&&!f},getParent:function(){return a},hide:function(c){if(c)a.style.height="0px";if(e.isLoaded())l.style.height="0px";return e},show:function(){a.style.height=p+"px";if(e.isLoaded())l.style.height=A+"px";return e},isHidden:function(){return e.isLoaded()&&parseInt(l.style.height,10)===0},load:function(b){if(!e.isLoaded()&&e._fireEvent("onBeforeLoad")!==!1){var s=0;i(d,function(){this.unload(function(){if(++s==d.length){if((h=a.innerHTML)&&!flashembed.isSupported(g.version))a.innerHTML=
"";if(b)b.cached=!0,m(w,"onLoad",b);flashembed(a,g,{config:c})}})})}return e},unload:function(c){if(this.isFullscreen()&&/WebKit/i.test(navigator.userAgent))return c&&c(!1),e;if(h.replace(/\s/g,"")!==""){if(e._fireEvent("onBeforeUnload")===!1)return c&&c(!1),e;f=!0;try{l&&(l.fp_close(),e._fireEvent("onUnload"))}catch(b){}setTimeout(function(){l=null;a.innerHTML=h;f=!1;c&&c(!0)},50)}else c&&c(!1);return e},getClip:function(a){a===void 0&&(a=z);return o[a]},getCommonClip:function(){return s},getPlaylist:function(){return o},
getPlugin:function(a){var c=u[a];if(!c&&e.isLoaded()){var g=e._api().fp_getPlugin(a);g&&(c=new b(a,g,e),u[a]=c)}return c},getScreen:function(){return e.getPlugin("screen")},getControls:function(){return e.getPlugin("controls")._fireEvent("onUpdate")},getLogo:function(){try{return e.getPlugin("logo")._fireEvent("onUpdate")}catch(a){}},getPlay:function(){return e.getPlugin("play")._fireEvent("onUpdate")},getConfig:function(a){return a?n(c):c},getFlashParams:function(){return g},loadPlugin:function(a,
c,g,d){typeof g=="function"&&(d=g,g={});var s=d?r():"_";e._api().fp_loadPlugin(a,c,g,s);c={};c[s]=d;d=new b(a,null,e,c);return u[a]=d},getState:function(){return e.isLoaded()?l.fp_getState():-1},play:function(a,c){var g=function(){a!==void 0?e._api().fp_play(a,c):e._api().fp_play()};e.isLoaded()?g():f?setTimeout(function(){e.play(a,c)},50):e.load(function(){g()});return e},getVersion:function(){if(e.isLoaded()){var a=l.fp_getVersion();a.push("flowplayer.js 3.2.6");return a}return"flowplayer.js 3.2.6"},
_api:function(){if(!e.isLoaded())throw"Flowplayer "+e.id()+" not loaded when calling an API method";return l},setClip:function(a){e.setPlaylist([a]);return e},getIndex:function(){return t},_swfHeight:function(){return l.clientHeight}});i("Click*,Load*,Unload*,Keypress*,Volume*,Mute*,Unmute*,PlaylistReplace,ClipAdd,Fullscreen*,FullscreenExit,Error,MouseOver,MouseOut".split(","),function(){var a="on"+this;if(a.indexOf("*")!=-1){var a=a.slice(0,a.length-1),c="onBefore"+a.slice(2);e[c]=function(a){m(w,
c,a);return e}}e[a]=function(c){m(w,a,c);return e}});i("pause,resume,mute,unmute,stop,toggle,seek,getStatus,getVolume,setVolume,getTime,isPaused,isPlaying,startBuffering,stopBuffering,isFullscreen,toggleFullscreen,reset,close,setPlaylist,addClip,playFeed,setKeyboardShortcutsEnabled,isKeyboardShortcutsEnabled".split(","),function(){var a=this;e[a]=function(c,g){if(!e.isLoaded())return e;var b=null,b=c!==void 0&&g!==void 0?l["fp_"+a](c,g):c===void 0?l["fp_"+a]():l["fp_"+a](c);return b==="undefined"||
b===void 0?e:b}});e._fireEvent=function(a){typeof a=="string"&&(a=[a]);var g=a[0],b=a[1],d=a[2],t=a[3],f=0;c.debug&&console.log("$f.fireEvent",[].slice.call(a));!e.isLoaded()&&g=="onLoad"&&b=="player"&&(l=l||document.getElementById(x),A=e._swfHeight(),i(o,function(){this._fireEvent("onLoad")}),i(u,function(a,c){c._fireEvent("onUpdate")}),s._fireEvent("onLoad"));if(!(g=="onLoad"&&b!="player")){if(g=="onError"&&(typeof b=="string"||typeof b=="number"&&typeof d=="number"))b=d,d=t;if(g=="onContextMenu")i(c.contextMenu[b],
function(a,c){c.call(e)});else if(g=="onPluginEvent"||g=="onBeforePluginEvent"){if(t=u[b.name||b])return t._fireEvent("onUpdate",b),t._fireEvent(d,a.slice(3))}else{if(g=="onPlaylistReplace"){o=[];var k=0;i(b,function(){o.push(new j(this,k++,e))})}if(g=="onClipAdd"){if(b.isInStream)return;b=new j(b,d,e);o.splice(d,0,b);for(f=d+1;f<o.length;f++)o[f].index++}var h=!0;if(typeof b=="number"&&b<o.length&&(z=b,(a=o[b])&&(h=a._fireEvent(g,d,t)),!a||h!==!1))h=s._fireEvent(g,d,t,a);i(w[g],function(){h=this.call(e,
b,d);this.cached&&w[g].splice(f,1);if(h===!1)return!1;f++});return h}}};if(typeof a=="string"){var B=document.getElementById(a);if(!B)throw"Flowplayer cannot access element: "+a;a=B}(function(){function l(a){var c=e.hasiPadSupport&&e.hasiPadSupport();if(/iPad|iPhone|iPod/i.test(navigator.userAgent)&&!/.flv$/i.test(o[0].url)&&!c)return!0;!e.isLoaded()&&e._fireEvent("onBeforeClick")!==!1&&e.load();return q(a)}$f(a)?($f(a).getParent().innerHTML="",t=$f(a).getIndex(),d[t]=e):(d.push(e),t=d.length-1);
p=parseInt(a.style.height,10)||a.clientHeight;v=a.id||"fp"+r();x=g.id||v+"_api";g.id=x;c.playerId=v;typeof c=="string"&&(c={clip:{url:c}});if(typeof c.clip=="string")c.clip={url:c.clip};c.clip=c.clip||{};if(a.getAttribute("href",2)&&!c.clip.url)c.clip.url=a.getAttribute("href",2);s=new j(c.clip,-1,e);c.playlist=c.playlist||[c.clip];var f=0;i(c.playlist,function(){var a=this;typeof a=="object"&&a.length&&(a={url:""+a});i(c.clip,function(c,b){b!==void 0&&a[c]===void 0&&typeof b!="function"&&(a[c]=b)});
c.playlist[f]=a;a=new j(a,f,e);o.push(a);f++});i(c,function(a,b){if(typeof b=="function"){if(s[a])s[a](b);else m(w,a,b);delete c[a]}});i(c.plugins,function(a,c){c&&(u[a]=new b(a,c,e))});if(!c.plugins||c.plugins.controls===void 0)u.controls=new b("controls",null,e);u.canvas=new b("canvas",null,e);h=a.innerHTML;setTimeout(function(){h.replace(/\s/g,"")!==""?a.addEventListener?a.addEventListener("click",l,!1):a.attachEvent&&a.attachEvent("onclick",l):(a.addEventListener&&a.addEventListener("click",q,
!1),e.load())},0)})()}function p(a){this.length=a.length;this.each=function(b){i(a,b)};this.size=function(){return a.length}}var j=function(a,b,c){var e=this,d={},f={};e.index=b;typeof a=="string"&&(a={url:a});k(this,a,!0);i("Begin*,Start,Pause*,Resume*,Seek*,Stop*,Finish*,LastSecond,Update,BufferFull,BufferEmpty,BufferStop".split(","),function(){var a="on"+this;if(a.indexOf("*")!=-1){var a=a.slice(0,a.length-1),d="onBefore"+a.slice(2);e[d]=function(a){m(f,d,a);return e}}e[a]=function(c){m(f,a,c);
return e};b==-1&&(e[d]&&(c[d]=e[d]),e[a]&&(c[a]=e[a]))});k(this,{onCuepoint:function(a,o){if(arguments.length==1)return d.embedded=[null,a],e;typeof a=="number"&&(a=[a]);var f=r();d[f]=[a,o];c.isLoaded()&&c._api().fp_addCuepoints(a,b,f);return e},update:function(a){k(e,a);c.isLoaded()&&c._api().fp_updateClip(a,b);var d=c.getConfig();k(b==-1?d.clip:d.playlist[b],a,!0)},_fireEvent:function(a,o,j,h){if(a=="onLoad")return i(d,function(a,d){d[0]&&c._api().fp_addCuepoints(d[0],b,a)}),!1;h=h||e;if(a=="onCuepoint"){var m=
d[o];if(m)return m[1].call(c,h,j)}if(o&&"onBeforeBegin,onMetaData,onStart,onUpdate,onResume".indexOf(a)!=-1&&(k(h,o),o.metaData))h.duration?h.fullDuration=o.metaData.duration:h.duration=o.metaData.duration;var x=!0;i(f[a],function(){x=this.call(c,h,o,j)});return x}});if(a.onCuepoint){var j=a.onCuepoint;e.onCuepoint.apply(e,typeof j=="function"?[j]:j);delete a.onCuepoint}i(a,function(c,b){typeof b=="function"&&(m(f,c,b),delete a[c])});if(b==-1)c.onCuepoint=this.onCuepoint},b=function(a,b,c,d){var f=
this,j={},h=!1;d&&k(j,d);i(b,function(a,c){typeof c=="function"&&(j[a]=c,delete b[a])});k(this,{animate:function(d,e,h){if(!d)return f;typeof e=="function"&&(h=e,e=500);if(typeof d=="string"){var i=d,d={};d[i]=e;e=500}if(h){var k=r();j[k]=h}e===void 0&&(e=500);b=c._api().fp_animate(a,d,e,k);return f},css:function(d,e){if(e!==void 0){var j={};j[d]=e;d=j}b=c._api().fp_css(a,d);k(f,b);return f},show:function(){this.display="block";c._api().fp_showPlugin(a);return f},hide:function(){this.display="none";
c._api().fp_hidePlugin(a);return f},toggle:function(){this.display=c._api().fp_togglePlugin(a);return f},fadeTo:function(b,d,e){typeof d=="function"&&(e=d,d=500);if(e){var g=r();j[g]=e}this.display=c._api().fp_fadeTo(a,b,d,g);this.opacity=b;return f},fadeIn:function(a,b){return f.fadeTo(1,a,b)},fadeOut:function(a,b){return f.fadeTo(0,a,b)},getName:function(){return a},getPlayer:function(){return c},_fireEvent:function(b,d){if(b=="onUpdate"){var e=c._api().fp_getPlugin(a);if(!e)return;k(f,e);delete f.methods;
h||(i(e.methods,function(){var b=""+this;f[b]=function(){var d=[].slice.call(arguments),d=c._api().fp_invoke(a,b,d);return d==="undefined"||d===void 0?f:d}}),h=!0)}return(e=j[b])?(e=e.apply(f,d),b.slice(0,1)=="_"&&delete j[b],e):f}})},d=[];window.flowplayer=window.$f=function(){var a=null,b=arguments[0];if(!arguments.length)return i(d,function(){if(this.isLoaded())return a=this,!1}),a||d[0];if(arguments.length==1)if(typeof b=="number")return d[b];else{if(b=="*")return new p(d);i(d,function(){if(this.id()==
b.id||this.id()==b||this.getParent()==b)return a=this,!1});return a}if(arguments.length>1){var c=arguments[1],e=arguments.length==3?arguments[2]:{};typeof c=="string"&&(c={src:c});c=k({bgcolor:"#000000",version:[9,0],expressInstall:"http://static.flowplayer.org/swf/expressinstall.swf",cachebusting:!1},c);if(typeof b=="string")if(b.indexOf(".")!=-1){var j=[];i(f(b),function(){j.push(new h(this,n(c),n(e)))});return new p(j)}else{var m=document.getElementById(b);return new h(m!==null?m:b,c,e)}else if(b)return new h(b,
c,e)}return null};k(window.$f,{fireEvent:function(){var a=[].slice.call(arguments),b=$f(a[0]);return b?b._fireEvent(a.slice(1)):null},addPlugin:function(a,b){h.prototype[a]=b;return $f},each:i,extend:k});if(typeof jQuery=="function")jQuery.fn.flowplayer=function(a,b){if(!arguments.length||typeof arguments[0]=="number"){var c=[];this.each(function(){var a=$f(this);a&&c.push(a)});return arguments.length?c[arguments[0]]:new p(c)}return this.each(function(){$f(this,n(a),b?n(b):{})})}})();
(function(){function n(){if(j.done)return!1;var b=document;if(b&&b.getElementsByTagName&&b.getElementById&&b.body){clearInterval(j.timer);j.timer=null;for(b=0;b<j.ready.length;b++)j.ready[b].call();j.ready=null;j.done=!0}}function i(b,d){if(d)for(key in d)d.hasOwnProperty(key)&&(b[key]=d[key]);return b}function k(b){switch(f(b)){case "string":return b=b.replace(RegExp('(["\\\\])',"g"),"\\$1"),b=b.replace(/^\s?(\d+)%/,"$1pct"),'"'+b+'"';case "array":return"["+q(b,function(a){return k(a)}).join(",")+
"]";case "function":return'"function()"';case "object":var d=[],a;for(a in b)b.hasOwnProperty(a)&&d.push('"'+a+'":'+k(b[a]));return"{"+d.join(",")+"}"}return String(b).replace(/\s/g," ").replace(/\'/g,'"')}function f(b){if(b===null||b===void 0)return!1;var d=typeof b;return d=="object"&&b.push?"array":d}function q(b,d){var a=[],g;for(g in b)b.hasOwnProperty(g)&&(a[g]=d(b[g]));return a}function m(b,d){var a=i({},b),g=document.all,c='<object width="'+a.width+'" height="'+a.height+'"';if(g&&!a.id)a.id=
"_"+(""+Math.random()).substring(9);a.id&&(c+=' id="'+a.id+'"');a.cachebusting&&(a.src+=(a.src.indexOf("?")!=-1?"&":"?")+Math.random());c+=a.w3c||!g?' data="'+a.src+'" type="application/x-shockwave-flash"':' classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"';c+=">";if(a.w3c||g)c+='<param name="movie" value="'+a.src+'" />';a.width=a.height=a.id=a.w3c=a.src=null;for(var e in a)a[e]!==null&&(c+='<param name="'+e+'" value="'+a[e]+'" />');a="";if(d){for(var f in d)d[f]!==null&&(a+=f+"="+(typeof d[f]==
"object"?k(d[f]):d[f])+"&");a=a.substring(0,a.length-1);c+='<param name="flashvars" value=\''+a+"' />"}c+="</object>";return c}function r(b,d,a){var g=flashembed.getVersion();i(this,{getContainer:function(){return b},getConf:function(){return d},getVersion:function(){return g},getFlashvars:function(){return a},getApi:function(){return b.firstChild},getHTML:function(){return m(d,a)}});var c=d.version,e=d.expressInstall,f=!c||flashembed.isSupported(c);if(f)d.onFail=d.version=d.expressInstall=null,b.innerHTML=
m(d,a);else if(c&&e&&flashembed.isSupported([6,65]))i(d,{src:e}),a={MMredirectURL:location.href,MMplayerType:"PlugIn",MMdoctitle:document.title},b.innerHTML=m(d,a);else if(b.innerHTML.replace(/\s/g,"")===""&&(b.innerHTML="<h2>Flash version "+c+" or greater is required</h2><h3>"+(g[0]>0?"Your version is "+g:"You have no flash plugin installed")+"</h3>"+(b.tagName=="A"?"<p>Click here to download latest version</p>":"<p>Download latest version from <a href='http://www.adobe.com/go/getflashplayer'>here</a></p>"),
b.tagName=="A"))b.onclick=function(){location.href="http://www.adobe.com/go/getflashplayer"};if(!f&&d.onFail&&(c=d.onFail.call(this),typeof c=="string"))b.innerHTML=c;document.all&&(window[d.id]=document.getElementById(d.id))}var h=typeof jQuery=="function",p={width:"100%",height:"100%",allowfullscreen:!0,allowscriptaccess:"always",quality:"high",version:null,onFail:null,expressInstall:null,w3c:!1,cachebusting:!1};if(h)jQuery.tools=jQuery.tools||{},jQuery.tools.flashembed={version:"1.0.4",conf:p};
var j=h?jQuery:function(b){if(j.done)return b();j.timer?j.ready.push(b):(j.ready=[b],j.timer=setInterval(n,13))};window.attachEvent&&window.attachEvent("onbeforeunload",function(){__flash_unloadHandler=function(){};__flash_savedUnloadHandler=function(){}});window.flashembed=function(b,d,a){if(typeof b=="string"){var g=document.getElementById(b);if(g)b=g;else{j(function(){flashembed(b,d,a)});return}}if(b)return typeof d=="string"&&(d={src:d}),g=i({},p),i(g,d),new r(b,g,a)};i(window.flashembed,{getVersion:function(){var b=
[0,0];if(navigator.plugins&&typeof navigator.plugins["Shockwave Flash"]=="object"){var d=navigator.plugins["Shockwave Flash"].description;typeof d!="undefined"&&(d=d.replace(/^.*\s+(\S+\s+\S+$)/,"$1"),b=parseInt(d.replace(/^(.*)\..*$/,"$1"),10),d=/r/.test(d)?parseInt(d.replace(/^.*r(.*)$/,"$1"),10):0,b=[b,d])}else if(window.ActiveXObject){try{d=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7")}catch(a){try{d=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6"),b=[6,0],d.AllowScriptAccess="always"}catch(g){if(b[0]==
6)return b}try{d=new ActiveXObject("ShockwaveFlash.ShockwaveFlash")}catch(c){}}typeof d=="object"&&(d=d.GetVariable("$version"),typeof d!="undefined"&&(d=d.replace(/^\S+\s+(.*)$/,"$1").split(","),b=[parseInt(d[0],10),parseInt(d[2],10)]))}return b},isSupported:function(b){var d=flashembed.getVersion();return d[0]>b[0]||d[0]==b[0]&&d[1]>=b[1]},domReady:j,asString:k,getHTML:m});if(h)jQuery.fn.flashembed=function(b,d){var a=null;this.each(function(){a=flashembed(this,b,d)});return b.api===!1?this:a}})();(function(){function n(){if(!h&&(h=!0,p)){for(var f=0;f<p.length;f++)p[f].call(window,[]);p=[]}}function i(f){var b=window.onload;window.onload=typeof window.onload!="function"?f:function(){b&&b();f()}}function k(){if(!r){r=!0;document.addEventListener&&!m.opera&&document.addEventListener("DOMContentLoaded",n,!1);m.msie&&window==top&&function(){if(!h){try{document.documentElement.doScroll("left")}catch(b){setTimeout(arguments.callee,0);return}n()}}();m.opera&&document.addEventListener("DOMContentLoaded",
function(){if(!h){for(var b=0;b<document.styleSheets.length;b++)if(document.styleSheets[b].disabled){setTimeout(arguments.callee,0);return}n()}},!1);if(m.safari){var f;(function(){if(!h)if(document.readyState!="loaded"&&document.readyState!="complete")setTimeout(arguments.callee,0);else{if(f===void 0){for(var b=document.getElementsByTagName("link"),d=0;d<b.length;d++)b[d].getAttribute("rel")=="stylesheet"&&f++;b=document.getElementsByTagName("style");f+=b.length}document.styleSheets.length!=f?setTimeout(arguments.callee,
0):n()}})()}i(n)}}var f=window.DomReady={},q=navigator.userAgent.toLowerCase(),m={version:(q.match(/.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/)||[])[1],safari:/webkit/.test(q),opera:/opera/.test(q),msie:/msie/.test(q)&&!/opera/.test(q),mozilla:/mozilla/.test(q)&&!/(compatible|webkit)/.test(q)},r=!1,h=!1,p=[];f.ready=function(f){k();h?f.call(window,[]):p.push(function(){return f.call(window,[])})};k()})();(function(n,i){function k(a,b){for(var c=[],d=0;d<a.length;d++)c.push(a[d]);for(d=0;d<c.length;d++)b(c[d])}function f(){k([j,b],function(a){k(i.getElementsByTagName(a),function(b){function c(a){return b.canPlayType(a)||e&&a.search("mp4")>-1}var d=!0,e=navigator.userAgent.toLowerCase().search("android")>-1;b.canPlayType&&(b.src?c(q(a,b.src))&&(d=!1):k(b.getElementsByTagName("source"),function(b){c(q(a,b.src,b.type))&&(d=!1)}));d?f.createFallback(a,b):e&&b.addEventListener("click",function(){b.play()},
!1)})})}function q(a,b,c){return c||u[a][b.split(".").slice(-1)[0]]||s[a]}function m(a,b){var c=a.getAttribute(b);return c==!0||typeof c=="string"}function r(a){return a.substr(0,1)=="/"?w+a:a.substr(0,1)=="."||!a.match(/^\s*\w+:\/\//)?v+a:a}function h(a,b,c){var d=a.getAttribute(b);if(d)return d+"px";if(a.currentStyle)a=a.currentStyle[b];else if(n.getComputedStyle)a=i.defaultView.getComputedStyle(a,null).getPropertyValue(b);else return c;return a=="auto"?c:a}function p(a){return a.match(/\s*([\w-]+\/[\w-]+)(;|\s|$)/)[1]}
var j="video",b="audio";i.createElement(j).canPlayType||k(["video","audio","source"],function(a){i.createElement(a)});var d="";k(i.getElementsByTagName("script"),function(a){a=a.src;a.match(/html5media(\.min|)\.js/)&&(d=a.split("/").slice(0,-1).join("/")+"/")});f.flowplayerSwf=d+"flowplayer.swf";f.flowplayerAudioSwf=d+"flowplayer.audio.swf";f.flowplayerControlsSwf=d+"flowplayer.controls.swf";var a=f.THEORA_FORMAT='video/ogg; codecs="theora, vorbis"',g=f.H264_FORMAT='video/mp4; codecs="avc1.42E01E, mp4a.40.2"',
c=f.VORBIS_FORMAT='audio/ogg; codecs="vorbis"',e=f.WEBM_FORMAT="video/webm;",l=f.M4A_FORMAT="audio/x-m4a;",y=f.MP3_FORMAT="audio/mpeg;",C=f.WAV_FORMAT='audio/wav; codecs="1"',s=f.assumedFormats={video:g,audio:y},o=f.fallbackFormats=[f.H264_FORMAT,f.M4A_FORMAT,f.MP3_FORMAT],u=f.fileExtensions={video:{ogg:a,ogv:a,avi:g,mp4:g,mkv:g,h264:g,264:g,avc:g,m4v:g,"3gp":g,"3gpp":g,"3g2":g,mpg:g,mpeg:g,webm:e},audio:{ogg:c,oga:c,aac:l,m4a:l,mp3:y,wav:C}},w=n.location.protocol+"//"+n.location.host,v=String(n.location);
k(i.getElementsByTagName("base"),function(a){if(a.href)v=a.href});v=v.split("/").slice(0,-1).join("/")+"/";f.configureFlowplayer=function(a,b,c){return c};f.createFallback=function(a,b){var c=m(b,"controls"),d=b.getAttribute("poster")||"",e=b.getAttribute("src")||"",g;e?g=q(a,e):k(b.getElementsByTagName("source"),function(b){var c=b.getAttribute("src");c&&!e&&k(o,function(d){g=q(a,c,b.getAttribute("type"));p(g)==p(d)&&(e=c)})});var l=i.createElement("span");l.id=b.id;l.className=b.className;l.title=
b.title;l.style.display="block";l.style.width=h(b,"width","300px");l.style.height=a=="audio"?"26px":h(b,"height","200px");b.parentNode.replaceChild(l,b);var n=(b.getAttribute("preload")||"").toLowerCase(),s=[];d&&s.push({url:r(d)});e&&s.push({url:r(e),autoPlay:m(b,"autoplay"),autoBuffering:m(b,"autobuffer")||m(b,"preload")&&(n==""||n=="auto"),onBeforeFinish:function(){return!m(b,"loop")}});d={controls:c&&{url:r(f.flowplayerControlsSwf),fullscreen:!1,autoHide:a==j&&"always"||"never"}||null};if(p(g)==
p(y)&&(d.audio={url:r(f.flowplayerAudioSwf)},!c))d.controls={url:r(f.flowplayerControlsSwf),display:"none"},l.style.height=0;c={play:null,playlist:s,clip:{scaling:"fit",fadeInSpeed:0,fadeOutSpeed:0},plugins:d};f.configureFlowplayer(a,b,c);flowplayer(l,{src:r(f.flowplayerSwf),wmode:"opaque"},c)};n.jQuery?jQuery(f):n.DomReady&&DomReady.ready(f);n.html5media=f})(this,document);