#!/usr/bin/env python

"""
Detects and deactivates duplicate Apt source entries in `/etc/sources.list'
and `/etc/sources.list.d/*.list'.
"""

from __future__ import print_function
from collections import defaultdict
import aptsources.sourceslist
import itertools
import sys


def _get_python_packagename(basename):
    version = sys.version_info.major
    version_part = str(version) if version >= 3 else ''
    return 'python{0:s}-{1:s}'.format(version_part, basename)


def get_duplicates(sourceslist):
    sentry_map = defaultdict(list)
    for se in sourceslist.list:
        if not se.invalid and not se.disabled:
            for c in (se.comps or (None,)):
                sentry_map[(se.type, se.uri, se.dist, c)].append(se)
    return filter(lambda dupe_set: len(dupe_set) > 1, sentry_map.values())


def _main():
    sourceslist = aptsources.sourceslist.SourcesList(False)
    duplicates = tuple(get_duplicates(sourceslist))
    if duplicates:
        for dupe_set in duplicates:
            orig = dupe_set.pop(0)
            for dupe in dupe_set:
                print(
                    'Overlapping source entries:\n'
                    '  1. {0}: {1}\n'
                    '  2. {2}: {3}\n'
                    'The latter entry was disabled.'.format(
                        orig.file, orig, dupe.file, dupe),
                    end='\n\n')
                dupe.disabled = True
        print('\n{0} source entries were disabled:'.format(len(duplicates)),
              *itertools.chain(*duplicates), sep='\n  ', end='\n\n')
        sourceslist.save()
    else:
        print('No duplicate entries were found.')
    return 0


if __name__ == '__main__':
    sys.exit(_main())
