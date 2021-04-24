import strings
// import os
fn read(s string) string {
	return s
}

fn eval(s string) string {
	return s
}

fn mal_print(s string) string {
	return s
}

fn rep(s_ string) string {
	mut s := read(s_)
	s = eval(s)
	s = mal_print(s)
	return s
}

fn read_line() string { unsafe {
	buf := [4096]byte{}
	mut res := strings.new_builder(1024)
	defer {
		res.free()
	}
	bufbp := &buf[0]
	C.fgets(&char(bufbp), 4096, C.stdin)
	len := vstrlen(bufbp)
	for i in 0 .. len {
		if bufbp[i] == `\n` {
				res.write_ptr(bufbp, i)
				final := res.str()
				return final
		}
	}
	res.write_ptr(bufbp, len)

	return res.str()
}}

fn main() {
	for {
		println('user>')
		mut s := read_line()
		s = rep(s)
		println(s)
		if s == 'a' {
		// if s == '\x4' {
			exit(0)
		}
	}
}
