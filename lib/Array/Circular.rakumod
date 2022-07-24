module Array::Circular {

    role circular[\size] {
        method append(::?ROLE:D: |) {
            callsame;
            self.shift until self.elems <= size;
        }
        method prepend(::?ROLE:D: |) {
            callsame;
            self.pop until self.elems <= size;
        }
        method push(::?ROLE:D: |) {
            callsame;
            self.shift until self.elems <= size;
        }
        method unshift(::?ROLE:D: |) {
            callsame;
            self.pop until self.elems <= size;
        }
    }

    multi sub trait_mod:<is>(Variable:D \v, :$circular! is raw) is export {
        if $circular.VAR.^name eq 'Scalar' {
            die "is circular() requires a compile-time constant value";
        }
        elsif $circular.Int -> \size {
            trait_mod:<does>(v, circular[size]);
            v.var.WHAT.^set_name(v.var.name ~ '[' ~ size ~ ',circular]');
        }
    }
}

=begin pod

=head1 NAME

Array::Circular - add "is circular" trait to Arrays

=head1 SYNOPSIS

  use Array::Circular;

  my @a is circular(3);  # limit to 3 elements

=head1 DESCRIPTION

This module adds a C<is circular> trait to C<Arrays>.  This limits the size
of the array to the given number of elements, similar to shaped arrays.
However, unlike shaped arrays, you B<can> C<push>, C<append>, C<unshift>
and C<prepend> to arrays with the C<is circular> trait.  Then, if the
resulting size of the array is larger than the given size, elements will
be removed "from the other end" until the array has the given size again.

=head1 CAVEATS

At this moment, it it only possible to specify the size of a circular
array at compile time.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Array-Circular .
Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a
L<small sponsorship|https://github.com/sponsors/lizmat/>  would mean a great
deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2018, 2020, 2021, 2022 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
