
all: hoorex man


man:	hoorex.1


hoorex: VERSION.txt
	sed -i -e "s/^HOOREX_VERSION.*/HOOREX_VERSION = \'$$(cat VERSION.txt)\'/" hoorex

hoorex.1:	hoorex.1.in
	a2x -f manpage $?

install: hoorex man
	install -m 0755 -D hoorex $(DESTDIR)/usr/bin/hoorex
	install -m 0644 -D hoorex.1 $(DESTDIR)/usr/man/man1/hoorex.1

uninstall:
	rm $(DESTDIR)/usr/bin/hoorex
	rm $(DESTDIR)/usr/man/man1/hoorex.1

clean:
	rm -f hoorex.1
	sed -i -e "s/^HOOREX_VERSION.*/HOOREX_VERSION = 'X.Y.Z'/" hoorex

.PHONY: clean
.PHONY: hoorex
.PHONY: man
