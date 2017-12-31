## Troubleshooting

`standard_init_linux.go:185: exec user process caused "no such file or directory"`: Common problem on windows. Convert line endings in the `entrypoint.sh` file to LF and the error will disappear.