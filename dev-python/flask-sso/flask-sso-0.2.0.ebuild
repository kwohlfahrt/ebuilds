# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/flask-login/flask-login-0.2.11.ebuild,v 1.3 2014/06/15 02:00:31 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3} )

inherit distutils-r1

MY_PN="Flask-SSO"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Login session support for Flask"
HOMEPAGE="http://pypi.python.org/pypi/Flask-SSO"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/flask[${PYTHON_USEDEP}]
         dev-python/blinker[${PYTHON_USEDEP}]
		 dev-python/six[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}"
