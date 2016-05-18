# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="A module for reading and writing TIFF image files."
HOMEPAGE="http://www.lfd.uci.edu/%7Egohlke/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="tifffile"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-python/numpy-1.8.4"
RDEPEND="${DEPEND}"
