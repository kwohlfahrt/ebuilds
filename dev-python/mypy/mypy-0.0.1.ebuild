# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pyopengl/pyopengl-3.1.0_alpha1.ebuild,v 1.11 2013/09/06 14:57:49 ago Exp $

EAPI=5
PYTHON_COMPAT=( python{3_2,3_3,3_4} )

inherit distutils-r1

MY_PN="mypy-lang"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Static typing for Python"
HOMEPAGE="http://www.mypy-lang.org/ http://pypi.python.org/pypi/mypy-lang"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}"
