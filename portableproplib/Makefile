# $NetBSD$

DISTNAME=	portableproplib-${VERSION}
VERSION=	0.6.4
CATEGORIES=	devel
MASTER_SITES=	-https://github.com/xtraeme/portableproplib/archive/${VERSION}${EXTRACT_SUFX}

MAINTAINER=	pkgsrc@ba23.org
HOMEPAGE=	https://github.com/xtraeme/portableproplib/
COMMENT=	Portable property list library, based on NetBSD's proplib
LICENSE=	modified-bsd

USE_LANGUAGES=	c
GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	autoconf automake autoreconf pkg-config

PKGCONFIG_OVERRIDE+=	proplib.pc.in

pre-configure:
	cd ${WRKSRC} && autoreconf -fi

BUILDLINK_ABI_DEPENDS.zlib+=	zlib>=1.2.3
.include "../../devel/zlib/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
