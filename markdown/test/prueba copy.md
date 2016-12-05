# Mi primer documento Markdown
Este documento es para experimentar lo que es diagramar con texto *Markup*.
Vamos ahora a realizar varios ensayos.
* Insertaremos una imagen
![left](/home/antalcides/Escritorio/est/ejemplos/image/maple.png  "Mi Imagen")
* insertaremos una ecuación
$\intop_{1}^{2}x^{2}dx$

* * *
* Imagenes 
![](/home/antalcides/Escritorio/est/ejemplos/image/maple.png "title""left""width:50px;height:50px;float:left;padding-left:10px;")
* Insertar una imagen con el tamaño personalizado
- - -
<center><IMG src="/home/antalcides/Escritorio/est/ejemplos/image/maple.png" width="100" height="100"/></center>
***
![][id]
[id]: http://bit.ly/1g1oUFW "title" "width:200px;height:100px"


![](http://bit.ly/1g1oUFW "right" "width:200px;height:100px;float:right;padding-left:10px;")

- - -


* Insertaremos líneas de código en Python
```python
       def syntaxHighlight():
    haroo = "press"
    return haroo
```

* Insertan código LaTex

```tex
\documentclass[12pt]{article}
\usepackage{lingmacros}
\usepackage{tree-dvips}
\begin{document} 
```

* Código en php

```php
<?php
$a1=array("a"=>"red","b"=>"green","c"=>"blue");
$a2=array("a"=>"red","c"=>"blue","d"=>"pink");

$result=array_intersect_key($a1,$a2);
print_r($result);
?>
```

* * *

```ruby
code block
```

~~~cpp
fenced code block
~~~

~~~javascript
function syntaxHighlight(code, lang) {
   var foo = 'rhio';
   var bar = 33;
}
~~~
* Tablas
| Column | Column | Column |
|--------|--------|--------|
| value  | value  | value  |

* Insertar media rich
@[media](https://twitter.com/haroopad/status/337257711827841024)
@[caption](https://twitter.com/haroopad/status/337257711827841024 'width:200px;margin:1em')
* Audio y video
![audio](http://v2v.cc/~j/theora_testsuite/320x240.ogg)
![video](http://www.html5rocks.com/en/tutorials/video/basics/devstories.webm)
* Otros
- [x] send email
- [ ] meet with my boss
- [ ] date with my girl friend
- [ ] write techical reporting about javascript

* * *
```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```

```markdown
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```

```mermaid
graph LR;
    A[Hard edge]-->|Link text|B(Round edge);
    B-->C{Decision};
    C-->|One|D[Result one];
    C-->|Two|E[Result two];
```



