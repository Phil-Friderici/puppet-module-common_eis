# puppet-module-common_eis #

[![Build Status](
https://api.travis-ci.org/juliengk/puppet-module-common_eis.png?branch=master)](https://travis-ci.org/juliengk/puppet-module-common_eis)

common module to be applied to **ALL** nodes

# Compatibility #

Module is generic enough to work on any system, though the individual modules that it could potentially include could be very platform specific.

===

# Common class #
Optionally include classes that are common to all EIS systems, such as `autofs`, `customrepo`, `nrpe`, `nscd`, ... By default we do not take any action, so you must enable the classes. This should be done in Hiera such as the following example. Ideally you would do this in your least specific level of hiera (often times labeled as 'common_eis' or 'global') and potentially override at other levels.

<pre>
---
common_eis::enable_afs: 'true'
common_eis::enable_autofs: 'true'
common_eis::enable_beuser: 'true'
common_eis::enable_customrepo: 'true'
common_eis::enable_nrpe: 'true'
common_eis::enable_nscd: 'true'
common_eis::enable_sudo: 'true'
common_eis::enable_vas: 'true'
</pre>
