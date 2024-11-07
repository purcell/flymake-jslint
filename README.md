flymake-jslint.el
=================

An Emacs flymake handler for syntax-checking Javascript source code
using [`jslint`](http://jslint.com/) or [`jsl`](http://javascriptlint.com/).

Installation
=============

If you choose not to use one of the convenient packages in
[Melpa][melpa] and [Marmalade][marmalade], you'll need to add the
directory containing `flymake-jslint.el` to your `load-path`, and then
`(require 'flymake-jslint)`. You'll also need to install
[flymake-easy](https://github.com/purcell/flymake-easy).

Usage
=====

Add the following to your emacs init file:

    (require 'flymake-jslint) ;; Not necessary if using ELPA package
    (add-hook 'js-mode-hook 'flymake-jslint-load)

The default checker is `jsl`, if that executable is
found at load-time. Otherwise, `jslint` is the default. If you want
to use the non-default checker, you can customize the values of
`flymake-jslint-command` and `flymake-jslint-args` accordingly.

[marmalade]: http://marmalade-repo.org
[melpa]: http://melpa.org

<hr>

[💝 Support this project and my other Open Source work via Patreon](https://www.patreon.com/sanityinc)

[💼 LinkedIn profile](https://uk.linkedin.com/in/stevepurcell)

[✍ sanityinc.com](http://www.sanityinc.com/)

