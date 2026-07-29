{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools-scm,
  pkgs,
}:

buildPythonPackage (finalAttrs: {
  pname = "zopfli";
  version = "0.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-qO6ZKyVJ4JDNPwF4v2Bt1Bop4GE6BM31BUIkZixy3OY=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools<72.2.0" "setuptools"
  '';

  build-system = [ setuptools-scm ];

  buildInputs = [ pkgs.zopfli ];

  env.USE_SYSTEM_ZOPFLI = "True";

  pythonImportsCheck = [ "zopfli" ];

  meta = {
    description = "CPython bindings for zopfli";
    homepage = "https://github.com/obp/py-zopfli";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
