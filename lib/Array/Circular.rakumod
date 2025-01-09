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

    role callable-circular[&size] {
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
        if $circular ~~ Callable {
            trait_mod:<does>(v, callable-circular[$circular]);
            v.var.WHAT.^set_name(v.var.name ~ '[*?,circular]');
        }
        elsif $circular.VAR.^name eq 'Scalar' {
            die "is circular() requires a compile-time constant value";
        }
        orwith $circular.Int {
            trait_mod:<does>(v, circular[$_]);
            v.var.WHAT.^set_name(v.var.name ~ "[$_,circular]");
        }
        else {
            die "Don't know how to handle 'is circular($circular.raku())";
        }
    }
}

# vim: expandtab shiftwidth=4
