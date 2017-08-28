# Copyright 2016 Mozilla Foundation. See the COPYRIGHT
# file at the top-level directory of this distribution.
#
# Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
# http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
# <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
# option. This file may not be copied, modified, or distributed
# except according to those terms.

CFLAGS = -Wall -Wextra -Werror -O3 -std=c11
LDFLAGS = -Wl,--gc-sections -ldl -lpthread -lgcc_s -lrt -lc -lm

recode_c: recode_c.o rustglue/target/release/librustglue.a
	$(CC) -o $@ $^ $(LDFLAGS)

recode_c.o: encoding_rs.h encoding_rs_statics.h recode_c.c

rustglue/target/release/librustglue.a: cargo

.PHONY: cargo
cargo:
	cd rustglue/; cargo build --release

.PHONY: all
all: recode_c

.PHONY: fmt
fmt:
	clang-format-3.8 --style=mozilla -i *.c

.PHONY: clean
clean:
	rm recode_c
	cd rustglue/; cargo clean
