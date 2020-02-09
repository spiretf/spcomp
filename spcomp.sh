#! /bin/sh

if [ -e "/include/*" ]; then
  cp /include/* /scripting/include
fi

BASEDIR="$(pwd)"

IN=$*
OUT="$(basename "${IN%.sp}".smx)"

if [ ! -z "$OUTPUT" ]; then
  if [ "$IN" -ot "$OUTPUT" ]; then
      echo "Compiled file already up to date"
      return
  fi
fi

cd "$(dirname "$IN")" || exit

IN="$(basename "$IN")"

if [ "$IN" -ot "$OUT" ]; then
    echo "Compiled file already up to date"
    return
fi

/scripting/spcomp "$IN"

OUT="${IN%.sp}.smx"

chown $(stat -c '%u' "$IN"):$(stat -c '%g' "$IN") "$OUT"

if [ -d "/output" ]; then
	cp $OUT /output
fi

if [ ! -z "$OUTPUT" ]
then
  mv $OUT /tmp/out.smx
  cd "$BASEDIR"
  mv /tmp/out.smx $OUTPUT
fi