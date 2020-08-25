I have a problem with ppx rewriters

I have

- lib/libmain which is a library with logic of rewriter
- lib/libplugin which is a dynamically loadable plugin for lib/libmain
- lib/ppxmain which is actual ppx rewriter that uses lib/libmain. It may use lib/libplugin, but indirectly
- ./main is an executable which is going to use ppx rewriter build using lib/libmain, lib/libplugin and lib/ppxmain. At the momenent if I write `(preprocess (pps ppxmain))` I do not link a plugin, which is not what I want.

The problem I don't know how to specify all three libnraries using `(preprocess (pps ...))` dune stanza.

Current workaround: create a custom executable which will link all the stuff together using `-linkall` flag and use it as a custon rewriter.
