======================
Simple vagrant machine
======================

Python centric developing machine machine

I use this machine for doing some development bits that don't require a single instance.


====================
Installation & Usage
====================

Make sure you have installed:

- vagrant  > 9.0 http://vagrantup.com/
- virtualBox https://www.virtualbox.org/

If you feel adventurous you can install the release candidate 1.0 vagrant as a package that doesn't require a ruby gem.

http://downloads.vagrantup.com/tags/v1.0.0.rc2


Or you can set up the ``GEMS_HOME`` on your bash profile so you don't have to ``sudo`` the gem instalation::

export GEM_HOME=$HOME/.gems


Do a checkout of the project::

$ git clone git://github.com/alfredo/vagrant-instance.git


Copy ``manifest/machine.pp.dist`` to ``manifest/machine.pp`` and edit the file with your details.

Please note that these details are used to fill in the templates in puppet.

This asumes that you have a ``projects`` directory one level up ``../projects`` of  your checkout.


Finally on your checkout directory run::

$ vagrant up

And after all the output you should be ready to go!
