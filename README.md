GPG Bruteforce tools
==============

Misc scripts I used to get back my GPG key. 

Sample usage: 

```bash
./gen_exrex.py 'secr(3|e)t(key)?[0-9]{2}' tried_passwords | gpg-agent --allow-loopback-pinentry --daemon ./bf.sh 58CE3C92
```

This will use the file ```tried_passwords``` (or create it, if it doesn't exist) as a store of already tried entries, in case you want to make slight alterations to the regex pattern without having to retry passwords that were already generated.
