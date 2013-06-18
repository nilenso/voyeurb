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

- capture a camping request/response
- draw class names over figures
- method calls should:
  - flash
  - display method name
- render objects
  - born = up
  - died = down

