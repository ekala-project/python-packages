{
  lib,
  buildPythonPackage,
  fetchpatch2,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pid";
  version = "3.0.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-DjNnDoP2oz67CCLkOmCcMkcXjUo3X/UKRoniZthT62Y=";
  };

  patches = [
    (fetchpatch2 {
      url = "https://github.com/trbs/pid/commit/c9d1550ba2ee73231f8e984d75d808c8cc103748.patch";
      hash = "sha256-2F31LlrJku1xzmI7P+QLyUZ8CzVHx25APp88qwWkZxw=";
    })
  ];

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pid" ];

  meta = {
    description = "Pidfile featuring stale detection and file-locking";
    homepage = "https://github.com/trbs/pid/";
    license = lib.licenses.asl20;
  };
}
