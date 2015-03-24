# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pyopengl/pyopengl-3.1.0_alpha1.ebuild,v 1.11 2013/09/06 14:57:49 ago Exp $

EAPI=5
PYTHON_COMPAT=( python{3_2,3_3,3_4} )

inherit distutils-r1 git-r3

DESCRIPTION="Static typing for Python"
HOMEPAGE="http://www.mypy-lang.org/ http://pypi.python.org/pypi/mypy-lang"
EGIT_REPO_URI="https://github.com/JukkaL/mypy.git"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

PATCHES=( "${FILESDIR}/${P}-data-dir.diff" )
