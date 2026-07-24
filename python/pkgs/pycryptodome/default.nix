{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  gmp,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pycryptodome";
  version = "3.23.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Legrandin";
    repo = "pycryptodome";
    tag = "v${version}";
    hash = "sha256-x8QkRBwM/H/n7yHGjE8UfBhOzkGr0PBixe9g4EuZLUg=";
  };

  postPatch = ''
    substituteInPlace lib/Crypto/Math/_IntegerGMP.py \
      --replace-fail 'load_lib("gmp"' 'load_lib("${gmp}/lib/libgmp.so.10"'
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "Crypto" ];

  meta = {
    description = "Self-contained cryptographic library";
    homepage = "https://github.com/Legrandin/pycryptodome";
    license = with lib.licenses; [
      bsd2 # and
      asl20
    ];
  };
}
