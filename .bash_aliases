alias hg='history | grep'
alias xsc='xclip -selection clipboard'
alias ytmdlp='yt-dlp --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"'
rpt_fn () {
    nzk=$(grep -r "#####" /home/outer-brain/main/thinks | wc -l)
    ttm=$(cd /home/kur/Documents/mine/ttm.mvp1/;git nc)
    txt=$(du -sb /home/outer-brain/main/proj/TEXT | cut -f1)
    echo \`ttm\` = $ttm
    echo \`nzk\` = $nzk
    echo \`txt\` = $txt
}
alias rpt=rpt_fn
