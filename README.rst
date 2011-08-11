===============================
Simple vagrant machine
===============================

A Vagrant configuration for a Python-centric machine, largely based on
https://github.com/theteam/vagrant-django-template

I use this machine for doing some development bits that don't require
a single instance.


====================
Installation & Usage
====================

Do a checkout of the project::

$ git clone git://github.com/alfredo/vagrant-instance.git


On your checkout directory run::

$ vagrant up


This asumes that you have a ``projects`` directory one level up
``../projects`` of  your checkout.


Pre requisites
----------------------------------------

Requirements: Vagrant & Virtualbox 4.x. So for Vagrant (it's a Ruby gem)::

$ gem install vagrant

or, if you're using RVM (if not, why not?)::

$ rvm 1.9.2 gem install vagrant
