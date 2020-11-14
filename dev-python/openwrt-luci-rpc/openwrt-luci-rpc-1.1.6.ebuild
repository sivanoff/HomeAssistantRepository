# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Module for interacting with OpenWrt Luci RPC interface"
HOMEPAGE="https://github.com/fbradyirl/openwrt-luci-rpc https://pypi.org/project/openwrt-luci-rpc/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/requests-2.21.0[${PYTHON_USEDEP}]
		 >=dev-python/packaging-19.1[${PYTHON_USEDEP}]
		 >dev-python/click-6.0.0[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed -e 's;requests==2.21.0;requests>=2.21.0;' \
		-i setup.py || die
	sed -e 's;packaging==19.1;packaging>=19.1;' \
		-i setup.py || die
	eapply_user
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
