# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_{5,6,7}} )

inherit distutils-r1

DESCRIPTION="A small python module for wake on lan."
HOMEPAGE="https://github.com/remcohaszing/pywakeonlan"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ia64 ~ppc ~ppc64 ~x86 ~amd64-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="test"

DEPEND="
	=dev-python/setuptools_scm-1.15.7[${PYTHON_USEDEP}]
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	dev-python/ipaddress[${PYTHON_USEDEP}]"

# Many tests fail, even on a regular tox run on a upstream clone
RESTRICT="test"

python_test() {
	${PYTHON} psutil/tests/__main__.py || die
}
