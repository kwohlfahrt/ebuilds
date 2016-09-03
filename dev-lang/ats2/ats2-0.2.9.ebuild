# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="ATS Programming Language"
HOMEPAGE="http://www.ats-lang.org"
SRC_URI="http://downloads.sourceforge.net/project/ats2-lang/ats2-lang/ats2-postiats-${PV}/ATS2-Postiats-${PV}.tgz"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-libs/glib
	dev-libs/gmp
	dev-libs/boehm-gc
	"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	"

S="${WORKDIR}"/ATS2-Postiats-${PV}

src_compile() {
	emake -j1
}

src_install() {
	emake DESTDIR="${D}" install -j1
}
