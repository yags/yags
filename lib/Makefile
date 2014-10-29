clean:
	rm *~

count:
	wc -l *.g*

headers:
	grep -E '^#[^# E]' *.g* >../00Headers.txt
perms:
	chown map *
	chgrp map *
	chmod 664 *
