# SPCOMP

Docker image for compiling sourcepawn scripts

## Usage

`docker run --rm -v "$PWD":/data spiretf/spcomp inputfile.sp`

If the `/output` directory is mounted then the resulting plugins will be created there.

## Extensions

The docker image comes with include files for the following sourcemod extensions

- [curl](https://forums.alliedmods.net/showthread.php?t=152216)

Additional include files can be added by mounting them inside `/include`

## Github action

You can also use the github action to automatically compile your sourcepawn scripts whenever they are modified.

Create a `.github/workflows/compile.yaml` with the following contents, adjusting the paths to your plugin

```yaml
name: Build sourcepawn and commit

on:
  push:
    paths:
      - '**.sp'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Compile sourcepawn
        uses: spiretf/spcomp@v0.1.0
        with:
          source: './plugin/myplugin.sp'
          target: './plugin/myplugin.smx'

      - name: Commit files
        run: |
          git config --local user.email "action@github.com"
          git config --local user.name "GitHub Action"
          git commit -m "Compile sourcepawn" -a
      - name: Push changes
        uses: ad-m/github-push-action@master
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
```