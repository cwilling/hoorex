
all: hoorex man


man:	hoorex.1


hoorex: VERSION.txt hoorex.in
	sed -e "s/^HOOREX_VERSION.*/HOOREX_VERSION = \'$$(cat VERSION.txt)\'/" hoorex.in > hoorex
	chmod a+x hoorex

hoorex.1:	hoorex.1.in
	a2x -f manpage $?

install: hoorex man
	install -m 0755 -D hoorex $(DESTDIR)/usr/bin/hoorex
	install -m 0644 -D hoorex.1 $(DESTDIR)/usr/man/man1/hoorex.1
	install -m 0644 -D completions/zsh/_hoorex $(DESTDIR)/usr/share/zsh/site-functions/_hoorex
	install -m 0644 -D completions/bash/hoorex $(DESTDIR)/usr/share/bash-completion/completions/hoorex

uninstall:
	rm -f $(DESTDIR)/usr/bin/hoorex
	rm -f $(DESTDIR)/usr/man/man1/hoorex.1*
	rm -f $(DESTDIR)/usr/share/zsh/site-functions/_hoorex
	rm -f $(DESTDIR)/usr/share/bash-completion/completions/hoorex

clean:
	rm -f hoorex.1 hoorex

.PHONY: clean
.PHONY: hoorex
.PHONY: man
