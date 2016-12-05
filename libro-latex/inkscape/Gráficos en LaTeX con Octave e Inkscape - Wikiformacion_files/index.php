/* Los estilos CSS definidos aquí aplicarán a todas las pieles (skins) */
/* CSS para infoboxes */
.infobox {
    border: 1px solid #aaa;
    background-color: #f9f9f9;
    color: #000;
    margin-bottom: 0.5em;
    margin-left: 1em;
    padding: 0.2em;
    float: right;
    clear: right;
}

.infobox td, .infobox th,
.infobox_v2 td, .infobox_v2 th {
    vertical-align: top;
}

.infobox caption {
    font-size: larger;
    margin-left: inherit;
}

/* infoboxes V2 ("nuevas") */
.infobox_v2 {
    border: 1px solid #B4BBC8;
    background-color: #f9f9f9;
    color: #000;
    margin: .5em 0 .5em 1em;
    padding: .4em;
    clear: right;
    float: right;
    font-size: 90%;
    line-height: 1.5em;
    width: 22.5em
}

.infobox_v2 .cabecera {
    font-size: 140%;
    font-weight: bolder;
    height: 45px;
    line-height: 1.2em;
    text-align: center;
    vertical-align: middle
}

.infobox_v2 .media {
    font-weight: bolder;
    height: 35px;
    text-align: center;
    vertical-align: middle
}

/*** Cajas de aviso en discusión nuevas (ambox) que son blancas y con
 * una cinta de color a la izquierda  */
table.ambox {
    margin: 0 10%; /* Will not overlap with other elements */
    border-collapse: collapse;
    background-color: #fbfbfb;
    border: 1px solid #aaa;
    border-left: 10px solid #1e90ff; /* Default "notice" blue */
}
table.ambox th.ambox-text, table.ambox td.ambox-text { /* The message body cell(s) */
    padding: 0.25em 0.5em; /* 0.5em left/right */
    width: 100%; /* Make all templates the same width regardless of text size */
}
table.ambox td.ambox-image { /* The left image cell */
    padding: 2px 0px 2px 0.5em; /* 0.5em left, 0px right */
    text-align: center;
}
table.ambox td.ambox-imageright { /* The right image cell */
    padding: 2px 4px 2px 0px;  /* 0px left, 4px right */
    text-align: center;
}
table.ambox-notice {border-left: 10px solid #1e90ff} /* Blue */
table.ambox-delete, table.ambox-serious {border-left: 10px solid #b22222} /* Red */
table.ambox-content {border-left: 10px solid #f28500} /* Orange */
table.ambox-style {border-left: 10px solid #f4c430} /* Yellow */
table.ambox-merge {border-left: 10px solid #9932cc} /* Purple */
table.ambox-growth {border-left: 10px solid #228b22} /* Green */
table.ambox-protection {border-left: 10px solid #bba} /* Gray */
table.ambox.ambox-mini { /* Small floating box variant */
    float: right;
    clear: right;
    margin: 0 0 0 1em;
    width: 25%;
}
@media print { /* Do not print article message box */
    .ambox {display: none}
}