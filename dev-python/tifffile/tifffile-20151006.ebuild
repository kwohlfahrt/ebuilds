# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1 git-r3

DESCRIPTION="A module for reading and writing TIFF image files."
HOMEPAGE="http://www.lfd.uci.edu/%7Egohlke/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/kwohlfahrt/tifffile.git"
EGIT_COMMIT="refs/tags/v${PV}"

LICENSE="tifffile"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-python/numpy-1.9.3"
RDEPEND="${DEPEND}"
