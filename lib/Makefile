clean:
	rm *~

count:
	wc -l *.g*

headers:
	grep -E '^#[^# E]' *.g* >../dev/headers
perms:
	chown map *
	chgrp map *
	chmod 664 *
