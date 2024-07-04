#!/usr/bin/env bash
 FESTIVALDIR="/home/getac/Develop/festival"
 tests_dir="$FESTIVALDIR/lib/dicts/INST_LANG/disle_tests/"
# -h FILE        True if file is a symbolic link
if [[ -h tests ]] ; then  rm -i "${tests_dir}"/tests; fi
# proposition de test	
if [[ ! -d tests1 ]] ; then  echo test1 is missing; exit 1; fi	

 myarr=()
 mapfile -t myarr < <(find "${tests_dir}" -maxdepth 1 -name 'tests-'"*" | sort -r)
 echo myarr "${myarr[0]}"; # /home/dop7/Develop/festival/lib/dicts/INST_LANG/disle_tests/tests-4
 echo tentative archivage du dernier test en tests-$(( "${#myarr[@]}" + 1 )); # 5
 nouvelle_archive="${tests_dir}"/tests-$(( "${#myarr[@]}" + 1 )); # echo $nouvelle_archive /home/dop7/Develop/festival/lib/dicts/INST_LANG/disle_tests//tests-5
 mkdir -p "${nouvelle_archive}"

ln -s -L -r  -v  -T  "${nouvelle_archive}" "${tests_dir}"/tests; # cible nom de lien relatif 

ls -al "${tests_dir}"/tests

 ( cp  "${tests_dir}"/tests1/ttd "${nouvelle_archive}" ) || exit 0
 # on reprend le dernier ttd
 # cp "${nouvelle_archive}"/ttd "${tests_dir}"/tests1
 # ln -s -L -r  -v  -T  "${tests_dir}"/tests1 "${tests_dir}"/tests; # cible nom de lien relatif
# pour mémoire    
cp -b "$FESTIVALDIR"/lib/INST_LANG/INST_LANG_token_to_words_autre.scm "${tests_dir}"/tests/
cp -b "$FESTIVALDIR"/lib/INST_LANG/INST_LANG_norm.scm "${tests_dir}"/tests/
cp -b "$FESTIVALDIR"/lib/dicts/INST_LANG/INST_LANG_token_to_words_lists.scm "${tests_dir}"/tests/

if [[ ! -s "${tests_dir}"/tests/ttd ]]; then 
echo no non empty "${tests_dir}"/tests/ttd generated; exit 1;
else
echo working with "$(wc -l <"${tests_dir}"/tests/ttd)" texts
fi

"$FESTIVALDIR"/bin/festival -b '(begin  (set_backtrace t)(voice_INST_LANG_VOX_cg))' || ( echo "something wrong with festival" ; exit 1 )

"$FESTIVALDIR"/bin/festival -b "${tests_dir}"/check.scm '(begin  (set_backtrace t)(set! suivi t)(check "'"${tests_dir}/tests/ttd"'"))' #| tee -a > log_tests
