#!/bin/bash
ctags -R --language-force=java --exclude=*.class --exclude=*.xml \
--exclude=*.xhtml --exclude=target $@
