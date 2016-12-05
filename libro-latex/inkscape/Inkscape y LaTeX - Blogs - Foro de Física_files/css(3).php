blockquote.postcontent, blockquote.blogcontent 
{
  overflow: visible !important;
}

.pod_vlatex_display
{
  position: relative;
  background: transparent;
  width: 100%;
/*  text-align: center; */
}

.pod_vlatex_display img
{
  display: block;
  margin: 2px auto 2px auto;
  padding: 0px;
}

.pod_vlatex_display label
{
  position: absolute;
  margin-top: -6.5px;
  font:    13px Verdana,Arial,Tahoma,Calibri,Geneva,sans-serif;
  line-height: 13px;
  height: 13px;
  right: 0px;
  top: 50%;
  padding: 0px;
}

.pod_vlatex_display label.pod_vlatex_autocount:before
{
  content: "(";
}


.pod_vlatex_display label.pod_vlatex_autocount:after
{
  content: ")";
}


.pod_vlatex_tag, span.pod_vlatex_autocount:before
{
  font:     ;
  color: #000090;
}


body, .postbit
{
  counter-reset: pod_vlatex_eq;
}

span.pod_vlatex_autocount:before
{
  content: counter(pod_vlatex_eq);
  counter-increment: pod_vlatex_eq;
}


img.pod_vlatex_inline
{
  align: middle;
  margin: 0px;
  padding: 0px;
}


.pod_vlatex_error
{
  color: #FF0000;
  font-weight: bold;
}

/* Code popup */
#vlatex_codepopup
{
  position:absolute;
  left:0px;
  top:0px;
  background: #f4f9fd none   ;
  border-radius: 5px;
  border: 1px solid #4E8CD5;
  padding: 10px;
  width: auto;
  min-width: 200px;
  max-width: 450px;
  z-index: 1000;
  -moz-box-shadow: 0px 4px 7px #c8c8c8;
  -webkit-box-shadow: 0px 4px 7px #c8c8c8;
  box-shadow: 0px 4px 7px #c8c8c8;
}

#vlatex_codepopup img
{
  float: right;
  border: 0px none transparent;
}

#vlatex_codepopup p
{
  font-weight: bold;
}

#vlatex_codepopup blockquote
{
  border:1px solid #4E8CD5;
  background:#fafafa url(images/webfisica/light-up.png) repeat-x  bottom;
  padding: 5px;
  margin: 5px 0px 0px 5px;
}

#vlatex_codepopup + img
{
  background:;
}



/******************************/
/**** vLaTeX Commands Menu ****/ 

#vlatex_commandmenu_container
{
  padding: 10px 5px 15px 5px;
}


#vlatex_commandmenu_title
{
  width: 100%;
  display: block;
}

#vlatex_commandmenu_title h2
{
  font-weight:bold;
  display: inline-block;
}

#vlatex_commandmenu_title h2 img
{
  vertical-align: ;
}

#vlatex_commandmenu_title #collapse_vlatex_commandmenu
{
  vertical-align: middle;
  position: static;
  float: none;
}


#vlatex_commandmenu li
{
  position: relative;
  display: inline-block;
  padding: 0px;
  margin: 0px 0px 1px 1px;
  height: 32px;
  min-width: 32px;
  /* IE7 hack */
  zoom: 1;
  *display:inline; 
  overflow: visible;
}

#vlatex_commandmenu li img
{
  vertical-align: middle;
  margin: auto auto;
  padding: 6px 3px;  
  border: 1px transparent solid;
}

#vlatex_commandmenu li div
{
  display: table-cell;
  text-align: center;
  vertical-align: middle;
  min-width: 32px;
  overflow: visible;
  height: 32px;
  line-height: 32px;
  padding: 0px;
}

#vlatex_commandmenu li:hover img
{
  background: #C1D2EE none   ;
  border: 1px inset #6B91AB;
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