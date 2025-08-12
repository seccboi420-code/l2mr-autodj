# ---------- Env helpers ----------
def getenv(name, default) =
  v = environment(name)
  if v == "" or v == nil then default else v end
end

# ---------- Config from ENV ----------
host      = getenv("L2MR_HOST", "78.129.241.110")
port      = int_of_string(getenv("L2MR_PORT", "37611"))
user      = getenv("L2MR_USER", "source")
password  = getenv("L2MR_PASS", "changeme")
mount     = getenv("L2MR_MOUNT", "/stream")
bitrate   = int_of_string(getenv("BITRATE", "128"))
name      = getenv("STREAM_NAME", "Vector Radio AutoDJ")
genre     = getenv("STREAM_GENRE", "Mixed")
desc      = getenv("STREAM_DESC", "AutoDJ via Railway")
site_url  = getenv("STREAM_URL", "https://listen2myradio.com")

# ---------- Music source ----------
music = playlist(mode="random", reload=60, "/app/media")

# Fallback if empty
sil = blank(duration=30.)
src = fallback(track_sensitive=false, [music, sil])

# ---------- Processing ----------
src = normalize(target=0.0, threshold=-20.0, src)
src = compress(threshold=-10.0, ratio=2.0, attack=0.01, release=0.5, gain=1.0, src)

# ---------- Output to Icecast ----------
output.icecast(
  %mp3(bitrate=bitrate, stereo=true, samplerate=44100),
  host=host, port=port, user=user, password=password, mount=mount,
  name=name, description=desc, genre=genre, url=site_url,
  src
)
