# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

MY_PN="pyFFTW"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A python wrapper around FFTW"
HOMEPAGE="http://pythonhosted.org/pyFFTW/"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=sci-libs/fftw-3.3[threads]
	>=dev-python/numpy-1.6"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"
