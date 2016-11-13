#!/bin/bash
#
# 17/08/2015 mda
#	Verificacao de binarios no Path que nao pertencem a nenhum pacote
#  Changes
#   17/08/2015 v2 - SUID Find
#   17/08/2015 v1 - RedHat & Debian
#   17/08/2015 v0 - Debian only
#
VERSION=v2
CACHE=/tmp/Check_Cache
LogFile=/tmp/Check_Log.${HOSTNAME}
SUIDFile=/tmp/Check_SUID
PackageSearch=
PackageList=
DebugLevel=1
InodeLimit=300000

Log() {
  lvl=$1; shift
  if [ "$lvl" -le "$DebugLevel" ]; then
	printf "%s %s\n" "$(date +%Y%m%d-%H:%M:%S)" "$*" | tee -a $LogFile
  fi
}

if which yum > /dev/null 2>&1; then
	Log 0 "Iniciando validacao RedHat Like"
	PackageSearch="rpm -qf "
	PackageList="rpm -ql "
elif which dpkg-query > /dev/null 2>&1; then
	Log 0 "Iniciando validacao Debian Like"
	PackageSearch="dpkg-query --search "
	PackageList="dpkg -L "
else
	Log 0 " ** RedHat/Debian incompatible **"
	exit 1
fi
touch $CACHE
Log 0 "Iniciando varredura do PATH $PATH"
for D in $(echo $PATH | sed 's/:/ /g'); do
	if [ ! -d "$D" ]; then
		Log 1 " Diretorio '$D' ausente!"
		continue;
	fi
	nFiles=$(find $D -maxdepth 1 | wc -l)
 	Log 1 " Verificando Diretorio $D - $nFiles arquivos."
	for F in $D/*; do
		if [ ! -e "$F" ]; then
			Log 2 "   Skip '$F' inexistente"
			continue
		elif [ -d "$F" ]; then
			Log 2 "   Skip '$F' Diretorio"
			continue
		elif [ -L "$F" ]; then
			LOG="$F"
			F="$(readlink -f $F)"
			Log 2 "   Link '$LOG' ajustado para '$F'"
		fi

		if [ -f "$F" ]; then
			if grep "^$F:" "$CACHE" > /dev/null 2>&1; then
				[ "$DebugLevel" -gt 3 ] && Log 5 "   Check '$F' encontrado no cache"
				continue
			fi
			PACKAGE=$($PackageSearch "$F" 2> /dev/null | cut -d: -f 1 | grep -v ' ')
			if [ -z "$PACKAGE" ]; then
				Log 0 "   '$F' - suspeito! md5: $(md5sum < "$F" | awk '{print $1}')"
			else
				Log 4 " **Package '$PACKAGE' identificado. Gerando cache"
				$PackageList "$PACKAGE" | xargs -n1 printf "%s:$PACKAGE\n" >> "$CACHE"
				Log 3 "   List package $PACKAGE content $(grep ":$PACKAGE$" "$CACHE" | wc -l | awk '{print $1}')"
			fi
		else
			Log 0 "   '$F' - suspeito - Nao eh arquivo!"
			Log 0 "     :  $(ls -l "$F")"
		fi
	done
done

Log 0 "Iniciando varredura de SUID"
for MountPoint in $(mount -l | egrep -v -e 'type (devpts|proc)' | awk '{print $3}'); do
	inodes=$(df -iP $MountPoint  | tail -1 | awk '{print $3}');
	Log 0 "- Verificando $MountPoint com $inodes inodes"
	if [ "$inodes" -gt $InodeLimit ]; then
		Log 0 "  ATENCAO MountPoint $MountPoint nao verificado. Total de inodes elevado $inodes"
		continue
	fi
	find $MountPoint -mount \( -perm +2000 -o -perm +4000 -o -perm +6000 \) -type f > "$SUIDFile" 2> /dev/null
	if [ ! -s "$SUIDFile" ]; then
		Log 1 "  Nenhum arquivo com SUID encontrado."
		continue
	fi

	Log 1 "  Investigando $(cat "$SUIDFile" | wc -l | awk '{print $1}') SUID's"
	cat "$SUIDFile" | while read fname; do
		if ! grep "^$fname:" "$CACHE" > /dev/null 2>&1; then
			PACKAGE=$($PackageSearch "$fname" 2> /dev/null | cut -d: -f 1 | grep -v ' ')
			if [ -z "$PACKAGE" ]; then
				Log 0 "   '$fname' - SUID suspeito nao pertence a nenhum package!"
			else
				Log 2 "   '$fname' - SUID inserido pelo package $PACKAGE!"
			fi
		fi
	done
done

rm -f "$CACHE" "$SUIDFile"

Log 0 "Concluido processamento - Verificar log $LogFile"

