{
  lib,
  buildPythonPackage,
  fetchPypi,
  pkg-config,
  cffi,
  pkgs,
}:

let
  libsecp256k1 = pkgs.secp256k1;
in

buildPythonPackage rec {
  pname = "secp256k1";
  version = "0.14.0";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "82c06712d69ef945220c8b53c1a0d424c2ff6a1f64aee609030df79ad8383397";
  };

  postPatch = ''
    # don't do hacky tarball download + setuptools check
    sed -i '38,54d' setup.py
    substituteInPlace setup.py --replace ", 'pytest-runner==2.6.2'" ""
  '';

  nativeBuildInputs = [ pkg-config ];

  propagatedBuildInputs = [
    cffi
    libsecp256k1
  ];

  preConfigure = ''
    cp -r ${libsecp256k1.src} libsecp256k1
    export INCLUDE_DIR=${libsecp256k1}/include
    export LIB_DIR=${libsecp256k1}/lib
  '';

  pythonImportsCheck = [ "secp256k1" ];

  meta = {
    homepage = "https://github.com/ludbb/secp256k1-py";
    description = "Python FFI bindings for secp256k1";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
