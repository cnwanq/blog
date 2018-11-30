cd public
git pull origin master
cd ..
hugo -t angels-ladder --baseUrl="http://cnwanq.github.io/"
cd public
git add .
git commit -m "commit by shell script."
git push -u origin master
