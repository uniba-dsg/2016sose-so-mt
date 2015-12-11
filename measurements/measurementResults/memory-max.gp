#!/usr/bin/gnuplot

set key autotitle columnhead
set linestyle 1
set style data lp
set terminal png
set xlabel "run"
set ylabel "RAM in MB"
set yrange[0:800]
#set yrange[0:*]
set output 'memory-max.png'
plot "values.dat" using 1:3, "values.dat" using 1:11, "values.dat" using 1:15, "values.dat" using 1:19

# plot "values.dat" using 1:3, "values.dat" using 1:7, "values.dat" using 1:11, "values.dat" using 1:15, "values.dat" using 1:19
