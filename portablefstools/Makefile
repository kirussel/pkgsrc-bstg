# $NetBSD$

DISTNAME=	portablefstools-${VERSION}
VERSION=	0.2.0
CATEGORIES=	filesystems
MASTER_SITES=	-https://github.com/kirussel/portablefstools/archive/v${VERSION}${EXTRACT_SUFX}

MAINTAINER=	pkgsrc@ba23.org
HOMEPAGE=	https://github.com/kirussel/portablefstools
COMMENT=	Portable Apple file system test tools
LICENSE=	apple-public-source-license

BUILD_TARGET=		fsx
INSTALLATION_DIRS+=	bin
MAKEFLAGS+=		ARCHS= CFLAGS+=-I.
TEST_DIRS=		test
TEST_TARGET=		check
USE_LANGUAGES=		c
USE_TOOLS+=		perl:run gmake:run
WRKSRC=			${WRKDIR}/${DISTNAME}/src/fsx

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/fsx ${DESTDIR}${PREFIX}/bin/

.include "../../mk/bsd.pkg.mk"
