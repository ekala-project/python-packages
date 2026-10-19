{
  lib,
  base58,
  buildPythonPackage,
  ecdsa,
  fetchPypi,
  # build-system
  setuptools,
  sympy,
}:

buildPythonPackage rec {
  pname = "bitcoin-utils-fork-minimal";
  version = "0.4.11.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-DzibvC8qr/5ync59cfFB7tBmZWkPs/hKh+e5OC4lcEw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    base58
    ecdsa
    sympy
  ];

  preConfigure = ''
    substituteInPlace setup.py \
      --replace "sympy==1.3" "sympy>=1.3" \
      --replace "base58==2.1.0" "base58>=2.1.0" \
      --replace "ecdsa==0.17.0" "ecdsa>=0.17.0"
  '';

  # Project doesn't ship tests

  pythonImportsCheck = [ "bitcoinutils" ];

  meta = {
    description = "Bitcoin utility functions";
    homepage = "https://github.com/doersf/python-bitcoin-utils";
    license = lib.licenses.mit;
  };
}
