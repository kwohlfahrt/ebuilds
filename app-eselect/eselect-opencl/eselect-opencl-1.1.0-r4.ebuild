# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils multilib

DESCRIPTION="Utility to change the OpenCL implementation being used"
HOMEPAGE="https://www.gentoo.org/"

BASE_URL="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers"
SRC_URI="https://dev.gentoo.org/~xarthisius/distfiles/${P}-r1.tar.xz
"

for ver in 1.0 1.1 1.2 2.0 2.1; do
	for h in opencl.h cl_platform.h cl.h cl_ext.h cl_gl.h cl_gl_ext.h; do
		uri_ver=$(echo ${ver} | /bin/sed -e "s/\.//")
		SRC_URI+="${BASE_URL}/opencl${uri_ver}/${h} -> CL-${ver}-${h}
		"
	done
done

for ver in 1.2 2.0 2.1; do
	uri_ver=$(echo ${ver} | /bin/sed -e "s/\.//")
	SRC_URI+="${BASE_URL}/opencl${uri_ver}/cl_egl.h -> CL-${ver}-cl_egl.h
	"
done

for ver in 1.0 1.1; do
	# Same header
	SRC_URI+="https://www.khronos.org/registry/cl/api/1.1/cl.hpp -> CL-${ver}-cl.hpp
	"
done

SRC_URI+="https://www.khronos.org/registry/cl/api/1.2/cl.hpp -> CL-1.2-cl.hpp
"

for ver in 2.0 2.1; do
	# Same header
	SRC_URI+="https://www.khronos.org/registry/cl/api/2.1/cl.hpp -> CL-${ver}-cl.hpp
	"
done

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

DEPEND=""
RDEPEND=">=app-admin/eselect-1.2.4"

pkg_postinst() {
	local impl="$(eselect opencl show)"
	if [[ -n "${impl}"  && "${impl}" != '(none)' ]] ; then
		eselect opencl set "${impl}"
	fi
}

src_prepare() {
	epatch "${FILESDIR}/egl.h.patch"
}

src_install() {
	insinto /usr/share/eselect/modules
	doins opencl.eselect
	#doman opencl.eselect.5

	local headers=( opencl.h cl_platform.h cl.h cl_ext.h cl_gl.h cl_gl_ext.h cl_egl.h cl.hpp )

	# We install all versions of OpenCL headers
	for ver in 1.0 1.1 1.2 2.0 2.1; do
		insinto /usr/$(get_libdir)/OpenCL/global/include/CL-${ver}
		for h in ${headers[@]}; do
			local src=${DISTDIR}/CL-${ver}-${h}
			if [ -e ${src} ]; then
				newins ${src} ${h}
			fi
		done
	done


	# Create symlinks to newest. Maybe this should be switchable?
	for f in ${D}/usr/$(get_libdir)/OpenCL/global/include/CL-2.1/*; do
		dosym ${f} /usr/$(get_libdir)/OpenCL/global/include/CL/$(basename ${f})
	done
}
