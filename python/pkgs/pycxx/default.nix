{
  lib,
  buildPythonPackage,
  fetchurl,
  setuptools,
  python,
}:

buildPythonPackage (finalAttrs: {
  pname = "pycxx";
  version = "7.2.0";
  pyproject = true;

  src = fetchurl {
    url = "mirror://sourceforge/cxx/CXX/PyCXX%20V${finalAttrs.version}/pycxx-${finalAttrs.version}.tar.gz";
    hash = "sha256-QUDKF8Oefz2MmkJtEhJqA3on3BSOUNP5jw0zRRP8u7I=";
  };

  outputs = [
    "out"
    "dev"
  ];

  build-system = [ setuptools ];

  postInstall = ''
    mkdir -p $dev/include
    mv $out/include/${python.libPrefix}*/* $dev/include
    ln -s $dev/include/cxx $dev/include/CXX # pysvn compat
    mv $out/CXX $dev/src
    sed -i "s|Src|$dev/src|" $dev/src/cxxextensions.c $dev/src/cxxsupport.cxx
  '';

  meta = {
    description = "Set of classes to help create extensions of Python in the C++ language";
    homepage = "https://sourceforge.net/projects/cxx/";
    license = lib.licenses.bsd3;
  };
})
