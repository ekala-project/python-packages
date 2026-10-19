{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-memcached";
  version = "1.62";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "linsomniac";
    repo = "python-memcached";
    tag = finalAttrs.version;
    hash = "sha256-Qko4Qr9WofeklU0uRRrSPrT8YaBYMCy0GP+TF7YZHLI=";
  };

  postPatch = ''
    substituteInPlace memcache.py \
      --replace-fail '__version__ = "1.60"' '__version__ = "${finalAttrs.version}"'
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "memcache" ];

  meta = {
    description = "Pure python memcached client";
    homepage = "https://github.com/linsomniac/python-memcached";
    license = lib.licenses.psfl;
  };
})
