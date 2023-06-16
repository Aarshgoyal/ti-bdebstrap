#!/bin/bash

function deb_package(){
  while [ $# -gt 0 ]; do
    case $1 in
      --help | -h)
        usage $0
        ;;
      --package_name) shift; package_name=$1; shift; ;;
      --control_file) shift; control_file=$1; shift; ;;
      --location) shift; location=$1; shift; ;;
      --Initial) shift; Initial=$1; shift; ;;
      *) echo "Unknown file $1 " ;;
    esac
  done
build_tree ${package_name} ${control_file} ${location}
do_install ${Initial} ${package_name} ${location}
deb_build  ${package_name}
}

# build_tree ${package_name} ${control_file} ${location}
# do_install ${Initial} ${package_name} ${location}
# deb_build  ${package_name}


function build_tree(){
    package_name=$1
    control_file=$2
    location=$3
    # package_name=${package_name}
    mkdir -p ${package_name}/{DEBIAN,${location}/,lib/share/man/man1,lib/share/doc/}

    cp ${control_file} ${package_name}/DEBIAN/control
    tree ${package_name}
}

#install
function do_install(){
    Initial=$1
    package_name=$2
    location=$3
    cp -r ${Initial} ${package_name}/${location}/
    tree ${package_name}
}

#build
function deb_build(){
    package_name=$1
    tree ${package_name}
    dpkg-deb -Zxz --build ${package_name} ${package_name}.deb
    echo Package created successfully
}


# build_tree ${package_name} ${control_file} ${location}
# do_install ${Initial} ${package_name} ${location}
# deb_build  ${package_name}



# function build_rfb() {
#     #Package_name
#     if [ -z "$1" ]; then
#         echo "Error:Package name not found."
#         exit 1
#     fi

#     PACKAGE_NAME="$1"

#     #control file
#     if [ -z "$2" ]; then
#         echo "Error: Control file path not found."
#         exit 1
#     fi

#     CONTROL_FILE="$2"

#     #script file/folder
#     if [ -z "$3" ]; then
#         echo "Error: file/folder path not found."
#         exit 1
#     fi

#     FOLDER_PATH="$3"

#     PACKAGE_DIR=${PACKAGE_NAME}
#     mkdir -p {$PACKAGE_DIR}/ {DEBIAN,lib/firmware/,lib/share/man/man1,lib/share/doc/}


#     cp {$CONTROL_FILE} {$PACKAGE_DIR}/DEBIAN/control
#     cp {$FOLDER_PATH} {$PACKAGE_DIR}/lib/firmware/

#     dpkg-deb -Zxz --build {$PACKAGE_DIR} {$PACKAGE_NAME}.deb


#     #Package created successfully

# }