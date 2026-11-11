{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "zc-lockfile";
  version = "4.1";
  pyproject = true;

  src = fetchPypi {
    pname = "zc_lockfile";
    inherit (finalAttrs) version;
    hash = "sha256-SY830zo20bFTTqMaD747XTcchiuuuIBfRnptOZSAEe8=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools >= 78.1.1,< 82" "setuptools"
  '';

  build-system = [ setuptools ];

  pythonNamespaces = [ "zc" ];

  pythonImportsCheck = [ "zc.lockfile" ];

  meta = {
    homepage = "https://github.com/zopefoundation/zc.lockfile";
    description = "Inter-process locks";
    license = lib.licenses.zpl21;
  };
})
