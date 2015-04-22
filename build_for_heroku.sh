grunt build
cp -R dist/* ../project_robin_heroku/
cd ../project_robin_heroku/
git add -A
git commit -m "Build update"
git push heroku master