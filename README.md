[![Actions Status](https://github.com/lizmat/Array-Circular/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/Array-Circular/actions) [![Actions Status](https://github.com/lizmat/Array-Circular/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/Array-Circular/actions) [![Actions Status](https://github.com/lizmat/Array-Circular/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/Array-Circular/actions)

NAME
====

Array::Circular - add "is circular" trait to Arrays

SYNOPSIS
========

```raku
use Array::Circular;

# limit to 3 elements at compile time
my @a is circular(3);

# random size picked at runtime
my $size = (^10).roll;
my @b is circular(-> { $size });
```

DESCRIPTION
===========

This module adds a `is circular` trait to `Arrays`. This limits the size of the array to the given number of elements, similar to shaped arrays. However, unlike shaped arrays, you **can** `push`, `append`, `unshift` and `prepend` to arrays with the `is circular` trait. Then, if the resulting size of the array is larger than the given size, elements will be removed "from the other end" until the array has the given size again.

The size of the circular array must be given by a value that is known at compile time. This can either be a literal value, a numeric constant or a code block that will return the required size when it is called (without any arguments).

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Array-Circular . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2018, 2020, 2021, 2022, 2024, 2025 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

