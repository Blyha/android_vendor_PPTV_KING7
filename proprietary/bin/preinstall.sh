#!/system/bin/sh
export PATH=/system/bin:$PATH

DATA_MEDIA_3D_DIR=/data/media/0/3d
DATA_LOCK_FLAG_FILE=/data/data_lock_flag_file

umask 003

sleep 60

if [ ! -e "$DATA_LOCK_FLAG_FILE" ]; then
    if [ -f /data/Avatar.mp4 ] ; then
        touch $DATA_LOCK_FLAG_FILE
        mkdir -p $DATA_MEDIA_3D_DIR
        cp /data/*.mp4 $DATA_MEDIA_3D_DIR
        chmod -R 0775 $DATA_MEDIA_3D_DIR
        chown -R media_rw:media_rw $DATA_MEDIA_3D_DIR
    fi
fi

if [[ -d $DATA_MEDIA_3D_DIR ]] ; then
	if [[ ! -f $DATA_MEDIA_3D_DIR/.nomedia ]] ; then
		touch $DATA_MEDIA_3D_DIR/.nomedia
	fi
fi
