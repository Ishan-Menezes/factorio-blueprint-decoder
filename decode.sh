#!/bin/bash

display_help() {
    echo "Usage: decode {input_file} {output_file='temp\out.json'} " >&2
    echo "Convert a *.dat file into plain JSON"
    echo
    echo "   -h, --help         display help"
    echo
    exit 1
}

# Checking Parameter Options
for arg in "$@"
do
    case "$arg" in
      -h | --help)
          display_help
          exit 0
          ;;
      -*)
          echo "decode: unknown option: $1" >&2
          exit 1
          ;;
      *)
          ;;
    esac
done

# Checking Parameters
if (("$#" == 0 )); then
    echo "decode: missing input file"
    exit 1
elif (("$#" > 2 )); then
    echo "decode: too many arguements"
    exit 1
fi

# Main
mkdir -p temp

python 'dat-json\decode.py' $1 > ${2:-temp/out.json}
