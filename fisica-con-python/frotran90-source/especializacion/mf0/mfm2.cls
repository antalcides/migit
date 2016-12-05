\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mfm2}[2002/05/13 Estilo para apuntes MFM II (VM)]
\newif\ifkeys\keysfalse
\DeclareOption{keys}{\keystrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}


%Historia
% v1.0 1998/07/30 Estilo para apuntes MFM II 
% v2.0 2002/03/25 Revision para Computacion (Matematicas)
% v2.0.1 2002/05/13 Adicion de ifpdf.sty, eliminacion epsfig.sty 

\textheight 23cm
\textwidth 16.6cm
\oddsidemargin -0.2cm
\evensidemargin -0.6cm
\topmargin -1.5cm

\RequirePackage[spanish]{babel}
\RequirePackage{amsmath}
\RequirePackage{theorem}
\RequirePackage{ifthen}
\RequirePackage{enumerate}
\RequirePackage{addmath}
\RequirePackage{ifpdf}
\ifpdfGraphicx
\ifkeys\RequirePackage[notref,notcite]{showkeys}\fi

                        
\theorembodyfont{\rmfamily\slshape}

\newtheorem{definicion_teorema}{\bf Definici\'on}[chapter]
\newenvironment{definicion}{%
\begin{definicion_teorema}%
\renewcommand{\em}{\sffamily}%
}{\end{definicion_teorema}}

\theorembodyfont{\rmfamily\upshape}

\newtheorem{teorema_teorema}{\bf Teorema}[chapter]
\newtheorem{proposicion_teorema}{\bf Proposici\'on}[chapter]

%\newcommand{\naturales}{\mbox{\sf I \hspace{-.8em} N}}
%\newcommand{\reales}{\mbox{\sf I \hspace{-.8em} R}}

\newenvironment{demostracion}{\vspace{.3cm}\par\noindent{\bf Demostraci\'on}
}{\nopagebreak\par\nopagebreak\hfill q.e.d.\par\vspace{.5cm}}
\newenvironment{demostracion*}{\vspace{.3cm}\par\noindent{\bf Demostraci\'on}
}{\par\vspace{.5cm}}
\newenvironment{teorema}[1][]{\begin{teorema_teorema} {\bf #1}}{\end{teorema_teorema}}
\newenvironment{proposicion}[1][]{\begin{proposicion_teorema} {\bf #1}}%
{\end{proposicion_teorema}}

\newcommand{\bfheading}[1]{\vspace{.3cm}\par\noindent {\bf #1}}

\newenvironment{ejemplo}{\bfheading{Ejemplo}}{}
\newenvironment{ejercicio}{\bfheading{Ejercicio}}{\vspace{.5cm}}
\newenvironment{corolario}{\bfheading{Corolario}}{}
\newenvironment{afirmacion}{\bfheading{Afirmaci\'on}}{}





\newcommand{\minititulo}[1]{\vspace{.5cm}\hbox{\bf#1}\vspace{.5cm}}

\newcounter{caso}
\newlength{\ancho}
\newcommand{\caso}{\addtocounter{caso}{1}%
\ifthenelse{\value{caso}>1}{\vspace{.5cm}}{}\noindent\thecaso) }
\newenvironment{casos}[1][]{\setcounter{caso}{0}\settowidth{\ancho}{#1}%
\ifthenelse{\lengthtest{\ancho=0pt}}{\vspace{.5cm}}{\minititulo{#1}}}{\par}

\addto\captionsspanish{\def\contentsname{\'Indice}}

