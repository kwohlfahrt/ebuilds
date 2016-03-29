# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="Vulkan ICD loader and validation layers"
HOMEPAGE="https://www.khronos.org/opengles/sdk/tools/Reference-Compiler/"
SRC_URI="https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers/archive/sdk-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE="+layers xcb"

DEPEND=">=dev-lang/python-3
        dev-util/cmake
		dev-util/glslang
		dev-util/SPIRV-Tools
		${RDEPEND}"
RDEPEND="xcb? ( x11-libs/libxcb )"

S="${WORKDIR}/Vulkan-LoaderAndValidationLayers-sdk-${PV}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	# Change the search path to match dev-util/glslang
	epatch "${FILESDIR}/${PV}-glslang-spirv-hpp.patch"
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_build xcb WSI_XCB_SUPPORT)
		$(cmake-utils_use_build layers LAYERS)
		"-DBUILD_WSI_XLIB_SUPPORT=OFF"
		"-DBUILD_DEMOS=OFF"
		"-DBUILD_TESTS=OFF"
	)

	cmake-utils_src_configure
}

