======================
Simple vagrant machine
======================

Python centric developing machine machine

I use this machine for doing some development bits that don't require a single instance.


====================
Installation & Usage
====================

Make sure you have installed:

- vagrant http://vagrantup.com/
- virtualBox https://www.virtualbox.org/

I recommend to set up the ``GEMS_HOME`` on your bash profile so you don't have to ``sudo`` the gem instalation::

export GEM_HOME=$HOME/.gems


Do a checkout of the project::

$ git clone git://github.com/alfredo/vagrant-instance.git


Copy ``manifest/machine.pp.dist`` to ``manifest/machine.pp`` and edit the file with your details.

This asumes that you have a ``projects`` directory one level up ``../projects`` of  your checkout.

Finally on your checkout directory run::

$ vagrant up

And after all the output you should be ready to go!
