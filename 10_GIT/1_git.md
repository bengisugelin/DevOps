### Example for local repository:

```
bengi@LAPTOP-P7IJPPN9 MINGW64 ~/Desktop/udemy/devops/10_GIT
$ git init
Initialized empty Git repository in C:/Users/bengi/Desktop/udemy/devops/10_GIT/.git/

bengi@LAPTOP-P7IJPPN9 MINGW64 ~/Desktop/udemy/devops/10_GIT (master)
$ mkdir nebula

bengi@LAPTOP-P7IJPPN9 MINGW64 ~/Desktop/udemy/devops/10_GIT (master)
$ mkdir jupiter

bengi@LAPTOP-P7IJPPN9 MINGW64 ~/Desktop/udemy/devops/10_GIT (master)
$ mkdir pluto

bengi@LAPTOP-P7IJPPN9 MINGW64 ~/Desktop/udemy/devops/10_GIT (master)
$ ls
1_git.md  jupiter/  nebula/  pluto/

bengi@LAPTOP-P7IJPPN9 MINGW64 ~/Desktop/udemy/devops/10_GIT (master)
$ touch saturn{1..10}.py

bengi@LAPTOP-P7IJPPN9 MINGW64 ~/Desktop/udemy/devops/10_GIT (master)
$ ls
1_git.md  nebula/  saturn1.py   saturn2.py  saturn4.py  saturn6.py  saturn8.py
jupiter/  pluto/   saturn10.py  saturn3.py  saturn5.py  saturn7.py  saturn9.py

bengi@LAPTOP-P7IJPPN9 MINGW64 ~/Desktop/udemy/devops/10_GIT (master)
$ touch jupiter/test1

bengi@LAPTOP-P7IJPPN9 MINGW64 ~/Desktop/udemy/devops/10_GIT (master)
$ touch nebula/testter32

bengi@LAPTOP-P7IJPPN9 MINGW64 ~/Desktop/udemy/devops/10_GIT (master)
$ touch pluto/tester89

bengi@LAPTOP-P7IJPPN9 MINGW64 ~/Desktop/udemy/devops/10_GIT (master)
$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        1_git.md
        jupiter/
        nebula/
        pluto/
        saturn1.py
        saturn10.py
        saturn2.py
        saturn3.py
        saturn4.py
        saturn5.py
        saturn6.py
        saturn7.py
        saturn8.py
        saturn9.py

nothing added to commit but untracked files present (use "git add" to track)

bengi@LAPTOP-P7IJPPN9 MINGW64 ~/Desktop/udemy/devops/10_GIT (master)
$ git add .

bengi@LAPTOP-P7IJPPN9 MINGW64 ~/Desktop/udemy/devops/10_GIT (master)
$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   1_git.md
        new file:   jupiter/test1
        new file:   nebula/testter32
        new file:   pluto/tester89
        new file:   saturn1.py
        new file:   saturn10.py
        new file:   saturn2.py
        new file:   saturn3.py
        new file:   saturn4.py
        new file:   saturn5.py
        new file:   saturn6.py
        new file:   saturn7.py
        new file:   saturn8.py
        new file:   saturn9.py


bengi@LAPTOP-P7IJPPN9 MINGW64 ~/Desktop/udemy/devops/10_GIT (master)
$ git commit -m "new files committed"
[master (root-commit) 4d4b25a] new files committed
 14 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 1_git.md
 create mode 100644 jupiter/test1
 create mode 100644 nebula/testter32
 create mode 100644 pluto/tester89
 create mode 100644 saturn1.py
 create mode 100644 saturn10.py
 create mode 100644 saturn2.py
 create mode 100644 saturn3.py
 create mode 100644 saturn4.py
 create mode 100644 saturn5.py
 create mode 100644 saturn6.py
 create mode 100644 saturn7.py
 create mode 100644 saturn8.py
 create mode 100644 saturn9.py

bengi@LAPTOP-P7IJPPN9 MINGW64 ~/Desktop/udemy/devops/10_GIT (master)
$ git status
On branch master
nothing to commit, working tree clean

```

Local to Remote integration:

- cd to local repo
- git remote add origin -> ssh://git@github.com/[username]/[repo-name].git
- git push
