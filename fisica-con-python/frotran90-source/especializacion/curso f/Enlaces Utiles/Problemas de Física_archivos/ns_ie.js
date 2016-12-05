if (!HVhpjs)
{
    var HVhpjs = 1;
    ads_hv_FactorX=20;
    
    isNS4 = (document.layers) ? true : false;
    isIE4 = (document.all && !document.getElementById) ? true : false;
    isIE5 = (document.all && document.getElementById) ? true : false;
    isNS6 = (!document.all && document.getElementById) ? true : false;
    
    function ads_hv_cerrar(){
        
        
        if(isNS4){
            
            document.HispaVista.visibility="hidden";
        }
        else if (isNS6){
            document.getElementById("HispaVista").style.visibility ="hidden";
        }
        else{
            
            document.all.HispaVista.style.visibility = "hidden";
        }
    }
    function ads_hv_setVals() {
        // Con NS el innerHeigth esta definido
        if (isIE4 || isIE5){
            if (document.body){
                innerWidth = document.body.clientWidth;
            	innerHeight = document.body.clientHeight;
            } else{
                innerWidth = 1004;
            	innerHeight= 578;	
            }
        }
        ads_hv_posX = 120+20;
        ads_hv_posY = 20;
        ads_hv_yanterior = 20;
        ads_hv_mover();
    }
    function ads_hv_mover(){
        var ads_hv_scrollPos = ads_hv_navDOM?self.pageYOffset:document.body.scrollTop;
        var ads_hv_posLeft = -ads_hv_posX +innerWidth + (ads_hv_navDOM?self.pageXOffset:document.body.scrollLeft);
        
        if (Math.abs(ads_hv_scrollPos-ads_hv_yanterior) > ads_hv_FactorX){
            var ads_hv_dist = 2 * parseInt( Math.abs(ads_hv_scrollPos-ads_hv_yanterior) / ads_hv_FactorX );
        } else {
            var ads_hv_dist  = 1;
        }
        
        if(ads_hv_yanterior < (ads_hv_scrollPos+ads_hv_posY)){
            ads_hv_yanterior+=ads_hv_dist;
            ads_hv_moverElemento(ads_hv_yanterior,ads_hv_posLeft);
        } else if (ads_hv_yanterior > (ads_hv_scrollPos+ads_hv_posY)){
            ads_hv_yanterior-=ads_hv_dist;
            ads_hv_moverElemento(ads_hv_yanterior,ads_hv_posLeft);
        } else if (ads_hv_yanterior == (ads_hv_scrollPos+ads_hv_posY)){
            ads_hv_moverElemento(ads_hv_yanterior,ads_hv_posLeft);
        }        
        
        setTimeout ("ads_hv_mover()",10);
    }
    function ads_hv_moverElemento(ads_hv_valTop,ads_hv_valLeft){
        if (isIE4){
            document.all["HispaVista"].style.left = ads_hv_valLeft;
            document.all["HispaVista"].style.top = ads_hv_valTop;
        }
        else if(isIE5){
            document.getElementById("HispaVista").style.left = ads_hv_valLeft;
            document.getElementById("HispaVista").style.top = ads_hv_valTop;
        }
        else if(isNS4){
            document.HispaVista.left = ads_hv_valLeft;
            document.HispaVista.top = ads_hv_valTop;
        }
        else if(isNS6){
            document.getElementById("HispaVista").style.left = ads_hv_valLeft;
            document.getElementById("HispaVista").style.top = ads_hv_valTop;
        }
    }
    function ads_hv_markMe() {
        if (screen.width >= 640 ){
        	window.onresize=ads_hv_setVals;
        	ads_hv_setVals();    	
        } 
    }
    
    
      function dar(){
        if(ads_hv_puesto==1){
            return;    
        }
        ads_hv_puesto = 1;
        ads_hv_tam_x = 11;//La X de cerrar es de 11x11
        
        if (isIE4){
            ads_hv_w = window.document.all["HispaVista"].document.all["ads_hv_publi"].width;
            ads_hv_h = window.document.all["HispaVista"].document.all["ads_hv_publi"].height;
            
            ads_hv_p1 = ads_hv_w-ads_hv_tam_x+1;
            
            window.document.all["HispaVista"].document.all["ads_hv_area_hv"].coords="0,0,"+ads_hv_p1+","+(ads_hv_tam_x-1);
            window.document.all["HispaVista"].document.all["ads_hv_area_cerrar"].coords=(ads_hv_p1+1)+",0,"+ads_hv_w+","+(ads_hv_tam_x-1);
            window.document.all["HispaVista"].document.all["ads_hv_area_img"].coords="0,"+ads_hv_tam_x+","+ads_hv_w+","+ads_hv_h;    
        }
        else if(isIE5){
            ads_hv_w = window.document.getElementById("HispaVista").document.getElementById("ads_hv_publi").width;
            ads_hv_h = window.document.getElementById("HispaVista").document.getElementById("ads_hv_publi").height;
            
            ads_hv_p1 = ads_hv_w-ads_hv_tam_x+1;
                                  
            window.document.getElementById("HispaVista").document.getElementById("ads_hv_area_hv").coords="0,0,"+ads_hv_p1+","+(ads_hv_tam_x-1);
            window.document.getElementById("HispaVista").document.getElementById("ads_hv_area_cerrar").coords=(ads_hv_p1+1)+",0,"+ads_hv_w+","+(ads_hv_tam_x-1);
            window.document.getElementById("HispaVista").document.getElementById("ads_hv_area_img").coords="0,"+ads_hv_tam_x+","+ads_hv_w+","+ads_hv_h;
        }
    }
    
    function tam(){        
        if (isIE4){
            ads_hv_posX = window.document.all["HispaVista"].document.all["ads_hv_publi"].width+20;
        }
        else if(isIE5){
            ads_hv_posX = window.document.getElementById("HispaVista").document.getElementById("ads_hv_publi").width+20;
        }
        dar();
    }
    
   
    
  function runPopup(tag){
  
    var tag_site=tag;  
    
    if (isIE4 || isIE5){
    	if (document.body){
        	ads_hv_altura=document.body.clientHeight;
        	ads_hv_anchura=document.body.clientWidth;
    	}else{
            if (frames.length==0){
                ads_hv_altura=301;
                ads_hv_anchura=451;
            }else{
        	    ads_hv_altura=0;
        	    ads_hv_anchura=0;
        	}
    	}
    }
    
    if (isNS4 || isNS6){
    	ads_hv_altura=window.innerHeight;
    	ads_hv_anchura=window.innerWidth;
    }
    
    ads_hv_fecha = new Date();
    ads_hv_bust = ads_hv_fecha.getTime();
    
    ads_hv_puesto = 0;
    
  
   
    
    if (ads_hv_altura>300 && ads_hv_anchura>450){
        if (isNS4){
    		document.write('<LAYER name="HispaVista"  POSITION=ABSOLUTE z-index=1000>');
    		document.write('<map name="HvMap"><area name ="ads_hv_area_cerrar" shape="rect" coords="111,0,120,9" href="#" onMouseOver="javascript:ads_hv_cerrar()" alt="Cerrar Publicidad" target="_self" id="ads_hv_area_cerrar" ><area name="ads_hv_area_hv" shape="rect" coords="0,0,110,9" href="http://www.hispavista.com" alt="&gt;&gt;Ir a INICIO de HispaVista" target="_blank" id="ads_hv_area_hv"><area name="ads_hv_area_img" shape="rect" coords="0,11,120,101" href="http://adserver.hispavista.com/click.ng/area='+tag_site+'&pos=lateral&site=hv_galeon_lateral&bust='+ads_hv_bust+'" target="_blank" id="ads_hv_area_img" ></map>');
    		document.write('<img name="ads_hv_publi" src="http://adserver.hispavista.com/image.ng/area='+tag_site+'&pos=lateral&site=hv_galeon_lateral&bust='+ads_hv_bust+'" border=0 usemap="#HvMap">');
            document.write('</LAYER>');
    	}
    	else{
            document.write('<DIV id="HispaVista" name="HispaVista" style="position:absolute;visibility: visible" z-index=1000 onMouseOver="dar()">');
            document.write('<map name="_HvMap_"><area id="ads_hv_area_cerrar" Shape="rect" coords="111,0,120,9" onMouseDown="javaScript:ads_hv_cerrar()" alt="Cerrar Publicidad" target="_self"><area id="ads_hv_area_hv" shape="rect" coords="0,0,110,9" href="http://www.hispavista.com" alt="&gt;&gt;Ir a INICIO de HispaVista" target="_blank"><area id="ads_hv_area_img" shape="rect" coords="0,11,120,101" href="http://adserver.hispavista.com/click.ng/area='+tag_site+'&pos=lateral&site=hv_galeon_lateral&bust='+ads_hv_bust+'" target="_blank"></map>');
            document.write('<img name="ads_hv_publi" src="http://adserver.hispavista.com/image.ng/area='+tag_site+'&pos=lateral&site=hv_galeon_lateral&bust='+ads_hv_bust+'" border=0 usemap="#_HvMap_" onLoad="tam()">');
            document.write('</DIV>');
    	}
    	
    	
        ads_hv_navDOM = isNS4 || isNS6;
        var ads_hv_vr = navigator.userAgent.replace(/mac/gi,"");
        if (navigator.userAgent != ads_hv_vr)
        {window.onload=ads_hv_markMe;} // safety for Mac IE4.5
        ads_hv_markMe();        
    }
    
  }//fin runpopup
}//fin if