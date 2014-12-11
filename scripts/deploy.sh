mkdir /usr/share/nginx/node
cd /usr/share/nginx/node
if [ ! -d "$JOB_NAME" ]; then
    echo "Cloning $GIT_URL into $JOB_NAME"
    git clone $GIT_URL $JOB_NAME
fi
if [ -d "$JOB_NAME/.git" ]; then
    cd $JOB_NAME
    git pull
    npm install
    # cd node_modules/sails && npm install && cd ../../
    forever start app.js
else
    rm -rf /usr/share/nginx/node/$JOB_NAME
    echo "Git clone failed!";
fi