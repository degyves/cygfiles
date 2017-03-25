#!/usr/bin/env python
# coding=utf-8
import subprocess, sys, fileinput, os, codecs, argparse
from lxml import etree
from io import StringIO
parser = argparse.ArgumentParser (description='Utileria'
        + 'para hacer queries sobre un archivo xml',
        epilog='Ejemplo: '
        +'./pyxpath.py archivo.xml'
        '/foo/bar')
parser.add_argument("archivo",  help='archivo al que se le aplique'
        +'el query.')
parser.add_argument("query", help='Query en xpath2.')
args = parser.parse_args()
f = args.archivo
xmlfile = open(f,'r', encoding='utf-8')
xmlcontent = xmlfile.read()
xmlcontent = xmlcontent.decode('utf-8').encode('ascii')
#f = StringIO('<foo><bar></bar></foo>')
#f = StringIO(s)
print(f)
tree = etree.parse( xmlcontent )
print(args.query)
print("Result:")
r = tree.xpath( args.query )
print(r)

