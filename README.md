Signal Desktop in Docker
------------------------

```console
$ docker build -t signalapp .
$ sudo semodule -X 300 -i my-signaldesktop.pp
$ ./run.sh
```

Should pass through X11 and Wayland okay. Seems to use X.

The semodule step allows signal desktop to connect to the X server. If you don't do this step, the first time you run Signal, it'll fail and you'll get an SELinux Troubleshooting thing pop up telling you about doing the same thing.

Works on Fedora at least. The container only has access to ~/signaldata too.
