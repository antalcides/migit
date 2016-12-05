# Mi primer documento Markdown
Este documento es para experimentar lo que es diagramar con texto *Markup*.
Vamos ahora a realizar varios ensayos.
* Insertaremos una imagen
![Imagen de prueba](/home/antalcides/Escritorio/est/ejemplos/image/maple.png  "Mi Imagen")
* insertaremos una ecuación
$\intop_{1}^{2}x^{2}dx$

* * *
* imagenes 
![](/home/antalcides/Escritorio/est/ejemplos/image/maple.png "title""width:50px;height:50px")
* Insertar una imagen con el tamaño personalizado
- - -
<center><IMG src="/home/antalcides/Escritorio/est/ejemplos/image/Professional_Social_Work-education.JPG" width="100" height="100"/></center>
***
![][id]
[id]: http://bit.ly/1g1oUFW "title" "width:200px;height:100px"


![](http://bit.ly/1g1oUFW "right" "width:200px;height:100px;float:right;padding-left:10px;")

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

graph LR;
    A[Hard edge]-->|Link text|B(Round edge);
    B-->C{Decision};
    C-->|One|D[Result one];
    C-->|Two|E[Result two];


*****

#Other Maths

En una línea

$ \alpha + \beta + x^{2} = z^{2} $ or $ \frac{1}{2^{-32} - 1} $.

Definición: Sea $X$ una variable aleatoria que asume los valores
$x_{1},x_{2},x_{3},\cdots x_{k}$, con iguales probabilidades, entonces
* * *
$$ \begin{equation} f\left(x,k\right)=\left\{ \begin{array}{ccc}
\frac{1}{k} & si & x=x_{1},x_{2},x_{3},\cdots x_{k}\\
0 &  & \text{si no}
\end{array}\right.\end{equation}$$
 
*****
These render differently. For example, type
$\sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6}$
 (which is inline mode) or type
$$\begin{equation}\sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6}\end{equation}$$




