echo "---------------- Fast API ----------------------"
#cd src/
UVICORN_WORKERS=1
HOST_IP=0.0.0.0
HOST_PORT=8980
uvicorn app:app --host=${HOST_IP} --port=${HOST_PORT} --workers=${UVICORN_WORKERS}