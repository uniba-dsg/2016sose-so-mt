#!/usr/bin/gnuplot

set key autotitle columnhead
set linestyle 1
set style data lp
set terminal png
set xlabel "run"
set ylabel "TTFR in seconds"
set yrange[0:*]
#set yrange[0:*]
set output 'timetofirtresponse.png'
plot "values.dat" using 1:($2/10000), "values.dat" using 1:($10/10000), "values.dat" using 1:($14/10000), "values.dat" using 1:($18/10000)

#plot "values.dat" using 1:($2/10000), "values.dat" using 1:($6/10000), "values.dat" using 1:($10/10000), "values.dat" using 1:($14/10000), "values.dat" using 1:($18/10000)
