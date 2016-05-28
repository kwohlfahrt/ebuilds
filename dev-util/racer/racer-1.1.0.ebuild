# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="Rust Code Completion utility "
HOMEPAGE="https://github.com/phildawes/racer"
SRC_URI="https://github.com/phildawes/racer/archive/v1.1.0.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

COMMON_DEPEND=">=virtual/rust-1.5.0"
DEPEND="${COMMON_DEPEND}
	dev-util/cargo"
RDEPEND="${COMMON_DEPEND}"

src_compile() {
	cargo build --release
}

src_install() {
	dobin target/release/racer
}

pkg_postinst() {
	elog "You most probably should fetch rust sources for best expirience."
	elog "Racer will look for sources in path pointed by RUST_SRC_PATH"
	elog "environment variable. You can use"
	elog "% export RUST_SRC_PATH=<path to>/rust/src."
	elog "Use vim-racer or emacs-racer for the editos support"
	elog
}
