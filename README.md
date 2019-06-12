# nodejs_app 


Section 1: nodejs_app 

Install dependencies
npm install

Run application.

npm start
Browser http://localhost:3000?name=walid

You should see `walid`

Run test
npm test

Section 2:`make install-git-hooks` command:
git hook installation :
1- Add a folder "hooks" into your git repository that you are cloned
2- Create in this folder file "pre-push" 
3-in the directory of git repository that is cloned, Create file Makefile
CURRENT_DIR = $(shell pwd)

install-git-hooks: ##@git-hooks Install git hooks
	@rm -rf .git/hooks && ln -s -f ${CURRENT_DIR}/hooks ${CURRENT_DIR}/.git/hooks
in order to create a symlink "the .git/hooks points /hooks"
the goal is to keep your hooks within version control
4- execute the task: make install-git-hooks
5- go to .git/
ls -lash , you should get this:
 0 lrwxrwxrwx  1 root root   27 Mar 14 06:36 hooks -> /home/yosr/nodejs_app/hooks
6-Finally, from now after you clone your  repository,  run this command `make install-git-hooks` to install git hooks.






