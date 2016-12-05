function getSkin() {
	var c = document.cookie;
	var pattern = /skin=([a-z0-9]+)/;
	if (pattern.exec(c)) {
		return RegExp.$1;
	}
	return 'gray';
}
function startHook() {
	var c = document.cookie;
	var pattern = /skin=([a-z0-9]+)/;
	if (pattern.exec(c)) {
		activateSkin(RegExp.$1);
	}
}
function activateSkin(skin) {
	var el = document.getElementById("skin");
	var v = el.getAttribute("href");
	el.setAttribute("href", v.replace(/(\/static)?\/skin\/[a-z0-9_-]+/g,
			"/skin/" + skin));
	el = document.getElementById("logo");
	if (el != null) {
		v = el.getAttribute("src");
		el.setAttribute("src", v.replace(/(\/static)?\/skin\/[a-z0-9_-]+/g,
				"/skin/" + skin));
	}
	var list = document.getElementsByName("skin");
	for (i = 0; i < list.length; i++) {
		el = list[i];
		el.setAttribute("href", "#" + skin);
		el.firstChild.replaceData(0, el.firstChild.nodeValue.length, skin);
	}
	$('#skinMsg').html('You are currently using the skin <a name="skin" href="#'+skin+'">'+skin+'</a>.');
}
function setSkin(skin) {
	document.cookie = "skin=" + skin + "; Path=/";
	activateSkin(skin ==''? 'gray' : skin);
}
function unsetSkin(skin) {
	document.cookie = "skin=; Path=/";
	activateSkin('gray');
	$('#skinMsg').html('You have no skin defined. The default is used.');
}

var voteName = new Array("", "poor", "flawed", "good", "very good", "excellent");

function voteHover(n, skin) {
	for (i = 1; i < 6; i++) {
		$('#s'+i).attr('src', '/skin/' + skin + '/vote/' + (i <= n ? 1 : 0) + ".png");
	}
	$("#sVote").html(voteName[n]);
	$("#vote").attr('value',n);
}
function toggleOptions(id, idx) {
	var path=$('#'+idx).attr('src').replace(/\/[^\/]*$/, "/");
	if ($('#'+id).css('display') == 'none') {
		$('#'+idx).attr('src',path+'down.png');
		//document.cookie = idx + "=none; Path=/";
	} else {
		$('#'+idx).attr('src',path+'right.png');
		//document.cookie = idx + "=inline; Path=/";
	}
	$('#'+id).slideToggle(100);
}
function checkCondition(value, message) {
	if (value) {
		portalMessage('Validation failure', message);
		return false;
	}
	return true;
}
function checkNotContains(value, pattern, field) {
	return checkCondition((value.match(pattern)), "The " + field
			+ " may not contain "+pattern+". Please provide a proper value.");
}
function checkEmail(value, field) {
	if (value.match(/^[a-zA-Z0-9.-]+@localhost$/))
		return true
	return checkCondition((!value
            .match(/^[a-zA-Z0-9_:;,=+*.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9_:;,=+*.-][a-zA-Z0-9_:;,=+*.-]+$/)), field
			+ " looks strange. Please provide a proper value.");
}
function checkEmpty(value, field) {
	return checkCondition((value == ""), "The " + field
			+ " is missing. Please provide a value.");
}
function checkMaxLength(value, len, field) {
	return checkCondition((value.length > len), "The " + field
			+ " is too long. Please restrict yourself to " + len
			+ " characters at most.");
}
function portalMessage(title, text) {
	$("#portal-message").dialog("close");
	$("#portal-message").empty();
	$("#portal-message").text(text);
	$("#portal-message").dialog({
		modal : false,
		title : title,
		width : 400,
		buttons : {
			Ok : function() {
				$(this).dialog("close");
			}
		}
	});
	$("#portal-message").dialog("open");
}
function portalConfirm(title, text) {
	// $("#portal-message").empty();
	// $("#portal-message").text(text);
	// $("#portal-message").dialog({modal:true,
	// title: title,
	// buttons: { Ok: function() { $( this ).dialog( "close" ); }} });
	// $( "#portal-message" ).dialog( "open" );
	return confirm(text);
}
function loginPane() {
	$('#drop').slideToggle(100);
}
function loginPaneButton() {
	$.ajax({
		url:"/user/ajaxLogin",
		dataType: 'html',
		data: { account: $('#d_account').val(), password:$('#d_password').val() },
		success: function(name) {
			if (name == 'null') {
				portalMessage("Login failed", "The combination of account and password is not valid. If you have forgotten your account or password please use the login page.")
			} else {
				$('#user').html(name)
				$('#logout').css('display','inline')
				$('#join').css('display','none')
				$('#login').css('display','none')
				$('#loginDrop').css('display','none')
				location.reload();
			}
		},
		error: function(a,b,c) {
			alert('error '+a.status);
		}
	});
	return false;
}
function logoutPaneButton() {
	$.ajax({
		url:"/user/ajaxLogout",
		dataType: 'html',
		data: { },
		success: function(name) {
				$('#user').html('')
				$('#logout').css('display','none')
				$('#join').css('display','inline')
				$('#login').css('display','inline')
				$('#loginDrop').css('display','inline')
		}
	});
	return false;
}
function updateRatings(pkg,skin) {
	$.ajax({
		url:"/vote/ajaxSummary",
		dataType: 'json',
		data: { pkg: pkg },
		success: function(data) {
			if(data==null) return;
			jQuery('#rateSum').html(data.avg + ' [' + data.count + (data.count==1?'&nbsp;vote]':'&nbsp;votes]'));
			var p = '/skin/'+skin+'/vote/'
			for ( var i=1; i<=5; i++ ) {
				$('#rateSum'+i).attr('src', p+(data.avg<=i-0.4?'0.png':'1.png'));
				$('#rateBar'+i).width(data.distribution[i].percent+'%');
				$('#rateNo'+i).html('['+data.distribution[i].count+']');
			}
		}
	});
}
function updateRatingsOnly(pkg,skin) {
	$.ajax({
		url:"/vote/ajaxSummary",
		dataType: 'json',
		data: { pkg: pkg },
		success: function(data) {
			jQuery('#rateSum').html(data.avg + ' [' + data.count + (data.count==1?'&nbsp;vote]':'&nbsp;votes]'));
			if (data.count == 0) {
				jQuery('#rat-1').css('display','none');
				jQuery('#rat-0').css('display','inline');
			} else {
				jQuery('#rat-0').css('display','none');
				jQuery('#rat-1').css('display','inline');
			}
			var p = '/skin/'+skin+'/vote/'
			for ( var i=1; i<=5; i++ ) {
				$('#rateSum'+i).attr('src', p+(data.avg<=i-0.4?'0.png':'1.png'));
			}
		}
	});
}
function updateRatingsProfile(account,skin) {
	$.ajax({
		url:"/vote/ajaxProfile",
		dataType: 'json',
		data: { account: account },
		success: function(data) {
			jQuery('#ratePro').html(data.count + (data.count==1?'&nbsp;package]':'&nbsp;packages'));
			for ( var i=1; i<=5; i++ ) {
				$('#rateProBar'+i).width(data.distribution[i].percent+'%');
				$('#rateProNo'+i).html('['+data.distribution[i].count+']');
			}
		},
		error: function(a,b,c) { alert(a.toString()+' '+b+' '+c)}
	});
}
function updateComments(offset,max,skin,pkg) {
	$.ajax({
		url:"/vote/ajaxVoteList",
		dataType: 'html',
		data: { pkg:pkg, skin:skin, offset:offset, max:max },
		success: function(html) {
			$("#commentList").html(html);
		},
		error: function(a,b,c) { alert(a.toString()+' '+b+' '+c)}
	});
}
$(function() {
	$('#drop').html('<form><p>Account: <input id="d_account" type="text"/></p>'+
			'<p>Password: <input id="d_password" type="password"/></p>'+
			'<p><input type="submit" value="Login" onclick="return loginPaneButton();" /></p></form>');
	$("#message").dialog({
		modal : false,
		buttons : {
			Ok : function() {
				$(this).dialog("close");
			}
		}
	});
//	$('#spinner').ajaxStart(function() {
//		$(this).fadeIn();
//	}).ajaxStop(function() {
//		$(this).fadeOut();
//	});
});
