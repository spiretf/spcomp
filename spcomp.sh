#! /bin/sh

if stat -t /include/* >/dev/null 2>&1; then
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

/scripting/spcomp "$IN" || exit

OUT="${IN%.sp}.smx"

chown $(stat -c '%u' "$IN"):$(stat -c '%g' "$IN") "$OUT"

if [ -d "/output" ]; then
  // copy without changing the file node
	cat $OUT > /output/$OUT
fi

if [ ! -z "$OUTPUT" ]
then
  mv $OUT /tmp/out.smx
  cd "$BASEDIR"
  cat /tmp/out.smx > $OUTPUT
fi
