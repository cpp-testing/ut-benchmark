#!/bin/bash

function plot {
  echo -n "googletest " > /tmp/file
  grep "^$1:" $2.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -1 | tail -1 >> /tmp/file

  echo -n "catch2 " >> /tmp/file
  grep "^$1:" $2.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -2 | tail -1 >> /tmp/file

  echo -n "doctest " >> /tmp/file
  grep "^$1:" $2.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -3  | tail -1 >> /tmp/file

  echo -n "ut " >> /tmp/file
  grep "^$1:" $2.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -4 | tail -1 >> /tmp/file

  gnuplot << EOF
    set title '$3 / $1 / $2'
    set ylabel "time [s]"
    set terminal png
    set output '$3_$1_$2.png'
    set boxwidth 0.5
    set style fill solid
    unset key
    set grid
    plot "/tmp/file" using 2:xtic(1) with boxes
EOF
}

function plot_compilation {
  plot $1 clang9 Compilation 1
  plot $1 clang9.debug Compilation 1
  plot $1 clang9.O2 Compilation 1
  plot $1 gcc9 Compilation 1
  plot $1 gcc9.debug Compilation 1
  plot $1 gcc9.O2 Compilation 1
}

function plot_execution {
  plot $1 clang9 Execution 2
  plot $1 clang9.debug Execution 2
  plot $1 clang9.O2 Execution 2
  plot $1 gcc9 Execution 2
  plot $1 gcc9.debug Execution 2
  plot $1 gcc9.O2 Execution 2
}

function plot_all {
  plot_compilation $1
  plot_execution $1
}

rm -f *.png
plot_compilation include
plot_all assert
plot_all test
plot_all suite
plot_all suite+assert
