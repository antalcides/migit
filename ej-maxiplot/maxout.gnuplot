set terminal png enhanced truecolor  size 600, 280
set out '/home/aolivo/maxout_270.png'
set size 1.0, 1.0
set origin 0.0, 0.0
set obj 1 rectangle behind from screen 0.0,0.0 to screen 1.0,1.0
set style rectangle fillcolor rgb '#ffffff' fs solid 1.0 noborder
set size noratio
set xrange [-1.0:6.283185307179586]
set yrange [-1.0:1.0]
set cbrange [*:*]
unset logscale x
unset logscale y
unset logscale cb
unset grid
set title 'Funciones SENO y COSENO'
set xlabel ''
set ylabel ''
set border 15
set xzeroaxis lw 1 lt 0 lc rgb '#000000'
set yzeroaxis lw 1 lt 0 lc rgb '#000000'
set xtics norotate border autofreq
unset x2tics
set ytics norotate border autofreq
unset y2tics
set cbtics autofreq
set colorbox
set cblabel ''
set palette rgbformulae 7,5,15
plot '/home/aolivo/data.gnuplot' index 0 t '' w l lw 2.0 lt 1 lc rgb '#0000ff' axis x1y1, \
'/home/aolivo/data.gnuplot' index 1 t 'Seno' w l lw 1.0 lt 1 lc rgb '#f03232' axis x1y1, \
'/home/aolivo/data.gnuplot' index 2 t 'Coseno' w l lw 1.0 lt 1 lc rgb '#8b0000' axis x1y1, \
'/home/aolivo/data.gnuplot' index 3 t '' w vect head size 0.1, 45 filled lw 1.0 lt 0 lc rgb '#8b0000' axis x1y1, \
'/home/aolivo/data.gnuplot' index 4 t '' w vect head size 0.1, 45 filled lw 1.0 lt 0 lc rgb '#f03232' axis x1y1, \
'/home/aolivo/data.gnuplot' index 5 t '' w vect head size 0.1, 45 filled lw 1.0 lt 0 lc rgb '#f03232' axis x1y1
