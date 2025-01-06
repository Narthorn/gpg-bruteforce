#!/usr/bin/bash

GPG_KEY=${1+"--default-key $1"}

gpg $GPG_KEY -n --passphrase NobodyCouldPossiblyHaveThisAsAPassphrase --pinentry-mode loopback --clearsign /dev/null >&/dev/null
[[ $? == 0 ]] && echo "$0: No passphrase required, or passphrase is already registered in the gpg-agent." && exit -1

while read pass; do
	if [[ $pass ]]; then
		gpg_test=$(gpg $GPG_KEY -n --passphrase "$pass" --pinentry-mode loopback --clearsign /dev/null 2>&1)
		ret=$?
		[[ $ret == 0 ]] && echo "Found ! Passphrase: $pass" && break
		[[ ! $gpg_test =~ "Bad passphrase" ]] && echo "$gpg_test" && exit $ret
	fi
done

[[ ! $ret == 0 ]] && echo "Not found :(" && exit -1
