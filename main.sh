echo "---------------- Fast API ----------------------"
#cd src/
echo $PWD
uvicorn app:app --host=${HOST_IP} --port=${HOST_PORT} --workers=${UVICORN_WORKERS}