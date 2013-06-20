voyeurb
=======

Watch your objects.

Intro
=====

Voyeurb can be added to your program to visualize the birth and death of your objects.

The classes in voyeurb are given Japanese names so they are less likely to conflict with your class names, since voyeurb's class names are excluded from analysis. Sorry if this is too cute.

Setup
=====

    rbenv local 2.0.0-p195
    gem install bundler
    bundle
    ./capture.sh
    ./watch.sh

Hacking
=======

This crap is written in ruby 2.0. Processing is JRuby. Have both.

     DEBUG=true ./watch.sh

...for less multithreading.

TODO
====

- fix concurrency bug in Population (some objs never die)
x capture a camping request/response
  x capture birth/death
  x capture method calls
  x whitelist api
  x change delimiter from `:'
x watch should ignore non-events
x normalize event timings
x draw class names over figures
x method calls should:
  x flash
  x display method name
- render objects
  - born = up
  - died = down

