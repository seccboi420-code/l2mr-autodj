# L2MR AutoDJ (Liquidsoap on Railway)

Free AutoDJ that pushes your music to Listen2MyRadio (Icecast). No BUTT/Mixxx/PC needed.

## Deploy (Railway.app)
1) Push these files to a GitHub repo.
2) Railway → New Project → Deploy from GitHub → select repo.
3) Add Environment Variables:
   - L2MR_HOST   = 78.129.241.110
   - L2MR_PORT   = 37611
   - L2MR_USER   = source
   - L2MR_PASS   = (your stream password)
   - L2MR_MOUNT  = /stream
   - BITRATE     = 128
   - STREAM_NAME = Vector Radio AutoDJ (optional)
4) Add Volume → mount path: /app/media
5) Upload MP3s into the volume.
6) Redeploy/Restart and test on your L2MR listener URL.
