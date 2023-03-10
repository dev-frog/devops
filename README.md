# Script for DevOps Hackathon

1. `chmod 400 devops-hackathon.pem` to make the key file read-only for your account.
2. `ssh -i devops-hackathon.pem ubunto@<IP>` to connect to the instance.
3. `scp -i devops-hackathon.pem -r <local-path> ubunto@<IP>:~` to copy files to the instance.

## Setup script

```bash
curl -sL https://raw.githubusercontent.com/dev-frog/devops/main/setup.sh | bash
```

## Help Notes

1. [ChatGPT](https://platform.openai.com/playground)
2. [MY_NOTE](https://excalidraw.com/#room=eff7242f557ed65800ff,0aIRoiK_G6h-XH14AQ0jfg)
