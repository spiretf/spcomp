#! /bin/sh

cp /include/* /scripting/include

/scripting/spcomp $@

out="${1%.sp}.smx"

chown $(stat -c '%u' $1):$(stat -c '%g' $1) $out

if [ -d "/output" ]; then
	mv $out /output
fi

if [ ! -z "$OUTPUT" ]
then
  cp /output/$out $OUTPUT
fi