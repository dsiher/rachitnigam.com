#!/bin/zsh
# Command to deploy hakyll website

# Temporarily store uncommited changes
git stash

# Verify correct branch
git checkout hakyll

# If purify-css is installed as an exec, purify bootstrap.min.css
if hash purifycss; then
    echo -n "purify-css was found! Running ..."
    purifycss css/bootstrap.min.css templates/* --info --min --out \
              css/bootp.css
    if [ $? -eq 0 ]; then
      echo "succeeded!"
      rm css/bootstrap.min.css
      mv css/bootp.css css/bootstrap.min.css
    else
      echo "failed!"
    fi
fi

# Build new files
stack exec site clean
stack exec site build

# Reset to head in case purifycss ran
git reset --hard

# Get previous files
git fetch --all
git checkout -b master --track origin/master

# Overwrite existing files with new files
rsync -a --filter='P _site/'      \
      --filter='P _cache/'     \
      --filter='P .git/'       \
      --filter='P .gitignore'  \
      --filter='P .stack-work' \
      --delete-excluded        \
      _site/ .

# Push the changes to the remote server
rsync -a --filter='P _site/'      \
      --filter='P _cache/'     \
      --filter='P .git/'       \
      --filter='P .gitignore'  \
      --filter='P .stack-work' \
      --delete-excluded        \
      _site/ website:~/public_html/

if [ "$?" -ne 0 ]; then
    echo "Failed to update the remote website server!"
fi

# Commit changes to master
git add -A
git commit -m "Publish."

# Push
git push origin master:master

# Restoration
git checkout hakyll
git branch -D master
git stash pop
