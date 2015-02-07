# $NetBSD$

BUILTIN_PKG:=	portableproplib

BUILTIN_FIND_HEADERS_VAR:=	H_PROPLIB
BUILTIN_FIND_HEADERS.H_PROPLIB=	prop/proplib.h

.include "../../mk/buildlink3/bsd.builtin.mk"

###
### Determine if there is a built-in implementation of the package and
### set IS_BUILTIN.<pkg> appropriately ("yes" or "no").
###
.if !defined(IS_BUILTIN.portableproplib)
IS_BUILTIN.portableproplib=	no
.  if empty(H_PROPLIB:M__nonexistent__) && empty(H_PROPLIB:M${LOCALBASE}/*)
IS_BUILTIN.portableproplib=	yes
.  endif
.endif
MAKEVARS+=	IS_BUILTIN.portableproplib

###
### If there is a built-in implementation, then set BUILTIN_PKG.<pkg> to
### a package name to represent the built-in package.
###
.if !defined(BUILTIN_PKG.portableproplib) && \
    !empty(IS_BUILTIN.portableproplib:M[yY][eE][sS]) && \
    empty(H_PROPLIB:M__nonexistent__)
BUILTIN_VERSION.portableproplib=0.3.0
BUILTIN_PKG.portableproplib=portableproplib-${BUILTIN_VERSION.portableproplib}
.endif
MAKEVARS+=	BUILTIN_PKG.portableproplib

###
### Determine whether we should use the built-in implementation if it
### exists, and set USE_BUILTIN.<pkg> appropriate ("yes" or "no").
###
.if !defined(USE_BUILTIN.portableproplib)
.  if ${PREFER.portableproplib} == "pkgsrc"
USE_BUILTIN.portableproplib=	no
.  else
USE_BUILTIN.portableproplib=	${IS_BUILTIN.portableproplib}
.    if defined(BUILTIN_PKG.portableproplib) && \
        !empty(IS_BUILTIN.portableproplib:M[yY][eE][sS])
USE_BUILTIN.portableproplib=	yes
.      for _dep_ in ${BUILDLINK_API_DEPENDS.portableproplib}
.        if !empty(USE_BUILTIN.portableproplib:M[yY][eE][sS])
USE_BUILTIN.portableproplib!=	\
	if ${PKG_ADMIN} pmatch ${_dep_:Q} ${BUILTIN_PKG.portableproplib:Q}; then	\
		${ECHO} yes;						\
	else								\
		${ECHO} no;						\
	fi
.        endif
.      endfor
.    endif
.  endif  # PREFER.portableproplib
.endif
MAKEVARS+=	USE_BUILTIN.portableproplib
