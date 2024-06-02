#!/bin/bash

#set -x

FOLDERS="/d/01.lilypond/01.github/baicasuyniem11-lmkimlong/nhac"
lilypondcmd='lilypond.exe'

export PATH=$PATH:/d/download/qpdf-10.1.0/bin

GEN="/d/01.lilypond/01.github/baicasuyniem11-lmkimlong/nhac"
#rm -rf ${GEN}
#mkdir ${GEN}

CONTENT=./muc-luc.csv
rm ${CONTENT}

# create a list of folders to scan for .ly files
IFS=' '
# scan .ly files
pagecounter=1
filelist=()
for fullname in ${FOLDERS}/*.ly
do
    name=`basename -- "$fullname"`
    shortname="${name%.*}"
    
    # lấy tên bài hát
    title=`cat "${fullname}" | grep " title" | grep "=" | sed 's/^[^"]*"//g' | sed -e 's/[[:space:]]*$//' | sed 's/\"[[:space:]]//g'`
    # bỏ ký tự cuối
    title=${title%?}
    # Thanh Vinh
    composer=`cat "${fullname}" | grep " composer" | grep "=" | sed 's/^[^"]*"//g' | sed -e 's/[[:space:]]*$//' | sed 's/\"[[:space:]]//g'`
    composer=${composer%?}
    
    # số trang của file tiếp sau
    pageno=`find "${GEN}" -xdev -type f -name "${shortname}.pdf" -exec pdfinfo "{}" ";" | awk '/^Pages:/ {n += $2} END {print n}'`
    echo "${composer}~${title}~${pagecounter}"
    echo "${composer}~${title}~${pagecounter}" >> ${CONTENT}
    pagecounter=$(( $pageno + $pagecounter ))
done
