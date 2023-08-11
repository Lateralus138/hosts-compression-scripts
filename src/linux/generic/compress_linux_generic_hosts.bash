#!/usr/bin/env bash
if [[ $# -gt 0 ]]; then
	OUTPUT="$*"
fi
SEPERATOR="════════════════════════════════════════════════"
TITLE=$(cat << EOF
 ╔$SEPERATOR╗
 ║ Linux Hosts File Compressor                    ║
 ╚$SEPERATOR╝
EOF
)
HOSTS="/etc/hosts"
if [[ ! -f "$HOSTS" ]]; then
	echo -e "$HOSTS does not exist."
	exit 1
fi
CONTENT=$(<$HOSTS)
HEADERARRAY=() URLSTEMPARRAY=() URLSARRAY=() FOOTERARRAY=() ISHEADER=true
index=0
clear && echo -en "\x1b[3J$TITLE"
while IFS= read -r line; do
	index=$((index + 1))
	echo -en "\x1b[J\x1b[4;1H\x1b[s  $SEPERATOR\n  Parsing line: [$index]\n  $SEPERATOR\x1b[u"
	if [[ "$line" =~ ^(0.0.0.0)[\s]* ]] && ! [[ "$line" =~ ^0.0.0.0" "0.0.0.0$ ]]; then
		if [[ -n "$ISHEADER" ]]; then
			unset ISHEADER
		fi
		URLSTEMPARRAY+=("${line:8}")
	else
		if [[ -n "$ISHEADER" ]]; then
			HEADERARRAY+=("$line")
		else
			FOOTERARRAY+=("$line")
		fi
	fi
done < <(printf '%s\n' "$CONTENT")
for ((index=0; index<${#URLSTEMPARRAY[@]}; index+=9))
{
	echo -en "\x1b[J\x1b[4;1H\x1b[s  $SEPERATOR\n  [$((${#URLSTEMPARRAY[@]} - index))] urls left to compress...\n  $SEPERATOR\x1b[u"
	URLSARRAY+=("0.0.0.0 ${URLSTEMPARRAY[*]:$index:9}")
}
echo -en "\x1b[J\x1b[4;1H\x1b[s  $SEPERATOR\n  ${#URLSTEMPARRAY[@]} urls compressed to ${#URLSARRAY[@]} lines.\n  $SEPERATOR\x1b[u"
echo -e "\x1b[6;1H"
if [[ -n "$OUTPUT" ]]; then
	printf '%s\n' "${HEADERARRAY[@]}" "${URLSARRAY[@]}" "${FOOTERARRAY[@]}" > "$OUTPUT"
	echo -en "\x1b[J\x1b[7;1H\x1b[s  $SEPERATOR\n  The output file is located at:\n  $OUTPUT\n  $SEPERATOR\x1b[u"
	echo -e "\x1b[10;1H"
else
	printf '%s\n' "${HEADERARRAY[@]}" "${URLSARRAY[@]}" "${FOOTERARRAY[@]}"
fi