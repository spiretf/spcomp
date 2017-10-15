# SPCOMP

Docker image for compiling sourcepawn scripts

## Usage

`docker run --rm -v "$PWD":/data spiretf/spcomp inputfile.sp`

If the `/output` directory is mounted then the resulting plugins will be created there.

## Extensions

The docker image comes with include files for the following sourcemod extensions

- [curl](https://forums.alliedmods.net/showthread.php?t=152216)

Additional include files can be added by mounting them inside `/include`
