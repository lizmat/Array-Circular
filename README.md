[![Actions Status](https://github.com/lizmat/Array-Circular/workflows/test/badge.svg)](https://github.com/lizmat/Array-Circular/actions)

NAME
====

Array::Circular - add "is circular" trait to Arrays

SYNOPSIS
========

    use Array::Circular;

    my @a is circular(3);  # limit to 3 elements

DESCRIPTION
===========

This module adds a `is circular` trait to `Arrays`. This limits the size of the array to the given number of elements, similar to shaped arrays. However, unlike shaped arrays, you **can** `push`, `append`, `unshift` and `prepend` to arrays with the `is circular` trait. Then, if the resulting size of the array is larger than the given size, elements will be removed "from the other end" until the array has the given size again.

CAVEATS
=======

At this moment, it it only possible to specify the size of a circular array at compile time.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Array-Circular . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2018, 2020, 2021, 2022 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

