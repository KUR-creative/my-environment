 [how to use git]
git add XXX     // XXX to staging area
    
git commit -a   // skip staging and commit
git commit -a -m 'commit comment'   
//skip staging and commit comment

git push origin master  
// push to remote 'origin'

git log
git log --format=oneline

git log -p <filename>

git ls-tree -r branch-name --name-only
// list all of the files currently being tracked under the branch-name

// ignore change of files.
git update-index --assume-unchanged [<file> ...]
// unde above and tracking again.
git update-index --no-assume-unchanged [<file> ...]

// how to know what files were tracked/untracked
git ls-files -v | grep '^[[:lower:]]'

// You can use 
git ls-files -v
// If the character printed is lower-case, 
// the file is marked assume-unchanged.

커밋을 좀 더 나눠서 하고 지금 뭘 하는지 좀더 제대로 기록하라
먼저 기록을 하고 움직여라. 그래야 무엇을 했는지 구분이 가능하다.


 [how to use ctags]
// make all tags in this directory. 
:!ctags -R


 [vim]
<c-w>x : 이전 창과 위치 바꾸기
:mks //save session
$vim -S Session.vim //open Session

//edit macro!
Try entering the escape with <Ctrl-v><Esc> in insert mode. See :help i_CTRL-V in vim.

how to expert in cursor moving? how vim to know CONTEXT? regex?

 [vim macros]
@i / @u: set c annotation in one line / unset c annotation in one line
I//j
^xxj

@t: write TEST template and switch insert mode
oTEST(){(void)state;//givenjO//whenjO//thenjO}kkkkkkkkllllli

@h: get function name from TEST generator
^eeebveeeykicmocka_unit_test_setup_teardown(pa),bbbR__>>>>$hi, setUp, tearDowndd

@h: get function name from TEST generator
^eeebveeeykicmocka_unit_test(pa),bbbR__>>>>$hdd

@0: temporary macro. it always change!

regex:
    \<start_end\>

where is my .vimrc file?
:echo($MYVIMRC)

 [cmocka]
// need to write some simple test macros...
see ~/study/cmocka-test/test.c
    
 [pro-like development]
    use git to version control!
    pro-like testing
    consistent naming convention
        parameter, local variables use snake_case, 
        and short words and abbreviation

        more permanant thing, use carmelCase.
        function name, struct member name.

    아니 개좆같네.. 왜 출력을 못 정하냐 병신 아니냐...
    어떻게 하면 criterion처럼 편하게할 수 있나?

 [colors]
:hi DefinedName cterm=Brown

Comment             DarkCyan
DefinedName         Brown       
Member              Gray
EnumerationValue    Magenta     //mean constant 
GlobalVariable      link to Normal

