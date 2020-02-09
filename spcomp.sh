#! /bin/sh

if [ -e "/include/*" ]; then
  cp /include/* /scripting/include
fi

IN=$@
cd $(dirname $IN)

IN="$(basename $IN)"
OUT="${IN%.sp}.smx"

if [ "$IN" -ot "$OUT" ]; then
    echo "Compiled file already up to date"
    return
fi

if [ ! -z "$OUTPUT" ]; then
  if [ "$IN" -ot "$OUTPUT" ]; then
      echo "Compiled file already up to date"
      return
  fi
fi

/scripting/spcomp $IN

OUT="${IN%.sp}.smx"

chown $(stat -c '%u' $IN):$(stat -c '%g' $IN) $OUT

if [ -d "/output" ]; then
	cp $OUT /output
fi

if [ ! -z "$OUTPUT" ]
then
  cp $OUT $OUTPUT
fi