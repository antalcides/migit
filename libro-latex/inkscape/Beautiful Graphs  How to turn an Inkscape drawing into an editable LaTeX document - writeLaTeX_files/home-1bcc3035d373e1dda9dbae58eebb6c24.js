function wlUploadZip(e){return typeof filepicker!="undefined"?(filepicker.setKey(e),filepicker.pick({extension:".zip",maxSize:10485760,container:"modal",services:["COMPUTER","DROPBOX","GOOGLE_DRIVE","GMAIL","BOX","GITHUB","URL","FTP","WEBDAV"]},function(e){var t=$("<form>").attr("action","/docs").attr("method","post");t.append($("<input>").attr("type","hidden").attr("name","zip_uri").attr("value",e.url)),t.append($("<input>").attr("type","hidden").attr("name","authenticity_token").attr("value",$('meta[name="csrf-token"]').attr("content"))),$("body").append(t),t.submit()},function(e){e.code!=101&&alert("Sorry, we couldn't upload your file. Please try again. If the problem persists, please contact us.\n"+e.toString())})):alert("Sorry, the file uploader failed to load. Please refresh the page and try again.\n\nIf this problem persists, it may be due to an ad- or script-block extension in your browser, or a network-wide content filter blocking our scripts. You may have to add exceptions for *.writelatex.com and *.filepicker.com in order to upload files.\n\nPlease feel free to contact us, and we'll try to help."),!1}$(document).ready(function(){$("#quotes > li:gt(0)").hide(),setInterval(function(){$("#quotes > li:first").fadeOut(1500).next().fadeIn(1500).end().appendTo("#quotes")},4500),$("#quotes_right > li:gt(0)").hide(),setInterval(function(){$("#quotes_right > li:first").fadeOut(1500).next().fadeIn(1500).end().appendTo("#quotes_right")},4500),$("a[data-rel^='prettyPhoto']").prettyPhoto({hook:"data-rel",show_title:!1,social_tools:!1,theme:"dark_rounded",default_width:1024,default_height:576,image_markup:'<a href="" style="cursor: default;" onclick="javascript:$.prettyPhoto.close(); return false;"><img id="fullResImage" src="{path}" /></a>'}),$("#notice").delay(5e3).fadeOut(1e3)});