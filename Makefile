#
#
#

clean:
	rm -f *.elc
	find kfi -name '*.elc' -ls -delete
	find . -name '*~' -ls -delete
