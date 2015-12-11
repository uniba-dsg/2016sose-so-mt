#!/usr/bin/gnuplot

set key autotitle columnhead
set linestyle 1
set style data lp
set terminal png
set xlabel "run"
set ylabel "HDD in MB"
set yrange[0:*]
set output 'hdd.png'
plot "values.dat" using 1:5, "values.dat" using 1:13, "values.dat" using 1:17, "values.dat" using 1:21

# plot "values.dat" using 1:5, "values.dat" using 1:9, "values.dat" using 1:13, "values.dat" using 1:17, "values.dat" using 1:21

