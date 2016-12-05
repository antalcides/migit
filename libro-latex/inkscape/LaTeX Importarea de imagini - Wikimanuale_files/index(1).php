/*

This is the script to add CGI:IRC login box to random pages (like [[WN:IRC]]). Please report problems to [[m:n:user talk:Bawolff]] (http://en.wikinews.org/wiki/user_talk:Bawolff ). modifications may take some time to get through caching. For yourself you can do a hard refresh of  [{{SERVER}}/w/index.php?title=Mediawiki:Irc.js&action=raw&ctype=text/javascript&dontcountme=s this page] to make mods go live. From http://en.wikinews.org/wiki/mediawiki:Irc.js this is version 2.0. If you have any complaints, comments requests, please contact me at http://en.wikinews.org/wiki/user_talk:Bawolff


:Just add <code><nowiki><div id="cgiircbox"/> </nowiki></code> (some wikis may need <code><nowiki><div id="cgiircbox"></div> </nowiki></code>) to a random page. You can style and add classes to thsi div if you want. in fact it doesn' even have to be a div, but a block level element is recommended (could be <code><nowiki><center id="cgiircbox"/> </nowiki></code>)


Note: This is heavily based on the login page from CGI:IRC 0.5 (or more specificly it is a reimplementation of the login page in javascript, to get arround restrictions on which elements can be added to a mediawiki page, plus a few extra features added along the way). CGI:IRC is made by David Leadbeater and is under the GPL. See http://cgiirc.sf.net . (therefor i geuss you could consider the entire combined thing under the gpl. I'm not a 100% sure how the copyright issue for this works, in any case I'm ok with any of my edits to the script being GPL)
<source lang="javascript">
*/


/*extern wgUserName wgUserGroups, new_input, new_element, new_label, setcharset*/
function add_irc() {
    var debug = false;
    var irc_div = document.getElementById("cgiircbox");
    if (irc_div) {
if (debug) alert("starting stuff. irc_div" + irc_div);
/*Localization stuff below this line. this is the only part you should have to edit*/

        add_irc.opt = {
                ircTitleText: "CGI:IRC Login",
                offWhite: "#f1f1f1",
                lightGrey: "#d9d9d9",
                blue: "#c0c0dd",
                advanced: "Advanced...",
                nick: "Your Nickname:",
                invalidNick: "Please enter a 16 character or less valid nickname. Acceptable characters include a-z, A-Z (no accents), 0-9, ^{}[]\\|_-`",
                no_advanced: "Advanced options have not been implemented as of yet.",
                go: " Chat! ",
                anonPrefix: "Wiki",
                annonSuffix: "newsie",
                chan: "IRC channel (which chat room):",
                //Transliterate options attempt to make non-leagl characters legal. No garuntees they work properly, but user can change anything they do, and if disabled, the script just removes not latin alphanumeric character
                transYI: true,
                transVowel: true,
                openAsPopUp: false, //still testing
                chanGroups: [ "Discussion", "Recent Changes"],
                server: 'http://chatwikizine.memebot.com/cgi-bin/cgiirc/irc.cgi'
                }
        //form add_irc.addChan("chan name", "chan desc", chan group number "server name");
        add_irc.addChan("#cafenea", "cafenea", 0, "irc.freenode.net");
        add_irc.addChan("#wikimania", "Wikimania", 0, "irc.freenode.net");
        add_irc.addChan("#kavehoyz", "kavehoyz", 0, "irc.freenode.net");

        add_irc.addChan("#ro.wikibooks", "RO Wikibooks RC", 1, "irc.wikimedia.org ");
        add_irc.addChan("#ro.wikinews", "RO Wikinews RC", 1, "irc.wikimedia.org ");
        add_irc.addChan("#ro.wikiquote", "RO Wikiquote RC", 1, "irc.wikimedia.org ");
        add_irc.addChan("#ro.wikisource", "RO Wikisource RC", 1, "irc.wikimedia.org ");
        add_irc.addChan("#ro.wiktionary", "RO Wiktionary RC", 1, "irc.wikimedia.org ");
        add_irc.addChan("#ro.wikipedia", "RO Wikipedia RC", 1, "irc.wikimedia.org ");

/*End localization stuff*/
        add_irc.con = { chanPrefix: "ircChanOption-", ircChannelSelect: "ircChannelSelect" };

        var irc_form = new_element("form", {id: 'cgiirclogin', name: 'cgiirclogin', method: (debug ? "get" : "post"), action: add_irc.opt.server, onsubmit: 'setjs();return nickvalid()', target: (add_irc.opt.OpenAsPopUp ? "_blank" : "_self")}, irc_div);
        new_element("span", {id: 'ietest'}, irc_div); //needed for ie browser detection
        new_input('interface', 'nonjs', 'hidden', irc_form); //this is kind of pointless, as we know they have js if they can see this, but good fallback
        new_input('Server', 'irc.freenode.net', 'hidden', irc_form);
        var pretable = new_element("table", {border: 0, cellpadding: 5, cellspacing: 0, id: "cgiircboxtable"}, irc_form);
if (debug) alert("appended form" + irc_form);
        //to seperate out table rows
        var table = new_element("tbody", {}, pretable);
        (function() {
            var tr = new_element("tr", {}, table);
            var td1 = new_element("td", {colspan: 2, align: "center", bgcolor: add_irc.opt.blue, style: "font-weight: bold;"}, tr);
            var ircTitle = document.createTextNode(add_irc.opt.ircTitleText);
            td1.appendChild(ircTitle);
        })();
        (function() {
            var tr = new_element("tr", {}, table);
            var td1 = new_element("td", {align: "right", bgcolor: add_irc.opt.offWhite, id: "nickname-label-a"}, tr);
            var td2 = new_element("td", {align: "left", bgcolor: add_irc.opt.offWhite, id: "nickname-a"}, tr);
        })();


        (function() {
            var tr = new_element("tr", {}, table);
            var td1 = new_element("td", {align: "right", bgcolor: add_irc.opt.offWhite, id: "channel-label-a"}, tr);
            var td2 = new_element("td", {align: "left", bgcolor: add_irc.opt.offWhite, id: "channel-a"}, tr);

        })();
        (function() {
            var tr = new_element("tr", {}, table);
            var td1 = new_element("td", {align: "left", bgcolor: add_irc.opt.lightGrey, id: "ircAdvanced-td"}, tr);
            var AdvancedLink = new_element("a", {href: "javascript:show_ircAdvanced()", style: "font-size:small;", id: "ircAdvanced"}, td1);
            var ircAdvanced = document.createTextNode(add_irc.opt.advanced);
            AdvancedLink.appendChild(ircAdvanced);
            var td2 = new_element("td", {align: "right", bgcolor: add_irc.opt.lightGrey, id: "go-a"}, tr);
        })();

        new_label('Nickname-label', 'nickname', 'Your Nickname: ', document.getElementById("nickname-label-a"));

        var irc_username = add_irc.opt.anonPrefix  + (Math.floor(Math.random()*100)) + add_irc.opt.annonSuffix;
        if (wgUserGroups && (wgUserGroups.join().indexOf("user") > 0)) {
            irc_username = wgUserName;
        }

        new_input('Nickname', irc_username, 'text', document.getElementById("nickname-a"));
        new_label('Channel-label', 'channel', add_irc.opt.chan, document.getElementById("channel-label-a"));
        var channel = new_element('select', {name: "Channel", id: add_irc.con.ircChannelSelect, onchange: "irc_channelChange(this.selectedIndex);"}, document.getElementById("channel-a"));
//start chat chan
        add_irc.doLabel(channel);
        add_irc.doChan();
        

        new_input('go', add_irc.opt.go, 'submit', document.getElementById("go-a"));

//do the setcharset stuff
        nickvalid(); 
        setcharset();
    }
}

//functions called by above
function show_ircAdvanced() {
//do nothing!
//eventually I will make this expand the form
    alert(add_irc.opt.no_advanced);
}

function irc_channelChange(chan) {
//fix server (if you have channels that are on diff irc servers)
    var select = document.getElementById(add_irc.con.ircChannelSelect);

    var serv = document.getElementById("Server");
    var curChan = select.options[select.options.selectedIndex].id.substring(add_irc.con.chanPrefix.length); //find name of cur channel less id prefix
    //if (debug) alert("Changing server. Channel" + curChan + "; Server: " + add_irc.chan[curChan].server);
    serv.setAttribute("value", add_irc.chan[curChan].server);

}


function new_input(id, value, type, attach) {
    var new_opt = document.createElement("input");
    new_opt.setAttribute('id', id);
    new_opt.setAttribute('name', id);
    new_opt.setAttribute('value', value);
    new_opt.setAttribute('type', type);
    //starting adding to tree 
    attach.appendChild(new_opt);
    return (document.getElementById(id));
}

function new_label(id, input, value, attach) {
    var new_opt = document.createElement("label");
    new_opt.setAttribute('id', id);
    new_opt.setAttribute('name', id);
    new_opt.setAttribute('for', input);
    var label = document.createTextNode(value);
    new_opt.appendChild(label);
    //starting adding to tree 
    if (attach && attach.appendChild) {
        attach.appendChild(new_opt);
    } else {
        throw new Error("JS Error (CGI::IRC): Can not find element to append new element to. (opt)");
    }
    return (document.getElementById(id));
}

function new_element(name, attributes) {
//Create element, and attributes, and optionally add to tree
// call as new_element(element name to create(string), attributes of element (object), optionally element to append as a child to) 
    if (name) {
        var elm = document.createElement(name);
    } else {
        return null;
    }
//set attributes
    if (typeof(attributes) === "object") {
        for (var i in attributes) {
            elm.setAttribute(i, attributes[i]);
        } 
    } 
    else {
    return null;
    }

//attach to tree (but only if third argument given)
    if (arguments[2]) {
        var appendState = arguments[2].appendChild(elm)
        if (!appendState) {
            throw new Error("JS Error (CGI::IRC): Can not find element to append new element to. (element)");
        }
    }
    return elm;
}

function setjs() {
//This function might be under the GPL as it is from cgi:irc 0.5 by David Leadbeater. see http://cgiirc.sf.net
    if(navigator.product == 'Gecko') {
        document.cgiirclogin["interface"].value = 'mozilla';
    }else if(window.opera && document.childNodes) {
        document.cgiirclogin["interface"].value = 'opera7';
    }else if(navigator.appName == 'Microsoft Internet Explorer' && navigator.userAgent.indexOf("Mac_PowerPC") > 0) {
        document.cgiirclogin["interface"].value = 'konqueror';
    }else if(navigator.appName == 'Microsoft Internet Explorer' &&
 document.getElementById && document.getElementById('ietest').innerHTML) {
        document.cgiirclogin["interface"].value = 'ie';
    }else if(navigator.appName == 'Konqueror') {
        document.cgiirclogin["interface"].value = 'konqueror';
    }else if(window.opera) {
        document.cgiirclogin["interface"].value = 'opera';
    }
}
add_irc.yiTrans = function(yi) {
//This probably doesn't work with combining characters, and may otherwise not work. use with caution
yi = yi.replace(/דזש/ig, "dzh");
yi = yi.replace(/זש/ig, "zh");
yi = yi.replace(/טש/ig, "tsh");
yi = yi.replace(/וו/ig, "v");
yi = yi.replace(/וי/ig, "oy");
yi = yi.replace(/יי/ig, "ey");
yi = yi.replace(/בֿ/ig, "v");
yi = yi.replace(/אַ/ig, "a");
yi = yi.replace(/אָ/ig, "o");
yi = yi.replace(/ב/ig, "b");
yi = yi.replace(/ג/ig, "g");
yi = yi.replace(/ד/ig, "d");
yi = yi.replace(/ה/ig, "h");
yi = yi.replace(/ו/ig, "u");
yi = yi.replace(/וּ/ig, "u");
yi = yi.replace(/ז/ig, "z");
yi = yi.replace(/ח/ig, "kh");
yi = yi.replace(/ט/ig, "t");
yi = yi.replace(/י/ig, "y");
yi = yi.replace(/יִ/ig, "i");
yi = yi.replace(/ײַ/ig, "ay");
yi = yi.replace(/כּ/ig, "k");
yi = yi.replace(/כ/ig, "kh");
yi = yi.replace(/ך/ig, "kh");
yi = yi.replace(/ל/ig, "l");
yi = yi.replace(/מ/ig, "m");
yi = yi.replace(/ם/ig, "m");
yi = yi.replace(/נ/ig, "n");
yi = yi.replace(/ן/ig, "m");
yi = yi.replace(/ס/ig, "s");
yi = yi.replace(/ע/ig, "e");
yi = yi.replace(/פּ/ig, "p");
yi = yi.replace(/פֿ/ig, "f");
yi = yi.replace(/ף/ig, "f");
yi = yi.replace(/צ/ig, "ts");
yi = yi.replace(/ץ/ig, "ts");
yi = yi.replace(/ק/ig, "k");
yi = yi.replace(/ר/ig, "r");
yi = yi.replace(/ש/ig, "sh");
yi = yi.replace(/שׂ/ig, "s");
yi = yi.replace(/תּ/ig, "t");
yi = yi.replace(/ת/ig, "s");
return yi;
}

function nickvalid() {
//This function might be under the GPL as it is from cgi:irc 0.5 by David Leadbeater. see http://cgiirc.sf.net
    var nick = document.cgiirclogin.Nickname.value;
    //The regex has been modified to escape ^. hopefully that doesn't screw up anything.
    if(nick.match(/^[A-Za-z0-9\[\]\{\}\^\\\|\_\-`]{1,16}$/))
        return true;
    if(arguments.length === 0) {
        alert(add_irc.opt.invalidNick);
    }
    nick = nick.replace(" ", "_");
    if (add_irc.opt.transYI) {
        nick = add_irc.yiTrans(nick);
    }
    if (add_irc.opt.transVowel) {
    //make some unicode chars ascii. This is not meant to be complete, just to work for some common chars. will make capitals lowercase
    nick = nick.replace(/[\xC0-\xC5\xE0-\xE5]/gi, "a");
    nick = nick.replace(/[\xC6\xE6]/gi, "ae");
    nick = nick.replace(/[\xC7\xE7]/gi, "c");
    nick = nick.replace(/[\xC8\xC9\xcA\xCB\xCC\xE8\xE9\xEA\xEB]/gi
, "e"); //includes schaw
    nick = nick.replace(/[\xCC-\xCF\xEC-\xEF]/gi, "i");
    nick = nick.replace(/[\xD2-\xD6\xD8\xF0\xF2-\xF6\xF8]/gi, "o");
    nick = nick.replace(/[\xD9-\xDC\xF9-\xFC]/gi, "u");
    }
    document.cgiirclogin.Nickname.value = nick.replace(/[^A-Za-z0-9\[\]\{\}\^\\\|\_\-`]/g, '');
    return false;
}
function setcharset() {
//This function might be under the GPL as it is from cgi:irc 0.5 by David Leadbeater. see http://cgiirc.sf.net
    if(document.charset && document.cgiirclogin && document.cgiirclogin["Character set"]) {
        document.cgiirclogin['Character set'].value = document.charset;
    }
}
add_irc.doLabel = function(select) {
    var newGroup;
    for (var i = 0; i < add_irc.opt.chanGroups.length; i++) {
        newGroup = new_element('optgroup', {label: add_irc.opt.chanGroups[i], id: "ircOptGroup-" + encodeURIComponent(add_irc.opt.chanGroups[i])}, select);
    add_irc.doLabel[i] = newGroup;
    }

}
add_irc.doChan = function(optgroup) {
    var newChan;
    for (var i in add_irc.chan) {
//to do, make things default selected
        newChan = new_element("option", {id: add_irc.con.chanPrefix + i, value: add_irc.chan[i].chan}, add_irc.doLabel[add_irc.chan[i].group]);
        newChan.appendChild(document.createTextNode(add_irc.chan[i].desc));
    } 
}
//form add_irc.addChan("chan name". "chan desc", chan group number "server name");
add_irc.addChan = function(chan, desc, group, server) {
    add_irc.chan = (add_irc.chan ? add_irc.chan : {});
    add_irc.chan[chan.substring(1)] = {chan: chan, desc: desc, group: group, server: server};

}
//because this is already from a load event
add_irc();
//</source>