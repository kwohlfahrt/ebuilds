# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3 scons-utils

DESCRIPTION="A minimal dynamic DNS client using netlink sockets."
HOMEPAGE="https://github.com/kwohlfahrt/dyndns"
EGIT_REPO_URI="git://github.com/kwohlfahrt/dyndns"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="${RDEPEND}
dev-util/scons"

RDEPEND="net-misc/curl"

src_compile() {
	escons
}

src_install() {
	escons DESTDIR="${D}/usr" install
	newinitd ${FILESDIR}/${PN}.initd ${PN}
	newconfd ${FILESDIR}/${PN}.conf ${PN}
}
