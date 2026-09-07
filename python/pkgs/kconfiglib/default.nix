{
  lib,
  buildPythonPackage,
  fetchPypi,
}:

buildPythonPackage rec {
  pname = "kconfiglib";
  version = "14.1.1a4";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-16d+R4neiTfVZ6/KM8BfxYu3kyAB9dMDdJSy74UWekE=";
  };

  patches = [
    # see https://github.com/ulfalizer/Kconfiglib/pull/119
    ./0001-Add-rudimentary-support-for-modules-property.patch
  ];

  # doesnt work out of the box but might be possible
  doCheck = false;

  meta = {
    description = "Flexible Python 2/3 Kconfig implementation and library";
    homepage = "https://github.com/ulfalizer/Kconfiglib";
    license = lib.licenses.isc;
    maintainers = [ ];
  };
}
