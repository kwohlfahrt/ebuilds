# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION=""
HOMEPAGE="https://www.sidefx.com"
SRC_URI="http://www.sidefx.com/index.php?option=com_download&task=apprentice&Itemid=208
         -> ${P}-linux_x86_64_gcc4.8.tar.gz"
RESTRICT="fetch"

LICENSE="SESI"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""

RDEPEND="=sys-devel/gcc-4.8*
	>=dev-libs/libxml2-2.8.0
	>=sci-physics/bullet-2.81
	>=dev-games/ode-0.10.1
	>=dev-cpp/tbb-4.3
	>=dev-libs/boost-1.55.0
	>=dev-python/numpy-1.7.1
	>=sys-libs/zlib-1.2.7
	>=media-libs/tiff-3.9.2:3"

# Dependencies not found on portage:
# OpenSubdiv 2.5.1
# OpenCL ATI 2.3
# ATI 2.3
# FBX 2016.1.2
# Collada 1.4.1
# Alembic 1.5.8
# openVDB 3.0
# Field3d 1.3.2
# http://www.sidefx.com/Support/system-requirements/

# Currently masked in portage:
# >=media-libs/openexr-2.2.0


S="${WORKDIR}/${P}-linux_x86_64_gcc4.8"
HFS_DIR=/opt/${PN}/hfs${PV}

src_install() {
	dodir ${HFS_DIR}
	tar zxf ${S}/${PN}.tar.gz -C ${D}/${HFS_DIR}

	elog "To run any houdini programs, source"
	elog "${HFS_DIR}/houdini_setup into a bash or csh shell"

	# Using bundled python-2.7 and python-2.6
	# Expects some site-packages that are bundled but not listed anywhere
	dodir ${HFS_DIR}/python
	tar -xzf ${S}/pythonlibdeps.tar.gz -C ${D}/${HFS_DIR}/python
	for py_ver in 2.7 2.6; do
		tar -xzf ${S}/python${py_ver}.tar.gz -C ${D}/${HFS_DIR}/python
	done

	# Can also set the local license file location in this config file
	echo "licensingMode = localValidator" >> ${D}/${HFS_DIR}/houdini/Licensing.opt
	dodir /usr/lib/sesi
	if [ ! -f /usr/lib/sesi/licenses.local ]; then
		touch ${D}/usr/lib/sesi/licenses.local
		chmod 666 ${D}/usr/lib/sesi/licenses.local
	fi
	elog "You may need to generate a local license:"
	elog "hkey -n 1 -c -foreground"
}
