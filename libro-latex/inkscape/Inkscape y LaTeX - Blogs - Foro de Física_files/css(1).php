@charset "UTF-8";
/* CSS Document */

.postbit-lite {
	clear:both;
	position:relative;
	padding-bottom:10px;
	background: #fafafa none   ;
}

.postbit.postbit-lite {
	border:0;
}
.postbit-lite.noavatar {
	padding-left:0;
}

.postbit-deleted,
.postbit-ignored {
	padding-left:0;
}

.postbit-deleted .postcontent.deletereason dt, .postbit-deleted .postcontent.deletereason dd {
	display:block;
}

.postbit-deleted .posttext .deletedby {
	font-weight:bold;
}

.postbit-deleted .managelinks {
	float:right;
	margin-right:10px;
}

.postbit-deleted .managelinks a {
	margin-left:1em;
	text-decoration:none;
	font-size:11px;
}

.postbit-lite dl.stats.groups {
	font-size:11px;
	margin-left:80px;
	margin-bottom:-10px;
	font-weight:normal;
}

.postbit-lite dl.stats.groups dd {
	padding-right:10px;
}

.postbit-lite p.moderated {
	padding:10px 10px 0;
}

.postbit-lite.imod_highlight,
.postbit-lite.imod_highlight .blocksubhead,
.postbit-lite.imod_highlight:hover .blockfoot {
	background:#fff1c2 none no-repeat 10px 10px;
}

.postbit-lite .postbithead {
	color: #3e3e3e;
	background: #D8E7F7 none   ;
	border: 1px solid #4E8CD5;
	padding: 5px 10px;
	margin-left:80px;
	text-align: left;
}

.postbit-lite .postbithead label {
	margin-right: 300px;
	display: block;
}

.postbit-lite .postbit-chkbox {
	position: absolute;
	right: 10px;
	margin-top: 5px;
}

.postbit-lite .avatarlink {
	float: left;
	clear: right;
}

.postbit-lite .avatarlink img {
	max-height:60px;
	width: auto;
}

.postbit-lite .username {
	font-weight:normal;
}

.postbit-lite .posttext {
	padding:10px;
	font:   13px Tahoma,Calibri,Verdana,Geneva,sans-serif;
	margin-left:80px;
}

.postbit-lite .postbithead.no_avatar,
.postbit-lite .posttext.no_avatar,
.postbit-lite .postinfo.no_avatar {
	margin-left:0;
}

.postbit-lite .posttext ul, .postbit-lite .posttext ol, .postbit-lite .posttext dl {
	margin:0 40px;
}

.postbit-lite.noavatar .posthead, .postbit-lite.noavatar .posttext, .postbit-lite.noavatar p.moderated {
	margin-left: 0;
}

.postbit-lite .postinfo {
	color:#666666;
}

.postbit-lite .postbitfoot {
	position: absolute;
	top: 5px;
	right: 20px;
}

.postbit-lite .postbitfoot .postcontrols li {
	display: inline;
	position: relative;
	top: -3px;
}

.postbit-lite .postbitfoot .postcontrols li.separator {
	color: #4E8CD5; /* do not change, makes the separator appear like a border */
	font-size: 17px;
	position: relative;
	top: -2px;
}

.postbit-lite .postbitfoot .postcontrols a {
	color: #417394;
}

.postbit-lite .postbitfoot .postcontrols li img {
	position: relative;
	top: 2px;
}

.postbit-lite .postbitfoot .postcontrols a, .postbit-lite .postbitfoot .postcontrols a:hover {
	border:0;
	padding:0;
	font-size: 11px;
	margin-right: 10px;
}

.postbit-lite .postbitfoot .postcontrols a:hover {
	text-decoration: none /* to preserve normal style of links. do not change */
}

.postbit-lite input.inlinemod {
	position:relative;
	top:2px;
}

.postbit-lite.moderated-picturecomment {
	padding-left:0;
}

.postbit-lite.moderated-picturecomment .postbithead,
.postbit-lite.moderated-picturecomment .posttext,
.postbit-lite.moderated-picturecomment .stats.groups,
.postbit-lite.moderated-picturecomment .posttext {
	margin-left:170px
}

.postbit-lite img.statusicon,
.postbit-lite img.posticon {
	vertical-align:top;
}

.postbit-lite .title img {

}

/* Moderated Picture Comments Attachent */
.avatarlink.pc-attachment {
	width:150px;
	font-size:11px;
	text-align:center;
}

.avatarlink.pc-attachment img {
	width:150px;
}
.postbit-lite .comment_blockrow label {
	margin-right: 300px;
	display: block;
}

.postbit-lite .comment_blockrow {
	color: #3e3e3e;
	float: right;
	width: 100%;
}

.postbit-lite .comment_text {
	clear: right;
}

.postbit-lite .postbit_headers {
	background: #D8E7F7 none   ;
	border: 1px solid #4E8CD5;
}

.postbit-lite .postbit_pb_right {
	margin-left: 80px;
}
.postbit-lite .postbit_pb_left {
	float: left;
}

.postbit-lite .comment_blockrow .floatleft {
	float: left;
	padding: 5px 10px 5px 10px;
}
.postbit-lite .comment_blockrow .floatright {
	float: right;
}
.postbit-lite .comment_blockrow.no_avatar {
	margin-left:0;
}
.postbit-lite .floatright .postcontrols {
	float: right;
}
.postbit-lite .floatright .postcontrols li {
	display: inline-block;
	padding: 5px;
}
.postbit-lite .floatright .postcontrols a,
.postbit-lite .floatright .postcontrols {
	color: #417394;
	font-size: 11px; 
}
.postbit-lite .floatright .postcontrols li img {
	position: relative;
	top: 2px;
}
.postbit-lite .postbit_pb_right .restore_margin {
	margin-left: 0;
}
.postbit-lite div.post_message_blockrow {
	float: right; 
	width: 100%;
}


/* ------------------- */
/* MAIN CONTENT */
.body_wrapper {
	background: rgb(255, 255, 255) none   ;
}

#content_container {
	width:100%;
	float:left;
	margin-right: -290px;
	padding: 10px 0;
}
#content_container.contentright {
	float:right;
	margin-right:0;
	margin-left:-280px;
}

#content_container #content {
	margin-right:290px;
}
#content_container.contentright #content {
	margin-right:0;
	margin-left:280px;
}

#content .block {}

#content #blogheader {
	margin-top:5px;
	margin-bottom:10px;
	text-transform:none;
}

#content .blockhead a {
	color:#3c6b9b;
}

#content #pagination_bottom {
	text-align: right;
}

/* remove styling for inlinemod */
#content #inlinemod_formctrls .popupctrl {
	background: transparent;
	color: #3c6b9b;
	font-size: 11px;
	font-weight: normal;
	padding: 0;
	border: 0;
	position:relative;
	top: -3px;
}

#content #inlinemod_formctrls .popupctrl .ctrlcontainer {
	background: transparent url(images/misc/black_downward_arrow.png) no-repeat right center;
	padding: 3px 5px;
	padding-right: 15px;
}

#pagination_bottom {
	float: right;
	margin-bottom: 2em;
}

#pagination_top {
	clear:both;
	float: right;
}
/* ------------------ */
/* PAGE TITLE */
#pagetitle {
	border-bottom:3px solid #425769;
	padding-bottom:1px;
	margin-bottom:5px;
}
#pagetitle h1 {
	font:   bold 140% Tahoma, Calibri, Verdana, sans-serif;
	color:#424242;
	display:block;
}
#pagetitle #rssicon {
	display:block;
	float:right;
	padding-left:5px;
	position: relative;
	top: 10px;
}

#pagetitle .pagetitleinfo {
	float: right;
	display:block;
	position: relative;
	top: -3px;
}

#pagetitle #blog_imodsel {
	position: relative;
	top: 10px;
}
#pagetitle .description{
	display:block;
	font:  normal 88% Tahoma, Calibri, Verdana, sans-serif;
	color:#828282;
}

/* New Entry button */
.actionbutton_container {
	margin-bottom:1em;
	text-align:right;
}

#pagetitle a.pagetitleinfo.textcontrol, .actionbutton_container a.pagetitleinfo.textcontrol {
	background: #4E8CD5 url(images/buttons/newbtn_middle.png) repeat-x left top;
	_background-image: none;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	-moz-box-shadow: 0 3px 8px #98BEEA;
	-webkit-box-shadow: 0 3px 8px #98BEEA;
	box-shadow: 0 3px 8px #98BEEA;
	font:   normal 14px Arial, sans-serif;
	color: #D8E7F7;
	padding: 4px 15px 4px 15px;
	border: 0  ;
	display:inline-block;
}

#pagetitle a.pagetitleinfo.textcontrol:hover, .actionbutton_container a.pagetitleinfo.textcontrol:hover {
	background: #7badea url(images/buttons/newbtn_middle.png) repeat-x left top;
	_background-image: none;
	display:inline-block;
	color: #D8E7F7;
}

#pagetitle a.pagetitleinfo.textcontrol span, .actionbutton_container a.pagetitleinfo.textcontrol span {
	font:  normal 14px Arial, sans-serif;
	font-size:15px;
	font-weight:bold;
	display:inline;
}

#rssicon {
	margin-top:0.765px;
}


/* -------------------- */
/* PAGE VIEW */
.blog_header {
	font-size:16px;
	padding: 2px 0;
	margin: 0;
	display: inline;
	font-weight: bold;
}
h1#blog_title {
	font-size:150%;
}

a.trackbacks {
	background:transparent url(images/misc/blog/trackback.png) no-repeat scroll right bottom;
	padding-right:20px;
}

.fly {
	float: right;
	display: inline;
	font-size: 88%;
}


.lastedited, div.tags, dl.blogcategory, .smallfont {
	font-size: 11px;
}

.blogmeta .tags img {
	display: none;
}

.blogmeta .tags:hover img {
	display: inline;
	margin-top: -5px;
}

.blog_date, .comment_date {
	font-size: 11px;
	/*color:#3e3e3e;*/
}

.blogcontent {
	margin-top:8px;
	margin-bottom:8px;
	font:   13px Tahoma,Calibri,Verdana,Geneva,sans-serif;
}

.blogcontent ul, .blogcontent ol, .blogcontent dl {
	margin:0 40px;
}

#navlinks {
	background: #D8E7F7 none   ;
	border-top: 1px solid #4E8CD5;
	padding: 6px;
	margin-bottom: 1em;
	text-align: center;
	color: #3c6b9b;
	font-size: 13px;
}
.bookmarks {
	margin: 10px 0;
	text-align: right;
}

.entrycontrols {
	text-align: right;
	clear:both;
	font-size: 11px;
}

.entrycontrols li {
	display: inline;
}

.entrycontrols li.separator {
	padding-left: 2px;
	color: #d8d8d8;
}

.entrycontrols li a {
	color: #3e3e3e;
}

.entrycontrols a img {
	position: relative;
	top: 3px;
}
.commentsheader { /* heading for comments block in page view */
	font-size: 140%;
	font-weight: bold;
	margin: 3px 0;
	padding: 1em 0 10px;
}

#above_comments {
	margin-bottom: 1em;
}

#above_comments .popupgroup {
	clear:both;
	margin: -2em 0 1em;
}

.commenthead img {
	position: relative;
	top: -3px;
}

/* BLOG COMMENTS (overwrite postbit/postbitlite default css) */
.postbit {
	width: auto;
}

.postbithead a.username {
	color:#3c6b9b;
	font-weight:bold;
}

.postbit-lite .avatarlink {
	left:0;
	_left:-60px;
	position:absolute;
	top:0;
}

.postbit-lite .texteditor {
	margin-left: 80px;
	clear: both;
}

.postbit-lite .commenthead {
	margin-left: 80px;
}

.postbit-lite .postbithead {
	float: left;
	width: 100%;
	padding: 5px 0;
	margin-left: 0;
}

.postbit-lite .postbithead label {
	float: left;
	clear: right;
	width: 45%;
	margin-right: 0;
	margin-left: 1em;
}

.postbit-lite .postbitfoot {
	float: right;
	position: relative;
	right: 0;
	top: 0;
	width: 40%;
	margin-right: 2em;
}

.postbit-lite .postbitfoot ul {
	text-align: right;
}

.postbit-lite .postbitfoot li {
	white-space: nowrap;
}

#qc_form .actionbuttons {
	padding-top:10px;
}

#trackbackurl input {
	width: 40%;
	border: 1px solid #c8c8c8;
}

.trackbacks_block {
	font-size: 12px;
}

/* TAG CLOUD */
a.tagcloudlink:link, a.tagcloudlink:visited { text-decoration:none; }
a.tagcloudlink:hover, a.tagcloudlink:active { text-decoration:underline; }
a.taglistlink:link, a.taglistlink:visited { text-decoration:none; display: block; }
a.taglistlink:hover, a.taglistlink:active { text-decoration:underline; display: block; }
a.level1 { font-size: 9px; }
a.level2 { font-size: 12px; }
a.level3 { font-size: 15px; }
a.level4 { font-size: 18px; }
a.level5 { font-size: 21px; }
#tag_edit_list {
	list-style:none;
	margin:0px;
	padding:0px;
}
#tag_edit_list li {
	float:left;
	display:block;
	width:200px;
}
#tag_edit_list li.mine {
	font-weight:bold;
}
/* END TAG CLOUD */

/* ---------------------- */
/* LIST VIEW */
.blog_comments_count {
	float: left;
	clear: right;
	text-align: left;
	font-weight: bold;
	font-size: 12px;
	margin-left: 10px;
}

.blog_comments_count img {
	position:relative;
	top:2px;
}

.continuereading {
	position: absolute;
	right: 10px;
	font-size: 12px;
	font-weight:bold;
	text-align:right;
}
.continuereading a {
	color:#3c6b9b;
}

.continuereading img {
	position:relative;
	top:2px;
}

a.blogentrylink {
	font:  bold 12px Tahoma,Calibri,Verdana,Geneva,sans-serif;
}

.bloglist {
	padding 0;
	float:left;
	width:100%;
	clear:both;
}

.bloglist > li {
	float:left;
	width:100%;
	clear:both;
}

.bloglist > li.featured {
	margin-bottom:1em;
}

.bloglist .blogentrybit.imod_highlight {
	background-color:#fff1c2;
}
.bloglistitems li {  /* MEMBERINFO group blogs list */
	display:inline;
}

/* tabular data */
.bloglistinfo {
	width: auto;
} 
.blogliststats {
	width: 100px;
	text-align:center;
}
.bloglistcomments { 
	width: 125px;
	text-align:center;
}
.bloglistlastpost {
	width: 200px;
}
.bloglistnotification {
	width: 108px;
}
.bloglistnotification input {
	float: right; 
	vertical-align: middle;
}

.bloglistimod {
	width: 50px;
	text-align:center;
	vertical-align:middle;
}
.bloglistimod span {
	padding: 13px 0; 
	text-align:center; 
	vertical-align:middle;
}

#blogentries {
	margin-bottom:1em;
}

/* blog entries */
.blogentrybit h4 {
	padding-right:2px;
	color:#3c6b9b;
	font-size:16px;
	line-height:35px;
}

.blogentrybit h4 a {
	font-weight:bold;
}

.blogentrybit h4 input[type="checkbox"] {
	float:right;
}

.blogentrybit {
	border-top: 1px dotted #4E8CD5;
	padding: 15px 0 10px;
	background: transparent none   ;
}

.blogentrybit:first-child, div.blogentrybit {
	border-top:none;
	padding-top:5px;
}

.below_blogentry {
	width: 100%;
	clear:both;
	margin: 0.5em 0 0;
	float: left;
	position: relative;
}

.below_blogentry div {
	width: 50%;
}


/* Featured Entry */
li.blogentrybit.featured {
	border:1px solid #4E8CD5;
	background:#D8E7F7 url(images/webfisica/gradient-background-down.png) repeat-x  ;
	padding:0 0 10px;
	-moz-border-radius:5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}
li.blogentrybit.featured .wrapper {
	padding: 0;
	-moz-border-radius:5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}
li.blogentrybit.featured p.featured {
	color:#424242;
	font-weight:normal;
	padding:5px 10px;
	background: #B9D3EE url(images/webfisica/gradient-border-down.png) repeat-x  ;
	-moz-border-radius-topleft:5px;
	-moz-border-radius-topright:5px;
	-webkit-border-top-left-radius: 5px;
	-webkit-border-top-right-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}
li.blogentrybit.featured p.featured a {
	font-weight:bold;
}
li.blogentrybit.featured p.featured img {
	position:relative;
	top: 2px;
}
li.blogentrybit h4, li.blogentrybit div.blogbit {
	margin-left:80px;
}

.blog_subscribe_link {
	text-align:right;
}

.blograting.rating1{ background-image:url(images/rating/rating-trans-15_0.png); padding-left:80px;}
.blograting.rating1{ background-image:url(images/rating/rating-trans-15_1.png); padding-left:80px;}
.blograting.rating2{ background-image:url(images/rating/rating-trans-15_2.png); padding-left:80px;}
.blograting.rating3{ background-image:url(images/rating/rating-trans-15_3.png); padding-left:80px;}
.blograting.rating4{ background-image:url(images/rating/rating-trans-15_4.png); padding-left:80px;}
.blograting.rating5{ background-image:url(images/rating/rating-trans-15_5.png); padding-left:80px;}

.blograting
{
	 background:transparent none no-repeat left top;
}

.featurepost_img {
	display: block;
	padding: 2px;
	float:left;
}
.blogsubheader {
	background:#B9D3EE url(images/gradients/subheading-gradient-alpha.png) repeat-x;
	border-bottom:solid 1px #6b91ab;
	text-align: center;
	font-size:9px;
	padding:5px 0;
}


/*-----------------------------------*/
/* SIDEBAR */
#sidebar_container {
	float:right;
	width:270px;
	padding:10px 0;
	margin-bottom:3em;
}

#sidebar_container .block {
	margin-bottom:4px;
	padding:6px;
	background:#B9D3EE url(images/misc/blog/top-highlight.png) repeat-x left top;
	-moz-border-radius-topleft:5px;
	-moz-border-radius-topright:5px;
	-webkit-border-top-left-radius: 5px;
	-webkit-border-top-right-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

#sidebar_container .blockbody {
	color: #424242;
	background:#f4f9fd;
	-moz-border-radius:5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	padding:0;
	border:1px solid #4E8CD5;
}

#sidebar_container .adblock {
	padding-top: 15px;
}

#sidebar_container .blockrow {
	color: #424242;  
	padding: 10px 6px 10px 6px; 
	border-top: 1px solid rgb(255, 255, 255);
	background:#f4f9fd url(images/webfisica/gradient-background-down.png) repeat-x  ;
	-moz-border-radius:5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}

#sidebar_container .blockrow a {
	color: #417394;  
}

#sidebar_container .blockrow a:hover {
	color: #417394;  
}

#sidebar_container .underblock {
	height:9px;
	background:transparent url(images/gradients/bottom-shadow.png) repeat-x left bottom;
}

#blog_user_sidebar, #blog_sidebar_generic {
	background-color:#B9D3EE;
	border:1px solid #4E8CD5;
	-moz-border-radius:5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;

	-moz-box-shadow:-2px 2px 2px #c8c8c8;
	-webkit-box-shadow:-2px 2px 2px #c8c8c8;
	box-shadow:-2px 2px 2px #c8c8c8;

}

#blog_user_sidebar .blocksubhead.moveable {
	cursor:move;
}

/* SIDEBAR TABS */
.blogitems li{
	display: block;
	width: 71px; /* is it always three? can this be changed in any way? */
	float:left;
	text-align:center;
}
.blogitems #processicon {
	width: 20px;
}
.blogitems #vb_bloglatest_latest span, .blogitems #vb_bloglatest_latest_link a {
	border-left:1px solid #4E8CD5;
}
.blogitems li a {
	display:block;
	border-right:1px solid #4E8CD5;
	border-top:1px solid #4E8CD5;
	background:#D8E7F7 none   ;
	padding:5px;
	-moz-border-radius-topleft:5px;
	-moz-border-radius-topright:5px;
	-webkit-border-top-left-radius: 5px;
	-webkit-border-top-right-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}
.blogitems li span {
	border-right:1px solid #4E8CD5;
	border-top:1px solid #4E8CD5;
	background:rgb(255, 255, 255) none   ;
	display:block;
	padding:5px;
	-moz-border-radius-topleft:5px;
	-moz-border-radius-topright:5px;
	-webkit-border-top-left-radius: 5px;
	-webkit-border-top-right-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

#whatsnewsidebar div.blocksubhead.smaller {
	height:41px;
	font:   bold 12px Tahoma,Calibri,Verdana,Geneva,sans-serif;
	padding-bottom:0;
}

#whatsnewsidebar div.blocksubhead.smaller a {
	color:#a68e3f;
}

#whatsnewsidebar div.blocksubhead.smaller a, #whatsnewsidebar div.blocksubhead.smaller span {
	display:block;
	_display:inline-block;
	_margin: 0;
	height:30px;
	padding-left:6px;
	padding-right:6px;
}
/* END SIDEBAR TABS */

#sidebar_container.sidebarleft {
	float:left;
}

#sidebar_container .blocksubhead {
	padding:10px 6px;
	color: #4E8CD5;
}

#sidebar_container .blocksubhead {
	background:transparent none;
	padding: 5px 6px;
	border:none;
	outline:none;
	font-weight:bold;
}

#sidebar_container .blocksubhead img {
	float:right;
	vertical-align:middle;
}

#sidebar_container .blocksubhead img.inlineimg {
	float: none;
	position: relative;
	top: -2px;
}

.smallavatar {
	height:30px;
	width:30px;
	overflow:hidden;
	float:left;
}

div.smallavatartext {
	font-size: 11px;
	margin-left: 40px;
	margin-top: -30px;
	float:right;
	width:202px;
}

.blog_home_list_item .blog_home_bit_icon {
	position:absolute;
	left:6px;
	top:5px;
	display:block;
	max-width:30px;
	max-height:30px;
	overflow:hidden;
	text-align:center;
	padding: 0;
	margin: 0;
}

#c_blog_calendar th {
	text-align:center;
}

#c_blog_calendar td a {
	font-weight:bold;
}
.simpleday {
	display:block;
	padding:3px;
	text-align: center;
	font-size:9px;
}
.today {
	border-color:rgb(255,68,0);
	background:rgb(255,255,200);
}

#sidebar_container .blocksubhead.smaller {
	font-size:13px;
	font-weight: bold;
}

#sidebar_container .blockrow {
	font-size:12px;
}

#sidebar_container .blockrow .meta {
	font-size:11px;
}

#sidebar_container .blocksubhead a.username {
	padding-right:20px;
}

#sidebar_container .blocksubhead a.username.offline {
	background:url(images/statusicon/user-offline.png) top right no-repeat;
}

#sidebar_container .blocksubhead a.username.online {
	background:url(images/statusicon/user-online.png) top right no-repeat;
}

#sidebar_container .blocksubhead a.username.invisible {
	background:url(images/statusicon/user-invisible.png) top right no-repeat;
}

#sidebar_container .formcontrols .blockrow label {
	width:auto;
}

#sidebar_container .advanced.blockfoot {
	padding:6px;
	border-bottom:none;
	font-size:88%;
	font-weight:bold;
	background: transparent;
}

/* Main Block */

#sidebar_container .mainblock .blocksubhead .username {
	font-size: 115%;
	color:#4E8CD5;
}
#sidebar_container .mainblock dl.userstats dt {
	float:left;
	color:#666666;
	margin-right:3px;
}

#sidebar_container .mainblock dl.userstats dt:after {
	content:":";
}

#sidebar_container .mainblock dl.userstats dd {
	padding-left:3px;
	padding-bottom:1px;
}

/* End - Main Block */
/* Search Block */

#cb_titleonly {
	vertical-align:text-bottom;
	*vertical-align:middle;
}

#sidebar_container .searchblock .advanced a {
	line-height:2;
}

#sidebar_container .searchblock .advanced .button {
	float:right;
}

#c_blog_search #quicksearch_blog_text {
	width:240px;
	border: 1px solid #c8c8c8;
}
#c_blog_search label.titleonly {
	float:right;
	margin-top:6px;
	font-size:88%;
}
#c_blog_search .controls {
	padding-top:6px;
	border-bottom:none;
	font-size:88%;
	font-weight:bold;
}
#c_blog_search .controls a {
	float:left;
	padding-top:5px;
}
#c_blog_search .controls input {
	float:right;
}

/* End - Search Block */

div.block_category_list { /* sidebar categories */
	overflow:hidden;
	white-space:nowrap;
}
div.sidebar_custom_block { /* sidebar custom */
	overflow:hidden
}

/* Category Block */

#sidebar_container ol.hideoverflow {
	overflow:hidden;
	white-space:nowrap;
	margin-bottom:2px;
}

#sidebar_container ol.hideoverflow.commalist {
	white-space:normal;
}

#sidebar_container ol.hideoverflow li {
	margin-bottom:2px;
}

#sidebar_container .categoryblock ol.folderlist li img {
	vertical-align:middle;
}

/* End - Category Block */

ul.recent_visitors_list li { /* sidebar visitors recent */
	display:inline;
	margin-right:3px;
}


/* ---------------- */
/* BLOG CP */
fieldset form, div.fieldsetpad {
	display:block; padding:6px; 
}
div.checkbox_ctrls { 
	margin-bottom:6px; 
}
label.show_avatars_ctrl {
	float:left; 
}
div.submitrow {
	text-align:right; 
}
.entryposter { /* div used in the customized user css for display purposes */
	background:#CCFFFF; 
}
.searchbox_wrapper {
	text-align: center; 
	padding: 10px;
}
.searchbox_wrapper .bginput{width: 500px;}

.restrain_container .formcontrols .blockrow input.full.primary, .contentright .formcontrols .blockrow input.full.primary {
	width: 90%;
	_display: inline;
}

/* BLOG CP MANAGE GROUPS */
ul.userlist {
	list-style:none; 
	padding:0px; 
	margin:0px; 
}
ul.userlist li { 
	float:left; 
	margin-right:6px; 
	margin-bottom:6px; 
	width:175px; 
}
ul.userlist hr { 
	display:none; 
}

/* avatars shown */
ul.userlist_showavatars li { 
	position:relative; 
	width:215px; 
	height: 60px; 
	border:solid 1px silver; 
	padding:4px; 
	overflow: hidden;
}
ul.userlist_showavatars label.avatar_label img { 
	float: left; 
}
ul.userlist_showavatars div.username { 
	position:relative; 
}
ul.userlist_showavatars div.username a { 
	position:relative; 
	left:6px; 
	vertical-align:top; 
	font-weight:bold; 
}
ul.userlist_showavatars div.userstatus { 
	position:relative; 
	left:6px; 
	padding-top:4px; 
}
ul.userlist_showavatars div.username input { 
	position:absolute; 
	left:0px;
	top:0px; 
}

/* avatars hidden */
ul.userlist_hideavatars li {
	position:relative; 
	width:215px; 
	border:solid 1px silver; 
	padding:4px; 
}
ul.userlist_hideavatars label.avatar_label img {
	display:none; 
}
ul.userlist_hideavatars div.username a {
	font-weight:bold; 
}
ul.userlist_hideavatars div.userstatus { 
	float:left; 
}

/* END BLOG CP MANAGE GROUPS */

/*------------------------------*/
/* MEMBER BLOGS */
/* Blog List */
dl.blogbit, tr.blogbit {
	background: #FAFAFF url(images/gradients/form-control-gradient-alpha.png) repeat-x bottom center;
}
/* End Blog List */
/*-------------------------------*/
/* BLOG SETTINGS */
/* Blog Categories List */
.blogcatdescription {
	width:220px;
}
.blogcatdisplayorder {
	width:100px;
	text-align:center;
}
.blogcatblogentries {
	width:100px;
	text-align:center;
}
dl.blogcatbit, tr.blogcatbit {
	background: #FAFAFF url(images/gradients/form-control-gradient-alpha.png) repeat-x bottom center;
}

.blogcatbit .td, tr.blogcatbit td { padding:10px; }
/* End Blog Categories List */

/* Custompage List */
.custompagebit .td, .custompagebit td { padding:10px; }

.blogcustompages .tr .bloglistlocation {
	width: 120px;
}

.blogcustompages .tr .bloglistorder {
	width: 100px;
}

/* End Custompage List */

/* Blog Group */
.bloggroupdate, .bloggroupdate.blocksubhead {
	width:160px;
	text-align:center;
}
.bloggroupaction, .bloggroupaction.blocksubhead {
	width:175px;
	text-align:center;
}
.bloggroupbit .td, .bloggroupbit td { padding:10px; }
/* End Blog Group */

/* Blog Sidebar */
.blogsitebarorder {
	width:160px;
	text-align:center;
}
.blogsitebaractive {
	width:70px;
	text-align:center;
}
.blogsitebarbit .td, .blogsitebarbit td { padding:10px; }
/* End Blog Sidebar */

.blogstats {
	width:110px;
	text-align:center;
}

.blogimod {
	text-align:center;
	vertical-align:middle;
	width:25px;
}

.bloglastpost {
	width:160px;
	text-align:center;
}

.blognotification {
	width:110px;
	text-align:center;
}

/* Trackbacks */
.popupgroup {
	float:right;
}

.trackbackdate {
	width:160px;
	text-align:center;
}

.trackbacksource {
	width:165px;
	text-align:center;
}

.trackbackbit .td, .trackbackbit td { padding:10px; }
/* End Trackbacks */

/* ------------------ */
/* MY BLOG */
/* Sidebar */
#userinfoblock {
	margin-bottom:8px;
}

#userinfoblock a.avatar {
	display:block;
	text-align:center;
}

#userinfoblock a.avatar .avatarcontainer {
	display:block;
	overflow:hidden;
	
	/* Image valign for non-IE */
	text-align:center;
	
	/* Image valign IE Hack */
	*display: block;
	*font-size: 52px;  
	*font-family:Arial;
}
#userinfoblock a.avatar .avatarcontainer img {
	max-width:248px;
	border:3px solid #FFF;
	outline:1px solid #4E8CD5;
}

#usermenu {
	margin-left:10px;
	padding-top:4px;
	font-size:88%;
}

#usermenu img {
	position: relative;
	top: 2px;
}

#userstats {
	padding-bottom:5px;
}

#customepages {
	border-top:1px solid #4E8CD5;
	padding-top:5px;
}

#userstats dl.stats dt {
	color: #666666;
	display:block;
	float:left;
	clear:right;
	width:50%;
	text-align: left;
}

#userstats dl.stats dd {
	float:right;
	text-align: right;
	font-weight:bold;
	display:block;
	width: 50%;
}

.blogusermenu img.inlineimg {
	padding: 0 10px 0 0;
}

.avatarcontent {
	padding-top:10px;
}
.avatarcontent:first-child {
	padding-top:0;
}


.blogentries {width:auto;}
.blogcomments{width:auto;}
.findmoretext {text-align:right;}
.td.findmoretext, td.findmoretext {padding:5px; border-bottom:1px solid #8F95BF;} /* deprecated? not showing in template search */



/* RATINGS */
.popupbody .rating {
	display:block;
	padding:0px;
	padding-left:75px;
	background:transparent url(images/rating/rating-15_0.png) left center no-repeat;
}

.popupbody .r5 { background-image:url(images/rating/rating-15_5.png); }
.popupbody .r4_right { background-image:url(images/rating/rating-15_4.png); }
.popupbody .r3_right { background-image:url(images/rating/rating-15_3.png); }
.popupbody .r2_right { background-image:url(images/rating/rating-15_2.png); }
.popupbody .r1_right { background-image:url(images/rating/rating-15_1.png); }

/*RTL rating*/
.popupbody .r4_left { background-image:url(images/rating/rating-15_4_left.png); }
.popupbody .r3_left { background-image:url(images/rating/rating-15_3_left.png); }
.popupbody .r2_left { background-image:url(images/rating/rating-15_2_left.png); }
.popupbody .r1_left { background-image:url(images/rating/rating-15_1_left.png); }


/* ---------------------- */
/* GENERAL */
.toright {
	float: right;
}
.toleft{
	float: left;
}
#content_inner {
	margin-left:10px;
}
.nobullets, .list_no_decoration { /* .nobullets is deprecated */
	list-style:none;
	margin:0px;
	padding:0px;
}
img.inlineimg {
	padding:0 1px;
}
.collapse_generic_img {
	float:right;
}

/* ---------------------- */
/* DEFAULT FORUM CSS OVERRIDE */
a.collapse {
	position:static;
	display:block;
	width:13px;
	padding-left:5px;
}
* a.collapse {
	display:inline;
	width:13px;
	margin: 0;
	float: right;
}
#whatsnewsidebar a.collapse {
	position:relative;
	display:block;
	width:13px;
	right: -6px;
	top: 0; 
}
.blogattachments {
	border: 1px solid #4E8CD5;
	background: #B9D3EE none   ;
	margin: 5px 30px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	padding: 5px 10px 5px 10px;
	font-size: 12px;
}

.vB_DatePicker {
	z-index: 1000;
	background: rgb(255, 255, 255);
}

.blogstatscontent { /* need help finding where blog_list_blogs_blog is that uses this class */
	margin-top:8px;
	margin-bottom:8px;
	padding-left:140px;
}

* li.blogentrybit.featured {
margin-bottom : 10px;
}

.postbit-lite .posttext {
	clear: both; /* VBIV-10312 */
}

.reportmsg {
	width: 496px;
	height: 248px;
}

.blogcontent img {
	max-width: 100%;
}


/* CSS Document */

.lightbox {
	position:absolute;
	/* left:0; */
	top:0;
}

.lightbox > div {
	background-color:#000000;
	padding:14px;
	-moz-border-radius:14px;
	-webkit-border-radius:14px;
	border-radius:14px;
}

.lightbox > div > div {
	background-color:#F5F5F5;
	padding:6px;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;	
	border-radius:5px;	
}

.lightbox .wider {
	width:106%;
}

.lightbox .picturerow {
	text-align:center;
}

.lightbox .buttonrow,
.lightbox .descrow {
	color:#666666;
	padding-top:4px;
	font-size:11px;
}

.lightbox .buttonrow .closebutton,
.lightbox .descrow .filename {
	float:right;
}

/*
.lightbox .progress {
	border:solid 4px #000000;
	border-bottom-width:0px
}
*/


/* CSS Document */

blockquote .align_left
{
	float:left;
}	
blockquote .align_center
{
	display:block;
	margin:0 auto;
}
blockquote .align_right
{
	float:right;
}

blockquote .size_thumbnail
{
	max-height:150px;
	max-width:150px;
	width: auto !important;
	height: auto !important;
}
blockquote .size_medium
{
	max-height:300px;
	max-width:300px;
	width: auto !important;
	height: auto !important;
}
blockquote .size_large
{
	max-height:1024px;
	max-width:1024px;
	width: auto !important;
	height: auto !important;
}
blockquote .size_fullsize
{
	max-width:100%;
	width: auto !important;
}

blockquote .size_fullsize img
{
	overflow:hidden;
}

blockquote .caption
{
	font-size:9px;
	font-weight:bold;
	text-align:center;
	margin-top:5px;
}

blockquote
{
	overflow:hidden;
}

#navbar_notice_0
{
  background: rgb(204, 204, 255) none   ;
  -moz-box-shadow: -2px 2px 2px #c8c8c8;
  -webkit-box-shadow: -2px 2px 2px #c8c8c8;
  color: #3e3e3e;
}

#navbar_notice_0 img.icon
{
  float: left;
  margin: 0px 5px 0px 0px;
}

#navbar_notice_0 span.title
{
  font:   bold 115% ;
  font-size: 115%;  
  font-weight: bold;
  color: #3e3e3e;
} 