# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 cmake-utils

DESCRIPTION="GLSL reference compiler."
HOMEPAGE="https://github.com/KhronosGroup/SPIRV-Tools"
SRC_URI=""
EGIT_REPO_URI="https://github.com/KhronosGroup/SPIRV-Tools"

LICENSE="spirv-tools"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-util/SPIRV-Headers"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=( -DSPIRV-Headers_SOURCE_DIR="/usr/" )
	cmake-utils_src_configure
}
