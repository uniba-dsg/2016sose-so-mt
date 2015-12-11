#!/usr/bin/gnuplot

set key autotitle columnhead
set linestyle 1
set style data lp
set terminal png
set xlabel "run"
set ylabel "average containersize from start to first response in MB"
set yrange[0:*]
set output 'memory-avg.png'
plot "values.dat" using 1:4, "values.dat" using 1:8, "values.dat" using 1:12, "values.dat" using 1:16, "values.dat" using 1:20

