# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit eutils multilib

DESCRIPTION="Complete VHDL simulator using the GCC technology"
HOMEPAGE="http://ghdl.free.fr"
SRC_URI="https://github.com/tgingold/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""
DEPEND="sys-devel/gcc[ada]
	dev-libs/gmp
	dev-libs/mpfr
	dev-libs/mpc"
RDEPEND="${DEPEND}"

src_configure() {
	./configure --prefix=/usr
}

