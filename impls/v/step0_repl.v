import os
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

fn main() {
	for {
		mut s := os.input('user> ')
		s = rep(s)
		println(s)
		if s == '<EOF>' {
			exit(0)
		}
	}
}
