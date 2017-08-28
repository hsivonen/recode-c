# recode_c

recode_c is a test/sample app that's written in C and uses
[encoding_rs](https://github.com/hsivonen/encoding_rs).

It expects encoding_rs to have been checked out to an adjacent directory.

## Licensing

Please see the file named COPYRIGHT.

## Building

Git, GNU Make and a version of GCC recent enough to accept `-std=c11` are
assumed to be already installed.

### 0. Install Rust (including Cargo) if you haven't already

See [rustup.rs](https://rustup.rs/). For
Linux and OS X, this means:
```
curl https://sh.rustup.rs -sSf | sh
```

### 1. Clone recode_c

```
git clone https://github.com/hsivonen/recode_c.git
```

### 2. Build recode_c

```
cd recode_c
make
```

### 3. Run it

```
./recode_c --help
```
