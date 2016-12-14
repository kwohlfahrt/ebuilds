# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/flask-login/flask-login-0.2.11.ebuild,v 1.3 2014/06/15 02:00:31 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python{3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Type-safe (bit)flags for Python 3"
HOMEPAGE="http://pypi.python.org/pypi/py-flags"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	=dev-python/dictionaries-0.0.1"
