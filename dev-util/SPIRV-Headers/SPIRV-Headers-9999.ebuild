# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 cmake-utils

DESCRIPTION="SPIRV header files"
HOMEPAGE="https://github.com/KhronosGroup/SPIRV-Headers"
SRC_URI=""
EGIT_REPO_URI="https://github.com/KhronosGroup/SPIRV-Headers"

LICENSE="spirv-headers"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		--target install-headers
		-DCMAKE_INSTALL_PREFIX="${D}/usr"
	)
	cmake-utils_src_configure
}

src_install() {
	cd ${BUILD_DIR}
	emake install-headers
}
