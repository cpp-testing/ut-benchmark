#!/bin/bash

function plot {
  echo "Framework clang9 clang9.debug clang9.release gcc9 gcc9.debug gcc9.release" > /tmp/file
  echo -n "googletest-1.10.0 " >> /tmp/file
  grep "^$1:" clang9.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -1 | tail -1 | xargs echo -n >> /tmp/file
  grep "^$1:" clang9.debug.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -1 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" clang9.release.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -1 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" gcc9.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -1 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" gcc9.debug.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -1 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" gcc9.release.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -1 | tail -1 | xargs echo '' >> /tmp/file

  echo -n "catch2-2.10.2 " >> /tmp/file
  grep "^$1:" clang9.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -2 | tail -1 | xargs echo -n >> /tmp/file
  grep "^$1:" clang9.debug.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -2 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" clang9.release.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -2 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" gcc9.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -2 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" gcc9.debug.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -2 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" gcc9.release.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -2 | tail -1 | xargs echo '' >> /tmp/file

  echo -n "doctest-2.3.5 " >> /tmp/file
  grep "^$1:" clang9.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -3 | tail -1 | xargs echo -n >> /tmp/file
  grep "^$1:" clang9.debug.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -3 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" clang9.release.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -3 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" gcc9.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -3 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" gcc9.debug.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -3 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" gcc9.release.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -3 | tail -1 | xargs echo '' >> /tmp/file

  echo -n "ut-1.1.0 " >> /tmp/file
  grep "^$1:" clang9.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -4 | tail -1 | xargs echo -n >> /tmp/file
  grep "^$1:" clang9.debug.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -4 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" clang9.release.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -4 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" gcc9.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -4 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" gcc9.debug.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -4 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" gcc9.release.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -4 | tail -1 | xargs echo '' >> /tmp/file

  gnuplot << EOF
    set tmargin 5
    set title '$3 / $1 (smaller is better)'
    set title font ",16"
    set ylabel "$2"
    set terminal png
    set output '$3_$1.png'
    set style histogram clustered gap 1
    set grid y
    set boxwidth 1.0 absolute
    set style fill transparent solid 1.0 noborder
    set style data histogram
    set xtics rotate by 45 right
    set xrange [0.3:4.7]
    set offsets 0, 0, 0.01, 0
    plot "/tmp/file" using 2:xticlabels(1) title 'clang9', '' u 3 title 'clang9.debug', '' u 4 title 'clang9.release', '' u 5 title 'gcc9', '' u 6 title 'gcc9.debug', '' u 7 title 'gcc9.release'
EOF
}

function plot_ut {
  echo "Framework clang9 clang9.debug clang9.release" > /tmp/file
  echo -n "ut.header " >> /tmp/file
  grep "^$1:" ut.clang9.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -1 | tail -1 | xargs echo -n >> /tmp/file
  grep "^$1:" ut.clang9.debug.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -1 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" ut.clang9.release.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -1 | tail -1 | xargs echo '' >> /tmp/file

  echo -n "ut.pch " >> /tmp/file
  grep "^$1:" ut.clang9.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -2 | tail -1 | xargs echo -n >> /tmp/file
  grep "^$1:" ut.clang9.debug.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -2 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" ut.clang9.release.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -2 | tail -1 | xargs echo '' >> /tmp/file

  echo -n "ut.module " >> /tmp/file
  grep "^$1:" ut.clang9.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -3 | tail -1 | xargs echo -n >> /tmp/file
  grep "^$1:" ut.clang9.debug.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -3 | tail -1 | xargs echo -n '' >> /tmp/file
  grep "^$1:" ut.clang9.release.bench | cut -d' ' -f2 | xargs -n3 | cut -d' ' -f$4 | head -3 | tail -1 | xargs echo '' >> /tmp/file

  gnuplot << EOF
    set tmargin 5
    set title '$3 / $1 (smaller is better)'
    set title font ",16"
    set ylabel "$2"
    set terminal png
    set output 'ut_$3_$1.png'
    set style histogram clustered gap 1
    set grid y
    set boxwidth 1.0 absolute
    set style fill transparent solid 1.0 noborder
    set style data histogram
    set xtics rotate by 45 right
    set xrange [0.3:2.2]
    set offsets 0, 0, 0.01, 0
    plot "/tmp/file" using 2:xticlabels(1) title 'clang9', '' u 3 title 'clang9.debug', '' u 4 title 'clang9.release'
EOF
}

rm -f *.png

plot include "time [s]" Compilation 1

plot assert "time [s]" Compilation 1
plot assert "time [s]" Execution 2

plot test "time [s]" Compilation 1
plot test "time [s]" Execution 2

plot suite "time [s]" Compilation 1
plot suite "time [s]" Execution 2

plot suite+assert "time [s]" Compilation 1
plot suite+assert "time [s]" Execution 2

plot suite+assert+stl "time [s]" Compilation 1
plot suite+assert+stl "time [s]" Execution 2

plot_ut suite+assert+stl "time [s]" Compilation 1
plot_ut suite+assert+stl "time [s]" Execution 2
